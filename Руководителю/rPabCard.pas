unit rPabCard;

interface

uses uExcel,sysutils,DataModule,Dialogs,Variants,ADODB;

procedure Print_Pab_Card(id:integer);

implementation


function get_place(v1,v2:Variant):string;
begin
  result := nz(v1,'');
  if not varisnull(v2) then
  result := result + ', '+nz(v2,'');
end;

function get_name_date(d,v1,v2:Variant):string;
begin
  result := nz(v1,'');
  if not varisnull(v2) then
  result := result + ', '+nz(v2,'');
  if not varisnull(d) then
  begin
    result := FormatDateTime('dd.mm.yyyy',d) + ' - '+ result;
  end;
  
end;

function get_time(v1,v2:Variant):string;
begin
  result := nz(v1,'');
  if not varisnull(v2) then
  result := result + ' - '+nz(v2,'');
end;

procedure get_cell_by_letter(letter:string;var row:integer;var col:integer);
begin
  if letter = 'À' then
  begin
    row := 17;
    col := 2;
  end else
  if letter = 'Á' then
  begin
    row := 17;
    col := 7;
  end else
  if letter = 'Â' then
  begin
    row := 17;
    col := 14;
  end else
  if letter = 'Ã' then
  begin
    row := 27;
    col := 2;
  end else
  if letter = 'Ä' then
  begin
    row := 27;
    col := 7;
  end else
  if letter = 'Å' then
  begin
    row := 27;
    col := 14;
  end;
end;

function get_possible_effect(pab_id:integer):string;
begin
  ADOQueryExecute(DQuery,'select dbo.pab_get_possible_effect('+inttostr(pab_id)+')');
  if DQuery.Eof then
  begin
    result := '';
  end else
  begin
    result := nz(DQuery.Fields[0].Value,'');
  end;
end;

function get_what_done(pab_id:integer):string;
begin
  ADOQueryExecute(DQuery,'select dbo.pab_get_what_done('+inttostr(pab_id)+')');
  if DQuery.Eof then
  begin
    result := '';
  end else
  begin
    result := nz(DQuery.Fields[0].Value,'');
  end;
end;

procedure Print_Pab_Card(id:integer);
var
  e: TExcelWriter;
  path: string;
  sql: widestring;
  letter: string;
  cnt,row,col: integer;
begin
  sql := 'select * from pab_main_view where id='+inttostr(id);
  ADOQueryExecute(queries[0],sql);

  sql := 'select letter,name, '+
	'(case isnull(pab_id,0) when 0 then 0 else 1 end) as checked  '+
'from  '+
'pab_groups as g '+
'left join pab_main_group as m on '+
'	g.id = m.group_id and '+
'	m.pab_id = '+inttostr(id)+
' order by letter,id';

  ADOQueryExecute(queries[1],sql);




  e := TExcelWriter.Create;
  path := extractfilepath(paramstr(0));
  e.Open(path+'templates\מעקוע ןאב.xlt');
  e.Show;

  with queries[0] do
  begin
    e.CellsB['E2'] := nz(FieldByName('num').Value,1);
    e.CellsB['E3'] := get_name_date(FieldByName('date').Value,FieldByName('tester').Value,FieldByName('tester_post').Value);
    e.CellsB['E4'] := nz(FieldByName('count').Value,0);
    e.CellsB['E5'] := get_place(FieldByName('ceh').Value,FieldByName('uchastok').Value);

    e.CellsB['E7'] := nz(FieldByName('type').Value,'');
    e.CellsB['K7'] := nz(FieldByName('fatal_effect').Value,'');
    e.CellsB['Q7'] := get_time(FieldByName('time_start').Value,FieldByName('time_end').Value);
    e.CellsB['A8'] := nz(FieldByName('audit_kind').Value,'');

    e.CellsB['E9'] := nz(FieldByName('work_kind').Value,'');
    e.CellsB['E10'] := nz(FieldByName('danger_descripton').Value,'');

    e.CellsB['E11'] := nz(FieldByName('possible_effect').Value,'');
    e.CellsB['E12'] := nz(FieldByName('what_done').Value,'');

    e.CellsB['E13'] := nz(FieldByName('worker_idea').Value,'');

    e.CellsB['A15'] := nz(FieldByName('category').Value,'');

    e.CellsB['H8'] := nz(FieldByName('age_category').Value,'');
    e.CellsB['K8'] := nz(FieldByName('work_time').Value,'');
    e.CellsB['P8'] := nz(FieldByName('proffession').Value,'');

    if nz(FieldByName('locked').Value,0)=2 then
    begin
      e.CellsB['E15'] := nz(FieldByName('boss_decision').Value,'');
      e.CellsB['K15'] := nz(FieldByName('boss_date').Value,'');
      e.CellsB['N15'] := nz(FieldByName('boss_name').Value,'');
    end else
    begin
      e.CellsB['E15'] := '';
      e.CellsB['K15'] := '';
      e.CellsB['N15'] := '';
    end;
    
  end;

  letter := '';
  cnt := 0;
  
  with queries[1] do
  while not eof do
  begin
    if FieldByName('letter').Value<>letter then
    begin
      letter := FieldByName('letter').Value;
      get_cell_by_letter(letter,row,col);
      cnt := 0;
    end;

    e.Cells[col,row+cnt] := nz(FieldByName('name').Value,'');
    if FieldByName('checked').Value=1 then
      e.Cells[col-1,row+cnt] := 'v';
    
    inc(cnt);
    Next;
  end;

  e.Excel.ActiveWorkbook.Printout(Preview:=true);
  e.Excel.DisplayAlerts:= false;
  e.Excel.Quit;
  
  e.Free;
end;

end.
