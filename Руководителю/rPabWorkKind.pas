unit rPabWorkKind;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;



procedure Report_Pab_WorkKind(date1:TDateTime;date2:TDateTime;user_id,ceh_id:integer);

implementation


procedure Report_Pab_WorkKind(date1:TDateTime;date2:TDateTime;user_id,ceh_id:integer);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid: integer;
  i: integer;
  sdate1,sdate2: string;
  datalen: integer;
  typ,last_typ: string;
begin

  DateTimeToString(sdate1,'dd.mm.yyyy',date1);
  DateTimeToString(sdate2,'dd.mm.yyyy',date2);



  sql := 'set dateformat dmy; select * from pab_main_view where date>='''+sdate1+''' and date<='''+sdate2+''' and (locked=1 or locked=2)';

  if user_id<>0 then
  begin
    sql := sql + ' and (tester='''+UserGetNameById(user_id)+''')';
  end;

  if ceh_id<>0 then
  begin
    sql := sql + ' and (cehid='+inttostr(ceh_id)+')';
  end;
  
  sql := sql +' order by work_kind,ceh,uchastok,date';

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\pab\отчет по видам работ.xlt');
  e.Show;

  e.SetActiveSheet(1);

  datalen := AQuery.RecordCount*2-1;

  e.InsertRows(8,datalen);

  data := VarArrayCreate([0,datalen,0,10],varVariant);


  e.CellsB['A3'] := 'за период '+sdate1+' - '+sdate2;

  AQuery.First;
  rowid := 0;
  i := 0;
  last_typ := 'none';
  
  while not AQuery.EOF do
  with AQuery do
  begin
    typ := nz(FieldByName('work_kind').Value,'');
    if typ<>last_typ then
    begin
      data[rowid,0] := nz(FieldByName('work_kind').Value,'');
      last_typ := typ;
      e.Range('A',9+rowid,'J',9+rowid).Merge;
      e.Range('A',9+rowid,'J',9+rowid).Font.Bold := true;
      inc(rowid);
    end;

    data[rowid,0] := nz(FieldByName('num').Value,'');
    data[rowid,1] := nz(FieldByName('date').Value,'');

    data[rowid,2] := nz(FieldByName('ceh').Value,'')+' - '+nz(FieldByName('uchastok').Value,'');

    data[rowid,3] := nz(FieldByName('type').Value,'');
    data[rowid,4] := nz(FieldByName('fatal_effect').Value,'');
    data[rowid,5] := nz(FieldByName('possible_effect').Value,'');
    data[rowid,6] := nz(FieldByName('what_done').Value,'');
    data[rowid,7] := nz(FieldByName('category').Value,'');
    data[rowid,8] := nz(FieldByName('boss_decision').Value,'');
    data[rowid,9] := nz(FieldByName('boss_name').Value,'');

    inc(rowid);
    inc(i);
    Next;
  end;


  e.Range('A',9,'J',9+datalen).Value := data;
  VarClear(data);
  if rowid<datalen+1 then
  begin
    e.Range('A',9+rowid,'J',9+datalen).Delete;
  end;
  e.Free;
end;

end.
