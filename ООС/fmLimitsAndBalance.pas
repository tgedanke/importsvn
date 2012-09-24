unit fmLimitsAndBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, RzPanel, DB, ADODB,DataModule, RzButton,
  StdCtrls, Mask, RzEdit, RzCmboBx, RzLabel;

type
  TFormLimits = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    DBGridEh1: TDBGridEh;
    dsCOdes: TDataSource;
    qryCodes: TADOQuery;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    ComboYear: TRzComboBox;
    FilterEdit: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure qryCodesBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure ComboYearChange(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckCanChange;
  end;

var
  FormLimits: TFormLimits;

implementation

{$R *.dfm}


procedure TFormLimits.CheckCanChange;
var
  d,m,y: word;
  ys: word;
begin
  DecodeDate(Date,y,m,d);
  ys := strtoint(ComboYear.Value);

  if ys<y then
    raise Exception.Create('Вы не можете изменить лимиты и остатки за прошлый год!');

  if (ys=y) and (m>2) then
    raise Exception.Create('Вы не можете изменить эти данные. Обратитесь к администратору!');
end;

procedure TFormLimits.ComboYearChange(Sender: TObject);
begin
  qryCodes.Active := false;
  qryCodes.Parameters.ParamValues['year'] := strtoint(ComboYear.Value);
  qryCodes.Active := true;
end;

procedure TFormLimits.FilterEditChange(Sender: TObject);
begin
  if FilterEdit.Text<>'' then
  begin
    qryCodes.Filter := 'name like ''%'+FilterEdit.Text+'%''';
    qryCodes.Filtered := true;
  end else
  begin
    qryCodes.Filtered := false;
  end;
end;

procedure TFormLimits.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  try
    qryCodes.Post;
  except

  end;
end;

procedure TFormLimits.FormCreate(Sender: TObject);
var
  d,m,y: word;
begin
  DecodeDate(Date,y,m,d);
  ComboYear.Value := inttostr(y);
  qryCodes.Active := false;
  qryCodes.Parameters.ParamValues['year'] := strtoint(ComboYear.Value);
  qryCodes.Active := true;
end;

procedure TFormLimits.qryCodesBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('balance_o').Value := DataSet.FieldByName('balance').Value;
  ExecSQLQuery('exec ws_set_balance_year '+
        inttostr(DataSet.FieldByName('code_id').Value)+','+
        ComboYear.Value+','+
        my_floattostr(DataSet.FieldByName('balance').Value)
  );
end;

procedure TFormLimits.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormLimits.RzButton2Click(Sender: TObject);
begin
  ExecSQLQuery('exec ws_add_codes_year_favorites '+ComboYear.Value);
end;

procedure TFormLimits.RzButton3Click(Sender: TObject);
var
  y: word;
begin
  CheckCanChange;
  y := strtoint(ComboYear.Value);
  ExecSQLQuery('exec ws_calc_balance '+inttostr(y-1)+','+inttostr(y));
  qryCodes.Requery();
end;

procedure TFormLimits.RzButton4Click(Sender: TObject);
var
  y: word;
begin
  CheckCanChange;
  y := strtoint(ComboYear.Value);
  ExecSQLQuery('exec ws_copy_limits '+inttostr(y-1)+','+inttostr(y));
  qryCodes.Requery();
end;

end.
