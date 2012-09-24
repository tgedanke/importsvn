unit fmOOSList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, RzPanel, DB, ADODB,
  DataModule, RzButton, StdCtrls, Mask, RzEdit, RzCmboBx;

type
  TFormOOSList = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    DBGridEh1: TDBGridEh;
    qryWaste: TADOQuery;
    dsWaste: TDataSource;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzPanel3: TRzPanel;
    RzButton3: TRzButton;
    FilterEdit: TRzEdit;
    ComboYear: TRzComboBox;
    ComboQuarter: TRzComboBox;
    procedure ComboQuarterChange(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FilterEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
  private
    { Private declarations }
    _year: word;
    _quarter: word;
  public
    { Public declarations }
  end;

var
  FormOOSList: TFormOOSList;

implementation
  uses fmOOSEdit;
{$R *.dfm}

procedure TFormOOSList.DBGridEh1DblClick(Sender: TObject);
begin
  if qryWaste.Eof or (nz(qryWaste.FieldByName('id').Value,0)=0) then exit;
  OOSEditOperation(qryWaste.FieldByName('id').Value);
end;

procedure TFormOOSList.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if nz(Column.Field.DataSet.FieldByName('has_operations').Value,0)=1 then
  begin
    Background := $00E0FFE0;
  end;
end;

procedure TFormOOSList.FilterEditChange(Sender: TObject);
begin
  if FilterEdit.Text<>'' then
  begin
    qryWaste.Filter := '(code like ''%'+FilterEdit.Text+'%'') or (name like ''%'+FilterEdit.Text+'%'')';
    qryWaste.Filtered := true;  
  end else
  begin
    qryWaste.Filtered := false;
  end;
end;

procedure TFormOOSList.FilterEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
  begin
    FilterEdit.Text := '';
    FilterEdit.OnChange(Sender);
  end;
end;

procedure TFormOOSList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormOOSList.FormCreate(Sender: TObject);
var
  y,m,d: word;
begin
  DecodeDate(Date,y,m,d);
  _year := y;
  _quarter := (m div 3)+1;
  if _quarter>4 then _quarter := 4;
  
  ComboYear.Value := inttostr(_year);
  ComboQuarter.Value := inttostr(_quarter);
  qryWaste.Active := false;
  qryWaste.Parameters.ParamValues['year'] := _year;
  qryWaste.Parameters.ParamValues['quarter'] := _quarter;
  qryWaste.Active := true;
end;

procedure TFormOOSList.RzButton2Click(Sender: TObject);
begin
  ExecSQLQuery('exec ws_add_waste_favorites '+inttostr(_year)+','+inttostr(_quarter));
  qryWaste.Requery();
end;

procedure TFormOOSList.RzButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOOSList.ComboQuarterChange(Sender: TObject);
begin
  _year := strtoint(ComboYear.Value);
  _quarter := strtoint(ComboQuarter.Value);

  qryWaste.Active := false;
  qryWaste.Parameters.ParamValues['year'] := _year;
  qryWaste.Parameters.ParamValues['quarter'] := _quarter;
  qryWaste.Active := true;
end;

end.
