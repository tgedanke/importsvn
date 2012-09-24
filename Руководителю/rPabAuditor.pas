unit rPabAuditor;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;


procedure Report_Pab_Auditor(date1:TDateTime;date2:TDateTime;user_id:integer;ceh_id:integer);

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

procedure Report_Pab_Auditor(date1:TDateTime;date2:TDateTime;user_id:integer;ceh_id:integer);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid: integer;
  i: integer;
  sdate1,sdate2: string;
  post,fio: string;
  datalen: integer;
  last_name: string;
  last_ceh: string;
  sname,ceh:string;
begin

  DateTimeToString(sdate1,'dd.mm.yyyy',date1);
  DateTimeToString(sdate2,'dd.mm.yyyy',date2);



  sql := 'set dateformat dmy; select * from pab_main_view where date>='''+sdate1+''' and date<='''+sdate2+''' and (locked=1 or locked=2)';

  if ceh_id<>0 then
  begin
    sql := sql + ' and cehid='+inttostr(ceh_id);
  end;

  if user_id<>0 then
  begin
    fio := UserGetNameById(user_id);
    post := fio+', '+UserGetPostById(user_id);
    sql := sql + ' and tester='''+fio+'''';
  end else
  begin
    post := 'все сотрудники';
    fio := '';
  end;

  sql := sql +' order by ceh,uchastok';

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;


  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\pab\отчет по аудитору.xlt');
  e.Show;

  e.SetActiveSheet(1);

  datalen := AQuery.RecordCount*3-1;

  e.InsertRows(8,datalen);

  data := VarArrayCreate([0,datalen,0,10],varVariant);

  e.CellsB['D3'] := post;
  e.CellsB['D4'] := sdate1+' - '+sdate2;

  AQuery.First;
  rowid := 0;
  i := 0;
  last_name := '';
  last_ceh := '';
  
  while not AQuery.EOF do
  with AQuery do
  begin

    sname := nz(FieldByName('tester').Value,'')+', '+nz(FieldByName('tester_post').Value,'');
    ceh :=  nz(FieldByName('ceh').Value,'')+' - '+nz(FieldByName('uchastok').Value,'');

    if sname<>last_name then
    begin
      last_name := sname;
      last_ceh := '';
      data[rowid,0] := sname;
      e.Range('A',9+rowid,'J',9+rowid).Merge;
      inc(rowid);
    end;

    //if ceh<>last_ceh then
   // begin
    //  last_ceh := ceh;
   //   data[rowid,0] := ceh;
   //   e.Range('A',9+rowid,'J',9+rowid).Merge;
   //   inc(rowid);
   // end;



    data[rowid,0] := nz(FieldByName('num').Value,'');
    data[rowid,1] := nz(FieldByName('date').Value,'');
    data[rowid,2] := nz(FieldByName('ceh').Value,'')+' - '+nz(FieldByName('uchastok').Value,'');
    data[rowid,3] := nz(FieldByName('audit_kind').Value,'');
    data[rowid,4] := nz(FieldByName('work_kind').Value,'');
    data[rowid,5] := nz(FieldByName('danger_descripton').Value,'');
    data[rowid,6] := nz(FieldByName('possible_effect').Value,'');
    data[rowid,7] := nz(FieldByName('what_done').Value,'');
    data[rowid,8] := nz(FieldByName('category').Value,'');
    data[rowid,9] := nz(FieldByName('boss_decision').Value,'');

    inc(rowid);
    inc(i);
    Next;
  end;


  e.Range('A',9,'J',9+datalen).Value := data;
  VarClear(data);

  if rowid<datalen+1 then
  begin
    e.Range('A',9+rowid,'Z',9+datalen+1).Delete;
  end;
  
  e.Free;
end;

end.
