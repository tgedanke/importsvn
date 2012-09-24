unit rSeverstal;

interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Report_Severstal_Build(year:word;quarter:byte);

implementation


procedure Report_Severstal_Build(year:word;quarter:byte);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid: integer;
  f1,f2,f3,f4:real;
  code,dept: string;
  clas: integer;
  i: integer;
  rowmap:array[1..5] of integer;
begin
  rowmap[1] := 0;
  rowmap[2] := 0;
  rowmap[3] := 10;
  rowmap[4] := 13;
  rowmap[5] := 16;
  /// prepare data
  sql :=
'select'+
' [code_id],max([code]) as [code],[class],[waste],'+
' dst_dept,'+
' operation_id,'+
' max(limit) as limit,'+
' sum(w.weight) as weight '+
'from ws_view_report as w '+
'where '+
' [year]='+inttostr(year)+' and '+
' [quarter]<='+inttostr(quarter)+' and '+
' dst_company_id=3 '+
'group by '+
'[code_id],'+
'[class],'+
'[waste],'+
'[dst_dept],'+
'[operation_id]';

  ADOQueryExecute(AQuery,sql);

  sql :=
' select distinct'+
' [code_id],max([code]) as [code],[class],[waste],max(limit) as limit,'+
' dst_dept'+
' from ws_view_report as w '+
' where '+
' [year]='+inttostr(year)+' and '+
' [quarter]<='+inttostr(quarter)+' and '+
' dst_company_id=3 and'+
' operation_id>0'+
' group by '+
' [code_id],'+
' [class],'+
' [waste],'+
' [dst_dept]';

  ADOQueryExecute(BQuery,sql);
  
  if AQuery.EOF then
  begin
    ShowErrorBox('No data found for report.');
    exit;
  end;

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\oos\отчтет по отходам переданных на объекты ОАО ''Северсталь''.xlt');
  e.Show;
  e.SetActiveSheet('данные');
  e.CellsB['B2'].Value := FormatDateTIme('dd.mm.yyyy',Date());
  e.CellsB['B1'].Value := inttostr(quarter*3)+IIF(quarter=1,' месяца ',' месяцев ')+inttostr(year)+' г.';
  e.SetActiveSheet(1);

for I := 5 downto 3 do
begin

  BQUery.Filter := 'class='+inttostr(i);
  BQUery.Filtered := true;
  BQuery.First;
  
  if BQuery.EOF then
  begin
    // 5 class not found , hide info
  end else
  begin
   // ShowMessage(inttostr(AQuery.RecordCount));
    e.InsertRows(rowmap[i]+1,BQuery.RecordCount-1);
    data := VarArrayCreate([0,BQuery.RecordCount-1,0,10],varVariant);

    rowid := 0;
    while not BQuery.EOF do
    with BQuery do
    begin

      code := nz(FieldByName('code').Value,'');
      dept := nz(FieldByName('dst_dept').Value,'');
      clas := nz(FieldByName('class').Value,0);

      f1 := nz(AQuery.Lookup('code;class;dst_dept;operation_id',
          VarArrayOf([code,clas,dept,1]), ///'для использования'
          'weight'),0);
      f1 := f1 + nz(AQuery.Lookup('code;class;dst_dept;operation_id',
          VarArrayOf([code,clas,dept,4]), ///'для переработки'
          'weight'),0);
      f2 := nz(AQuery.Lookup('code;class;dst_dept;operation_id',
          VarArrayOf([code,clas,dept,2]), ///'для обезвреживания'
          'weight'),0);
      f3 := nz(AQuery.Lookup('code;class;dst_dept;operation_id',
          VarArrayOf([code,clas,dept,3]), ///'для захоронения'
          'weight'),0);


      f4 := f1 + f2 + f3;
      ////'=CELL("contents",Indirect(Concatenate("H",ROW())))';
      data[rowid,0] := '=ROW()-7';
      data[rowid,1] := nz(FieldByName('waste').Value,'');
      data[rowid,2] := code;
      data[rowid,3] := clas;
      data[rowid,5] := nz(FieldByName('limit').Value,'0');
      data[rowid,6] := f4;
      data[rowid,7] := f1;
      data[rowid,8] := f2;
      data[rowid,9] := f3;
      data[rowid,10] := dept;


      inc(rowid);
      BQuery.Next;
    end;

    e.Range('A',rowmap[i]+2,'K',rowmap[i]+2+BQuery.RecordCount-1).Value := data;

    VarClear(data);
  end;
end;



  e.Free;
end;

end.

