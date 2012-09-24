unit fmPredpriatia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList;

type
  TFormPredpriatia = class(TForm)
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
    RzDBGrid1: TRzDBGrid;
    RzPanel2: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    dsPodrazdelenia: TDataSource;
    podrazdelenia: TADOTable;
    procedure RzDBGrid1Enter(Sender: TObject);
    procedure DBGridEnter(Sender: TObject);
    procedure SortDescExecute(Sender: TObject);
    procedure SortAscExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure RemoveFilterExecute(Sender: TObject);
    procedure ApplyFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure TableAfterPost(DataSet: TDataSet);
    procedure TableAfterRefresh(DataSet: TDataSet);
    procedure TableAfterDelete(DataSet: TDataSet);
    procedure TableAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setCount;
  end;

var
  FormPredpriatia: TFormPredpriatia;

implementation



{$R *.dfm}

procedure TFormPredpriatia.setCount;
begin
  labelCount.Caption := inttostr(Table.RecordCount);
end;

procedure TFormPredpriatia.SortAscExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,table,true);
end;

procedure TFormPredpriatia.SortDescExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,table,false);
end;

procedure TFormPredpriatia.TableAfterDelete(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormPredpriatia.TableAfterInsert(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormPredpriatia.TableAfterPost(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormPredpriatia.TableAfterRefresh(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormPredpriatia.ApplyFilterExecute(Sender: TObject);
begin
  DataModule.SetFilter(DBGrid,table,labelCount);
end;

procedure TFormPredpriatia.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPredpriatia.DBGridEnter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable;
end;

procedure TFormPredpriatia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPredpriatia.FormShow(Sender: TObject);
begin
  setCount();
end;

procedure TFormPredpriatia.RefreshExecute(Sender: TObject);
begin
  Table.Requery();
end;

procedure TFormPredpriatia.RemoveFilterExecute(Sender: TObject);
begin
  DataModule.RemoveFilter(table,labelCount);
end;

procedure TFormPredpriatia.RzDBGrid1Enter(Sender: TObject);
begin
  DBNavigator.DataSource := dsPodrazdelenia;
end;

end.
