unit fmPabGraphicAddUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, GridsEh, DBGridEh, DB, ADODB,
  DataModule, MemTableEh, StdCtrls, RzLabel, RzEdit;

type
  TFormGraphicAddUsers = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    RzPanel1: TRzPanel;
    RzButton2: TRzButton;
    DBGridEh1: TDBGridEh;
    dsUsers: TDataSource;
    tblUsers: TMemTableEh;
    tblUsersid: TIntegerField;
    tblUsersname: TStringField;
    tblUsersselected: TBooleanField;
    RzLabel1: TRzLabel;
    procedure RzButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //year: integer;
    //month: integer;

    procedure AddUser(uid: integer);
  end;


  function ShowGraphicAddUsers(year,month:integer):boolean;

implementation

{$R *.dfm}

var
  year,month: integer;

function ShowGraphicAddUsers(year,month:integer):boolean;
var
  f: TFormGraphicAddUsers;
begin
  fmPabGraphicAddUsers.year := year;
  fmPabGraphicAddUsers.month := month;

  f := TFormGraphicAddUsers.Create(nil);

  result := mrOK = f.ShowModal;
  f.Free;
end;

procedure TFormGraphicAddUsers.AddUser(uid: integer);
var
  n: integer;
  sql: string;
begin
  n := GetSingleSQLResult('select count(*) from pab_plane where [year]='+_i(year)+' and [month]='+_i(month)+' and uid='+_i(uid),0);

  if n>0 then exit;

  sql := 'insert into pab_plane(year,month,uid) values('+_i(year)+','+_i(month)+','+_i(uid)+')';
  ExecSQLQuery(sql);
end;

procedure TFormGraphicAddUsers.FormCreate(Sender: TObject);
var
  q: TADOQuery;
begin
  q := TADOQuery.Create(nil);
  q.Connection := DataModule1.KMCConnection;
  q.SQL.Text := 'select id,name,show_in_graphic,isnull((select count(*) from pab_plane where pab_plane.uid=pab_users.id and [year]='+
  _i(year)+' and [month]='+_i(month)+'),0) as [e]  from pab_users where fixed=1 order by name';

  try
    q.Open;
    with q do
    while not eof do
    begin
      tblUsers.Insert;
      tblUsers.FieldByName('id').Value := FieldByName('id').Value;
      tblUsers.FieldByName('name').Value := FieldByName('name').Value;
      if FieldByName('e').Value<>0 then
        tblUsers.FieldByName('selected').Value := 0
      else
        tblUsers.FieldByName('selected').Value := FieldByName('show_in_graphic').Value;
      next;
    end;

    if not q.IsEmpty then
    begin
      tblUsers.Post;
    end;
  except

  end;
  q.Free;
end;

procedure TFormGraphicAddUsers.RzButton2Click(Sender: TObject);
begin
  if tblUsers.State = dsEdit then  tblUsers.Post;
  dsUsers.DataSet := nil;
  tblUsers.First;
  with  tblUsers do
  while not eof do
  begin
    if nz(FieldByName('selected').Value,0)<>0 then
    begin
      AddUser(FieldByName('id').Value);
    end;
    Next;
  end;
end;

end.
