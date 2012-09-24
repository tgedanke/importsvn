unit rTeh;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Report_Teh_Build(year:word;quarter:byte);

implementation

uses DB;

type
  TInfo=record
    limit:real;
    balance: real;
    produced: real;
    outer_total: real;
    outer_use: real;
    outer_defuse: real;
    outer_save: real;
    outer_burial: real;
    total_use: real;
    total_defuse: real;
    export_total: real;
    export_use: real;
    export_defuse: real;
    export_save: real;
    export_burial: real;
    export_limit: real;
    balance_new: real;
  end;

var
  _q: array[0..9] of TADOQuery;
  
function snz(v:Variant):String;
begin
  result := VarToStr(v);
  if result = '0' then result :='';
end;

function fnz(v:Variant):Variant;
var
  f: real;
begin
  f := nz(v,0);
  if f = 0 then result :=''
  else
    result := f;
end;


procedure Init_Data(year:word);
var
  i: integer;
  sql: string;
begin
  for i := 0 to 9 do
  begin
    _q[i] := TADOQuery.Create(nil);
    _q[i].Connection := DataModule.DataModule1.KMCConnection;
  end;


  sql :=
'select '+
'	code_id,limit,balance_o as balance,normative_o as normative '+
'from '+
'	ws_codes_year '+
'where '+
'	year='+inttostr(year);

  ADOQueryExecute(_q[0],sql);

  sql :=
'select '+
'	code_id, sum(weight) as weight '+
'from  '+
'	ws_view_report '+
'where '+
'	((year='+inttostr(year-1)+' and (quarter=3 or quarter=4)) or '+
'	(year='+inttostr(year)+' and (quarter=1 or quarter=2)) ) and '+
'	src_company_id=5 '+
'group by '+
'	code_id '
;
  ADOQueryExecute(_q[1],sql);

sql :=
'select '+
'	code_id,operation_id, sum(weight) as weight '+
'from '+
'	ws_view_report '+
'where '+
'	((year='+inttostr(year-1)+' and (quarter=3 or quarter=4)) or '+
'	(year='+inttostr(year)+' and (quarter=1 or quarter=2)) ) and '+
'	src_company_id<>5 and '+
'	src_company_id>0 '+
'group by '+
'	code_id,operation_id '
;
  ADOQueryExecute(_q[2],sql);

sql :=
'select '+
'	code_id,operation_id, sum(weight) as weight '+
'from '+
'	ws_view_report '+
'where '+
'	((year='+inttostr(year-1)+' and (quarter=3 or quarter=4)) or '+
'	(year='+inttostr(year)+' and (quarter=1 or quarter=2)) ) and '+
'	src_company_id>0 and dst_company_id=5 and '+
'	operation_id>0 '+
'group by '+
'	code_id,operation_id '
;
  ADOQueryExecute(_q[3],sql);

sql :=
'select '+
'	code_id,operation_id, sum(weight) as weight '+
'from '+
'	ws_view_report '+
'where '+
'	((year='+inttostr(year-1)+' and (quarter=3 or quarter=4)) or '+
'	(year='+inttostr(year)+' and (quarter=1 or quarter=2)) ) and '+
'	dst_company_id<>5 and '+
'	operation_id>0 '+
'group by '+
'	code_id,operation_id'
;

  ADOQueryExecute(_q[4],sql);

  sql :=
'select '+
'	code_id, sum(weight) as weight '+
'from '+
'	ws_view_report '+
'where '+
'	((year='+inttostr(year-1)+' and (quarter=3 or quarter=4)) or '+
'	(year='+inttostr(year)+' and (quarter=1 or quarter=2)) ) and '+
'	src_company_id=5 and '+
'	operation_id>0 '+
'group by '+
'	code_id'
;

  ADOQueryExecute(_q[5],sql);


  sql :=
'select '+
'	code_id,limit,balance_o as balance,normative_o as normative '+
'from '+
'	ws_codes_year '+
'where '+
'	year='+inttostr(year-1);

  ADOQueryExecute(_q[6],sql);

    sql :=
'select '+
'	code_id, sum(weight) as weight '+
'from '+
'	ws_view_report '+
'where '+
'	((year='+inttostr(year-1)+' and (quarter=1 or quarter=2)) '+
'	 ) and '+
'	src_company_id=5 and '+
'	operation_id=0 '+
'group by '+
'	code_id'
;
    ADOQueryExecute(_q[7],sql);
end;

procedure Fin_Data;
var
  i: integer;
begin
  for i := 0 to 9 do
    _q[i].Free;
end;

function fmax(a,b:real):real;
begin
  if a>b then result := a else result := b;  
end;

procedure Get_Data(code_id:integer;var r:TInfo);
begin
  r.limit := nz(_q[0].Lookup('code_id',code_id,'normative'),0);
  r.balance := nz(_q[6].Lookup('code_id',code_id,'balance'),0)+nz(_q[7].Lookup('code_id',code_id,'weight'),0);
  r.produced := nz(_q[1].Lookup('code_id',code_id,'weight'),0);
  r.outer_use := nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,1]),'weight'),0) +
                  nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,4]),'weight'),0);
  r.outer_defuse := nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,2]),'weight'),0);
  r.outer_save := nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,5]),'weight'),0);
  r.outer_burial := nz(_q[2].Lookup('code_id;operation_id',VarArrayOf([code_id,3]),'weight'),0);
  r.outer_total := r.outer_use+r.outer_defuse+r.outer_save+r.outer_burial;
  r.total_use := nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,1]),'weight'),0)+
                  nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,4]),'weight'),0);
  r.total_defuse := nz(_q[3].Lookup('code_id;operation_id',VarArrayOf([code_id,2]),'weight'),0);

  r.export_use := nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,1]),'weight'),0) +
                  nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,4]),'weight'),0) +
                  nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,5]),'weight'),0);
  r.export_defuse := nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,2]),'weight'),0);
  r.export_save := 0 ;
  r.export_burial := nz(_q[4].Lookup('code_id;operation_id',VarArrayOf([code_id,3]),'weight'),0);
  r.export_total := r.export_use+r.export_save+r.export_burial+r.export_defuse;
  r.export_limit := nz(_q[0].Lookup('code_id',code_id,'limit'),0);
  r.balance_new :=  fmax(r.balance+r.produced - nz(_q[5].Lookup('code_id',code_id,'weight'),0),0);
end;



procedure Report_Teh_Build_adv(year:word;quarter:word;e:TExcelWriter);
var
  sql: widestring;
  data: Variant;
  rowid,cid: integer;
  clas: integer;
  wprev ,wcur: string;
  wcnt: integer;
  wsum,wweight: real;
begin
  sql := 'select '+
'	wr.code,wr.code_id,wr.waste,wr.class,wr.dst_company_id,wr.operation,sum(wr.weight) as [weight]  '+
'from  '+
'	ws_view_report as wr  '+
'	left join ws_codes_year as cy on cy.code_id=wr.code_id and cy.year='+inttostr(year)+'  '+
'where  '+
'(	(wr.year='+inttostr(year-1)+' and (wr.quarter=3 or wr.quarter=4)) or '+
'	(wr.year='+inttostr(year)+'  and (wr.quarter=1 or wr.quarter=2))  )  '+
' and  '+
'	wr.class>0 and  '+
'	wr.src_company_id=5 and   '+
'	wr.dst_company_id <> 5 and   '+
'	wr.dst_company_id is not null and     '+
'	wr.operation is not null  '+
'group by wr.code,wr.code_id,wr.waste,wr.class,wr.dst_company_id,wr.operation  '+
'order by wr.class,wr.waste,wr.dst_company_id,wr.operation  ';

  ADOQueryExecute(BQuery,sql);
  ADOQueryExecute(CQuery,'select * from ws_companies');

  data := VarArrayCreate([0,BQuery.RecordCount*2,0,9],varVariant);

  BQuery.First;
  rowid := 0;
  wprev := '';
  wsum  := 0;
  wcnt := 1;
  
  while not BQuery.EOF do
  with BQuery do
  begin
    clas := nz(FieldByName('class').Value,0);
    cid :=  nz(FieldByName('dst_company_id').Value,0);
    wcur := nz(FieldByName('waste').Value,'');
    wweight := nz(FieldByName('weight').Value,0);


    if (wprev <> wcur) then
    begin
      if wcnt > 1 then
      begin
        data[rowid,0] := rowid+1;
        data[rowid,1] := '';
        data[rowid,2] := 'Итого:';
        data[rowid,3] := wsum;
        data[rowid,4] := '';
        data[rowid,5] := '';
        data[rowid,6] := '';
        data[rowid,7] := '';
        data[rowid,8] := '';
        data[rowid,9] := '';
        inc(rowid);
      end;
      
      wcnt := 1;
      wsum := wweight;
    end else
    begin
      wsum := wsum + wweight;
      inc(wcnt);
    end;

    data[rowid,0] := rowid+1;
    data[rowid,1] := wcur;
    data[rowid,2] := nz(FieldByName('code').Value,'');
    data[rowid,3] := wweight;
    data[rowid,4] := nz(FieldByName('operation').Value,'');
    data[rowid,5] := nz(CQuery.Lookup('id',cid,'name'),'');
    data[rowid,6] := nz(CQuery.Lookup('id',cid,'address'),'');
    data[rowid,7] := nz(CQuery.Lookup('id',cid,'inn'),'');
    data[rowid,8] := nz(CQuery.Lookup('id',cid,'license'),'');
    data[rowid,9] := nz(CQuery.Lookup('id',cid,'contract'),'');
    inc(rowid);

    wprev := wcur;
    Next;
  end;

  if wcnt > 1 then
  begin
    data[rowid,0] := rowid+1;
    data[rowid,1] := '';
    data[rowid,2] := 'Итого:';
    data[rowid,3] := wsum;
    data[rowid,4] := '';
    data[rowid,5] := '';
    data[rowid,6] := '';
    data[rowid,7] := '';
    data[rowid,8] := '';
    data[rowid,9] := '';
    inc(rowid);
  end;

  e.SetActiveSheet(3);
  e.InsertRows(7,rowid-1);
  e.Range('A',7,'J',7+rowid-1).Value:= data;
  VarClear(data);
end;



procedure Report_Teh_Build(year:word;quarter:byte);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data,data2: Variant;
  rowid,realrow,realrow2: integer;
  code: string;
  code_id,i: integer;
  clas: integer;
  limit, f1,f2,f3,f4,f5: real;
  class_map: array[1..5] of integer;
  class_row: integer;
  row_number,total_rows : integer;
  info: TInfo;
  rowclas: array[0..5] of integer;
begin
  class_map[1] := 13;
  class_map[2] := 16;
  class_map[3] := 19;
  class_map[4] := 22;
  class_map[5] := 25;

  FillChar(rowclas[0],5*sizeof(integer),0);

  sql :=
'select '+
'	wr.code,wr.code_id,wr.waste,wr.class '+
'from '+
'	ws_view_report as wr '+
'	left join ws_codes_year as cy on cy.code_id=wr.code_id and cy.year='+inttostr(year)+' '+
'where '+
'(	(wr.year='+inttostr(year-1)+' and (wr.quarter=3 or wr.quarter=4)) or ' +
'	(wr.year='+inttostr(year)+' and (wr.quarter=1 or wr.quarter=2))  )' +
' and '+
'	wr.class>0 and '+
'	wr.src_company_id=5 '+
'group by wr.code,wr.code_id,wr.waste,wr.class '+
'order by wr.class,wr.waste '
;

  ADOQueryExecute(AQuery,sql);




  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\oos\отчет баланс.xlt');
  e.Show;

  {
  e.SetActiveSheet('данные');
  e.CellsB['B4'].Value := FormatDateTIme('dd.mm.yyyy',Date());
  e.CellsB['B1'].Value := inttostr(quarter)+' квартал '+inttostr(year)+' г.';
  e.SetActiveSheet(1);
   }

 e.SetActiveSheet(1);
  e.CellsB['A4'] := FormatDateTIme('dd.mm.yyyy',EncodeDate(year-1,7,1));
  e.CellsB['B4'] := FormatDateTIme('dd.mm.yyyy',EncodeDate(year,6,1));

  row_number := AQuery.RecordCount;

  Init_Data(year);
  
for i := 5 downto 1 do
begin
  class_row := class_map[i];
  AQuery.Filtered := false;
  AQuery.Filter := ' class='+inttostr(i);
  AQuery.Filtered := true;
  

  
  if AQuery.RecordCount<=0 then continue;
  

  data := VarArrayCreate([0,AQuery.RecordCount-1,0,11],varVariant);
  data2 := VarArrayCreate([0,AQuery.RecordCount-1,0,17],varVariant);

  AQuery.First;
  rowid := 0;

  row_number := row_number - AQuery.RecordCount;

  while not AQuery.EOF do
  with AQuery do
  begin

      code := nz(FieldByName('code').Value,'');
      code_id := nz(FieldByName('code_id').Value,0);
      clas := nz(FieldByName('class').Value,0);

      Get_Data(code_id,info);
      
      data[rowid,0] := clas*100+rowclas[clas]+1;//row_number+rowid+1;
      data[rowid,1] := nz(FieldByName('waste').Value,'');
      data[rowid,2] := code;
      data[rowid,3] := clas;
      data[rowid,4] := fnz(info.balance);
      data[rowid,5] := fnz(info.produced);
      data[rowid,6] := fnz(info.limit);

      data[rowid,7] := fnz(info.outer_total);
      data[rowid,8] := fnz(info.outer_use);
      data[rowid,9] := fnz(info.outer_defuse);
      data[rowid,10] := fnz(info.outer_save);
      data[rowid,11] := fnz(info.outer_burial);

      data2[rowid,0] := clas*100+rowclas[clas]+1;
      data2[rowid,1] := '';
      data2[rowid,2] := fnz(info.total_use);
      data2[rowid,3] := fnz(info.total_defuse);
      data2[rowid,4] := fnz(info.export_total);
      data2[rowid,5] := fnz(info.export_defuse);
      data2[rowid,6] := fnz(info.export_use);
      data2[rowid,7] := fnz(info.export_save);
      data2[rowid,8] := fnz(info.export_burial);
      data2[rowid,9] := fnz(info.export_limit);

      data2[rowid,15] := fnz(info.produced+info.balance);
      data2[rowid,16] := fnz(info.balance_new);

    inc(rowid);
    inc(rowclas[clas]);
    Next;
  end;

  e.SetActiveSheet(1);
  e.InsertRows(class_row-1,AQuery.RecordCount-1);
  e.Range('A',class_row,'L',class_row+AQuery.RecordCount-1).Value:= data;

  e.SetActiveSheet(2);
  e.InsertRows(class_row-1,AQuery.RecordCount-1);
  e.Range('A',class_row,'R',class_row+AQuery.RecordCount-1).Value:= data2;

  VarClear(data);
end;

  Report_Teh_Build_adv(year,quarter,e);

  e.SetActiveSheet(1);


  Fin_Data;

  e.Free;
end;

end.

