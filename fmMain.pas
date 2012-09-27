unit fmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, RzStatus, RzPanel, ExtCtrls,
  Datamodule, fmPredpriatia, fmProfPost, fmRabotniki, fmDocs, fmTool,
  fmProtocolNew,fmSostoyanie,fmProtocolList,fmAbout,
  RzButton, ActnList,shellapi,fmPabUsers,fmPabAdd,fmPabList,
  fmOOSList,fmLimitsAndBalance,fmOOSView,fmGetuser,
  rSummary,rFull,rSeverstal,r2tp,rTeh,rOperations,
  ReportLogic,
  fmOOSGetPeriod,fmOOSNormative,fmOOSWaste,fmCompany,fmPabGraphic,
  fmOOSProps;

type
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    RzToolbar1: TRzToolbar;
    StatusClock: TRzClockStatus;
    StatusVersion: TRzVersionInfoStatus;
    StatusUser: TRzFieldStatus;
    RzVersionInfo1: TRzVersionInfo;
    BtnFilterAdd: TRzToolButton;
    BtnFilterDel: TRzToolButton;
    RzSpacer1: TRzSpacer;
    BtnFilterAsc: TRzToolButton;
    BtnFilterDesc: TRzToolButton;
    RzSpacer2: TRzSpacer;
    BtnRefresh: TRzToolButton;
    ActionList1: TActionList;
    FilterApply: TAction;
    FilterRemove: TAction;
    SortAsc: TAction;
    SortDesc: TAction;
    Refresh: TAction;
    RzSpacer3: TRzSpacer;
    BtnNewProtocol: TRzToolButton;
    NewProtocol: TAction;
    N9: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    MenuPAB: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N21: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    Jnxtns1: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N2NG1: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    procedure N54Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N2NG1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure NewProtocolExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure SortDescExecute(Sender: TObject);
    procedure SortAscExecute(Sender: TObject);
    procedure FilterRemoveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FilterApplyExecute(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnProtocolClose(sender:TForm);
  end;

const admin_email = 'sv.duchenko@ssmtm.ru';

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FilterApplyExecute(Sender: TObject);
begin
  if FormMain.ActiveMDIChild <> nil then
  begin
    if AskFilter then CallAction(FormMain.ActiveMDIChild,'ApplyFilter',BtnFilterAdd);
  end;
end;

procedure TFormMain.FilterRemoveExecute(Sender: TObject);
begin
    CallAction(FormMain.ActiveMDIChild,'RemoveFilter',BtnFilterDel);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  StatusUser.Caption := UserAccount+' ('+UserGetName+')';

  if not (IsUserBoss or IsUserUser or IsUserAdmin or IsUserVIewAll) then
  begin
    MenuPAB.Enabled := false;
  end;

  if not IsUserViewAll then
  begin
    N50.Enabled := false;
  end;
  

  if not (IsUserAdmin) then
  begin
    N21.Visible := false;
  end;

  if not (IsUserTBUser) then
  begin
    N2.Enabled := false;
    N3.Enabled := false;
    BtnNewProtocol.Enabled := false;
  end;

  if not (IsUserOOSUser) then
  begin
    N29.Enabled := false;
  end;

end;

procedure TFormMain.N11Click(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TFormMain.N12Click(Sender: TObject);
begin
  ShellExecute(Handle,'open','ИП-ТБ-001-001.doc','','',SW_SHOW);
end;

procedure TFormMain.N13Click(Sender: TObject);
begin
  Close;
end;



procedure TFormMain.N15Click(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to FormMain.MDIChildCount-1 do
    Formmain.MDIChildren[i].WindowState := wsNormal;
  FormMain.Cascade;
end;

procedure TFormMain.N16Click(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to FormMain.MDIChildCount-1 do
    Formmain.MDIChildren[i].WindowState := wsNormal;
  FormMain.Tile;
end;

procedure TFormMain.N17Click(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to FormMain.MDIChildCount-1 do
    Formmain.MDIChildren[i].Close;
end;


procedure TFormMain.N18Click(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to FormMain.MDIChildCount-1 do
    Formmain.MDIChildren[i].WindowState := wsMinimized;
  FormMain.ArrangeIcons;
end;


procedure TFormMain.N19Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormTool,TForm(FormTool));
end;

procedure TFormMain.N20Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormSostoyanie,TForm(FormSostoyanie));
end;

procedure TFormMain.N22Click(Sender: TObject);
var
  body,mail: AnsiString;
  d,u: string;
begin
  DateTimeToString(d,'dd mmm yyyy , hh:nn:ss',Now());
  u := GetSingleSQLResult('select current_user','');
  body := 'Система: АСУ Травмобезопасность'+'%0A'+
          'Пользователь: '+u+'%0A'+
          'Версия: '+StatusVersion.VersionInfo.FileVersion+'%0A'+
          'Дата: '+ d +'%0D%0A%0D%0A';
  mail := 'mailto:'+admin_email+'?Subject=АСУ Травмобезопасность&Body='+body;
  ShellExecute(Handle,'open',PWideChar(mail),'','',SW_SHOW);
end;

procedure TFormMain.N23Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormPabUsers,TForm(FormPabUsers));
end;

procedure TFormMain.N25Click(Sender: TObject);
begin
_Debug_User := not _Debug_User;
_Debug := _Debug_Boss or _Debug_User;
N25.Checked := _Debug_User;
end;

procedure TFormMain.N26Click(Sender: TObject);
begin
  if UserGetCeh=-1 then
  begin
    raise Exception.Create('Для вас не настроен рабочий Цех. Обратитесь к администратору.');
  end;

  if not (IsUserUser or IsUserBoss or IsUserViewAll) then
  begin
    raise Exception.Create('Для вас не настроены права доступа. Обратитесь к администратору.');
  end;

  OpenChildForm(FormMain,TFormPabList,TForm(FormPabList));
end;

procedure TFormMain.N28Click(Sender: TObject);
begin
_Debug_Boss := not _Debug_Boss;
_Debug := _Debug_Boss or _Debug_User;
N28.Checked := _Debug_Boss;
end;

procedure TFormMain.N2NG1Click(Sender: TObject);
var
  y,q: word;
begin
  if OOSGetPeriod(y,q) then
    Report_2TP_Build(y,q);
end;


procedure TFormMain.N30Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormOOSList,TForm(FormOOSList));
end;

procedure TFormMain.N31Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormLimits,TForm(FormLimits));
end;

procedure TFormMain.N32Click(Sender: TObject);
begin
  FormOOSView := TFormOOSView.Create(Application);
  FormOOSView.Show;
end;

procedure TFormMain.N33Click(Sender: TObject);
var
  y,q: word;
begin
  if OOSGetPeriod(y,q) then
    Report_Summary_Build(y,q);
end;

procedure TFormMain.N34Click(Sender: TObject);
var
  y,q: word;
begin
  if OOSGetPeriod(y,q) then
    Report_Full_Build(y,q);
end;

procedure TFormMain.N35Click(Sender: TObject);
begin
  Report_Auditor_Show;
end;

procedure TFormMain.N36Click(Sender: TObject);
begin
  Report_Ceh_Show;
end;

procedure TFormMain.N37Click(Sender: TObject);
begin
  Report_Type_Show;
end;

procedure TFormMain.N38Click(Sender: TObject);
begin
  Report_Category_Show;
end;

procedure TFormMain.N39Click(Sender: TObject);
begin
  Report_WorkKind_Show;
end;

procedure TFormMain.N40Click(Sender: TObject);
begin
  Report_BossDecision_Show;
end;

procedure TFormMain.N41Click(Sender: TObject);
var
  y,q: word;
begin
  if OOSGetPeriod(y,q) then
    Report_Severstal_Build(y,q);
end;

procedure TFormMain.N42Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormOOSNormative,TForm(FormOOSNormative));
end;

procedure TFormMain.N43Click(Sender: TObject);
var
  y,q: word;
begin
  if OOSGetPeriod(y,q) then
    Report_Teh_Build(y,q);
end;


procedure TFormMain.N44Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormOOSWaste,TForm(FormOOSWaste));
end;

procedure TFormMain.N45Click(Sender: TObject);
begin
//FormOOSCompanies
  OpenChildForm(FormMain,TFormOOSCompanies,TForm(FormOOSCompanies));
end;

procedure TFormMain.N46Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormGraphic,TForm(FormGraphic));
end;

procedure TFormMain.N47Click(Sender: TObject);
begin
  Report_Plan_Show;
end;

procedure TFormMain.N48Click(Sender: TObject);
begin
  ShellExecute(Handle,'open','ИП-ТБ-002-002.doc','','',SW_SHOW);
end;

procedure TFormMain.N49Click(Sender: TObject);
var
  y,q: word;
  ceh,otch: integer;
begin
  if OOSGetPeriodCeh(y,q,ceh,otch) then
    Report_Operations_Build(y,q,ceh,otch);
end;

procedure TFormMain.N51Click(Sender: TObject);
begin
  Report_Analytic_Show(1);
end;

procedure TFormMain.N52Click(Sender: TObject);
begin
  Report_Analytic_Show(2);
end;

procedure TFormMain.N53Click(Sender: TObject);
begin
  Report_Analytic_Show(3);
end;

procedure TFormMain.N54Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormOOSProps,TForm(FormOOSProps));
end;

procedure TFormMain.N5Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormProtocolList,TForm(FormProtocolList));
end;

procedure TFormMain.N6Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormRabotniki,TForm(FormRabotniki));
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormPredpriatia,TForm(FormPredpriatia));
end;

procedure TFormMain.N8Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormProfPost,TForm(FormProfPost));
end;

procedure TFormMain.N9Click(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormDocs,TForm(FormDocs));
end;

procedure TFormMain.NewProtocolExecute(Sender: TObject);
begin
  OpenChildForm(FormMain,TFormProtocolNew,TForm(FormProtocolNew));
  FormProtocolNew.OnProtocolClose := OnProtocolClose;
end;

procedure TFormMain.RefreshExecute(Sender: TObject);
begin
    CallAction(FormMain.ActiveMDIChild,'Refresh',BtnRefresh);
end;

procedure TFormMain.SortAscExecute(Sender: TObject);
begin
    CallAction(FormMain.ActiveMDIChild,'SortAsc',BtnFilterAsc);
end;

procedure TFormMain.SortDescExecute(Sender: TObject);
begin
    CallAction(FormMain.ActiveMDIChild,'SortDesc',BtnFilterDesc);
end;

procedure TFormMain.OnProtocolClose(sender:TForm);
begin
  try
    if assigned(FormProtocolList) then
      FormProtocolList.Refresh.Execute;
  finally

  end;
end;

end.
