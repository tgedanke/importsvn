unit fmAddNPA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBCtrls, RzDBCmbo, StdCtrls, RzLstBox, RzDBList,
  DataModule, DB, ADODB, Grids, DBGrids, RzDBGrid, RzButton, RzRadChk, RzEdit,
  ActnList, RzCmboBx, RzLabel, RzPrgres;

type
  TFormAddNPA = class(TForm)
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
    tplPunktBotPanel: TRzPanel;
    tplPunktRightPanel: TRzPanel;
    tplPunktRightMemo: TRzMemo;
    tplPunktLeftPanel: TRzPanel;
    tplPunktLeftMemo: TRzMemo;
    tplPunktCheckboxBot: TRzCheckBox;
    tplPunktHint2: TRzPanel;
    tplPunktHint1: TRzPanel;
    dsMeropr: TDataSource;
    qMeropr: TADOQuery;
    tplPunktLookup: TRzDBLookupComboBox;
    updateCommand: TADOCommand;
    LoadingPanel: TRzPanel;
    LoadingProgress: TRzProgressBar;
    RzLabel1: TRzLabel;
    razdelid: TAutoIncField;
    razdelname: TStringField;
    procedure ScrollPunktResize(Sender: TObject);
    procedure tplPunktLeftMemoExit(Sender: TObject);
    procedure tplPunktRightMemoExit(Sender: TObject);
    procedure tplPunktCheckboxBotClick(Sender: TObject);
    procedure tplPunktLookupClick(Sender: TObject);
    procedure qMeroprAfterScroll(DataSet: TDataSet);
    procedure tplPunktRightMemoMouseLeave(Sender: TObject);
    procedure tplPunktRightMemoMouseEnter(Sender: TObject);
    procedure tplPunktLeftMemoMouseLeave(Sender: TObject);
    procedure tplPunktLeftMemoMouseEnter(Sender: TObject);
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

    procedure updateChanged(p:TRzPanel);
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
  FormAddNPA: TFormAddNPA;
  protocol_id : integer = 1;
  razd_num: integer  = 1;

implementation

{$R *.dfm}

procedure CloneMemo(const src:TRzMemo;var dest:TRzMemo);
begin
  dest.Width := src.Width;
  dest.Height := src.Height;
  dest.Left :=src.Left;
  dest.Top := src.Top;
  dest.Align := src.Align;
  dest.Margins := src.Margins;
  dest.AlignWithMargins := src.AlignWithMargins;
  dest.ReadOnly := src.ReadOnly;
  dest.ReadOnlyColor := src.ReadOnlyColor;
  dest.ScrollBars := src.ScrollBars;
  dest.OnMouseEnter := src.OnMouseEnter;
  dest.OnMouseWheel := src.OnMouseWheel;
  dest.OnMouseLeave := src.OnMouseLeave;
  dest.OnExit := src.OnExit;
  dest.Visible := true;
  dest.Hint := src.Hint;
end;


procedure ClonePanel(const src:TRzPanel;var dst:TRzPanel);
begin
  dst.OnMouseEnter := src.OnMouseEnter;
  dst.OnMouseLeave := src.OnMouseLeave;
  dst.OnClick := src.OnClick;
  dst.Width := src.Width;
  dst.Height := src.Height;
  dst.Visible := true;
  dst.Align := src.Align;
  dst.BorderSides := src.BorderSides;
  dst.TextMargin := src.TextMargin;
  dst.Margins := src.Margins;
  dst.AlignWithMargins := src.AlignWithMargins;
  dst.Alignment :=  src.Alignment;
  dst.AlignmentVertical :=  src.AlignmentVertical;
  dst.Hint := src.Hint;
  dst.BorderInner := src.BorderInner;
  dst.BorderOuter := src.BorderOuter;
  dst.Caption := src.Caption;
  dst.Top := src.Top;
  dst.Left := src.Left;
  dst.Color := src.Color;
  dst.ShowHint := src.ShowHint;
end;

procedure CloneCheckbox(const src:TRzCheckBox;var dst:TRzCheckBox);
begin
dst.Width := src.Width;
dst.Height := src.Height;
dst.Left :=src.Left;
dst.Top := src.Top;
dst.Align := src.Align;
dst.Margins := src.Margins;
dst.AlignWithMargins := src.AlignWithMargins;
dst.OnClick := src.OnClick;
dst.OnMouseEnter := src.OnMouseEnter;
dst.Visible := true;
dst.Caption := src.Caption;
dst.Hint := src.Hint;
end;

procedure CloneLookup(const src:TRzDBLookupComboBox;var dst:TRzDBLookupComboBox);
begin
dst.Width := src.Width;
dst.Height := src.Height;
dst.Left :=src.Left;
dst.Top := src.Top;
dst.Align := src.Align;
dst.Margins := src.Margins;
dst.AlignWithMargins := src.AlignWithMargins;
dst.OnClick := src.OnClick;
dst.OnMouseEnter := src.OnMouseEnter;
dst.Visible := true;
end;

procedure TFormAddNPA.AddNSD(d:TDataSet);
var
  p: TRzPanel;
begin
  p := TRzpanel.Create(tplNsd.Owner);
  clonePanel(tplNsd,p);
  tplNsd.Parent.InsertControl(p);
  p.Caption := nsd.FieldByName('name').Value;
  p.Hint := nsd.FieldByName('name').Value;
  p.Tag := d.FieldByName('id').Value;
  p.Show;
end;

procedure TFormAddNPA.updateChanged(p:TRzPanel);
var
  nsdid,pid,i,j,k: integer;
  pp: TWinControl;
  mer,sost: string;
  sootv: boolean;
  msost: TRzMemo;
begin
  nsdid := p.Tag;
  pid :=0;
  for i := 0 to p.ControlCount - 1 do
  if (p.Controls[i].Hint = 'punktchk') and  (TRzCheckbox(p.Controls[i]).Checked) then
  begin
    pid := p.Controls[i].Tag;
    break;
  end;
  if pid = 0 then exit;

  for i := 0 to p.ControlCount - 1 do
  if p.Controls[i].Hint = 'cont' then
  for j := 0 to TWinCOntrol(p.Controls[i]).ControlCount - 1 do
  if TWinCOntrol(p.Controls[i]).Controls[j].Hint = 'cont' then
  begin
    pp := TwinControl(TWinCOntrol(p.Controls[i]).Controls[j]);
    for k := 0 to pp.ControlCount - 1 do
    if pp.Controls[k].Hint = 'chk_sootv' then
    begin
      sootv := TRzCheckbox(pp.Controls[k]).Checked;
    end else
    if pp.Controls[k].Hint = 'memo_sost' then
    begin
      sost := TRzmemo(pp.Controls[k]).Text;
      msost := TRzmemo(pp.Controls[k]);
    end else
    if pp.Controls[k].Hint = 'memo_mer' then
    begin
      mer := TRzmemo(pp.Controls[k]).Text;
    end;
  end;

  if sootv and (sost='') then
  begin
    sost := 'Выполняется';
    msost.Text := sost;
  end;

  updateCommand.Parameters.ParamValues['nsd'] := nsdid;
  updateCommand.Parameters.ParamValues['pid'] := pid;
  updateCommand.Parameters.ParamValues['sootv'] := sootv;
  updateCommand.Parameters.ParamValues['mer'] := mer;
  updateCommand.Parameters.ParamValues['sost'] := sost;

  updateCommand.Parameters.ParamValues['protocolid'] := protocol_id;
  updateCommand.Parameters.ParamValues['num'] := razd_num;
  
  updateCommand.Execute;
end;

procedure TFormAddNPA.AddPunkt(d:TDataSet);
var
  p,pl,pr,pb ,ph1,ph2: TRzPanel;
  m,ml,mr: TRzMemo;
  c,cb: TRzCheckBox;
  v: Variant;
  nsdid,punktid:integer;
  lu: TRzDBLookupComboBox;
  va : TVarArr;
begin
  p := TRzpanel.Create(tplPunkt.Owner);
  pb := TRzpanel.Create(tplPunkt.Owner);
  pl := TRzpanel.Create(tplPunkt.Owner);
  pr := TRzpanel.Create(tplPunkt.Owner);
  ph1 := TRzpanel.Create(tplPunkt.Owner);
  ph2 := TRzpanel.Create(tplPunkt.Owner);
  
  m := TRzmemo.Create(p);
  ml := TRzmemo.Create(p);
  mr := TRzmemo.Create(p);
  c := TRzCheckbox.Create(p);
  cb := TRzCheckbox.Create(p);

  lu := TRzDBLookupComboBox.Create(p);


  clonePanel(tplPunkt,p);

  clonePanel(tplPunktBotPanel,pb);
  clonePanel(tplPunktRightPanel,pr);
  clonePanel(tplPunktLeftPanel,pl);
  clonePanel(tplPunktHint1,ph1);
  clonePanel(tplPunktHint2,ph2);



  cloneMemo(tplPunktMemo,m);
  cloneMemo(tplPunktLeftMemo,ml);
  cloneMemo(tplPunktRightMemo,mr);

  cloneCHeckbox(tplPunktCheckbox,c);
  cloneCHeckbox(tplPunktCheckboxBot,cb);

  cloneLookup(tplPunktLookup,lu);
  pl.InsertControl(cb);
  pl.InsertControl(ml);
  pl.InsertControl(ph1);


  pr.InsertControl(lu);
  pr.InsertControl(mr);
  pr.InsertControl(ph2);

  pb.InsertControl(pl);
  pb.InsertControl(pr);

  p.InsertControl(pb);
  p.InsertControl(c);
  p.InsertControl(m);

  tplPunkt.Parent.InsertControl(p);

  nsdid := d.FieldByName('nsd_id').Value;
  punktid := d.FieldByName('id').Value;

  m.Text := d.FieldByName('num').Value + '   ' +d.FieldByName('description').Value;
  v := GetSingleSQLResult(
    'select count(*) from tb_protocol_nsd where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and num=' + inttostr(razd_num)
  ,0);

  va := GetSingleSQLRow(
    'select * from tb_protocol_nsd where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and num=' + inttostr(razd_num)
  );

  c.Checked := v > 0;
  c.Tag := punktid;
  p.Tag := nsdid;

  ml.Text := nz(va.values['d_sost'],'');
  mr.Text := nz(va.values['d_mer'],'');
  cb.Checked := nz(va.values['d_sootv'],false);

  lu.ListSource := tplPunktLookup.ListSource;
  lu.ListField := tplPunktLookup.ListField;
  lu.KeyField := tplPunktLookup.KeyField;
end;

procedure TFormAddNPA.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAddNPA.ClearPunkt;
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

procedure TFormAddNPA.SetPunkt(Sender:TObject);
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
    'select count(*) from tb_protocol_nsd where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and num=' + inttostr(razd_num)
  ,0);
  
  if (not c) and (v=0) then exit;
  if (c) and (v>0) then exit;

  if not c then ExecSQLQuery(
    'delete from tb_protocol_nsd where protocol_id='+inttostr(protocol_id)
    + ' and nsd_id=' + inttostr(nsdid)
    + ' and punkt_id=' + inttostr(punktid)
    + ' and num=' + inttostr(razd_num));

  if c then
  begin
  ExecSQLQuery(
    'insert into tb_protocol_nsd(protocol_id,num,nsd_id,punkt_id,sort) values('
    +inttostr(protocol_id)
    + ',' + inttostr(razd_num)
    + ',' + inttostr(nsdid)
    + ',' + inttostr(punktid)
    + ',0)');
    updateChanged(TRzPanel(TRzCheckbox(Sender).Parent));
  end;
end;

procedure TFormAddNPA.ActivateNSD(id:integer;hover:boolean);
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

procedure TFormAddNPA.dsRazdelDataChange(Sender: TObject; Field: TField);
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

procedure TFormAddNPA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if closeaction<>nil then

  closeaction.Execute;
end;

procedure TFormAddNPA.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if ScrollNsd.Focused then
    ScrollNsd.VertScrollBar.Position := ScrollNsd.VertScrollBar.Position-WheelDelta;

  if ScrollPunkt.Focused then
    ScrollPunkt.VertScrollBar.Position := ScrollPunkt.VertScrollBar.Position-WheelDelta;
    handled := true;
end;

procedure TFormAddNPA.FormShow(Sender: TObject);
begin
  nsd.First;
  while not nsd.eof do
  begin
    AddNsd(nsd);
    nsd.Next;
  end;
  RzDBLookupComboBox1.InitKeyValue;
end;

procedure TFormAddNPA.qMeroprAfterScroll(DataSet: TDataSet);
begin
  Caption := inttostr(random(100));
end;

procedure TFormAddNPA.tplPunktLeftMemoExit(Sender: TObject);
begin
  updateChanged(TRzPanel(TWinCOntrol(sender).Parent.Parent.Parent));
end;

procedure TFormAddNPA.tplPunktLeftMemoMouseEnter(Sender: TObject);
var
  p : TWinCOntrol;
  i: integer;
begin
  p := TWinCOntrol(Sender).Parent;
  for i:=0 to p.ControlCount-1 do
  if p.Controls[i].Hint = 'label_sost' then
  begin
    p.Controls[i].Hide;
    exit;
  end;
end;

procedure TFormAddNPA.tplPunktLeftMemoMouseLeave(Sender: TObject);
var
  p : TWinCOntrol;
  i: integer;
begin
  p := TWinCOntrol(Sender).Parent;
  for i:=0 to p.ControlCount-1 do
  if p.Controls[i].Hint = 'label_sost' then
  begin
    p.Controls[i].Show;
    exit;
  end;
end;

procedure TFormAddNPA.tplPunktLookupClick(Sender: TObject);
var
  p: TWinControl;
  i : integer;
begin
  p := TRzDBLookupComboBox(Sender).Parent;
  for i := 0 to p.ControlCount - 1 do
  if p.Controls[i].Hint = 'memo_mer' then
  begin
     TRzMemo(p.Controls[i]).Text := TRzDBLookupComboBox(sender).Text;
     break;
  end;

  updateChanged(TRzPanel(TwinControl(Sender).Parent.parent.parent));
end;

procedure TFormAddNPA.ScrollNsdMouseEnter(Sender: TObject);
begin
ScrollNsd.SetFocus;
end;

procedure TFormAddNPA.ScrollPunktMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddNPA.ScrollPunktResize(Sender: TObject);
begin
  LoadingPanel.Left := (ScrollPunkt.Width - LoadingPanel.Width) div 2;
  LoadingPanel.Top := (ScrollPunkt.Height - LoadingPanel.Height) div 2;
end;

procedure TFormAddNPA.tplNsdClick(Sender: TObject);
var
  id,i,num : integer;
  sql: WideString;
begin
  id := TRzPanel(Sender).Tag;
  if id = nsd_active then exit;
  num := nz(razdel.FieldByName('id').Value,0);
  sql := 'select *,(select count(*) from tb_protocol_nsd as b where  b.protocol_id='+inttostr(protocol_id)+
  ' and a.nsd_id=b.nsd_id and b.punkt_id=a.id and b.num='+inttostr(num)+') as active'+
  ' from tb_nsd_punkt as a where nsd_id='+inttostr(id)+
  ' order by active asc, num desc';

  punkt.SQL.Text := sql;
  punkt.Active := true;

  ScrollPunkt.Visible := false;
  LoadingPanel.Show;
  Application.ProcessMessages;
  
  ClearPunkt;
  
  punkt.First;
  i := 0;
  
  while not punkt.eof do
  begin
    LoadingProgress.Percent := round(100*i/punkt.RecordCount);
    AddPunkt(punkt);
    punkt.Next;
    inc(i);
  end;


  ActivateNSD(id,true);
  Application.ProcessMessages;
  
  ScrollPunkt.Visible := true;
  LoadingProgress.Percent := 100;
  LoadingPanel.Hide;

  ScrollPunkt.SetFocus;
end;

procedure TFormAddNPA.tplNsdMouseEnter(Sender: TObject);
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

procedure TFormAddNPA.tplNsdMouseLeave(Sender: TObject);
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

procedure TFormAddNPA.tplPunktCheckboxBotClick(Sender: TObject);
begin
  updateChanged(TRzPanel(TWinCOntrol(sender).Parent.Parent.Parent));
end;

procedure TFormAddNPA.tplPunktCheckboxClick(Sender: TObject);
begin
  SetPunkt(Sender);
end;

procedure TFormAddNPA.tplPunktCheckboxMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddNPA.tplPunktMemoMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddNPA.tplPunktMouseEnter(Sender: TObject);
begin
  ScrollPunkt.SetFocus;
end;

procedure TFormAddNPA.tplPunktRightMemoExit(Sender: TObject);
begin
  updateChanged(TRzPanel(TWinCOntrol(sender).Parent.Parent.Parent));
end;

procedure TFormAddNPA.tplPunktRightMemoMouseEnter(Sender: TObject);
var
  p : TWinControl;
  i: integer;
begin
  p := TWinCOntrol(Sender).Parent;
  for i:=0 to p.ControlCount-1 do
  if p.Controls[i].Hint = 'label_mer' then
  begin
    p.Controls[i].Hide;
    exit;
  end;
end;

procedure TFormAddNPA.tplPunktRightMemoMouseLeave(Sender: TObject);
var
  p : TWinCOntrol;
  i: integer;
begin
  p := TWinCOntrol(Sender).Parent;
  for i:=0 to p.ControlCount-1 do
  if p.Controls[i].Hint = 'label_mer' then
  begin
    p.Controls[i].Show;
    exit;
  end;
end;

end.
