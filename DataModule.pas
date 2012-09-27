unit DataModule;

interface

uses
  SysUtils, Classes,  DB, SqlExpr, ADODB, ImgList, Controls, ActnList,
  Forms, StdCtrls, windows,Variants,RzDBGrid, Dialogs, graphics, COmObj,DBGrids;

type
  TFormClass = class of TForm;
  TDataModule1 = class(TDataModule)
    KMCConnection: TADOConnection;
    ProjectImages: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function newQuery:TADOQuery;

    function GetPropertyValue(const year,month:integer;const cname:string):string;
  end;

  TVarArr = class
  private
    _values : array of Variant;
    _names : array of string;
    _count : integer;

    function Findname(name:string):integer;
    function GetVal(name:string):Variant;
    procedure SetVal(name:string;const val:Variant);
    function GetName(i:integer):string;
  public
    property Values[name:string]:Variant read GetVal write SetVal;
    property Names[i:integer]:string read GetName;
    property NameCount: integer read _count;
  end;
const
  MSG_NO_FILTER_SELECTED = 'Вы не выбрали поле для фильтрования!';
  MSG_NO_SORT_SELECTED = 'Вы не выбрали поле для сортировки!';
  MSG_CANT_FILTER_FIELD = 'Невозможно применить фильтр к данному полю!';
  MSG_CANT_SORT_FIELD = 'Невозможно применить сортировку к данному полю!';
  MSG_ERROR_TITLE = 'Произошла ошибка';
  S_DB_NAVIGATOR_HINTS =  ''
  + 'Первая запись' + #13#10
  + 'Предыдущая запись' + #13#10
  + 'Следующая запись' + #13#10
  + 'Последняя запись' + #13#10
  + 'Всавить запись' + #13#10
  + 'Удалить запись' + #13#10
  + 'Редактировать запись' + #13#10
  + 'Завершить редактирование' + #13#10
  + 'Отменить редактирование' + #13#10
  + 'Обновить' + #13#10;
const
  months : array[1..12] of string = (
    'январь','февраль','март','апрель',
    'май','июнь','июль','август',
    'сентябрь','октябрь','ноябрь','декабрь'
  );

  months2 : array[1..12] of string = (
    'января','февраля','марта','апреля',
    'мая','июня','июля','августа',
    'сентября','октября','ноября','декабря'
  );

var
  DataModule1: TDataModule1;
  adoquery: TADOQuery;
  queries:array[0..9] of TADOQuery;
  AQuery,BQuery,CQuery,DQUery,EQUery,FQUery,GQuery: TADOQuery;
  CurrentFilter: string;
  errmsg: TStringList;
  
  UserGroups: TStringList;
  User: string;
  UserAccount: string;

  _Debug_Boss : boolean;
  _Debug_User : boolean;
  _Debug : boolean;

function NZ(v:Variant;default:Variant):Variant;
function IsOpened(mainform:TForm;formclass:TClass):boolean;
procedure CallAction(form:TForm;action:string;Sender:TObject=nil);
function HasAction(const l: TActionList;name:AnsiString): integer;
function my_floattostr(f:real):string;


procedure ClearError;
procedure AddError(e:string);
function HasError:boolean;
procedure ShowError;

procedure ShowErrorBox(msg:string);

function GetSingleSQLResult(const sql:string;default:Variant):Variant;
function GetSingleSQLRow(const sql:string):TVarArr;
procedure ExecSQLQuery(const sql:string);
function ADOQueryExecute(query:TADOQUery;sql:WideString):boolean;

function AskFilter:boolean;

procedure SetFilter(grid:TRzDBGrid;dataset:TCustomADODataSet;labl:TLabel = nil);
procedure RemoveFilter(dataset:TCustomADODataSet;labl:TLabel = nil);

procedure SetSort(grid:TRzDBGrid;dataset:TCustomADODataSet;asc:boolean = true;field:TField = nil);
procedure OpenChildForm(form:TForm;clas:TFormClass;var child:TForm);
procedure SaveEXCEL(dataset:TCustomADODataSet;filename:string;bookmarks:TBookmarkList = nil);

function VtoFloat(v:Variant):double;
function VtoFloatStr(v:Variant):string;

procedure GridSelectMarked(Sender: TObject;bm1:TBookmark;bm2:TBookmark);
function ShiftPressed:boolean;
function strreplace(replace:WideString;new:WideString;str:WideString):WideString;


function IsUserBoss:boolean;
function IsUserUser:boolean;
function IsUserAdmin:boolean;
function IsUserViewAll:boolean;
function IsUserPlane:boolean;


function IsUserTBUser:boolean;

function IsUserOOSUser:boolean;

function UserGetName:string;
function UserGetPost:string;
function UserGetCeh:integer;
function UserGetID:integer;

function UserGetNameById(id:integer):string;
function UserGetPostById(id:integer):string;


function max(a,b:integer):integer;

function round3(f:Variant):Variant;

function IIF(_flag:boolean;_true:Variant;_false:Variant):Variant;


function _i(i:integer):string;
function _s(s:string):string;


implementation

{$R *.dfm}


function _i(i:integer):string;
begin
  result := inttostr(i);
end;

function _s(s:string):string;
var
  i: integer;
begin
  result :='';
  for i := 1 to length(s) do
  if s[i]='''' then s := s + '''''' else s := s + s[i];
  
  result := ''''+result+'''';
end;

function round3(f:Variant):Variant;
var
  i: integer;
  r: real;
begin

  if VarIsFloat(f) or VarIsNumeric(f) then
  begin
    r := round(f*10000);
    r := r/10000;
    result := r;
  end else
    result := f;
end;

function TVarArr.FindName(name:string):integer;
var
  i : integer;
begin
  result := -1;
  for i := 0 to _count - 1 do
  if _names[i] = name then
  begin
    result := i;
    exit;
  end;  
end;

function TVarArr.GetVal(name:string):Variant;
var
  i : integer;
begin
  i :=  FindName(name);
  if i = -1 then
  result := null
  else
  result := _values[i];
end;

procedure TVarArr.SetVal(name:string;const val:Variant);
var
  i: integer;
begin
  i := FindName(name);
  if i = -1 then
  begin
    setlength(_names,_count+1);
    setlength(_values,_count+1);
    i := _count;
    inc(_count);
    _names[i] := name;
  end;

  _values[i] := val;
end;

function TVarArr.GetName(i:integer):string;
begin
  result := _names[i];
end;


function max(a,b:integer):integer;
begin
  if a>b  then result := a else result := b;
  
end;

function strreplace(replace:WideString;new:WideString;str:WideString):WideString;
var
  s: WideString;
  p: integer;
  l,i: integer;
begin
  s := str;
  l := length(replace);
  i := 0;
  while true and (i<100) do
  begin
    p := pos(replace,s);
    if p = 0 then break;
    delete(s,p,l);
    insert(new,s,p);
    inc(i);
  end;
  result := s;
end;

function my_floattostr(f:real):string;
var
  i: integer;
begin
  result := floattostr(f);
  for i := 1 to length(result) do
  if result[i]=',' then begin result[i] := '.'; break; end;
end;

function NZ(v:Variant;default:Variant):Variant;
begin
  if varisnull(v) then
    result := default
  else
    result := v;
end;

procedure ClearError;
begin
  errmsg.Clear;
end;

procedure AddError(e:string);
begin
  errmsg.Add(e);
end;

function HasError:boolean;
begin
  result := errmsg.Count>0;
end;

procedure ShowError;
var
  i:integer;
  s : string;
begin
  for i := 0 to errmsg.Count - 1 do
  begin
    s := s + errmsg[i];
    if errmsg.Count-1 <> i then
      s := s + #13#10;
  end;
  ShowErrorBox(s);
end;

procedure ShowErrorBox(msg:string);
begin
  MessageBox(Application.ActiveFormHandle,PWideChar(msg),MSG_ERROR_TITLE,MB_OK or MB_ICONERROR);
end;


function IsOpened(mainform:TForm;formclass:TClass):boolean;
var
  i:integer;
begin
  for I := 0 to mainform.MDIChildCount - 1 do
  if mainform.MDIChildren[i].ClassType = formclass then
  begin
    result := true;
    exit;
  end;
  result := false;
end;

function GetSingleSQLResult(const sql:string;default:Variant):Variant;
begin
  adoquery.SQL.Clear;
  adoquery.SQL.Add(sql);
  adoquery.Open;
  if adoquery.RecordCount=0 then
  begin
     result := default;
     exit;
  end;
  result := NZ(adoquery.Recordset.Fields[0].Value,default);
end;

function GetSingleSQLRow(const sql:string):TVarArr;
var
  i: integer;
begin
  result := TVarArr.Create;

  adoquery.SQL.Clear;
  adoquery.SQL.Add(sql);
  adoquery.Open;
  if adoquery.RecordCount=0 then
  begin
     exit;
  end;
  for i := 0 to adoquery.Recordset.Fields.Count - 1 do
  begin
    result.Values[adoquery.Recordset.Fields[i].Name] := adoquery.Recordset.Fields[i].Value;
  end;  
//  result := NZ(adoquery.Recordset.Fields[0].Value,default);
end;

procedure ExecSQLQuery(const sql:string);
begin
  adoquery.SQL.Clear;
  adoquery.SQL.Add(sql);
  adoquery.ExecSQL;
end;

procedure CallAction(form:TForm;action:string;Sender:TObject=nil);
var
  i: integer;
  l : TActionList;
begin
    if form = nil then exit;
    l := form.FindComponent('ChildActionList') as TActionList;
    i := HasAction(l,action);
    if i >=0 then
    begin
      if Sender <> nil then
      begin
        TControl(Sender).Enabled := false;
        Application.ProcessMessages;
      end;
      l.Actions[i].Execute;
      if Sender <> nil then
      begin
        TControl(Sender).Enabled := true;
      end;
    end;
end;

function HasAction(const l: TActionList;name:AnsiString): integer;
var
  i: integer;
begin
  result := -1;
  if l = nil then exit;
  for I := 0 to l.ActionCount - 1 do
  if l.Actions[i].Name = name then
  begin
    result := i;
    exit;
  end;
end;

procedure SetFilter(grid:TRzDBGrid;dataset:TCustomADODataSet;labl:TLabel = nil);
var
  s1,s2: string;
begin
  if (grid.SelectedField = nil) or (grid.SelectedField.FieldName = '') then
  begin

    MessageDlg(MSG_NO_FILTER_SELECTED,mtError,[mbOk],0);
    exit;
  end;

  if grid.SelectedField.FieldKind = fkCalculated then
  begin
    MessageDlg(MSG_CANT_FILTER_FIELD,mtError,[mbOk],0);
    exit;
  end;

  s1 := ' = ''' ;
  s2:='''';
  
  case grid.SelectedField.DataType of
    ftString,ftMemo: begin
      s1 := ' like ''%';
      s2 := '%''';
    end;
  end;

  dataset.Filter := '['+grid.SelectedField.FieldName+'] ' + s1+DataModule.CurrentFilter +s2;
  dataset.Filtered := true;
  
  if labl <> nil then
    labl.Caption := inttostr(dataset.Recordset.RecordCount);
end;

procedure RemoveFilter(dataset:TCustomADODataSet;labl:TLabel = nil);
begin
  dataset.Filtered := false;
  labl.Caption := inttostr(dataset.Recordset.RecordCount);
end;

procedure SetSort(grid:TRzDBGrid;dataset:TCustomADODataSet;asc:boolean = true;field:TField = nil);
var
  s: string;
  i: integer;
begin
  if field = nil then
    field := grid.SelectedField;
  if (field = nil) or (field.FieldName = '') then
  begin
    MessageDlg(MSG_NO_SORT_SELECTED,mtError,[mbOk],0);
    exit;
  end;

  if field.FieldKind = fkCalculated then
  begin
    MessageDlg(MSG_CANT_SORT_FIELD,mtError,[mbOk],0);
    exit;
  end;


  if asc then
  begin
    s := '['+grid.SelectedField.FieldName+'] ASC';
  end else
  begin
    s := '['+grid.SelectedField.FieldName+'] DESC';
  end;

  dataset.Sort :=  s;

  for I := 0 to grid.Columns.Count - 1 do
  if grid.Columns[i].FieldName = field.FieldName then
  begin
    if asc then
      grid.Columns[i].Title.Color := clMoneyGreen
    else
      grid.Columns[i].Title.Color := clMedGray;
  end else
  begin
    grid.Columns[i].Title.Color := clBtnFace;
  end;
end;


procedure OpenChildForm(form:TForm;clas:TFormClass;var child:TForm);
begin
  if not IsOpened(form,clas) then
  begin
    child := clas.Create(form);
  end;
  child.Show;
  child.WindowState := wsMaximized;
end;

procedure SaveEXCEL(dataset:TCustomADODataSet;filename:string;bookmarks:TBookmarkList = nil);
var
  xl,ws : Variant;
  rs : TADODataset;
  r: _Recordset;
  i,row,j : integer;
  b : boolean;

begin
  xl := CreateOleObject('Excel.Application');

  if varisnull(xl) then
  begin
    ShowErrorBox('Не могу создать Excel-документ!');
    exit;
  end;

  xl.Workbooks.Add;
  xl.DisplayAlerts := false;

  if (bookmarks<>nil) and (bookmarks.Count>0) then
  begin
    b := MessageBox(Application.ActiveFormHandle,
    'Сохранить весь документ (Да) или только выделенную часть (Нет)?',
    'Сохранение Excel-документа',MB_YESNO) = IDNO;
  end else
  begin
    b := false;
  end;

  try
    ws := xl.Workbooks[1].Worksheets[1];
    rs := TADODataset.Create(nil);
    rs.Clone(dataset);
    if b then
    begin
      for j := 0 to bookmarks.Count - 1 do
      begin
        rs.GotoBookmark(pointer(bookmarks[j]));
        r := rs.Recordset;
        for i := 0 to  r.Fields.Count-1 do
        begin
          ws.Cells[j+1,i+1] := r.Fields[i].Value;
        end;
      end;
    end else
    begin
      rs.Recordset.MoveFirst;
      row := 1;
      while not rs.Recordset.EOF do
      begin
        r := rs.Recordset;
        for i := 0 to  r.Fields.Count-1 do
        begin
          ws.Cells[row,i+1] := r.Fields[i].Value;
        end;
        inc(row);
        rs.Recordset.MoveNext;
      end;
    end;

    rs.Free;

    xl.Columns.AutoFit;
  except
    on e: Exception do begin end;
  end;

  if filename='' then
  begin
    xl.Visible:= true;
  end else
  begin
    xl.Workbooks[1].SaveAs(filename);
    xl.ActiveWorkbook.Close;
    xl.Quit;
  end;

end;

function VtoFloat(v:Variant):double;
var
  s: string;
begin
  if varisnull(v) then result:= 0
  else begin
    s := v;
    try
      result := strtofloat(s);
    except
      on e: Exception do
        result := 0;
    end;
  end;
  
end;

function VtoFloatStr(v:Variant):string;
var
  d: double;
  s: string;
  i : integer;
begin
  d := VtoFloat(v);
  s := floattostr(d);
  for i := 1 to length(s) do
  if s[i] = ',' then
  begin
    s[i] := '.';
  end;
  result := s;
end;

function AskFilter:boolean;
begin
  DataModule.CurrentFilter := InputBox('Применение фильтра','Введите фильтр','');
  result := DataModule.CurrentFilter <>'';
end;

procedure GridSelectMarked(Sender: TObject;bm1:TBookmark;bm2:TBookmark);
    var
      flag: integer;
      TempBM: TBookmark;
    begin
      with (Sender as TDBGRID).DataSource.Dataset do 
      begin
        if (BOF and EOF) then
          Exit;
        DisableControls;
        try
          try
            GotoBookmark(BM1);
            case (Sender as TDBGRID).DataSource.DataSet.CompareBookmarks(BM1, BM2) of
              -1: flag := -1;
              1: flag    := 1;
              0: flag    := 0;
            end;
            TempBM := (Sender as TDBGRID).DataSource.DataSet.GetBookmark;
            while (Sender as TDBGRID).DataSource.DataSet.CompareBookmarks(BM2, TempBM) <> 0 do
            begin
              (Sender as TDBGRID).SelectedRows.CurrentRowSelected := True;
              if flag = -1 then
                Next
              else
                Prior;
              TempBM := (Sender as TDBGRID).DataSource.DataSet.GetBookmark;
            end;
          finally
            FreeBookmark(tempbm);
          end;
        finally
          EnableControls;
        end;
      end;
    end;


function ShiftPressed:boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[VK_SHIFT] and 128) <> 0);
end;



procedure InitUserGroups;
var
  suser:string;
  q: TADOQuery;
  g:string;
begin
  UserGroups := TStringList.Create;
  User := GetSingleSQLResult('select user_name()','');
  
  suser := GetSingleSQLResult('select suser_sname()','');
  suser := lowercase(copy(suser,pos('\',suser)+1,100));
  UserAccount := suser;

  if suser='' then exit;

  q := TADOQuery.Create(nil);
  q.Connection := DataModule1.KMCConnection;

  q.SQL.Text := 'select * from get_user_groups('''+suser+''')';
  q.Active := true;

  while not q.EOF do
  begin
    g := nz(q.FieldByName('group').Value,'');
    if g <> '' then
      UserGroups.Add(LowerCase(g));
    q.Next;
  end;
  
  q.Free;

  _Debug_User := false;
  _Debug_Boss := false;
  _Debug := false;
end;


function IsUserBoss:boolean;
begin
  result := false;

  if _Debug then
  begin
    result := _Debug_Boss;
    exit;
  end;

 // if (user='dbo') then result := true;
  if UserGroups.IndexOf('pab_dept_boss')>=0 then result := true;
end;

function IsUserTBUser:boolean;
begin
  result := false;
  if (user='dbo') then result := true;
  if UserGroups.IndexOf('tb_user')>=0 then result := true;
end;

function IsUserOOSUser:boolean;
begin
  result := false;
  if (user='dbo') then result := true;
  if UserGroups.IndexOf('ws_user')>=0 then result := true;
end;

function IsUserAdmin:boolean;
begin
  result := false;
  if user='dbo' then result := true;
  if UserGroups.IndexOf('pab_admin')>=0 then result := true;
end;

function IsUserUser:boolean;
begin
  result := false;

  if _Debug then
  begin
    result := _Debug_user;
    exit;
  end;
  
 // if (user='dbo') then result := true;
  if UserGroups.IndexOf('pab_simple')>=0 then result := true;
end;

function IsUserViewAll:boolean;
begin
  result := false;
  if (user='dbo') then result := true;
  if UserGroups.IndexOf('pab_view_all')>=0 then result := true;
end;

function IsUserPlane:boolean;
begin
  result := false;
  if (user='dbo') then result := true;
  if UserGroups.IndexOf('pab_plane')>=0 then result := true;
end;

function UserGetName:string;
begin
  result := GetSingleSQLResult('select name from pab_users where sname='''+UserAccount+'''','');
end;

function UserGetNameById(id:integer):string;
begin
  result := GetSingleSQLResult('select name from pab_users where id='+inttostr(id),'');
end;

function UserGetPost:string;
begin
  result := GetSingleSQLResult('select post from pab_users where sname='''+UserAccount+'''','');
end;

function UserGetPostById(id:integer):string;
begin
  result := GetSingleSQLResult('select post from pab_users where id='+inttostr(id),'');
end;

function UserGetCeh:integer;
begin
  result := GetSingleSQLResult('select ceh from pab_users where sname='''+UserAccount+'''',-1);
end;

function UserGetID:integer;
begin
  result := GetSingleSQLResult('select id from pab_users where sname='''+UserAccount+'''',-1);
end;


function ADOQueryExecute(query:TADOQUery;sql:WideString):boolean;
begin
  query.Active := false;
  query.Filtered := false;
  query.SQL.Text := sql;
  try
    query.Active := true;
    result := true;
  except
    result := false;
  end;
end;

function IIF(_flag:boolean;_true:Variant;_false:Variant):Variant;
begin
  if _flag then
    result := _true
  else
    result := _false;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  errmsg := TStringList.Create;
  adoquery := TAdoQUery.Create(DataModule1);
  adoquery.Connection := DataModule1.KMCConnection;

  InitUserGroups;

  for i := 0 to 9 do
  begin
    queries[i] := TADOQuery.Create(Self);
    queries[i].Connection := KMCConnection;
  end;

  AQuery := queries[0];
  BQuery := queries[1];
  CQuery := queries[2];
  DQuery := queries[3];
  EQuery := queries[4];
  FQuery := queries[5];
  GQuery := queries[5];

end;

function TDataModule1.newQuery:TADOQuery;
begin
  result := TADOQuery.Create(nil);
  Result.Connection := KMCConnection;
  Result.CommandTimeout := 120;
end;

function TDataModule1.GetPropertyValue(const year,month:integer;const cname:string):string;
begin
  with newQuery do
  try
    SQL.Text := 'select dbo.ws_get_property_over_year('''+cname+''','+inttostr(year)+','+inttostr(month)+')';
    Open;
    result := Fields[0].AsString;
  finally
    Free;
  end;
end;


end.

