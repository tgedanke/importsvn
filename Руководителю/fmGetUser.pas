unit fmGetUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, RzPanel, RzButton, StdCtrls, RzLabel,
  Mask, RzEdit, DB, ADODB, DataModule;

type
  TFormGetUser = class(TForm)
    RzPanel1: TRzPanel;
    DBGridEh1: TDBGridEh;
    RzPanel2: TRzPanel;
    btnClose: TRzButton;
    FilterEdit: TRzEdit;
    RzLabel1: TRzLabel;
    qryUsers: TADOQuery;
    dsUsers: TDataSource;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id: integer;
  end;

var
  FormGetUser: TFormGetUser;

implementation

{$R *.dfm}

procedure TFormGetUser.btnCloseClick(Sender: TObject);
begin
  ModalResult := 2;
end;

procedure TFormGetUser.DBGridEh1DblClick(Sender: TObject);
begin
  if qryUsers.Eof or (nz(qryUsers.FieldByName('id').Value,0)=0) then
  begin
    ShowErrorBox('Пользователь не выбран!');
    exit;
  end;

  id := nz(qryUsers.FieldByName('id').Value,0);

  ModalResult := 1;
end;

procedure TFormGetUser.FilterEditChange(Sender: TObject);
begin
  if FilterEdit.Text<>'' then
  begin
    qryUsers.Filter := 'name like ''%'+FilterEdit.Text+'%''';
    qryUsers.Filtered := true;
  end else
    qryUsers.Filtered := false;
end;

end.
