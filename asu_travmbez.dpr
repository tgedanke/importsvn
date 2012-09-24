program asu_travmbez;

uses
  windows,
  Forms,
  Variants,
  sysutils,
  fmMain in 'fmMain.pas' {FormMain},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  fmPredpriatia in '�����������\�����������\fmPredpriatia.pas' {FormPredpriatia1},
  fmProfPost in '�����������\��������� � ���������\fmProfPost.pas' {FormProfPost},
  fmRabotniki in '�����������\��������� �����������\fmRabotniki.pas' {FormRabotniki},
  fmProtocolNew in '��������\fmProtocolNew.pas' {FormProtocolNew},
  fmDocs in '�����������\���������\fmDocs.pas' {FormDocs},
  fmTool in '�����������\������������ � ��������������\fmTool.pas' {FormTool},
  fmSostoyanie in '�����������\��������� � �����������\fmSostoyanie.pas' {FormSostoyanie},
  report in 'report.pas',
  fmProtocolList in '��������\fmProtocolList.pas',
  fmAbout in 'fmAbout.pas' {FormAbout},
  fmAddNPA in '��������\fmAddNPA.pas' {FormAddNPA},
  fmInputList in '��������\fmInputList.pas' {FormInputList},
  uUpdater in '..\_UPDATER\uUpdater.pas',
  uConf in '..\_conf\uConf.pas',
  fmPabUsers in '������������\fmPabUsers.pas' {FormPabUsers},
  fmPabAdd in '������������\fmPabAdd.pas' {FormPabAdd},
  fmPabList in '������������\fmPabList.pas' {FormPabList},
  uExcel in 'uExcel.pas',
  rPabCard in '������������\rPabCard.pas',
  fmGetUser in '������������\fmGetUser.pas' {FormGetUser},
  fmPabReturn in '������������\fmPabReturn.pas' {FormPabReturn},
  fmOOSList in '���\fmOOSList.pas' {FormOOSList},
  fmOOSEdit in '���\fmOOSEdit.pas' {FormOOSEdit},
  fmOOSAddOper in '���\fmOOSAddOper.pas' {FormOOSAddOper},
  fmLimitsAndBalance in '���\fmLimitsAndBalance.pas' {FormLimits},
  fmOOSTakeBalance in '���\fmOOSTakeBalance.pas' {FormOOSTakeBalance},
  fmOOSView in '���\fmOOSView.pas' {FormOOSView},
  rSummary in '���\rSummary.pas',
  fmOOSGetPeriod in '���\fmOOSGetPeriod.pas' {FormOOSGetPeriod},
  rFull in '���\rFull.pas',
  rPabAuditor in '������������\rPabAuditor.pas',
  ReportLogic in '������������\ReportLogic.pas',
  fmGetPeriod in '������������\fmGetPeriod.pas' {FormGetPeriod},
  fmPabGetCeh in '������������\fmPabGetCeh.pas' {FormPabGetCeh},
  rPabCeh in '������������\rPabCeh.pas',
  rPabType in '������������\rPabType.pas',
  rPabBossDecision in '������������\rPabBossDecision.pas',
  rPabWorkKind in '������������\rPabWorkKind.pas',
  rPabCategory in '������������\rPabCategory.pas',
  rSeverstal in '���\rSeverstal.pas',
  r2TP in '���\r2TP.pas',
  fmOOSNormative in '���\fmOOSNormative.pas' {FormOOSNormative},
  rTeh in '���\rTeh.pas',
  fmOOSWaste in '���\fmOOSWaste.pas' {FormOOSWaste},
  fmCompany in '���\fmCompany.pas' {FormOOSCompanies},
  fmPabGraphic in '������������\fmPabGraphic.pas' {FormGraphic},
  fmPabGraphicAddUsers in '������������\fmPabGraphicAddUsers.pas' {FormGraphicAddUsers},
  rPabPlan in '������������\rPabPlan.pas',
  rOperations in '���\rOperations.pas',
  rAnalytic in '������������\rAnalytic.pas',
  fmPabAnalytic in '������������\fmPabAnalytic.pas' {FormAnalytic},
  fmOOSProps in '���\fmOOSProps.pas' {FormOOSProps},
  fmOOSPropsAdd in '���\fmOOSPropsAdd.pas' {FormOOSPropsAdd};

{$R *.res}

function FU_RunFile(const fname,params:string;wait:boolean):boolean;
var
  si: TStartupInfo;
  pi: TProcessInformation;
begin
  result := false;

  Zeromemory(@si,sizeof(si));
  si.cb := sizeof(si);
    
  if CreateProcess(nil,PAnsiChar('"'+fname+'" '+params),nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,si,pi) then
  begin
    result := true;
    if wait then
    begin
      WaitForSingleObject(pi.hProcess,INFINITE);
    end;
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
  end;

end;

function DebuggerPresent: boolean;
type
  TDebugProc = function: boolean; stdcall;
var
  Kernel32: HMODULE;
  DebugProc: TDebugProc;
begin
  Result := False;
  Kernel32 := GetModuleHandle('kernel32.dll');
  if Kernel32 <> 0 then
  begin
    @DebugProc := GetProcAddress(Kernel32, 'IsDebuggerPresent');
    if Assigned(DebugProc) then
      Result := DebugProc;
  end;
end;

var
  updater: TUpdater;

begin
  Application.Initialize;

  if not DebuggerPresent then
  FU_RunFile(
    '\\Server_kmc\asu_kmc\���������_���������\repository\nupdater.exe',
    '"'+paramstr(0)+'" '+inttostr(GetCurrentProcessId),
  true);
 // updater := TUpdater.Create;

 // if updater.NeedUpdate then
 // begin
 //   updater.Free;
 //   MessageBox(0,'���������� ���������� ���������!','��������!',MB_OK or MB_ICONWARNING);
 //   WinExec('updater.exe',SW_SHOW);
 //   Exit;
 // end;

  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormAbout, FormAbout);

  // Application.CreateForm(TFormOOSProps, FormOOSProps);
  // Application.CreateForm(TFormAnalytic, FormAnalytic);
  //Application.CreateForm(TFormGraphicAddUsers, FormGraphicAddUsers);
  //Application.CreateForm(TFormGraphic, FormGraphic);
  //Application.CreateForm(TFormOOSCompanies, FormOOSCompanies);
  // Application.CreateForm(TFormOOSWaste, FormOOSWaste);
  //Application.CreateForm(TFormOOSNormative, FormOOSNormative);
  // Application.CreateForm(TFormPabGetCeh, FormPabGetCeh);
  //Application.CreateForm(TFormGetPeriod, FormGetPeriod);
  //Application.CreateForm(TFormOOSGetPeriod, FormOOSGetPeriod);
  // Application.CreateForm(TFormOOSTakeBalance, FormOOSTakeBalance);
  //Application.CreateForm(TFormOOSView, FormOOSView);
  //Application.CreateForm(TFormLimits, FormLimits);
  //Application.CreateForm(TFormOOSAddOper, FormOOSAddOper);
  // Application.CreateForm(TFormInputList, FormInputList);
 // Application.CreateForm(TFormGetUser, FormGetUser);
 // Application.CreateForm(TFormPabReturn, FormPabReturn);

  //Application.CreateForm(TFormOOSEdit, FormOOSEdit);
  //Application.CreateForm(TFormOOSList, FormOOSList);
  //Application.CreateForm(TFormPabList, FormPabList);
  // Application.CreateForm(TFormPabAdd, FormPabAdd);
  //Application.CreateForm(TFormPabUsers, FormPabUsers);
  //Application.CreateForm(TFormAddResNPA, FormAddResNPA);

  Variants.NullStrictConvert := false;
  Variants.NullAsStringValue := '';

  Application.Run;
end.
