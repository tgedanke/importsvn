unit uUpdater;

interface

  uses forms,
  classes,
  sysutils,
  windows,
  shellapi,
  uConf;

const
  default_server = '\\server_kmc\ASU_KMC\Исходники_ДученкоСВ\repository\';

type
  TUpdater = class
  private
    _path: string;
    _projects: TStringList;
    _cur_versions: TStringList;
    _new_versions: TStringList;
    _local_config: TConfFile;
    _remote_config: TConfFile;
    _projects_list: TStringList;

    function ProjectToExe(pname:string):string;
    function VersionToStr(version:DWORD):string;
    function StrToVersion(version:string):DWORD;
    function GetCurrentVersion(pname:string):string;
    procedure ProjectToUpdate(var list: TStringList);
    procedure GetCurrentVersions(const projects:TStringList;var list: TStringList);
    procedure GetNewVersions(const projects:TStringList;var list: TStringList);
    procedure parseProjects(projects: AnsiString;list:TStringList);
  public
    constructor Create;
    destructor Destroy;
    procedure UpdateAll;
    function NeedUpdate: boolean;
    procedure ReplaceOld;
    property Projects:TStringList read _projects;
    property CurrentVersions:TStringList read _cur_versions;
    property NewVersions:TStringList read _new_versions;
  end;

var
  server: string;
  
implementation

function ReplaceSlashes(s:AnsiString):AnsiString;
var
  i: integer;
  r: AnsiString;
begin
  r := '';
  for i := 1 to length(s) do
  if (s[i]='/') then
    r := r + '\'
  else
    r := r + s[i];
  result := r;
end;

function CopyDir(src,dst:AnsiString):boolean;
var
  op: TSHFileOPStructA;
  psrc,pdst: array[0..255] of Char;
begin
    FillChar(psrc,256,#0);
    FillChar(pdst,256,#0);

    StrCopy(PAnsiChar(@psrc[0]),PAnsiChar(@src[1]));
    StrCopy(PAnsiChar(@pdst[0]),PAnsiChar(@dst[1]));

    Fillchar(op,sizeof(op),#0);
    op.Wnd := Application.Handle;
    op.wFunc := FO_COPY;
    op.pFrom := @psrc[0];
    op.pTo := @pdst[0];
    op.fFlags := FOF_NOCONFIRMATION or FOF_NOERRORUI or FOF_SIMPLEPROGRESS;
    result := SHFileOperationA(op) = 0;
end;

procedure TUpdater.ProjectToUpdate(var list: TStringList);
var
  i: integer;
  s: AnsiString;
begin
  list.Clear;

  for I := 0 to _projects_list.Count - 1 do
  begin
    s := _remote_config.NodeValue(_projects_list[i]+'.file');
    if (s<>'') and FileExists(_path+s) then
      list.Add(_projects_list[i]);
  end;

end;

function TUpdater.ProjectToExe(pname:string):string;
begin
   result := _remote_config.NodeValue(pname+'.file');
end;

function TUpdater.VersionToStr(version:DWORD):string;
begin
  result := inttostr((version shr 16) and $FFFF)+'.'+inttostr(version and $FFFF);
end;

function TUpdater.StrToVersion(version:string):DWORD;
var
  l : string;
  r : string;
  i : integer;
begin
  i := pos('.',version);
  l := copy(version,1,i-1);
  r := copy(version,i+1,length(version)-i);
  result := (strtoint(l) shl 16) + strtoint(r);
end;

function TUpdater.GetCurrentVersion(pname:string):string;
var
  version: Cardinal;
  fname : string;
begin
  fname := _path+ProjectToExe(pname);
  version := GetFileVersion(_path+ProjectToExe(pname));
  result := VersionToStr(version);
end;

procedure TUpdater.GetCurrentVersions(const projects:TStringList;var list: TStringList);
var
  i : integer;
begin
  list.Clear;
  for I := 0 to projects.Count - 1 do
  begin
    list.Add(GetCurrentVersion(projects[i]));
  end;
end;

procedure TUpdater.GetNewVersions(const projects:TStringList;var list: TStringList);
var
  i : integer;
  f :TextFile;
  s1,s2 : string;
begin
  list.Clear;
  for I := 0 to projects.Count - 1 do
  begin
    s1 := _remote_config.NodeValue(projects[i]+'.version');
    if s1= '' then
      list.Add('0.0')
    else
      list.Add(s1);
  end;
end;

constructor TUpdater.Create;
begin

  _local_config := TConfFile.Create;
  _remote_config := TConfFile.Create;

  try
    _local_config.Load('updater.conf');
    server := _local_config.NodeValue('repository.path');
    if server = '' then
      server := default_server;
  except
    server := default_server;
  end;

  _projects_list := TStringList.Create;
  
  try
    _remote_config.Load(server+'projects.conf');
  except
  end;

  parseProjects(_remote_config.NodeValue('projects'),_projects_list);

  _path := ExtractFilePath(paramStr(0));
  _projects := TStringList.Create;
  _cur_versions := TStringList.Create;
  _new_versions := TStringList.Create;
  ProjectToUpdate(_projects);
  GetCurrentVersions(_projects,_cur_versions);
  GetNewVersions(_projects,_new_versions);
end;

destructor TUpdater.Destroy;
begin
  _local_config.Free;
  _remote_config.Free;
  _projects_list.Free;
  _projects.Free;
  _cur_versions.Free;
  _new_versions.Free;
end;

procedure TUpdater.parseProjects(projects: AnsiString;list:TStringList);
var
  p: integer;
  s,s2: string;
begin
  list.Clear;
  s := trim(projects);

  while true do
  begin
    p := pos(',',s);
    
    if p = 0 then
    begin
      if   s<> ''  then
        list.Add(s);
      break;
    end;

    s2 := trim(copy(s,1,p-1));
    if   s<> ''  then
        list.Add(s2);
    s := trim(copy(s,p+1,length(s)-p));
  end;

end;

function TUpdater.NeedUpdate: boolean;
var
  i : integer;
begin
  result := false;
  for I := 0 to _cur_versions.Count - 1 do
  if StrToVersion(_cur_versions[i]) < StrToVersion(_new_versions[i]) then
  begin
    result := true;
    exit;
  end;
end;

procedure TUpdater.UpdateAll;
var
  i: integer;
  p,e,s,d: AnsiString;
  updated : boolean;
  dir: AnsiString;
  error: boolean;
begin
  dir := ReplaceSlashes(ExtractFilePath(ParamStr(0))+'#new_files/');
  CreateDirectory(@dir[1],nil);

  updated := false;
  error := false;
  for i:= 0 to _projects.Count - 1 do
  if StrToVersion(_cur_versions[i]) < StrToVersion(_new_versions[i]) then
  begin
    updated := true;
    p := _projects[i];
    e := _remote_config.NodeValue(p+'.file');
    d := _remote_config.NodeValue(p+'.dir');
    if (e = '') or (d = '') then continue;
    
    s := ReplaceSlashes(server+d+'*');
    error := error or (not CopyDir(s,dir));
    
    if LowerCase(p) = LowerCase('updater') then
    /// if updater in list of projects , then split update to 2 parts
    ///  1st: change updater (it can content new settings and update lgoritms)
    ///  2nd: change other files
      break;
  end;

  if error then
  begin
        MessageBox(0,'Ошибка при копировании файлов!','Updater',MB_OK or MB_ICONERROR);
        exit;
  end;

  if updated then
  begin
    MessageBox(0,'Файлы скачаны, нажмите ОК для обновления !','Updater',MB_OK or MB_ICONINFORMATION);
    ReplaceOld;
  end;
end;

procedure TUpdater.ReplaceOld;
var
  i: integer;
  f : TextFile;
  l : TStringList;
  e : string;
begin
  
  l := TStringList.Create;
  l.Add('xcopy .\#new_files\* .\ /E /C /R /H /Y');
  l.Add('rd .\#new_files\ /S /Q');
  l.Insert(0,'@ping 127.0.0.1 -n 2 -w 2000 > nul');
  l.Add('del _updater_.bat');
  AssignFile(f,'_updater_.bat');
  {$I-}
  Rewrite(f);
  {$I+}
  if IOResult <>0 then
  begin
      MessageBox(0,'не могу создать файл _updater_.bat !','Updater',MB_OK or MB_ICONERROR);
      Application.Terminate;
  end;

  for i:= 0 to l.Count - 1 do
    WriteLn(f,l[i]);
  CloseFile(f);
  WinExec(PansiChar(_path+'_updater_.bat'),SW_HIDE);
  l.Free;
  Application.Terminate;
end;

end.
