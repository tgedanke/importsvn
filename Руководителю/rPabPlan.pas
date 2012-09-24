unit rPabPlan;

interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;


procedure Report_Pab_Plan(date1:TDateTime;date2:TDateTime);

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

const
  _month:array[1..12] of string=(
  '€нварь','февраль','март','апрель','май','июнь',
  'июль','август','сент€брь','окт€брь','но€брь','декабрь'
  );

procedure Report_Pab_Plan(date1:TDateTime;date2:TDateTime);
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
  y1,y2,m1,m2,d1,d2: word;
  p1,p2,pc: integer;
begin

  DateTimeToString(sdate1,'dd.mm.yyyy',date1);
  DateTimeToString(sdate2,'dd.mm.yyyy',date2);

  DecodeDate(date1,y1,m1,d1);
  DecodeDate(date2,y2,m2,d2);
  
  p1 := y1*12+(m1-1);
  p2 := y2*12+(m2-1);
  pc := p2 - p1;

  if pc<0 then
  begin
    ShowErrorBox('неверно указан период дл€ отчета');
    exit;
  end;
  
  sql := 'set dateformat dmy; select * from pab_plan_report_view where (year*12+month-1)>='+_i(p1)+' and (year*12+month-1)<='+_i(p2);

  sql := sql +' order by fio';

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных дл€ отчета.');
    exit;
  end;
  
  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\pab\отчет по плану.xlt');
  e.Show;


  for i := 0 to pc-1 do
  begin
    e.Excel.ActiveWorkbook.Worksheets[1].Copy(After:=e.Excel.ActiveWorkbook.Worksheets[1]);
  end;


for I := 0 to pc do
begin
  p2 := p1 + i;
  y2 := p2 div 12;
  m2 := p2 mod 12 + 1;
   
  e.Excel.ActiveWorkbook.Worksheets[i+1].Name := inttostr(y2)+' - '+_month[m2];
  e.SetActiveSheet(i+1);

  AQuery.Filter := 'year='+inttostr(y2)+' and month='+inttostr(m2);
  AQuery.Filtered := true;
  datalen :=  AQuery.RecordCount;

  if datalen=0 then continue;
  
  e.InsertRows(6,datalen-1);

  data := VarArrayCreate([0,datalen-1,0,8],varVariant);

  e.CellsB['A2'] := 'за '+_month[m2]+' '+inttostr(y2)+' года';

  AQuery.First;
  rowid := 0;

  while not AQuery.EOF do
  with AQuery do
  begin

    data[rowid,0] := nz(FieldByName('fio').Value,'');
    data[rowid,1] := nz(FieldByName('week1').Value,'');
    data[rowid,2] := nz(FieldByName('real_week1').Value,'');
    data[rowid,3] := nz(FieldByName('week2').Value,'');
    data[rowid,4] := nz(FieldByName('real_week2').Value,'');
    data[rowid,5] := nz(FieldByName('week3').Value,'');
    data[rowid,6] := nz(FieldByName('real_week3').Value,'');
    data[rowid,7] := nz(FieldByName('week4').Value,'');
    data[rowid,8] := nz(FieldByName('real_week4').Value,'');

    inc(rowid);

    Next;
  end;

  e.Range('A',7,'I',7+datalen-1).Value := data;
  VarClear(data);
  
end;

  e.Free;
end;

end.
