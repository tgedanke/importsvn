unit fmOOSView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, Mask, RzEdit, RzCmboBx,
  RzDBCmbo, RzLabel,
  DataModule, DBCtrls, DB, ADODB, GridsEh, DBGridEh;

type
  TFormOOSView = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    FilterEdit: TRzEdit;
    QuarterCombo: TRzComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    dsCeh: TDataSource;
    qryCeh: TADOQuery;
    CehCombo: TRzDBLookupComboBox;
    qryWaste: TADOQuery;
    dsWaste: TDataSource;
    WasteCombo: TRzDBLookupComboBox;
    DBGridEh1: TDBGridEh;
    qrySumm: TADOQuery;
    dsSumm: TDataSource;
    YearCombo: TRzComboBox;
    RzLabel4: TRzLabel;
    RzButton2: TRzButton;
    BalanceInfo: TRzPanel;
    DBGridEh2: TDBGridEh;
    RzButton3: TRzButton;
    dsBalance: TDataSource;
    qryBalance: TADOQuery;
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
    _ceh_id : integer;
    _waste_id : integer;
    _quarter : integer;
  public
    { Public declarations }

    procedure UpdateData;
  end;

var
  FormOOSView: TFormOOSView;

implementation

{$R *.dfm}

procedure TFormOOSView.UpdateData;
begin
  _waste_id := WasteCombo.KeyValue;
  _ceh_id := CehCombo.KeyValue;
  _quarter := strtoint(QuarterCombo.Value);

  qrySumm.Active := false;
  with qrySumm.parameters do
  begin
    ParamValues['code_id'] := _waste_id;
    ParamValues['ceh'] := _ceh_id;
    ParamValues['quarter'] := _quarter;
    ParamValues['year'] := strtoint(YearCombo.Value);
  end;
  qrySumm.Active := true;
end;

procedure TFormOOSView.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
 case Column.Field.DataSet.FieldByName('id').Value of
  0: Background:= $00E0FFFF;
  10: background:= $00E0FFE0;
 else
  Background := $00FFFFFF;
 end;
end;

procedure TFormOOSView.FilterEditChange(Sender: TObject);

begin
  if FilterEdit.Text='' then
  begin
    qryWaste.Filtered := false;
    WasteCombo.KeyValue := 0;
    exit;
  end;
  qryWaste.Filtered := false;
  qryWaste.Filter := '(name like ''%'+FilterEdit.Text+'%'') or (id=0)';
  qryWaste.Filtered := true;
  if (qryWaste.RecordCount>1) and (not qryWaste.Eof) then
  begin
    qryWaste.Next;
    WasteCombo.KeyValue := qryWaste.FieldByName('id').Value;
  end else
  begin
    WasteCombo.KeyValue := 0;
  end;
end;

procedure TFormOOSView.FormCreate(Sender: TObject);
var
  y,m,d: word;
begin
  WasteCombo.KeyValue := 0;
  CehCombo.KeyValue := 0;

  DecodeDate(date,y,m,d);
  YearCombo.Value := IntToStr(y);

  UpdateData;
end;

procedure TFormOOSView.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOOSView.RzButton2Click(Sender: TObject);
begin
  UpdateData;
end;

procedure TFormOOSView.RzButton3Click(Sender: TObject);
var
  y: integer;
begin
  if BalanceInfo.Visible=True then
  begin
    BalanceInfo.Visible:= false;
    exit;
  end;
  
  y := strtoint(YearCombo.Value);
  qryBalance.Active := false;
  qryBalance.Parameters.ParamValues['year'] := y;
  qryBalance.Active := true;
  BalanceInfo.Height := 226;
  BalanceInfo.Top := 2;
  BalanceInfo.Visible := true;
end;

end.
