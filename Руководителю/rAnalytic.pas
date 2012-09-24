unit rAnalytic;


interface
uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;


procedure Report_Pab_Analytic_Month(date1:TDateTime;date2:TDateTime;ceh_id:integer);
procedure Report_Pab_Analytic_Mode(date1:TDateTime;date2:TDateTime;mode:integer);

implementation

procedure Report_Pab_Analytic_Month(date1:TDateTime;date2:TDateTime;ceh_id:integer);
const map2: array[0..5] of char = ('А','Б','В','Г','Д','Е');
const map: array[0..5] of integer = (12,15,18,21,24,27) ;
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid: integer;
  i: integer;
  sdate1,sdate2: string;
  s: AnsiString;
  datalen: integer;
  d,m,y: word;
  d2,m2,y2: word;
begin

  DecodeDate(Now,y,m,d);
  DecodeDate(date1,y2,m2,d2);

  DateTimeToString(sdate1,'dd.mm.yyyy',date1);
  DateTimeToString(sdate2,'dd.mm.yyyy',date2);

  sql := 'set dateformat dmy; select * from pab_get_analytic('''+sdate1+''','''+sdate2+''','+inttostr(ceh_id)+')';

  ADOQueryExecute(AQuery,sql);

  if AQuery.EOF then
  begin
    ShowErrorBox('нет данных для отчета.');
    exit;
  end;

  /// write data to Excel document
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\pab\отчет по аналитике.xlt');
  e.Show;
  e.CellsB['A1'] := d;

  s := months2[m];
  e.CellsB['B1'] := s;

  e.CellsB['C1'] := y;


  if ceh_id=0 then
  begin
    e.CellsB['A2'] := '';
    e.CellsB['C2'] := '';
  end
  else
  begin
    e.CellsB['C2'] := GetSingleSQLResult('select top 1 name_short from pab_users where (post like ''начальник%'') and show_in_graphic=1 and ceh='+inttostr(ceh_id)+' and ceh<>0','');
    e.CellsB['A2'] := GetSingleSQLResult('select top 1 name from pab_ceh where id='+inttostr(ceh_id),'');
  end;

  s := months[m2];
  e.CellsB['B2'] := s;


for I := 5 downto 0 do
begin
  AQuery.Filter := 'letter='''+map2[i]+'''';
  AQuery.Filtered := true;

  datalen := AQuery.RecordCount;

  if datalen=0 then continue;
  
  e.InsertRows(map[i],AQuery.RecordCount-1);

  data := VarArrayCreate([0,AQuery.RecordCount-1,0,7],varVariant);

  AQuery.First;
  rowid := 0;

  while not AQuery.EOF do
  with AQuery do
  begin

    data[rowid,0] := nz(FieldByName('name').Value,'');
    data[rowid,1] := nz(FieldByName('total').Value,0);
    data[rowid,2] := nz(FieldByName('t1').Value,0);
    data[rowid,3] := nz(FieldByName('t2').Value,0);
    data[rowid,4] := nz(FieldByName('t34').Value,0);
    data[rowid,5] := nz(FieldByName('e1').Value,0);
    data[rowid,6] := nz(FieldByName('e2').Value,0);
    data[rowid,7] := nz(FieldByName('e3').Value,0);

    inc(rowid);
    Next;
  end;

  e.Range('A',map[i],'H',map[i]+datalen-1).Value := data;
  VarClear(data);
end;

  e.Free;
end;




procedure Report_Pab_Analytic_Mode(date1:TDateTime;date2:TDateTime;mode:integer);
type
  TInfo=record
    n: integer;
    c: char;
    dm:byte;
  end;

const
  map: array[2..3] of TInfo = ((n: 3;c: 'D';dm:1),(n: 4;c: 'C';dm:3));

var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  data: Variant;
  rowid: integer;
  i,j: integer;
  sdate1,sdate2: string;
  startCol: char;
  n: integer;
  d,m,y: word;
  nd,nm,ny: word;
  d2,d3,m2,m3: word;
  dt1,dt2: string;
begin
  DecodeDate(date1,y,m,d);
  DecodeDate(Now,ny,nm,nd);

  data := VarArrayCreate([0,19,0,map[mode].n-1],varVariant);
  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\pab\отчет по аналитике за квартал.xlt');
  e.Show;

  e.CellsB['A1'] := nd;
  e.CellsB['B1'] := months2[nm];
  e.CellsB['C1'] := ny;
  e.CellsB['C3'] := map[mode].n;
  
  if mode = 2 then
  begin
    e.CellsB['A3'] := 'месяцам';
    e.CellsB['B2'] := inttostr((m-1) div 3 +1)+' квартал '+inttostr(y)+' года';
    e.Sheet.Columns['C:C'].Hidden := true;
  end else
  begin
    e.CellsB['A3'] := 'кварталам';
    e.CellsB['B2'] := inttostr(y)+' год';
  end;

  for I := 0 to map[mode].n-1 do
  begin
    d2 := 1;
    m2 := m+i*map[mode].dm;
    m3 := m2+map[mode].dm-1;
    d3 := MonthDays[IsLeapYear(y)][m3];
    DateTimeToString(dt1,'dd.mm.yyyy',EncodeDate(y,m2,d2));
    DateTimeToString(dt2,'dd.mm.yyyy',EncodeDate(y,m3,d3));
    sql := 'set dateformat dmy; select * from pab_get_analytic_total('''+dt1+''','''+dt2+''')';
    ADOQueryExecute(AQuery,sql);

    for j := 0 to 18 do
    if (j<>7) and (j<>14) then
    begin
      data[j+1,i] := AQuery.Fields[j].Value;
    end;

    if mode = 2 then
    begin
      data[0,i] := months[m2];
    end else
    begin
      data[0,i] := inttostr(i+1)+' квартал';
    end;
    
  end;

  e.Range(map[mode].c,10,'F',29).Value := data;
  
  VarClear(data);
  e.Free;
end;

end.
