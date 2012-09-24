unit ReportLogic;

interface

procedure Report_Auditor_Show;
procedure Report_Ceh_Show;
procedure Report_Type_Show;
procedure Report_Category_Show;

procedure Report_WorkKind_Show;
procedure Report_BossDecision_Show;

procedure Report_Plan_Show;

procedure Report_Analytic_Show(mode:integer);

implementation

uses sysutils,windows,DataModule,Dialogs,Variants,
    fmGetUser,fmGetPeriod,fmpabGetCeh,fmPabAnalytic,
    rPabAuditor,rPabCeh,rPabType,
    rPabCategory,rPabWorkKind,rPabBossDecision,
    rPabPlan,rAnalytic;

procedure Report_Auditor_Show;
var
  d1,d2: TDateTime;
  ceh_id: integer;
  user_id: integer;
begin
//  IsUserBoss
  ceh_id := -1;
  user_id := -1;

  if not GetPeriod(d1,d2) then exit;

  if IsUserViewAll then
  begin
    ceh_id := 0;
    user_id := 0;
  end else
  if IsUserBoss then
  begin
    ceh_id := UserGetCeh;
    user_id := 0;
  end else
  if IsUserUser then
  begin
    ceh_id := 0;
    user_id := UserGetID;
  end else
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра отчета!');
    exit;
  end;

  Report_Pab_Auditor(d1,d2,
      user_id,
      ceh_id
    );
end;

procedure Report_Ceh_Show;
var
  d1,d2: TDateTime;
  ceh_id: integer;
begin
//  IsUserBoss
  ceh_id := -1;

  if not(IsUserBoss or IsUserViewAll) then
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра этого отчета!');
    exit;
  end;
  
  if not GetPeriod(d1,d2) then exit;

  if isUserViewAll then
  begin
  
    if not Pab_GetCeh(ceh_id) then exit;

  end else
  if isUserBoss then
  begin

    ceh_id := UserGetCeh;

  end;

  Report_Pab_Ceh(d1,d2,ceh_id);
  
end;

procedure Report_Type_Show;
var
  d1,d2: TDateTime;
  user_id,ceh_id: integer;
begin

  user_id := -1;
  ceh_id := -1;
  if not GetPeriod(d1,d2) then exit;

  if IsUserViewAll then
  begin
    ceh_id := 0;
    user_id := 0;
  end else
  if IsUserBoss then
  begin
    ceh_id := UserGetCeh;
    user_id := 0;
  end else
  if IsUserUser then
  begin
    ceh_id := 0;
    user_id := UserGetID;
  end else
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра отчета!');
    exit;
  end;
  
  Report_Pab_Type(d1,d2,true,true,true,user_id,ceh_id);
  
end;



procedure Report_Category_Show;
var
  d1,d2: TDateTime;
  user_id,ceh_id: integer;
begin

  user_id := -1;
  ceh_id := -1;
  if not GetPeriod(d1,d2) then exit;

  if IsUserViewAll then
  begin
    ceh_id := 0;
    user_id := 0;
  end else
  if IsUserBoss then
  begin
    ceh_id := UserGetCeh;
    user_id := 0;
  end else
  if IsUserUser then
  begin
    ceh_id := 0;
    user_id := UserGetID;
  end else
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра отчета!');
    exit;
  end;

  Report_Pab_Category(d1,d2,user_id,ceh_id);

end;

procedure Report_WorkKind_Show;
var
  d1,d2: TDateTime;
  user_id,ceh_id: integer;
begin

  user_id := -1;
  ceh_id := -1;
  if not GetPeriod(d1,d2) then exit;

  if IsUserViewAll then
  begin
    ceh_id := 0;
    user_id := 0;
  end else
  if IsUserBoss then
  begin
    ceh_id := UserGetCeh;
    user_id := 0;
  end else
  if IsUserUser then
  begin
    ceh_id := 0;
    user_id := UserGetID;
  end else
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра отчета!');
    exit;
  end;

  Report_Pab_WorkKind(d1,d2,user_id,ceh_id);

end;


procedure Report_BossDecision_Show;
var
  d1,d2: TDateTime;
  user_id,ceh_id: integer;
begin

  user_id := -1;
  ceh_id := -1;
  if not GetPeriod(d1,d2) then exit;

  if IsUserViewAll then
  begin
    ceh_id := 0;
    user_id := 0;
  end else
  if IsUserBoss then
  begin
    ceh_id := UserGetCeh;
    user_id := 0;
  end else
  if IsUserUser then
  begin
    ceh_id := 0;
    user_id := UserGetID;
  end else
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра отчета!');
    exit;
  end;

  Report_Pab_BossDecision(d1,d2,user_id,ceh_id);

end;


procedure Report_Plan_Show;
var
  d1,d2: TDateTime;
  ceh_id: integer;
  user_id: integer;
begin
//  IsUserBoss
  ceh_id := -1;
  user_id := -1;

  if not GetPeriod(d1,d2) then exit;

  Report_Pab_Plan(d1,d2);
end;


procedure Report_Analytic_Show(mode:integer);
var
  d1,d2: TDateTime;
  ceh_id: integer;
begin
  ceh_id := -1;


  if IsUserViewAll then
  begin
    ceh_id := 0;
  end else
  if IsUserBoss then
  begin
    ceh_id := UserGetCeh;
  end else
  begin
    ShowErrorBox('У вас недостаточно прав для просмотра отчета!');
    exit;
  end;

  if not GetAnalytic(mode,ceh_id,d1,d2) then exit;

  if mode = 1 then
    Report_Pab_Analytic_Month(d1,d2,ceh_id)
  else
    Report_Pab_Analytic_Mode(d1,d2,mode)

end;

end.
