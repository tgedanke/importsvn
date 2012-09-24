unit fmOOSProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, GridsEh, DBGridEh, StdCtrls, RzLabel, RzButton, ExtCtrls,
  RzPanel,DataModule, fmOOSPropsAdd;

type
  TFormOOSProps = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzButton1: TRzButton;
    btnAdd: TRzButton;
    btnSave: TRzButton;
    btnCancel: TRzButton;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    DBGridEh1: TDBGridEh;
    tblProps: TADOTable;
    dsProps: TDataSource;
    btnDelete: TRzButton;
    procedure FormShow(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dsPropsStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOOSProps: TFormOOSProps;

implementation

{$R *.dfm}

procedure TFormOOSProps.btnAddClick(Sender: TObject);
var
  context: TOOSPropContext;
begin
  if OOSPropsGetAddInfo(context) then
  with DataModule1.newQuery do
  try
    SQL.Text :=
      'insert into ws_property_over_year([year],[month_from],[month_to],id_property,value)'+
      'values(:year,:month_from,:month_to,:id_property,:value)';

    Parameters.ParamValues['year'] := context.year;
    Parameters.ParamValues['month_from'] := context.month_from;
    Parameters.ParamValues['month_to'] := context.month_to;
    Parameters.ParamValues['id_property'] := context.id_property;
    Parameters.ParamValues['value'] := context.value;
    
    ExecSQL;

    tblProps.Requery();
  finally
    Free;
  end;
end;

procedure TFormOOSProps.btnCancelClick(Sender: TObject);
begin
  try
    tblProps.Cancel;
  except
  end;
end;

procedure TFormOOSProps.btnDeleteClick(Sender: TObject);
begin
  if tblProps.IsEmpty then
    raise Exception.Create('Выберите значение');

  if MessageBox(handle,'Вы действительно хотите удалить запись?','Удаление',
            MB_YESNO or MB_ICONQUESTION) <> IDYES then
    exit;
  
  with DataModule1.newQuery do
  try
    SQL.Text := 'delete from ws_property_over_year where [year]=:year and '+
                '[id_property]=:id and [month_from]=:mf and [month_to]=:mt';
    Parameters.ParamValues['year'] := tblProps.FieldByName('year').AsInteger;
    Parameters.ParamValues['mf'] := tblProps.FieldByName('month_from').AsInteger;
    Parameters.ParamValues['mt'] := tblProps.FieldByName('month_to').AsInteger;
    Parameters.ParamValues['id'] := tblProps.FieldByName('id_property').AsInteger;
    ExecSQL;
  finally
    Free;
  end;
  
  tblProps.Requery();
end;

procedure TFormOOSProps.btnSaveClick(Sender: TObject);
begin
  try
    tblProps.Post;
  except
  end;
end;

procedure TFormOOSProps.dsPropsStateChange(Sender: TObject);
begin
  if tblProps.State in [dsInsert,dsEdit] then
  begin
    btnSave.Enabled := true;
    btnCancel.Enabled := true;
    btnAdd.Enabled := false;
    btnDelete.Enabled := false;
  end else
  begin
    btnSave.Enabled := false;
    btnCancel.Enabled := false;
    btnAdd.Enabled := true;
    btnDelete.Enabled := true;
  end;
end;

procedure TFormOOSProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tblProps.State in [dsInsert,dsEdit] then
  try
    tblProps.Post;
  except
  end;
  
  Action := caFree;
end;

procedure TFormOOSProps.FormShow(Sender: TObject);
begin
  tblProps.Open;
end;

procedure TFormOOSProps.RzButton1Click(Sender: TObject);
begin
  Close;
end;

end.
