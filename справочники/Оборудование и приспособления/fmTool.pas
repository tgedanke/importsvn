unit fmTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList;

type
  TFormTool = class(TForm)
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
    Tableid: TIntegerField;
    Tablename: TStringField;
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
  FormTool: TFormTool;

implementation



{$R *.dfm}

procedure TFormTool.setCount;
begin
  labelCount.Caption := inttostr(Table.RecordCount);
end;

procedure TFormTool.SortAscExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,table,true);
end;

procedure TFormTool.SortDescExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,table,false);
end;

procedure TFormTool.TableAfterDelete(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormTool.TableAfterInsert(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormTool.TableAfterPost(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormTool.TableAfterRefresh(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormTool.ApplyFilterExecute(Sender: TObject);
begin
  DataModule.SetFilter(DBGrid,table,labelCount);
end;

procedure TFormTool.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormTool.DBGridEnter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable;
end;

procedure TFormTool.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormTool.FormShow(Sender: TObject);
begin
  setCount();
  table.Sort := 'name ASC';
end;

procedure TFormTool.RefreshExecute(Sender: TObject);
begin
  Table.Requery();
end;

procedure TFormTool.RemoveFilterExecute(Sender: TObject);
begin
  DataModule.RemoveFilter(table,labelCount);
end;

end.
