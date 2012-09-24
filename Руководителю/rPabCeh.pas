unit rPabCeh;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;


procedure Report_Pab_Ceh(date1:TDateTime;date2:TDateTime;ceh_id:integer);

implementation

type
 TCeh = record
   id:integer;
   name: string;
 end;

 TNorm = record
   k: real;
   p: real;
 end;

procedure Report_Pab_Ceh(date1:TDateTime;date2:TDateTime;ceh_id:integer);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid: integer;
  i: integer;
  sdate1,sdate2: string;
  datalen: integer;
begin

  DateTimeToString(sdate1,'dd.mm.yyyy',date1);
  DateTimeToString(sdate2,'dd.mm.yyyy',date2);



  sql := 'set dateformat dmy; select * from pab_main_view where date>='''+sdate1+''' and date<='''+sdate2+''' and (locked=1 or locked=2)';

  if ceh_id<>0 then
  begin
    sql := sql + ' and cehid='+inttostr(ceh_id)+'  order by tester,date';
  end else
  begin
    sql := sql +' order by ceh,tester,date';
  end;

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\pab\отчет по цеху.xlt');
  e.Show;

  e.SetActiveSheet(1);

  datalen := AQuery.RecordCount-1;

  e.InsertRows(8,datalen);

  data := VarArrayCreate([0,datalen,0,10],varVariant);

  if ceh_id=0 then
  begin
    e.CellsB['A2'] := 'во всех цехах за период '+sdate1+' - '+sdate2;
  end else
  begin
    e.CellsB['A2'] := 'в '+GetSingleSQLResult('select name from pab_ceh_view where id='+inttostr(ceh_id),'')+' за период '+sdate1+' - '+sdate2;
  end;
  //e.CellsB['D3'] := post;
  //e.CellsB['D4'] := sdate1+' - '+sdate2;

  AQuery.First;
  rowid := 0;

  while not AQuery.EOF do
  with AQuery do
  begin

    data[rowid,0] := nz(FieldByName('num').Value,'');
    data[rowid,1] := nz(FieldByName('date').Value,'');
    if ceh_id=0 then
    begin
      data[rowid,2] := nz(FieldByName('ceh').Value,'')+' - '+nz(FieldByName('uchastok').Value,'');
    end else
    begin
      data[rowid,2] := nz(FieldByName('uchastok').Value,'');
    end;
    data[rowid,3] := nz(FieldByName('tester').Value,'');
    data[rowid,4] := nz(FieldByName('time_start').Value,'');
    data[rowid,5] := nz(FieldByName('time_end').Value,'');
    data[rowid,6] := nz(FieldByName('work_kind').Value,'');
    data[rowid,7] := nz(FieldByName('possible_effect').Value,'');
    data[rowid,8] := nz(FieldByName('category').Value,'');
    data[rowid,9] := nz(FieldByName('boss_decision').Value,'');

    inc(rowid);
    Next;
  end;


  e.Range('A',9,'J',9+datalen).Value := data;
  VarClear(data);

  e.Free;
end;

end.
