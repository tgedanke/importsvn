unit fmPabUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, RzDBNav, RzButton, StdCtrls, RzLabel, ExtCtrls, RzPanel,
  RzTabs, GridsEh, DBGridEh, RzSplit,DataModule, DB, ADODB, RzPrgres, Mask,
  RzEdit;

type
  TFormPabUsers = class(TForm)
    PanelBottom: TRzPanel;
    PanelBottomButtons: TRzPanel;
    ButtonClose: TRzButton;
    pabPages: TRzPageControl;
    pageUsers: TRzTabSheet;
    pageCeh: TRzTabSheet;
    RzSplitter1: TRzSplitter;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    GridUchastok: TDBGridEh;
    GridCeh: TDBGridEh;
    tblCeh: TADOTable;
    tblUch: TADOTable;
    dsCeh: TDataSource;
    dsUch: TDataSource;
    RzPanel3: TRzPanel;
    RzDBNavigator1: TRzDBNavigator;
    RzPanel4: TRzPanel;
    RzDBNavigator2: TRzDBNavigator;
    RzButton1: TRzButton;
    RzPanel5: TRzPanel;
    GridUsers: TDBGridEh;
    tblUsers: TADOTable;
    dsUsers: TDataSource;
    RzDBNavigator3: TRzDBNavigator;
    RzButton2: TRzButton;
    ProgressPanel: TRzPanel;
    RzProgressBar1: TRzProgressBar;
    tblUsersid: TAutoIncField;
    tblUsersname: TStringField;
    tblUserssname: TStringField;
    tblUserspost: TStringField;
    tblUsersfixed: TBooleanField;
    tblUsersceh: TIntegerField;
    qryCeh: TADOQuery;
    DataSource1: TDataSource;
    tblUserscehnm: TStringField;
    UserFilter: TRzEdit;
    tblUsersname_short: TStringField;
    tblUsersshow_in_graphic: TBooleanField;
    procedure UserFilterChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPabUsers: TFormPabUsers;

implementation

{$R *.dfm}

procedure TFormPabUsers.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPabUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPabUsers.FormCreate(Sender: TObject);
begin
  tblUsers.Sort := 'fixed desc,name';
end;

procedure TFormPabUsers.RzButton1Click(Sender: TObject);
var
  q: TADOQuery;
  c: TADOConnection;
  sql : WideString;
  name:string;
begin

      sql :=
      'SELECT company,department,name '+
      'FROM ' +
      '''LDAP://ssmtm.severstalgroup.com'' where objectcategory=''person'' ' +
      'and ' +
      'objectclass=''User'' and ' +
      'userAccountControl=512';

  c := TADOConnection.Create(nil);
  c.Provider := 'ADsDSOObject';
  c.LoginPrompt := false;
  c.Connected := true;
  q := TADOQuery.Create(nil);
  q.Connection := c;
  q.SQL.Text := sql;

  try
    q.Active := true;
  except
    ShowMessage('Ошибка при выполнении запроса!');
  end;


  while not q.EOF do
  begin
    name := nz(q.FieldByName('department').Value,'');
    if name <> '' then
    
    try
      ExecSQLQuery('insert into pab_ceh(name) values('''+name+''')');
    except
    end;
    q.Next;
  end;
  
  q.Free;
  c.Free;

  tblCeh.Requery();
end;

procedure TFormPabUsers.RzButton2Click(Sender: TObject);
var
  q: TADOQuery;
  c: TADOConnection;
  sql : WideString;
  name,sname:string;
begin
  if MessageBox(Handle,'Пользователи без пометки "Не синхронизировать" будут загружены заново. Хотите продолжить?','Синхронизация',MB_YESNO or MB_ICONQUESTION) <> IDYES then
    exit;

  sql :=
      'SELECT sAMAccountName,name '+
      'FROM ' +
      '''LDAP://ssmtm.severstalgroup.com'' where objectcategory=''person'' ' +
      'and ' +
      'objectclass=''User'' and ' +
      'userAccountControl=512';

  c := TADOConnection.Create(nil);
  c.Provider := 'ADsDSOObject';
  c.LoginPrompt := false;
  c.Connected := true;
  q := TADOQuery.Create(nil);
  q.Connection := c;
  q.SQL.Text := sql;

  progresspanel.Show;
  RzProgressBar1.Percent := 0;
  Application.ProcessMessages;
  
  try
    q.Active := true;
  except
    ShowMessage('Ошибка при выполнении запроса!');
    progresspanel.Hide;
    exit;
  end;

  ExecSQLQuery('delete from pab_users where fixed=0');

  RzProgressBar1.TotalParts := q.RecordCount;

  while not q.EOF do
  begin
    name := nz(q.FieldByName('name').Value,'');
    sname := nz(q.FieldByName('sAMAccountName').Value,'');
    if (name <> '') and (length(name)>10) then
    try
      ExecSQLQuery('insert into pab_users(name,sname,fixed) values('''+name+''','''+sname+''',0)');
    except
    end;
    RzProgressBar1.IncPartsByOne;
    q.Next;
  end;
  
  q.Free;
  c.Free;

  tblUsers.Requery();
  progresspanel.Hide;
end;

procedure TFormPabUsers.UserFilterChange(Sender: TObject);
begin
  if UserFilter.Text<>'' then
  begin
    tblUsers.Filter := 'name like ''%'+UserFilter.Text+'%''';
    tblUsers.Filtered := true;
  end else
  begin
    tblUsers.Filtered := false;
  end;
end;

end.
