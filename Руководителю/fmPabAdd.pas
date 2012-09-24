unit fmPabAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DataModule, RzPanel, RzRadGrp, ExtCtrls, RzButton, RzRadChk, ComCtrls,
  RzDTP, RzDBDTP, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel, RzDBSpin, RzCmboBx,
  RzDBCmbo, RzDBRGrp, DB, ADODB, DBCtrls, RzLstBox, RzChkLst;

const cat_name='АБВГДЕ';
type
  TFormPabAdd = class(TForm)
    ScrollBox1: TScrollBox;
    RzPanel1: TRzPanel;
    RzPanel16: TRzPanel;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    CatList: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel12: TRzLabel;
    RzPanel17: TRzPanel;
    RzDBRadioGroup1: TRzDBRadioGroup;
    RzDBRadioGroup2: TRzDBRadioGroup;
    RzDBRadioGroup3: TRzDBRadioGroup;
    RzPanel18: TRzPanel;
    RzLabel7: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzLabel8: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzPanel19: TRzPanel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzDBSpinEdit1: TRzDBSpinEdit;
    RzPanel20: TRzPanel;
    RzLabel1: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel2: TRzLabel;
    RzDBDateTimePicker1: TRzDBDateTimePicker;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    TimeStart: TRzMaskEdit;
    TimeEnd: TRzMaskEdit;
    category3: TRzPanel;
    RzPanel9: TRzPanel;
    RzCheckBox17: TRzCheckBox;
    RzCheckBox18: TRzCheckBox;
    RzCheckBox19: TRzCheckBox;
    RzCheckBox20: TRzCheckBox;
    RzCheckBox21: TRzCheckBox;
    RzCheckBox22: TRzCheckBox;
    RzCheckBox23: TRzCheckBox;
    RzCheckBox24: TRzCheckBox;
    category6: TRzPanel;
    RzPanel15: TRzPanel;
    RzCheckBox42: TRzCheckBox;
    RzCheckBox43: TRzCheckBox;
    RzCheckBox44: TRzCheckBox;
    RzCheckBox45: TRzCheckBox;
    RzCheckBox46: TRzCheckBox;
    category2: TRzPanel;
    RzPanel7: TRzPanel;
    RzCheckBox10: TRzCheckBox;
    RzCheckBox11: TRzCheckBox;
    RzCheckBox12: TRzCheckBox;
    RzCheckBox13: TRzCheckBox;
    RzCheckBox14: TRzCheckBox;
    RzCheckBox15: TRzCheckBox;
    RzCheckBox16: TRzCheckBox;
    category5: TRzPanel;
    RzPanel13: TRzPanel;
    RzCheckBox35: TRzCheckBox;
    RzCheckBox36: TRzCheckBox;
    RzCheckBox37: TRzCheckBox;
    RzCheckBox38: TRzCheckBox;
    category4: TRzPanel;
    RzPanel11: TRzPanel;
    RzCheckBox28: TRzCheckBox;
    RzCheckBox29: TRzCheckBox;
    RzCheckBox30: TRzCheckBox;
    category1: TRzPanel;
    RzPanel4: TRzPanel;
    RzCheckBox1: TRzCheckBox;
    RzCheckBox2: TRzCheckBox;
    RzCheckBox3: TRzCheckBox;
    RzCheckBox4: TRzCheckBox;
    RzCheckBox5: TRzCheckBox;
    RzCheckBox6: TRzCheckBox;
    RzCheckBox7: TRzCheckBox;
    RzCheckBox8: TRzCheckBox;
    dsPab: TDataSource;
    tblPab: TADOTable;
    CehCombo: TRzDBLookupComboBox;
    tblCeh: TADOTable;
    dsCeh: TDataSource;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    dsUch: TDataSource;
    tblUch: TADOTable;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    btnSave: TRzButton;
    btnClose: TRzButton;
    btnPrint: TRzButton;
    btnSign: TRzButton;
    lblEdit: TRzLabel;
    lblView: TRzLabel;
    RzPanel5: TRzPanel;
    RzDBRadioGroup4: TRzDBRadioGroup;
    btnReturn: TRzButton;
    btnComplete: TRzButton;
    btnGetUser: TRzButton;
    lblSign: TRzLabel;
    btnReturnText: TRzButton;
    RzLabel9: TRzLabel;
    RzCheckBox9: TRzCheckBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzLabel17: TRzLabel;
    qryAge: TADOQuery;
    dsAge: TDataSource;
    qryWTime: TADOQuery;
    dsWTime: TDataSource;
    dsProf: TDataSource;
    qryProf: TADOQuery;
    dsWorkKinds: TDataSource;
    qryWorkKinds: TADOQuery;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    RzPanel14: TRzPanel;
    RzPanel12: TRzPanel;
    wdCb9: TRzCheckBox;
    wdCb8: TRzCheckBox;
    wdCb7: TRzCheckBox;
    wdCb6: TRzCheckBox;
    RzPanel10: TRzPanel;
    wdCb5: TRzCheckBox;
    wdCb3: TRzCheckBox;
    wdCb2: TRzCheckBox;
    wdCb1: TRzCheckBox;
    wdCb4: TRzCheckBox;
    RzPanel21: TRzPanel;
    RzPanel6: TRzPanel;
    peCb4: TRzCheckBox;
    peCb3: TRzCheckBox;
    peCb2: TRzCheckBox;
    peCb1: TRzCheckBox;
    RzPanel8: TRzPanel;
    peCb8: TRzCheckBox;
    peCb7: TRzCheckBox;
    peCb6: TRzCheckBox;
    peCb5: TRzCheckBox;
    RzDBEdit4: TRzDBEdit;
    RzButton1: TRzButton;
    RzLabel18: TRzLabel;
    procedure dsPabDataChange(Sender: TObject; Field: TField);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure RzButton1Click(Sender: TObject);
    procedure btnReturnTextClick(Sender: TObject);
    procedure tblCehAfterScroll(DataSet: TDataSet);
    procedure btnGetUserClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure btnSignClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    _Mode: string;
    _Locked : boolean;
  public
    { Public declarations }

    procedure NewPortocol;
    procedure OpenProtocol(id:integer);
    procedure UpdateProtocolData;
    procedure SetProtocolData;


    procedure CheckBoxClick(Sender: TObject);
  end;

  procedure Boss_Sign(id:integer);
  procedure Boss_Return(id:integer;t:string);
  procedure Boss_Complete(id:integer);

var
  FormPabAdd: TFormPabAdd;

implementation

uses rPabCard,fmPabList,fmGetUser,fmPabReturn;

{$R *.dfm}


procedure Boss_Sign(id:integer);
begin
  ExecSQLQuery('update pab_main set locked=1 where id='+inttostr(id));
end;

procedure Boss_Return(id:integer;t:string);
begin
  ExecSQLQuery('update pab_main set locked=3,boss_return_text='''+t+''' where id='+inttostr(id));
end;

procedure Boss_Complete(id:integer);
begin
  ExecSQLQuery('update pab_main set locked=2,boss_name='''+UserGetName+''',boss_date=getdate() where id='+inttostr(id));
end;


function my_timeToStr(t:integer):string;
var
  c1,c2: string;
begin
  c1 := inttostr(t div 100);
  c2 := inttostr(t mod 100);
  if length(c1)=1 then c1 := '0'+ c1;
  if length(c2)=1 then c2 := '0'+ c2;
  
  result := c1 +':'+ c2;
end;

function my_StrToTime(s:string):integer;
var
  h,m: integer;
  p: integer;
begin
 p := pos(':',s);
 if p = 0  then
 begin
  h := 0;
  m := 0;
 end
 else
 begin
   h := strtoint(copy(s,1,p-1));
   m := strtoint(copy(s,p+1,10));
 end;

 result := h*100+m;
end;

procedure TFormPabAdd.FormClose(Sender: TObject; var Action: TCloseAction);
var
  r: integer;
  id: integer;
begin
  if tblPab.State <> dsEdit then
  begin
    Action := caFree;
    exit;
  end;

  if _Locked then
  begin
    tblPab.Cancel;
    Action := caFree;
    exit;
  end;

  
  Action := caNone;
  r := MessageBOx(Handle,'Сохранить изменения?','Запрос на сохранение',MB_YESNOCANCEL or MB_ICONQUESTION);
  if r = IDCANCEL then exit;

  Action := caFree;

  if r = IDNO then
  begin

    if _mode='open' then
    begin
      tblPab.Cancel;
    end else
    if _mode='new' then
    begin
      id := tblPab.FieldByName('id').Value;
      tblPab.Cancel;
      ExecSQLQuery('delete from pab_main where id='+inttostr(id));
    end;

    exit;
  end;

  SetProtocolData;
  tblPab.Post;
end;

procedure TFormPabAdd.FormCreate(Sender: TObject);
begin
  _Locked := false;

end;

procedure TFormPabAdd.FormDestroy(Sender: TObject);
begin
  PabListRefresh;
end;

procedure TFormPabAdd.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  d: integer;
begin
  Caption := inttostr(WheelDelta);
  if WheelDelta<0 then d := 1;
  if WheelDelta>0 then d := -1;
  if WheelDelta=0 then d := 0;
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 40*d;
 // ScrollBox1.ScrollBy(0,WheelDelta);
end;

procedure TFormPabAdd.NewPortocol;
var
  y,m,d,hr,mn,sk,ms: word;
  num: integer;
begin
///
_mode := 'new';

DecodeDate(date,y,m,d);
ADOQueryExecute(queries[0],'select (isnull(max(num),0)+1) as n from pab_main where year(date)='+inttostr(y));
if queries[0].EOF then
begin
  num := 1;
end else
begin
  num := queries[0].FieldByName('n').Value;
end;

DecodeTime(Time,hr,mn,sk,ms);

mn := (mn div 5)* 5;

tblPab.Insert;
tblpab.FieldByName('num').Value := num;
tblpab.FieldByName('date').Value := Date;
tblpab.FieldByName('time_start').Value := max(hr-1,0)*100+mn;
tblpab.FieldByName('time_end').Value := hr*100+mn;
tblpab.FieldByName('count').Value := 1;
tblpab.FieldByName('tester').Value := UserGetName;
tblpab.FieldByName('tester_post').Value := UserGetPost;
tblpab.FieldByName('owner').Value := UserAccount;
tblpab.FieldByName('l_ceh').Value := 0;
tblPab.Post;
tblPab.Edit;


UpdateProtocolData;

RzPanel5.Enabled := false;
lblEdit.Visible := true;
ScrollBox1.VertScrollBar.Position := 0;

end;

procedure TFormPabAdd.UpdateProtocolData;

var
  i,j,id: integer;
  p: TRzPanel;
  c: TRzCheckBox;
  f: boolean;
  cat: string;
begin
  id := tblpab.FieldByName('id').Value;

  TimeStart.Text := my_timeToStr(tblpab.FieldByName('time_start').Value);
  TimeEnd.Text := my_timeToStr(tblpab.FieldByName('time_end').Value);

  /// проставляем категории
  ADOQueryExecute(queries[0],'select * from pab_main_group where pab_id='+inttostr(id));

  for i := 1 to 6 do
  begin

    p := TRzPanel(RzPanel1.FindChildControl('category'+inttostr(i)));
    if p = nil then continue;
    f := false;

    for j:= 0 to p.ControlCount-1 do
    begin
      if TControl(p.Controls[j]).Tag<2 then continue;
      c := TRzCheckBOx(p.Controls[j]);
      c.OnClick := CheckBoxClick;
      if not varisnull(queries[0].Lookup('group_id',inttostr(c.tag),'pab_id')) then
      begin
        c.Checked := true;
        f := true;
      end;
    end;

    if f then
    begin
      if cat<>'' then cat := cat + ', ';
      cat := cat+cat_name[i];
    end;

  end;

  CatList.Caption := cat;

  // проставляем возможные последствия
  ADOQueryExecute(AQuery,'select * from pab_main_possible_effect where pab_id='+inttostr(id));

  for i := 1 to 16 do
  begin
    c := TRzCheckBOx(Self.FindComponent('peCb'+inttostr(i)));
    if c=nil then break;
    c.Checked := not varisnull(AQuery.Lookup('possible_effect_id',inttostr(c.tag),'pab_id'));
  end;

  // проставляем принятые действия
  ADOQueryExecute(AQuery,'select * from pab_main_what_done where pab_id='+inttostr(id));

  for i := 1 to 16 do
  begin
    c := TRzCheckBOx(Self.FindComponent('wdCb'+inttostr(i)));
    if c=nil then break;
    c.Checked := not varisnull(AQuery.Lookup('what_done_id',inttostr(c.tag),'pab_id'));
  end;
  
end;

procedure TFormPabAdd.SetProtocolData;
var
  i,j,id: integer;
  p: TRzPanel;
  c: TRzCheckBox;
begin
  id := tblpab.FieldByName('id').Value;

  tblpab.FieldByName('time_start').Value:= my_StrToTime(TimeStart.Text );
  tblpab.FieldByName('time_end').Value:= my_StrToTime(TimeEnd.Text );
  tblpab.FieldByName('tmp_category').Value:= CatList.Caption;

  ExecSQLQuery('delete from pab_main_group where pab_id='+inttostr(id));

  for i := 1 to 6 do
  begin

    p := TRzPanel(RzPanel1.FindChildControl('category'+inttostr(i)));
    if p = nil then continue;

    for j:= 0 to p.ControlCount-1 do
    begin
      if TControl(p.Controls[j]).Tag<2 then continue;
      c := TRzCheckBOx(p.Controls[j]);
      if c.Checked then
      begin
        ExecSQLQuery('insert into pab_main_group(pab_id,group_id)values('+inttostr(id)+','+inttostr(c.Tag)+')');
      end;
    end;

  end;

  /// заносим в базу возможный эффект
  ExecSQLQuery('delete from pab_main_possible_effect where pab_id='+inttostr(id));
  for i := 1 to 16 do
  begin
    c := TRzCheckBOx(Self.FindComponent('peCb'+inttostr(i)));
    if c=nil then break;
    if c.Checked then
      ExecSQLQuery('insert into pab_main_possible_effect(pab_id,possible_effect_id)values('+inttostr(id)+','+inttostr(c.Tag)+')');
  end;

  /// заносим в базу принятые действия
  ExecSQLQuery('delete from pab_main_what_done where pab_id='+inttostr(id));
  for i := 1 to 16 do
  begin
    c := TRzCheckBOx(Self.FindComponent('wdCb'+inttostr(i)));
    if c=nil then break;
    if c.Checked then
      ExecSQLQuery('insert into pab_main_what_done(pab_id,what_done_id)values('+inttostr(id)+','+inttostr(c.Tag)+')');
  end;

end;

procedure TFormPabAdd.tblCehAfterScroll(DataSet: TDataSet);
begin
  RzDBLookupComboBox2.ClearKeyValue;
end;

procedure TFormPabAdd.OpenProtocol(id:integer);
var
  locked: integer;
  can_edit,can_sign: boolean;
begin
  _mode := 'open';

  if not tblPab.Locate('id',inttostr(id),[loPartialKey]) then
  begin
    close;
    raise Exception.Create('Не найден ПАБ!');
  end;

  locked := nz(tblPab.FieldByName('locked').Value,0);

  can_sign := IsUserBoss and  (nz(tblPab.FieldByName('l_ceh').Value,-1) = UserGetCeh) and (locked<>2);
  can_edit := (nz(tblPab.FieldByName('owner').Value,'')=UserAccount) and ((locked=0) or (locked=3));
  
  if not can_sign then
  begin
    RzPanel5.Enabled := false;  
  end;

  if can_sign then
  begin
    btnReturn.Visible := true;
    btnComplete.Visible := true;
    lblSign.Visible := true;
    ScrollBox1.VertScrollBar.Position := RzPanel1.Height - ScrollBox1.Height;
    tblPab.Edit;
  end;
  
  if not can_edit then
  begin
    _Locked := true;
    btnSave.Visible := false;
    btnSign.Visible := false;
    RzPanel20.Enabled := false;
    RzPanel19.Enabled := false;
    RzPanel18.Enabled := false;
    RzPanel17.Enabled := false;
    RzPanel16.Enabled := false;
    category1.Enabled := false;
    category2.Enabled := false;
    category3.Enabled := false;
    category4.Enabled := false;
    category5.Enabled := false;
    category6.Enabled := false;
    lblView.Visible := not can_sign;
  end else
  begin
    lblEdit.Visible := true;
    ScrollBox1.VertScrollBar.Position := 0;
    tblPab.Edit;
  end;


  
  if locked=3 then
  begin
    btnReturn.Visible := false;
    btnComplete.Visible := false;
    btnReturnText.Visible := true;
    btnReturnText.Left := btnComplete.Left;
    btnReturnText.Top := btnComplete.Top;
  end;

  UpdateProtocolData;

  if locked=3 then
    pabReturnSetText(nz(tblPab.FieldByName('boss_return_text').Value,''));

end;

procedure TFormPabAdd.RzButton1Click(Sender: TObject);
begin
  FormGetUser := TFormGetUser.Create(nil);
  if FormGetUser.ShowModal=1 then
  begin
    tblpab.FieldByName('w_name').Value := UserGetNameById(FormGetUser.id);
  end;
  FormGetUser.Free;
end;

procedure TFormPabAdd.btnSaveClick(Sender: TObject);
begin
  SetProtocolData;
  tblPab.Post;

  if (_mode='new') and (nz(tblPab.FieldByName('boss_decision').Value,0)<>0) then
  begin
    Boss_Complete(tblpab.FieldByName('id').Value);
  end;

  Close;
end;

procedure TFormPabAdd.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPabAdd.btnCompleteClick(Sender: TObject);
begin
  if nz(tblPab.FieldByName('boss_decision').Value,0)=0 then
  begin
    ShowErrorBox('Не выбрано решение!');
    exit;
  end;
  
  if IDNO = MessageBox(Handle,'Завершить работу с ПАБ?','Подтверждение',MB_YESNO or MB_ICONQUESTION) then exit;
  SetProtocolData;
  tblPab.Post;
  Boss_Complete(tblpab.FieldByName('id').Value);
  close;
end;

procedure TFormPabAdd.btnGetUserClick(Sender: TObject);
begin
  FormGetUser := TFormGetUser.Create(nil);
  if FormGetUser.ShowModal=1 then
  begin
    tblpab.FieldByName('tester').Value := UserGetNameById(FormGetUser.id);
    tblpab.FieldByName('tester_post').Value := UserGetPostById(FormGetUser.id);
  end;
  FormGetUser.Free;
end;

procedure TFormPabAdd.btnPrintClick(Sender: TObject);
begin
  Print_Pab_Card(tblpab.FieldByName('id').Value);
end;

procedure TFormPabAdd.btnReturnClick(Sender: TObject);
var
  t: string;
begin
  if IDNO = MessageBox(Handle,'ПАБ будет возвращен создателю. Хотите продолжить?','Подтверждение',MB_YESNO or MB_ICONQUESTION) then exit;
  t := PabReturnGetText;
  if t='' then
  begin
    exit;
  end;

  SetProtocolData;
  tblPab.Post;
  Boss_Return(tblpab.FieldByName('id').Value,t);
  close;
end;

procedure TFormPabAdd.btnReturnTextClick(Sender: TObject);
begin
  pabReturnSetText(nz(tblPab.FieldByName('boss_return_text').Value,''));
end;

procedure TFormPabAdd.btnSignClick(Sender: TObject);
begin
  if nz(tblpab.FieldByName('l_ceh').Value,0)=0 then
  begin
    ShowErrorBox('Не выбран цех!');
    exit;
  end;

  if IDNO = MessageBox(Handle,'После этой операции ПАБ станет недоступен для изменения. Хотите продолжить?','Подтверждение',MB_YESNO or MB_ICONQUESTION) then exit;

  SetProtocolData;
  tblPab.Post;
  Boss_Sign(tblpab.FieldByName('id').Value);
  Close;
end;

procedure TFormPabAdd.CheckBoxClick(Sender: TObject);
var
  c,c2: TRzCheckBox;
  p: TRzPanel;
  i: integer;
  f: boolean;
  cat: string;
  acat: string;
  rcat: string;
begin
  c := TRzCheckBox(Sender);
  p := TRzPanel(c.Parent);
  f := false;
  for i := 0 to  p.ControlCount - 1 do
  begin
    if p.Controls[i].Tag<2 then continue;
    f := f or TRzCheckBox(p.Controls[i]).Checked;
  end;

  cat := cat_name[p.Tag];
  acat := CatList.Caption;
  rcat := '';
  for i := 1 to 6 do
  begin
    if (not f) and (cat_name[i]=cat) then continue;
    if (cat_name[i]<>cat) and (pos(cat_name[i],acat)=0) then continue;

    if rcat<>'' then rcat := rcat + ', ';
    rcat := rcat + cat_name[i];
  end;

  CatList.Caption := rcat;
end;



procedure TFormPabAdd.dsPabDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then exit;
  
  if not (
      (_mode = 'new') and
      IsUserBoss and
      (Field.FieldName='l_ceh')
  ) then exit;

  if (nz(Field.Value,-1) = UserGetCeh) then
  begin
    RzPanel5.Enabled := true;
    btnSign.Visible := false;
  end else
  begin
    RzPanel5.Enabled := false;
    btnSign.Visible := true;
    tblPab.FieldByName('boss_decision').Value := 0;
  end;
  
end;

end.
