program asu_travmbez;

uses
  windows,
  Forms,
  Variants,
  sysutils,
  fmMain in 'fmMain.pas' {FormMain},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  fmPredpriatia in 'справочники\Предприятия\fmPredpriatia.pas' {FormPredpriatia1},
  fmProfPost in 'справочники\Профессии и Должности\fmProfPost.pas' {FormProfPost},
  fmRabotniki in 'справочники\Работники предприятий\fmRabotniki.pas' {FormRabotniki},
  fmProtocolNew in 'протокол\fmProtocolNew.pas' {FormProtocolNew},
  fmDocs in 'справочники\Документы\fmDocs.pas' {FormDocs},
  fmTool in 'справочники\Оборудование и приспособления\fmTool.pas' {FormTool},
  fmSostoyanie in 'справочники\Состояния и мероприятия\fmSostoyanie.pas' {FormSostoyanie},
  report in 'report.pas',
  fmProtocolList in 'протокол\fmProtocolList.pas',
  fmAbout in 'fmAbout.pas' {FormAbout},
  fmAddNPA in 'протокол\fmAddNPA.pas' {FormAddNPA},
  fmInputList in 'протокол\fmInputList.pas' {FormInputList},
  uUpdater in '..\_UPDATER\uUpdater.pas',
  uConf in '..\_conf\uConf.pas',
  fmPabUsers in 'Руководителю\fmPabUsers.pas' {FormPabUsers},
  fmPabAdd in 'Руководителю\fmPabAdd.pas' {FormPabAdd},
  fmPabList in 'Руководителю\fmPabList.pas' {FormPabList},
  uExcel in 'uExcel.pas',
  rPabCard in 'Руководителю\rPabCard.pas',
  fmGetUser in 'Руководителю\fmGetUser.pas' {FormGetUser},
  fmPabReturn in 'Руководителю\fmPabReturn.pas' {FormPabReturn},
  fmOOSList in 'ООС\fmOOSList.pas' {FormOOSList},
  fmOOSEdit in 'ООС\fmOOSEdit.pas' {FormOOSEdit},
  fmOOSAddOper in 'ООС\fmOOSAddOper.pas' {FormOOSAddOper},
  fmLimitsAndBalance in 'ООС\fmLimitsAndBalance.pas' {FormLimits},
  fmOOSTakeBalance in 'ООС\fmOOSTakeBalance.pas' {FormOOSTakeBalance},
  fmOOSView in 'ООС\fmOOSView.pas' {FormOOSView},
  rSummary in 'ООС\rSummary.pas',
  fmOOSGetPeriod in 'ООС\fmOOSGetPeriod.pas' {FormOOSGetPeriod},
  rFull in 'ООС\rFull.pas',
  rPabAuditor in 'Руководителю\rPabAuditor.pas',
  ReportLogic in 'Руководителю\ReportLogic.pas',
  fmGetPeriod in 'Руководителю\fmGetPeriod.pas' {FormGetPeriod},
  fmPabGetCeh in 'Руководителю\fmPabGetCeh.pas' {FormPabGetCeh},
  rPabCeh in 'Руководителю\rPabCeh.pas',
  rPabType in 'Руководителю\rPabType.pas',
  rPabBossDecision in 'Руководителю\rPabBossDecision.pas',
  rPabWorkKind in 'Руководителю\rPabWorkKind.pas',
  rPabCategory in 'Руководителю\rPabCategory.pas',
  rSeverstal in 'ООС\rSeverstal.pas',
  r2TP in 'ООС\r2TP.pas',
  fmOOSNormative in 'ООС\fmOOSNormative.pas' {FormOOSNormative},
  rTeh in 'ООС\rTeh.pas',
  fmOOSWaste in 'ООС\fmOOSWaste.pas' {FormOOSWaste},
  fmCompany in 'ООС\fmCompany.pas' {FormOOSCompanies},
  fmPabGraphic in 'Руководителю\fmPabGraphic.pas' {FormGraphic},
  fmPabGraphicAddUsers in 'Руководителю\fmPabGraphicAddUsers.pas' {FormGraphicAddUsers},
  rPabPlan in 'Руководителю\rPabPlan.pas',
  rOperations in 'ООС\rOperations.pas',
  rAnalytic in 'Руководителю\rAnalytic.pas',
  fmPabAnalytic in 'Руководителю\fmPabAnalytic.pas' {FormAnalytic},
  fmOOSProps in 'ООС\fmOOSProps.pas' {FormOOSProps},
  fmOOSPropsAdd in 'ООС\fmOOSPropsAdd.pas' {FormOOSPropsAdd};

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
    '\\Server_kmc\asu_kmc\Исходники_ДученкоСВ\repository\nupdater.exe',
    '"'+paramstr(0)+'" '+inttostr(GetCurrentProcessId),
  true);
 // updater := TUpdater.Create;

 // if updater.NeedUpdate then
 // begin
 //   updater.Free;
 //   MessageBox(0,'Необходимо обновление программы!','Внимание!',MB_OK or MB_ICONWARNING);
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
