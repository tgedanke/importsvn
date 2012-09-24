unit uExcel;

interface

uses variants,sysutils,ComObj;

type

TExcelWriter = class
private

protected

  type
    TCell = record
      ACol:word;
      ARow:word;
    end;

  var
  
  _excel: Variant;
  _sheet: Variant;
  
  function GetCells(ACol:word;ARow:word):Variant;
  procedure SetCells(ACol:word;ARow:word;Value:Variant);
  function GetCells2(ACol:string;ARow:word):Variant;
  procedure SetCells2(ACol:string;ARow:word;Value:Variant);
  function GetCells3(ACell:string):Variant;
  procedure SetCells3(ACell:string;Value:Variant);

  function ColToInt(ACol:string):word;
  function CellToInt(ACell:string):TCell;
  function IntToCol(ACol:Word):string;
public
  constructor Create;
  destructor Destroy;override;

  procedure Open(filename:string);
  procedure SetActiveSheet(ASheetName:string);overload;
  procedure SetActiveSheet(ASheetIndex:integer);overload;
  procedure Close;
  procedure Show;
  procedure Hide;

  procedure InsertRows(ARowAfter:word;ACount:word);
  procedure InsertCols(AColAfter:word;ACount:word);overload;
  procedure InsertCols(AColAfter:string;ACount:word);overload;

  procedure CopyRange(ACol:word;ARow:word;AColCount:word;ARowCount:word;Data:Variant);overload;
  procedure CopyRange(ACol:string;ARow:word;AColCount:word;ARowCount:word;Data:Variant);overload;
  procedure CopyRange(ARange:Variant;Data:Variant);overload;

  function Range(ACol:word;ARow:word;BCol:word;BRow:word):Variant;overload;
  function Range(ACol:string;ARow:word;BCol:string;BRow:word):Variant;overload;
  function Range(ACell:string;BCell:string):Variant;overload;

  property Cells[ACol:word;ARow:word]:Variant read GetCells write SetCells;
  property CellsA[ACol:string;ARow:word]:Variant read GetCells2 write SetCells2;
  property CellsB[ACell:string]:Variant read GetCells3 write SetCells3;
  property Excel: Variant read _excel;
  property Sheet: Variant read _sheet;
end;

implementation

const map = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
constructor TExcelWriter.Create;
begin
  _excel := null;
  _sheet := null;
end;

destructor TExcelWriter.Destroy;
begin
end;

procedure TExcelWriter.Open(filename:string);
begin
  _excel := CreateOleObject('Excel.Application');
  _excel.Workbooks.Open(filename);
  _sheet := _excel.ActiveWorkbook.ActiveSheet;
end;

procedure TExcelWriter.SetActiveSheet(ASheetName:string);
begin
  _sheet := _excel.ActiveWorkbook.Worksheets[ASheetName];
  _sheet.Activate;
end;

procedure TExcelWriter.SetActiveSheet(ASheetIndex:integer);
begin
  _sheet := _excel.ActiveWorkbook.Worksheets[ASheetIndex];
  _sheet.Activate;
end;

procedure TExcelWriter.Close;
begin
  _excel.ActiveWorkbook.Close;
  _excel.Quit;
  _excel := null;
  _sheet := null;
end;

procedure TExcelWriter.Show;
begin
  _excel.Visible := true;
end;

procedure TExcelWriter.Hide;
begin
  _excel.Visible := false;
end;

procedure TExcelWriter.InsertRows(ARowAfter:word;ACount:word);
var
  i: integer;
begin
  for i := 1 to ACount do
    _sheet.Rows[inttostr(ARowAfter+1)+':'+inttostr(ARowAfter+1)].Insert;
end;

procedure TExcelWriter.InsertCols(AColAfter:word;ACount:word);
begin
end;

procedure TExcelWriter.InsertCols(AColAfter:string;ACount:word);

begin
  InsertCols(ColToInt(AColAfter),ACount);
end;

procedure TExcelWriter.CopyRange(ACol:word;ARow:word;AColCount:word;ARowCount:word;Data:Variant);
begin
  CopyRange(Range(ACol,ARow,ACol+AColCount,ARow+ARowCount),data);
end;

procedure TExcelWriter.CopyRange(ACol:string;ARow:word;AColCount:word;ARowCount:word;Data:Variant);
begin
  CopyRange(ColToInt(ACol),ARow,AColCount,ARowCount,Data);
end;

procedure TExcelWriter.CopyRange(ARange:Variant;Data:Variant);
begin
  ARange.Value := Data;
end;

function TExcelWriter.Range(ACol:word;ARow:word;BCol:word;BRow:word):Variant;
var
  c1,c2: string;
begin
  c1 := IntToCol(ACol-1)+inttostr(ARow);
  c2 := IntToCol(BCol-1)+inttostr(BRow);
  result := Range(c1,c2);
end;

function TExcelWriter.Range(ACol:string;ARow:word;BCol:string;BRow:word):Variant;
var
  c1,c2:word;
begin
  c1 := ColToInt(ACol);
  c2 := ColToInt(BCol);
  result := Range(c1,ARow,c2,BRow);
end;

function TExcelWriter.Range(ACell:string;BCell:string):Variant;
begin
  result := _sheet.Range[ACell+':'+BCell]
end;

function TExcelWriter.GetCells(ACol:word;ARow:word):Variant;
begin
     result := _sheet.Cells[ARow,ACol];
end;

procedure TExcelWriter.SetCells(ACol:word;ARow:word;Value:Variant);
begin
  _sheet.Cells[ARow,ACol]:=Value;
end;

function TExcelWriter.GetCells2(ACol:string;ARow:word):Variant;
begin
  result := GetCells(ColToInt(ACol),ARow);
end;

procedure TExcelWriter.SetCells2(ACol:string;ARow:word;Value:Variant);
begin
  SetCells(ColToInt(ACol),ARow,Value);
end;

function TExcelWriter.GetCells3(ACell:string):Variant;
var
  c:TCell;
begin
  c := CellToInt(ACell);
  result := GetCells(c.ACol,c.ARow);
end;

procedure TExcelWriter.SetCells3(ACell:string;Value:Variant);
var
  c:TCell;
begin
  c := CellToInt(ACell);
  SetCells(c.ACol,c.ARow,Value);
end;

function TExcelWriter.ColToInt(ACol:string):word;
var
  i:integer;
  r:word;
  c: char;
  a,b: boolean;
begin
  r := 0;
  for i := 1 to length(ACol) do
  begin
    c:= ACol[i];
    a := (c>='A') and (c<='Z');
    b := (c>='a') and (c<='z');
    if  not (   a   or   b  ) then
      raise Exception.Create('Wrong character "'+c+'" in column name');
    if a then
      r := r*26 + ord(c) - ord('A') + 1
    else
      r := r*26 + ord(c) - ord('a') + 1;
  end;

  result := r;
end;


function TExcelWriter.CellToInt(ACell:string):TCell;
var
  i:integer;
  r1,r2:word;
  c: char;
  a,b,d: boolean;
  s1,s2:string;
begin

  for i := 1 to length(ACell) do
  begin
    c:= ACell[i];
    a := (c>='A') and (c<='Z');
    b := (c>='a') and (c<='z');
    d := (c>='0') and (c<='9');
    if  not (  a  or  b or d  ) then
      raise Exception.Create('Wrong character "'+c+'" in column name');

    if a or b  then continue;

    s1 := copy(aCell,1,i-1);
    s2 := copy(aCell,i,10);

    try
        r2 := strtoint(s2);
    except
        raise Exception.Create('Wrong character "'+c+'" in column name');
    end;

    r1 := ColToInt(s1);

    result.ACol := r1;
    result.ARow := r2;

    exit;
  end;

  raise Exception.Create('Cant convert cell "'+ACell+'" to index');
end;

function TExcelWriter.IntToCol(ACol:Word):string;
var
  r: string;
  h: word;
begin
  while true do
  begin
    if ACol<26 then
    begin
      r := map[ACol+1] + r;
      break;
    end;

    h := ACol mod 26;
    ACol := ACol div 26;

    r := map[h+1] + r;
  end;

  result := r;
end;

end.
