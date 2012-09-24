unit fmOOSEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DataModule, RzDBLbl, StdCtrls, RzLabel, ExtCtrls, RzPanel, DB, ADODB,
  RzButton, GridsEh, DBGridEh, RzCmboBx;

type
  TFormOOSEdit = class(TForm)
    tblWaste: TADOTable;
    dsWaste: TDataSource;
    RzPanel2: TRzPanel;
    ScrollBox1: TScrollBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzDBLabel1: TRzDBLabel;
    RzLabel2: TRzLabel;
    RzDBLabel2: TRzDBLabel;
    RzPanel3: TRzPanel;
    RzButton1: TRzButton;
    RzPanel4: TRzPanel;
    GridOper: TDBGridEh;
    dsOper: TDataSource;
    qryOper: TADOQuery;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    RzPanel5: TRzPanel;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    qrySumm: TADOQuery;
    RzButton4: TRzButton;
    CehCombo: TRzComboBox;
    procedure CehComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure RzButton4Click(Sender: TObject);
    procedure qryOperRecordChangeComplete(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const RecordCount: Integer;
      const Error: Error; var EventStatus: TEventStatus);
    procedure RzButton3Click(Sender: TObject);
    procedure GridOperDblClick(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetID(id:integer);
  end;

var
  FormOOSEdit: TFormOOSEdit;

  procedure OOSEditOperation(id:integer);
implementation

uses fmMain,fmOOSAddOper;

{$R *.dfm}

procedure OOSEditOperation(id:integer);
begin
  OpenChildForm(FormMain,TFormOOSEdit,TForm(FormOOSEdit));
  if not FormOOSEdit.tblWaste.Locate('id',inttostr(id),[loPartialKey]) then
  begin
    FormOOSEdit.Free;
    raise Exception.Create('Отход не найден!');
  end;
  FormOOSEdit.SetID(id);
end;

procedure TFormOOSEdit.SetID(id:integer);
begin
///
  qryOper.Active := false;
  qryOper.Parameters.ParamValues['id'] := inttostr(id);
  qryOper.Active := true;

  qrySumm.Active := false;
  qrySumm.Parameters.ParamValues['id'] := inttostr(id);
  qrySumm.Parameters.ParamValues['year'] := nz(tblWaste.FieldByName('year').Value,0);
  qrySumm.Parameters.ParamValues['quarter'] := nz(tblWaste.FieldByName('quarter').Value,0);
  qrySumm.Active := true;
end;

procedure TFormOOSEdit.CehComboChange(Sender: TObject);
begin
  qrySumm.Active := false;
  qrySumm.Parameters.ParamValues['ceh']:= strtoint(CehCombo.Value);
  qrySumm.Active := true;
end;

procedure TFormOOSEdit.DBGridEh1GetCellParams(Sender: TObject;
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

procedure TFormOOSEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormOOSEdit.FormCreate(Sender: TObject);
begin
  ADOQueryExecute(queries[0],'select * from ws_get_ceh_list()');
  while not queries[0].eof do
  begin
    CehCombo.AddItemValue(queries[0].fieldbyname('name').Value,inttostr(queries[0].fieldbyname('id').Value));
    queries[0].Next;
  end;
  CehCombo.Value := '0';
end;

procedure TFormOOSEdit.GridOperDblClick(Sender: TObject);
begin
  if qryOper.IsEmpty or (nz(qryOper.FieldByName('id').Value,0)=0) then
  begin
    ShowErrorBox('Операция не выбрана !');
    exit;
  end;
  OOSEditOper(qryOper.FieldByName('id').Value);
  qryOper.Requery();
  qrySumm.Requery();
end;

procedure TFormOOSEdit.qryOperRecordChangeComplete(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const RecordCount: Integer; const Error: Error;
  var EventStatus: TEventStatus);
begin
      qrySumm.Requery();
end;

procedure TFormOOSEdit.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOOSEdit.RzButton2Click(Sender: TObject);
begin
  OOSAddOper(tblWaste.FieldByName('id').Value);
  qryOper.Requery();
  qrySumm.Requery();
end;

procedure TFormOOSEdit.RzButton3Click(Sender: TObject);
begin
  if qryOper.IsEmpty or (nz(qryOper.FieldByName('id').Value,0)=0) then
  begin
    ShowErrorBox('Операция не выбрана !');
    exit;
  end;

  if IDYES<>MessageBox(Handle,'Вы действительно хотите удалить операцию?','Подтверждение',MB_YESNO or MB_ICONQUESTION) then  exit;
  
  ExecSQLQuery('delete from ws_waste_operation where id='+inttostr(qryOper.FieldByName('id').Value));
  
  qryOper.Requery();
  qrySumm.Requery();
end;

procedure TFormOOSEdit.RzButton4Click(Sender: TObject);
begin
  qryOper.Requery();
  qrySumm.Requery();
end;

end.
