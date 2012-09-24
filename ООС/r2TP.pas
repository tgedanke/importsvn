unit r2TP;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Report_2TP_Build(year:word;quarter:byte);

implementation


type
  TRow = record
    balance: real;
    produce: real;
    input_total: real;
    input_import: real;
    inner_use: real;
    inner_defuse: real;
    outer_total: real;
    outer_use: real;
    outer_defuse: real;
    outer_save: real;
    outer_z: real;
    inner_place_total: real;
    inner_place_save: real;
    inner_place_z: real;
  end;

var
  _q: array[0..9] of TADOQuery;
  
function snz(v:Variant):Variant;
begin
  if VarIsFloat(v) or VarIsNumeric(v) then
  begin
    if v=0 then result := '' else result := v;
    
  end else
  result := v;
end;


function fnz(v:Variant):String;
var
  f: real;
begin
  f := nz(v,0);
  if f = 0 then result :=''
  else
    result := my_floattostr(f);
end;

procedure InitWasteInfo(year:word;quarter:byte);
var
  i: integer;
  sql: string;
begin
  for i := 0 to 9 do
  begin
    _q[i] := TADOQuery.Create(nil);
    _q[i].Connection := DataModule.DataModule1.KMCConnection;
  end;

  ////////// образовалось за год+ остаток с прошлого
    sql :=
'select  '+
'	wr.code_id, '+
'	sum(wr.weight) as weight, '+
'	max(wy.balance_o) as balance '+
'from  '+
'ws_view_report as wr '+
'left join ws_codes_year as wy on wy.year=wr.year and wy.code_id=wr.code_id '+
'where  '+
'	wr.year='+inttostr(year)+' and '+
'	wr.quarter<='+inttostr(quarter)+' and '+
'	wr.operation_id>=0 and '+
'	wr.src_company_id=5 '+
'group by wr.code_id '
;

  ADOQueryExecute(_q[0],sql);


  /////////  получено от сторонних организаций
  sql :=
'select  '+
'	wr.code_id, '+
'	sum(wr.weight) as weight '+
'from  '+
'ws_view_report as wr '+
'where  '+
'	wr.year='+inttostr(year)+' and '+
'	wr.quarter<='+inttostr(quarter)+' and '+
'	wr.operation_id>0 and '+
'	wr.src_company_id<>5 '+
'group by wr.code_id '
;

  ADOQueryExecute(_q[1],sql);

  //// образовалось на предприятии
  sql :=
' select '+
' 	code_id,operation_id,sum(weight) as weight '+
' from  '+
' 	ws_view_report as wr '+
' where  '+
' 	src_company_id=5 and '+
' 	dst_company_id=5 and '+
'	wr.year='+inttostr(year)+' and '+
'	wr.quarter<='+inttostr(quarter)+
' group by '+
' 	code_id,operation_id ';
  ADOQueryExecute(_q[2],sql);

    //// передано другим организациям
  sql :=
' select '+
' 	code_id,operation_id,sum(weight) as weight '+
' from  '+
' 	ws_view_report as wr '+
' where  '+
' 	src_company_id=5 and '+
' 	dst_company_id<>5 and '+
'	wr.year='+inttostr(year)+' and '+
'	wr.quarter<='+inttostr(quarter)+
' group by '+
' 	code_id,operation_id ';
  ADOQueryExecute(_q[3],sql);

    sql :=
' select '+
' 	code_id,operation_id,sum(weight) as weight '+
' from  '+
' 	ws_view_report as wr '+
' where  '+
' 	dst_company_id=5 and '+
'	wr.year='+inttostr(year)+' and '+
'	wr.quarter<='+inttostr(quarter)+
' group by '+
' 	code_id,operation_id ';
  ADOQueryExecute(_q[4],sql);

end;

procedure GetWasteInfo(code_id:integer;var r: TRow);
begin
    FillChar(r,sizeof(r),0);
    r.balance := nz(_q[0].Lookup('code_id',code_id,'balance'),0);
    r.produce := nz(_q[0].Lookup('code_id',code_id,'weight'),0);
    r.input_total := nz(_q[1].Lookup('code_id',code_id,'weight'),0);
    r.input_import := 0;

    r.inner_use := nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,1]),'weight'),0)+
                  nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,4]),'weight'),0);
    r.inner_defuse := nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,2]),'weight'),0);

    r.outer_use := nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,1]),'weight'),0)+
                  nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,4]),'weight'),0);
    r.outer_defuse := nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,2]),'weight'),0);
    r.outer_save := nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,5]),'weight'),0);
    r.outer_z := nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,3]),'weight'),0);

    r.inner_place_save := nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,5]),'weight'),0);
    r.inner_place_z := nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,3]),'weight'),0);
    
end;


procedure FinWasteInfo;
var
  i: integer;
begin
  for i := 0 to 9 do
  begin
    _q[i].Free;
  end;
end;


procedure Report_2TP_Build(year:word;quarter:byte);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data,data2: Variant;
  rowid,realrow: integer;
  srealrow:string;
  classi: integer;
  rowmap:array[1..5] of integer;
  code_id: integer;
  row: TRow;
begin
  rowmap[1] := 9;
  rowmap[2] := 12;
  rowmap[3] := 15;
  rowmap[4] := 18;
  rowmap[5] := 21;

  sql :=
'select distinct '+
'	code_id, '+
'	max(code) as code , '+
'	max(waste) as waste , '+
'	class '+
'from '+
'	ws_view_report '+
'where '+
' year='+inttostr(year)+' and '+
' quarter<='+inttostr(quarter)+' '+
'group by '+
'	class,code_id '+
'order by class,waste'
;

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  InitWasteInfo(year,quarter);
  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\oos\отчет 2 тп.xlt');
  e.Show;

  e.SetActiveSheet(1);

  e.CellsB['E31'].Value := FormatDateTIme('dd.mm.yyyy',Date());


for classi := 5 downto 1 do
begin

  AQuery.Filter := 'class='+inttostr(classi);
  AQuery.Filtered := true;

  if AQuery.RecordCount<=0 then
  begin
    // hide row
    continue;
  end;
  
  e.InsertRows(rowmap[classi]-1,AQuery.RecordCount-1);
  data := VarArrayCreate([0,AQuery.RecordCount,0,18],varVariant);

  AQuery.First;
  rowid := 0;


  while not AQuery.EOF do
  with AQuery do
  begin
    code_id := nz(FieldByName('code_id').Value,0);
    GetWasteInfo(code_id,row);
    realrow := rowid+rowmap[classi];
    srealrow := inttostr(realrow);
    data[rowid,0] := 100*classi+rowid+1;
    data[rowid,1] := nz(FieldByName('waste').Value,'');
    data[rowid,2] := nz(FieldByName('code').Value,'');
    data[rowid,3] := nz(FieldByName('class').Value,'');
    
    data[rowid,4] := snz(row.balance);
    data[rowid,5] := snz(row.produce);
    data[rowid,6] := snz(row.input_total);
    data[rowid,7] := snz(row.input_import);
    data[rowid,8] := snz(row.inner_use+row.input_total);
    data[rowid,9] := snz(row.inner_defuse);

    data[rowid,10] := '=L'+srealrow+'+M'+srealrow+'+N'+srealrow+'+O'+srealrow; //K
    data[rowid,11] := snz(row.outer_use);
    data[rowid,12] := snz(row.outer_defuse);
    data[rowid,13] := snz(row.outer_save);
    data[rowid,14] := snz(row.outer_z);
    data[rowid,15] := '=Q'+srealrow+'+R'+srealrow;
    data[rowid,16] := snz(row.inner_place_save);
    data[rowid,17] := snz(row.inner_place_z);

    data[rowid,18] := '=E'+srealrow+'+F'+srealrow+'+G'+srealrow+'-I'+srealrow+'-J'+srealrow+'-K'+srealrow+'-R'+srealrow; //K

    inc(rowid);
    Next;
  end;

  e.Range('A',rowmap[classi],'S',rowmap[classi]+AQuery.RecordCount-1).Value := data;

  VarClear(data);

end;

  e.Free;

  FinWasteInfo;
end;

end.
