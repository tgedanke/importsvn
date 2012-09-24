unit report;

interface
uses variants,sysutils,ComObj;
type

TExcelReport = class
  private
    excel: Variant;
    sheet: Variant;
    function getCells(row:integer;col:integer):Variant;
    procedure setCells(row:integer;col:integer;val:Variant);
  public
    constructor Create;
    procedure Open(filename:string);
    procedure SaveAs(filename:string);
    procedure New;
    procedure Close;
    procedure Show;
    procedure Hide;

    procedure InsertRow(before:integer=1);
    procedure DeleteRow(row:integer);
    procedure ReplaceMask(row:integer;col:integer;mask:string;replace:string);
    procedure AutoFitRow(row:integer);
    procedure ShapeByIdSetText(id:integer;text:string);
    procedure ShapeByNameSetText(name:string;text:string);

    procedure MergeCells(row:integer;col1:integer;col2:integer);
    procedure FixHeight(width:double;row:integer;col:integer);
    procedure DisableScreenUpdating;
    procedure EnableScreenUpdating;
  protected
    property Cells[row:integer;col:integer]:Variant read getCells write setCells;
  end;

  TTBReport = class(TExcelReport)
  private
    _tb_obor_added : integer;
    _tb_inst_added : integer;
    _tb_instruct_added : integer;
    _tb_bezop_added : integer;
    _tb_p1_added : integer;
    _tb_p2_added : integer;
    _tb_p3_added : integer;
    _tb_p4_added : integer;
    _tb_p6_added : integer;
    _tb_p7_added : integer;
    _tb_p8_added : integer;
    _tb_p9_added : integer;

    _tb_obor_from : integer;
    _tb_inst_from : integer;
    _tb_instruct_from : integer;
    _tb_bezop_from : integer;
    _tb_p1_from : integer;
    _tb_p2_from : integer;
    _tb_p3_from : integer;
    _tb_p4_from : integer;

    _tb_p6_from : integer;
    _tb_p6_from_usloviya: integer;
    _tb_p7_from : integer;
    _tb_p8_from : integer;
    _tb_p9_from : integer;
    
  public
    constructor Create;
    destructor Destroy;
    procedure AddTBOborudovanie(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
    procedure AddTBInstrument(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
    procedure AddTBInstruktag(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
    procedure AddTBBezopasnost(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
    procedure AddP1(text:string);
    procedure AddP2(text:string);
    procedure AddP3(text:string);
    procedure AddP4(text:string);
    procedure AddP6(text:string;bold:boolean=true);
    procedure AddP6Usloviya(text:string);
    procedure AddP7(post:string;fio:string);
    procedure AddP8(post:string;fio:string);
    procedure AddP9(post:string;fio:string);
    procedure FinishP9;
    procedure FinishP8;
    procedure FinishP7;
    procedure FinishP6;

    procedure FinishTable;

    procedure AddP1_4(n:integer;text:string);
  end;
const
  column_names = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

implementation

constructor TExcelReport.Create;
begin
   excel := null;
   sheet := null;
end;

procedure TExcelReport.Open(filename:string);
begin
  excel := CreateOleObject('Excel.Application');
  excel.Workbooks.Open(filename);
  sheet := excel.ActiveWorkbook.ActiveSheet;
end;

procedure TExcelReport.SaveAs(filename:string);
begin
   excel.Workbooks[1].SaveAs(filename);
end;

procedure TExcelReport.New;
begin
  excel := CreateOleObject('Excel.Application');
  excel.Workbooks.Add;
  excel.ActiveWorkbook.Worksheets.Add;
  sheet := excel.Workbooks[1].Worksheets[1];

end;

procedure TExcelReport.Close;
begin
  excel.ActiveWorkbook.Close;
  excel.Quit;
  excel := null;
  sheet := null;
end;

procedure TExcelReport.Show;
begin
  excel.Visible := true;
end;

procedure TExcelReport.Hide;
begin
  excel.Visible := false;
end;


procedure TExcelReport.InsertRow(before:integer=1);
begin
  sheet.Rows[inttostr(before)+':'+inttostr(before)].Insert;
end;

procedure TExcelReport.DeleteRow(row:integer);
begin
  sheet.Rows[inttostr(row)+':'+inttostr(row)].Delete;
end;

procedure TExcelReport.ReplaceMask(row:integer;col:integer;mask:string;replace:string);
var
  s: string;
  p: integer;
  l: integer;
begin
  s:=Cells[row,col];
  l := length(mask);
  p := pos(mask,s);
  if p = 0 then exit;
  delete(s,p,l);
  insert(replace,s,p);
  Cells[row,col]:=s;
end;

procedure TExcelReport.AutoFitRow(row:integer);
begin
  sheet.Rows[inttostr(row)+':'+inttostr(row)].AutoFit;
end;

procedure TExcelReport.ShapeByIdSetText(id:integer;text:string);
begin
  sheet.shapes.item(id).textframe.characters.text := text;
end;

procedure TExcelReport.ShapeByNameSetText(name:string;text:string);
var
  i: integer;
begin
  for i := 1 to sheet.shapes.count do
  if sheet.shapes.item(i).AlternativeText = name then
  begin
    sheet.shapes.item(i).textframe.characters.text := text;
    exit;
  end;
end;

procedure TExcelReport.MergeCells(row:integer;col1:integer;col2:integer);
var
  c1,c2,r : string;
begin
  c1 := column_names[col1];
  c2 := column_names[col2];
  r := c1+inttostr(row)+':'+c2+inttostr(row);
  sheet.Range[r].Merge;
end;

function TExcelReport.getCells(row:integer;col:integer):Variant;
begin
   result := sheet.Cells[row,col];
end;

procedure TExcelReport.setCells(row:integer;col:integer;val:Variant);
begin
   sheet.Cells[row,col]:=val;
end;

procedure TExcelReport.FixHeight(width:double;row:integer;col:integer);
var
  w,h: double;
  tr,tc : integer;
begin
  tr := 1000;
  tc := 100;
  w := width;
  sheet.Columns[tc].ColumnWidth := w;

  sheet.Cells[tr, tc].Value := sheet.Cells[row,col].Value;
  
  sheet.Cells[tr, tc].WrapText := True;
  sheet.Cells[tr, tc].Rows.AutoFit ;
  h := sheet.Cells[tr, tc].RowHeight;
  sheet.Cells[tr, tc].Clear;
  sheet.Cells[row,col].RowHeight := h ;
end;

procedure TExcelReport.DisableScreenUpdating;
begin
  excel.ScreenUpdating:= false;
end;

procedure TExcelReport.EnableScreenUpdating;
begin
  excel.ScreenUpdating:= true;
end;

constructor TTBReport.Create;
begin
    _tb_obor_added := 0;
    _tb_inst_added := 0;
    _tb_bezop_added := 0;
    _tb_instruct_added := 0;
    _tb_obor_from := 27;
    _tb_inst_from := 29;
    _tb_instruct_from := 31;
    _tb_bezop_from := 33;
    
    _tb_p1_from := 15;
    _tb_p2_from := 17;
    _tb_p3_from := 19;
    _tb_p4_from := 21;

    _tb_p1_added := 0;
    _tb_p2_added := 0;
    _tb_p3_added := 0;
    _tb_p4_added := 0;

    _tb_p6_from := 38;
    _tb_p6_from_usloviya := 39;
    _tb_p7_from := 44;
    _tb_p8_from := 50;
    _tb_p9_from := 56;

    Open(ExtractFilePath(paramstr(0))+'templates/מעקוע.xlt');

end;

destructor TTBReport.Destroy;
begin
   //Self.Close;
end;

procedure TTBReport.FinishTable;
begin
  DeleteRow(_tb_inst_from + _tb_obor_added + _tb_inst_added - 1);
  DeleteRow(_tb_p9_from);
end;

procedure TTBReport.AddTBOborudovanie(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
var
  before: integer;
  n : integer;
begin
  trebowanie := trim(trebowanie);
  sostoyanie := trim(sostoyanie);
  ocenka := trim(ocenka);
  meropriatia := trim(meropriatia);

  before := _tb_obor_from + _tb_obor_added;
  n := _tb_obor_added+1;
  if _tb_obor_added>0 then
    InsertRow(before);
  Cells[before,1] := inttostr(n)+'.';
  Cells[before,2] := trebowanie;
  Cells[before,3] := sostoyanie;
  Cells[before,4] := ocenka;
  Cells[before,5] := meropriatia;
  Cells[before,2].Characters[0,sel].Font.Bold := true;
  Cells[before,2].Characters[sel+1,length(trebowanie)].Font.Bold := false;
  inc(_tb_obor_added);
end;

procedure TTBReport.AddTBInstrument(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
var
  before: integer;
  n : integer;
begin
  trebowanie := trim(trebowanie);
  sostoyanie := trim(sostoyanie);
  ocenka := trim(ocenka);
  meropriatia := trim(meropriatia);

  before := _tb_inst_from + _tb_obor_added + _tb_inst_added;
  n := _tb_obor_added+_tb_inst_added+1;
  if _tb_obor_added>0 then
    dec(before);
  if _tb_inst_added>0 then
    InsertRow(before);
  Cells[before,1] := inttostr(n)+'.';
  Cells[before,2] := trebowanie;
  Cells[before,3] := sostoyanie;
  Cells[before,4] := ocenka;
  Cells[before,5] := meropriatia;
  Cells[before,2].Characters[0,sel].Font.Bold := true;
  Cells[before,2].Characters[sel+1,length(trebowanie)].Font.Bold := false;
  inc(_tb_inst_added);
end;


procedure TTBReport.AddTBInstruktag(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
var
  before: integer;
  n : integer;
begin
  trebowanie := trim(trebowanie);
  sostoyanie := trim(sostoyanie);
  ocenka := trim(ocenka);
  meropriatia := trim(meropriatia);
  
  before := _tb_instruct_from + _tb_obor_added + _tb_inst_added + _tb_instruct_added;
  n := _tb_obor_added + _tb_inst_added + _tb_instruct_added+1;
  if _tb_obor_added>0 then
    dec(before);
  if _tb_inst_added>0 then
    dec(before);
  if _tb_instruct_added>0 then
    InsertRow(before);
  Cells[before,1] := inttostr(n)+'.';
  Cells[before,2] := trebowanie;
  Cells[before,3] := sostoyanie;
  Cells[before,4] := ocenka;
  Cells[before,5] := meropriatia;
  Cells[before,2].Characters[0,sel].Font.Bold := true;
  Cells[before,2].Characters[sel+1,length(trebowanie)].Font.Bold := false;
  inc(_tb_instruct_added);
end;

procedure TTBReport.AddTBBezopasnost(trebowanie:widestring;sostoyanie:widestring;
                                ocenka:widestring;meropriatia:widestring;sel:integer);
var
  before: integer;
  n : integer;
begin
  trebowanie := trim(trebowanie);
  sostoyanie := trim(sostoyanie);
  ocenka := trim(ocenka);
  meropriatia := trim(meropriatia);

  before := _tb_bezop_from + _tb_obor_added + _tb_inst_added + _tb_instruct_added
    + _tb_bezop_added;
  n := _tb_obor_added + _tb_inst_added + _tb_instruct_added
    + _tb_bezop_added+1;

  if _tb_obor_added>0 then
    dec(before);
  if _tb_inst_added>0 then
    dec(before);
  if _tb_instruct_added>0 then
    dec(before);

  if _tb_bezop_added>0 then
    InsertRow(before);
  Cells[before,1] := inttostr(n)+'.';
  Cells[before,2] := trebowanie;
  Cells[before,3] := sostoyanie;
  Cells[before,4] := ocenka;
  Cells[before,5] := meropriatia;
  Cells[before,2].Characters[0,sel].Font.Bold := true;
  Cells[before,2].Characters[sel+1,length(trebowanie)].Font.Bold := false;
  inc(_tb_bezop_added);
end;

procedure TTBReport.AddP1(text:string);
var
  before: integer;
begin
  text := trim(text);
  if text = '' then exit;
  before := _tb_p1_from + _tb_p1_added;
  //if _tb_p1_added>0 then
  InsertRow(before);
  Cells[before,1] := text;
  MergeCells(before,1,5);
  Cells[before,1].Font.Bold := false;
  Cells[before,1].Font.Underline := false;
  Cells[before,1].WrapText := true;
  FixHeight(120,before,1);
  inc(_tb_p1_added);
end;

procedure TTBReport.AddP2(text:string);
var
  before: integer;
begin
  text := trim(text);
  if text = '' then exit;
  before := _tb_p2_from + _tb_p1_added + _tb_p2_added;
  if _tb_p1_added>0 then
    dec(before);
  //if _tb_p2_added>0 then
  InsertRow(before);
  Cells[before,1] := text;
  MergeCells(before,1,5);
  Cells[before,1].Font.Bold := false;
  Cells[before,1].Font.Underline := false;
  Cells[before,1].WrapText := true;
  FixHeight(120,before,1);
  inc(_tb_p2_added);
end;

procedure TTBReport.AddP3(text:string);
var
  before: integer;
begin
  text := trim(text);
  if text = '' then exit;
  before := _tb_p3_from + _tb_p1_added + _tb_p2_added+ _tb_p3_added;
  if _tb_p1_added>0 then
    dec(before);
  if _tb_p2_added>0 then
    dec(before);
  //if _tb_p3_added>0 then
  InsertRow(before);
  Cells[before,1] := text;
  MergeCells(before,1,5);
  Cells[before,1].Font.Bold := false;
  Cells[before,1].Font.Underline := false;
  Cells[before,1].WrapText := true;
  FixHeight(120,before,1);
  inc(_tb_p3_added);
end;

procedure TTBReport.AddP4(text:string);
var
  before: integer;
begin
  text := trim(text);
  if text = '' then exit;
  
  before := _tb_p4_from + _tb_p1_added + _tb_p2_added+ _tb_p3_added+ _tb_p4_added;
  if _tb_p1_added>0 then
    dec(before);
  if _tb_p2_added>0 then
    dec(before);
  if _tb_p3_added>0 then
    dec(before);
  //if _tb_p4_added>0 then
  InsertRow(before);
  Cells[before,1] := text;
  MergeCells(before,1,5);
  Cells[before,1].Font.Bold := false;
  Cells[before,1].Font.Underline := false;
  Cells[before,1].WrapText := true;
  FixHeight(120,before,1);
  inc(_tb_p4_added);
end;

procedure TTBReport.AddP6Usloviya(text:string);
var
  before: integer;
begin
  text := trim(text);
  before := _tb_p6_from_usloviya;
  //InsertRow(before);
  Cells[before,1] := text;
end;

procedure TTBReport.AddP6(text:string;bold:boolean);
var
  before: integer;
begin
  text := trim(text);
  before := _tb_p6_from + _tb_p6_added;
  InsertRow(before);
  Cells[before,1] := text;
  Cells[before,1].Font.Bold := bold;
  MergeCells(before,1,5);
  Cells[before,1].WrapText := true;
  FixHeight(132,before,1);
  inc(_tb_p6_added);
end;


procedure TTBReport.AddP7(post:string;fio:string);
var
  before: integer;
begin
  post := trim(post);
  fio := trim(fio);
  before := _tb_p7_from + _tb_p7_added;
  InsertRow(before);
  Cells[before,2] := post;
  Cells[before,3] := fio;
  inc(_tb_p7_added);
end;


procedure TTBReport.AddP8(post:string;fio:string);
var
  before: integer;
begin
  post := trim(post);
  fio := trim(fio);
  before := _tb_p8_from + _tb_p8_added;
  InsertRow(before);
  Cells[before,2] := post;
  Cells[before,3] := fio;
  inc(_tb_p8_added);
end;


procedure TTBReport.AddP9(post:string;fio:string);
var
  before: integer;
begin
  post := trim(post);
  fio := trim(fio);
  before := _tb_p9_from + _tb_p9_added;
  InsertRow(before);
  Cells[before,2] := post;
  Cells[before,3] := fio;
  inc(_tb_p9_added);
end;

procedure TTBReport.FinishP9;
begin
  DeleteRow(_tb_p9_from + _tb_p9_added);
  DeleteRow(_tb_p9_from - 1);
end;

procedure TTBReport.FinishP8;
begin
  DeleteRow(_tb_p8_from + _tb_p8_added);
  DeleteRow(_tb_p8_from - 1);
end;

procedure TTBReport.FinishP7;
begin
  DeleteRow(_tb_p7_from + _tb_p7_added);
  DeleteRow(_tb_p7_from - 1);
end;

procedure TTBReport.FinishP6;
begin
  DeleteRow(_tb_p6_from - 1);
end;

procedure TTBReport.AddP1_4(n:integer;text:string);
begin
   case n of
    1: AddP1(text);
    2: AddP2(text);
    3: AddP3(text);
    4: AddP4(text);
   end;
end;

end.

