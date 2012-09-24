unit fmPabGraphic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, GridsEh, DBGridEh, StdCtrls, RzCmboBx,
  DataModule, DB, ADODB, RzLabel;

type
  TFormGraphic = class(TForm)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    RzPanel1: TRzPanel;
    DBGridEh1: TDBGridEh;
    YearCombo: TRzComboBox;
    MonthCombo: TRzComboBox;
    qryPlane: TADOQuery;
    dspab: TDataSource;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    qryCeh: TADOQuery;
    dsCeh: TDataSource;
    qryPlaneid: TAutoIncField;
    qryPlaneuid: TIntegerField;
    qryPlaneyear: TIntegerField;
    qryPlanemonth: TIntegerField;
    qryPlaneweek1: TIntegerField;
    qryPlaneweek2: TIntegerField;
    qryPlaneweek3: TIntegerField;
    qryPlaneweek4: TIntegerField;
    qryPlanefio: TStringField;
    qryPlaneweek1_text: TStringField;
    qryPlaneweek2_text: TStringField;
    qryPlaneweek3_text: TStringField;
    qryPlaneweek4_text: TStringField;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure RzButton3Click(Sender: TObject);
    procedure DBGridEh1Columns13EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure RzButton2Click(Sender: TObject);
    procedure qryPlaneBeforeClose(DataSet: TDataSet);
    procedure YearComboChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure UpdateGraphic;

    procedure DeleteUser(year:integer;month:integer;uid:integer);
    procedure DeleteUsers(year:integer;month:integer);
  end;

var
  FormGraphic: TFormGraphic;

implementation

{$R *.dfm}

uses fmPabGraphicAddUsers;

procedure TFormGraphic.UpdateGraphic;
begin
  qryPlane.Active := false;
  with qryPlane.Parameters do
  begin
    qryPlane.Parameters.ParamValues['year'] := YearCombo.Value;
    qryPlane.Parameters.ParamValues['month'] := MonthCombo.Value;
  end;
  qryPlane.Active := true;
end;

procedure TFormGraphic.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if Column.Field = nil then exit;
  with Column.Field.DataSet do
  begin
    if
      varisnull(FieldByName('week1').Value) and
      varisnull(FieldByName('week2').Value) and
      varisnull(FieldByName('week3').Value) and
      varisnull(FieldByName('week4').Value)
    then
      Background := $00CCFFFF;
  end;
end;

procedure TFormGraphic.DeleteUser(year:integer;month:integer;uid:integer);
begin
  ExecSQLQuery('delete from pab_plane where [year]='+_i(year)+' and [month]='+_i(month)+' and [uid]='+_i(uid));
  UpdateGraphic;
end;

procedure TFormGraphic.DeleteUsers(year:integer;month:integer);
begin
  ExecSQLQuery('delete from pab_plane where [year]='+_i(year)+' and [month]='+_i(month));
  UpdateGraphic;
end;

procedure TFormGraphic.YearComboChange(Sender: TObject);
begin
  UpdateGraphic;
end;

procedure TFormGraphic.DBGridEh1Columns13EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  Handled := true;
  DeleteUser(strtoint(YearCombo.Value),strtoint(MonthCombo.Value), qryPlane.FieldByName('uid').Value);
end;

procedure TFormGraphic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryPlane.State in [dsEdit] then
    qryPlane.Post;
  Action := caFree;
end;

procedure TFormGraphic.FormCreate(Sender: TObject);
var
  d,m,y: word;
  i: integer;
begin
  if  not IsUserPlane then
  begin
    DBGridEh1.ReadOnly := true;
    RzButton2.Visible := false;
    RzButton3.Visible := false;
    for I := 0 to DBGridEh1.Columns.Count - 1 do
    if DBGridEh1.Columns[i].FieldName = 'deleteBtn' then
    begin
      DBGridEh1.Columns[i].Visible := false;
    end;
      

  end;

  DecodeDate(Date(),y,m,d);
  YearCombo.Value := inttostr(y);
  MonthCombo.Value := inttostr(m);
  UpdateGraphic;
end;

procedure TFormGraphic.qryPlaneBeforeClose(DataSet: TDataSet);
begin
  if qryPlane.State in [dsEdit] then
    qryPlane.Post;
end;

procedure TFormGraphic.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormGraphic.RzButton2Click(Sender: TObject);
begin
  if ShowGraphicAddUsers(strtoint(YearCombo.Value),strtoint(MonthCombo.Value)) then
    qryPlane.Requery();
end;

procedure TFormGraphic.RzButton3Click(Sender: TObject);
begin
  DeleteUsers(strtoint(YearCombo.Value),strtoint(MonthCombo.Value));
end;

end.
