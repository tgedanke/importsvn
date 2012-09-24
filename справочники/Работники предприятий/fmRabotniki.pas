unit fmRabotniki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList, RzDBCmbo, RzCmboBx;

type
  TFormRabotniki = class(TForm)
    PanelBottom: TRzPanel;
    labelCaountlabel: TRzLabel;
    labelCount: TRzLabel;
    PanelBottomButtons: TRzPanel;
    ButtonSave: TRzButton;
    ButtonClose: TRzButton;
    DBNavigator: TRzDBNavigator;
    Table: TADOTable;
    DBGrid: TRzDBGrid;
    dsTable: TDataSource;
    ChildActionList: TActionList;
    ApplyFilter: TAction;
    RemoveFilter: TAction;
    Refresh: TAction;
    SortAsc: TAction;
    SortDesc: TAction;
    RzPanel1: TRzPanel;
    predpriatia: TADOQuery;
    dsPredpriatia: TDataSource;
    Tablepredpriatie_id: TIntegerField;
    Tablepost_id: TIntegerField;
    Tableprof_id: TIntegerField;
    Tablename: TStringField;
    dolgnost: TADOQuery;
    dsDolgnost: TDataSource;
    dsProfession: TDataSource;
    profession: TADOQuery;
    TableField: TStringField;
    TableField2: TStringField;
    PredpriatieList: TRzDBLookupComboBox;
    procedure dsPredpriatiaDataChange(Sender: TObject; Field: TField);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RefreshExecute(Sender: TObject);
    procedure RemoveFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setCount;
  end;

var
  FormRabotniki: TFormRabotniki;

implementation



{$R *.dfm}

procedure TFormRabotniki.setCount;
begin
  labelCount.Caption := inttostr(Table.RecordCount);
end;

procedure TFormRabotniki.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRabotniki.dsPredpriatiaDataChange(Sender: TObject;
  Field: TField);
begin
  setCount();
end;

procedure TFormRabotniki.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormRabotniki.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    if PredpriatieList.Focused then
  begin
      predpriatia.Next;
      handled := true;
      PredpriatieList.KeyValue := predpriatia.FieldByName('id').value;
  end;
end;

procedure TFormRabotniki.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

  if PredpriatieList.Focused then
  begin
      predpriatia.Prior;
      handled := true;
      PredpriatieList.KeyValue := predpriatia.FieldByName('id').value;
  end;

end;

procedure TFormRabotniki.FormShow(Sender: TObject);
begin
  PredpriatieList.KeyValue := predpriatia.FieldByName('id').value;
  setCount();
end;

procedure TFormRabotniki.RefreshExecute(Sender: TObject);
begin
  Table.Requery();
end;

procedure TFormRabotniki.RemoveFilterExecute(Sender: TObject);
begin
  DataModule.RemoveFilter(table,labelCount);
end;

end.
