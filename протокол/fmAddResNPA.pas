unit fmAddResNPA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBCtrls, RzDBCmbo, StdCtrls, RzLstBox, RzDBList,
  DataModule, DB, ADODB, Grids, DBGrids, RzDBGrid, RzButton, RzRadChk, RzEdit,
  ActnList;

type
  TFormAddResNPA = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzPanel1: TRzPanel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    nsd: TADOQuery;
    dsNsd: TDataSource;
    ScrollNsd: TScrollBox;
    tplNsd: TRzPanel;
    ScrollPunkt: TScrollBox;
    tplPunkt: TRzPanel;
    tplPunktMemo: TRzMemo;
    tplPunktCheckbox: TRzCheckBox;
    dsPunkt: TDataSource;
    punkt: TADOQuery;
    dsRazdel: TDataSource;
    razdel: TADOQuery;
    PanelBottom: TRzPanel;
    PanelBottomButtons: TRzPanel;
    ButtonClose: TRzButton;
    tplPunktPanelBottom: TRzPanel;
    tplPanelTOp: TRzPanel;
    RzCheckBox1: TRzCheckBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzPanel6: TRzPanel;
    tplPunktMemo1: TRzMemo;
    tplPunktMemo2: TRzMemo;
    RzButton1: TRzButton;
    procedure RzButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure tplPunktMemoMouseEnter(Sender: TObject);
    procedure tplPunktMouseEnter(Sender: TObject);
    procedure tplPunktCheckboxMouseEnter(Sender: TObject);
    procedure ScrollPunktMouseEnter(Sender: TObject);
    procedure tplPunktCheckboxClick(Sender: TObject);
    procedure dsRazdelDataChange(Sender: TObject; Field: TField);
    procedure tplNsdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ScrollNsdMouseEnter(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure tplNsdMouseLeave(Sender: TObject);
    procedure tplNsdMouseEnter(Sender: TObject);
  private
    { Private declarations }
    nsd_active: integer;
  public
    closeaction: TAction;
    { Public declarations }
    procedure AddNSD(d:TDataSet);
    procedure AddPunkt(d:TDataSet);
    procedure ClearPunkt;
    procedure SetPunkt(Sender:TObject);
    procedure ActivateNSD(id:integer;hover:boolean);

  end;

const
  DEFAULT_COLOR = clBtnFace;
  DEFAULT_TEXT = clBtnText;
  DEFAULT_HOVER_COLOR = clHighlight;
  DEFAULT_HOVER_TEXT = clHighlightText;

  ACTIVE_COLOR = $00AAFFAA;
  ACTIVE_TEXT = clBlack;
  ACTIVE_HOVER_COLOR = $00337733;
  ACTIVE_HOVER_TEXT = clWhite;

var
  FormAddResNPA: TFormAddResNPA;
  protocol_id : integer = 1;
  razd_num: integer  = 1;

implementation

{$R *.dfm}

procedure CopyProperties(const src: TWinControl;var dst:TWinControl);
begin
  if src.ClassName = 'TRzPanel' then
  begin
    TRzPanel(dst).OnMouseEnter := TRzPanel(src).OnMouseEnter;
    TRzPanel(dst).OnMouseLeave := TRzPanel(src).OnMouseLeave;
    TRzPanel(dst).OnClick := TRzPanel(src).OnClick;
    TRzPanel(dst).Width := TRzPanel(src).Width;
    TRzPanel(dst).Height := TRzPanel(src).Height;
    TRzPanel(dst).Align := TRzPanel(src).Align;
    TRzPanel(dst).BorderSides := TRzPanel(src).BorderSides;
    TRzPanel(dst).BorderInner := TRzPanel(src).BorderInner;
    TRzPanel(dst).BOrderOuter := TRzPanel(src).BOrderOuter;
    TRzPanel(dst).TextMargin := TRzPanel(src).TextMargin;
    TRzPanel(dst).Margins := TRzPanel(src).Margins;
    TRzPanel(dst).AlignWithMargins := TRzPanel(src).AlignWithMargins;
    TRzPanel(dst).Alignment := TRzPanel(src).Alignment;
    TRzPanel(dst).AlignmentVertical := TRzPanel(src).AlignmentVertical;
    TRzPanel(dst).Left := TRzPanel(src).Left;
    TRzPanel(dst).Top := TRzPanel(src).Top;
    exit;
  end;

  if src.ClassName = 'TRzMemo' then
  begin
    TRzMemo(dst).OnMouseEnter := TRzMemo(src).OnMouseEnter;
    TRzMemo(dst).OnMouseLeave := TRzMemo(src).OnMouseLeave;
    TRzMemo(dst).OnClick := TRzMemo(src).OnClick;
    TRzMemo(dst).Width := TRzMemo(src).Width;
    TRzMemo(dst).Height := TRzMemo(src).Height;
    TRzMemo(dst).Align := TRzMemo(src).Align;
    TRzMemo(dst).Margins := TRzMemo(src).Margins;
    TRzMemo(dst).AlignWithMargins := TRzMemo(src).AlignWithMargins;
    TRzMemo(dst).Alignment := TRzMemo(src).Alignment;
    TRzMemo(dst).Left := TRzMemo(src).Left;
    TRzMemo(dst).Top := TRzMemo(src).Top;
    exit;
  end;

  if src.ClassName = 'TRzCheckBox' then
  begin
    TRzCheckbox(dst).Width := TRzCheckbox(src).Width;
    TRzCheckbox(dst).Height := TRzCheckbox(src).Height;
    TRzCheckbox(dst).Left := TRzCheckbox(src).Left;
    TRzCheckbox(dst).Top := TRzCheckbox(src).Top;
    TRzCheckbox(dst).Align := TRzCheckbox(src).Align;
    TRzCheckbox(dst).Margins := TRzCheckbox(src).Margins;
    TRzCheckbox(dst).AlignWithMargins := TRzCheckbox(src).AlignWithMargins;
    TRzCheckbox(dst).OnMouseEnter := TRzCheckbox(src).OnMouseEnter;
    TRzCheckbox(dst).OnMouseLeave := TRzCheckbox(src).OnMouseLeave;
    TRzCheckbox(dst).OnClick := TRzCheckbox(src).OnClick;
    exit;
  end;

end;

procedure TFormAddResNPA.AddNSD(d:TDataSet);
var
  p: TRzPanel;
begin
  p := TRzpanel.Create(tplNsd.Owner);
  p.OnMouseEnter := tplNsd.OnMouseEnter;
  p.OnMouseLeave := tplNsd.OnMouseLeave;
  p.OnClick := tplNsd.OnClick;
  p.Width := tplNsd.Width;
  p.Height := tplNsd.Height;
  p.Visible := true;
  p.Align := alTop;
  p.BorderSides := tplNsd.BorderSides;
  p.TextMargin := tplNsd.TextMargin;
  p.Margins := tplNsd.Margins;
  p.AlignWithMargins := tplNsd.AlignWithMargins;
  p.Alignment :=  tplNsd.Alignment;
  p.AlignmentVertical :=  tplNsd.AlignmentVertical;
  tplNsd.Parent.InsertControl(p);
  p.Caption := nsd.FieldByName('name').Value;
  p.Tag := d.FieldByName('id').Value;
  p.Show;
end;

procedure TFormAddResNPA.AddPunkt(d:TDataSet);
var
  p: TRzPanel;
  m,m1,m2: TRzMemo;
  c: TRzCheckBox;
  pb,pt: TRzPanel;
  v: Variant;
  nsdid,punktid:integer;
begin
  p := TRzpanel.Create(tplPunkt.Owner);
  m := TRzmemo.Create(p);
  c := TRzCheckbox.Create(p);
  {
  pb := TRzpanel.Create(p);
  pt := TRzpanel.Create(pb);
  m1 := TRzmemo.Create(pb);
  m2 := TRzmemo.Create(pb);
  }
  CopyProperties(tplPunkt,TWinControl(p));
  p.Visible := true;
  p.Height := 100;
  CopyProperties(tplPunktMemo,TWinControl(m));
  m.Visible := true;
  m.ReadOnly := true;
  m.ReadOnlyColor := clWindow;
  {
  CopyProperties(tplPunktMemo1,TWinControl(m1));
  m1.Visible := true;

  CopyProperties(tplPunktMemo2,TWinControl(m2));
  m2.Visible := true;
  }

  CopyProperties(tplPunktCheckbox,TWinControl(c));
  c.Visible := true;

  {
  CopyProperties(tplPunktPanelBottom,TWinControl(pb));
  pb.Visible := true;

  CopyProperties(tplPanelTop,TWinControl(pt));
  pt.Visible := true;

  pb.InsertControl(pt);
  pb.InsertControl(m1);
  pb.InsertControl(m2);
  p.InsertControl(pb);
  }
  
  p.InsertControl(c);
  p.InsertControl(m);
  tplPunkt.Parent.InsertControl(p);
  p.Show;

  nsdid := d.FieldByName('nsd_id').Value;
  punktid := d.FieldByName('id').Value;

  m.Text := d.FieldByName('num').Value + '   ' +d.FieldByName('description').Value;
  v := GetSingleSQLResult(
    'select count(*) from tb_protocol_result where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and sub_id=' + inttostr(razd_num)
  ,0);

  c.Checked := v > 0;
  c.Tag := punktid;
  p.Tag := nsdid;
end;

procedure TFormAddResNPA.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAddResNPA.ClearPunkt;
var
  id ,i,l: integer;
  sql: WideString;
  c: array of TControl;
begin
  l := 0;
  setlength(c,l);

  for I := 0 to ScrollPunkt.ControlCount-1 do
  if ScrollPunkt.Controls[i].Visible then
  begin
    inc(l);
    setlength(c,l);
    c[l-1] := ScrollPunkt.Controls[i];
  end;

  for i := 0 to l-1 do
  begin
    c[i].Free;
  end;

  setlength(c,0);
end;

procedure TFormAddResNPA.SetPunkt(Sender:TObject);
var
  nsdid: integer;
  punktid: integer;
  c: boolean;
  v: integer;
begin
  with TRzCheckbox(Sender) do
  begin
    c := Checked;
    punktid := tag;
    nsdid := Parent.Tag;
  end;
  if (punktid = 0) or (nsdid=0) then exit;
  
  v := GetSingleSQLResult(
    'select count(*) from tb_protocol_result where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and sub_id=' + inttostr(razd_num)
  ,0);
  
  if (not c) and (v=0) then exit;
  if (c) and (v>0) then exit;

  if not c then ExecSQLQuery(
    'delete from tb_protocol_result where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and sub_id=' + inttostr(razd_num));

  if c then ExecSQLQuery(
    'insert into tb_protocol_result(protocol_id,sub_id,nsd_id,punkt_id,ocenka_id) values('
    +inttostr(protocol_id)
    + ',' + inttostr(razd_num)
    + ',' + inttostr(nsdid)
    + ',' + inttostr(punktid)
    + ',1)');
end;

procedure TFormAddResNPA.ActivateNSD(id:integer;hover:boolean);
var
  i: integer;
  p: TRzpanel;
begin
  for i:=0 to ScrollNsd.ControlCount-1 do
  begin
    p := TRzPanel(ScrollNsd.Controls[i]);
    if p.tag = nsd_active then
    begin
      p.Color := DEFAULT_COLOR;
      p.Font.Color := DEFAULT_TEXT;
    end;

    if p.tag =id then
    begin
      if hover then
      begin
        p.Color := ACTIVE_HOVER_COLOR;
        p.Font.Color := ACTIVE_HOVER_TEXT;
      end else
      begin
        p.Color := ACTIVE_COLOR;
        p.Font.Color := ACTIVE_TEXT;
      end;
    end;
  end;
  nsd_active := id;
end;

procedure TFormAddResNPA.dsRazdelDataChange(Sender: TObject; Field: TField);
var
  v : string;
begin
  v := RzDBLookupComboBox1.GetKeyValue ;
  if strtoint(v)<>razd_num then
  begin
    razd_num := strtoint(v);
    ClearPunkt;
    ActivateNsd(0,false);
  end;
end;

procedure TFormAddResNPA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if closeaction<>nil then

  closeaction.Execute;
end;

procedure TFormAddResNPA.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if ScrollNsd.Focused then
    ScrollNsd.VertScrollBar.Position := ScrollNsd.VertScrollBar.Position+WheelDelta;

  if ScrollPunkt.Focused then
    ScrollPunkt.VertScrollBar.Position := ScrollPunkt.VertScrollBar.Position+WheelDelta;
    handled := true;
end;

procedure TFormAddResNPA.FormShow(Sender: TObject);
var
  p: TRzPanel;
begin
  p := TRzPanel.Create(Owner);
  CopyProperties(tplPunkt,TWinControl(p));
  nsd.First;
  while not nsd.eof do
  begin
    AddNsd(nsd);
    nsd.Next;
  end;
  RzDBLookupComboBox1.InitKeyValue;
end;

procedure TFormAddResNPA.RzButton1Click(Sender: TObject);
begin
  AddPunkt(nil);
end;

procedure TFormAddResNPA.ScrollNsdMouseEnter(Sender: TObject);
begin
ScrollNsd.SetFocus;
end;

procedure TFormAddResNPA.ScrollPunktMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddResNPA.tplNsdClick(Sender: TObject);
var
  id : integer;
  sql: WideString;
begin
  id := TRzPanel(Sender).Tag;
  if id = nsd_active then exit;
  
  sql := 'select * from tb_nsd_punkt where nsd_id='+inttostr(id);
  punkt.SQL.Text := sql;
  punkt.Active := true;

  ClearPunkt;
  
  punkt.First;
  while not punkt.eof do
  begin
    AddPunkt(punkt);
    punkt.Next;
  end;

  ActivateNSD(id,true);
end;

procedure TFormAddResNPA.tplNsdMouseEnter(Sender: TObject);
begin
  if TPanel(Sender).tag = nsd_active then
  begin
    TPanel(Sender).Color := ACTIVE_HOVER_COLOR;
    TPanel(Sender).Font.Color := ACTIVE_HOVER_TEXT;
  end else
  begin
    TPanel(Sender).Color := DEFAULT_HOVER_COLOR;
    TPanel(Sender).Font.Color := DEFAULT_HOVER_TEXT;
  end;
  ScrollNsd.SetFocus;
end;

procedure TFormAddResNPA.tplNsdMouseLeave(Sender: TObject);
begin
  if TPanel(Sender).tag = nsd_active then
  begin
    TPanel(Sender).Color := ACTIVE_COLOR;
    TPanel(Sender).Font.Color := ACTIVE_TEXT;
  end else
  begin
    TPanel(Sender).Color := DEFAULT_COLOR;
    TPanel(Sender).Font.Color := DEFAULT_TEXT;
  end;
end;

procedure TFormAddResNPA.tplPunktCheckboxClick(Sender: TObject);
begin
  SetPunkt(Sender);
end;

procedure TFormAddResNPA.tplPunktCheckboxMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddResNPA.tplPunktMemoMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddResNPA.tplPunktMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

end.
