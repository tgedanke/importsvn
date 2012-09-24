unit fmSostoyanie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList, RzDBEdit;

type
  TFormSostoyanie = class(TForm)
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
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzDBMemo1: TRzDBMemo;
    RzDBMemo2: TRzDBMemo;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    Tableid: TAutoIncField;
    Tabletext: TStringField;
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
  FormSostoyanie: TFormSostoyanie;

implementation



{$R *.dfm}

procedure TFormSostoyanie.setCount;
begin
  labelCount.Caption := inttostr(Table.RecordCount);
end;

procedure TFormSostoyanie.SortAscExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,table,true);
end;

procedure TFormSostoyanie.SortDescExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,table,false);
end;

procedure TFormSostoyanie.TableAfterDelete(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormSostoyanie.TableAfterInsert(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormSostoyanie.TableAfterPost(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormSostoyanie.TableAfterRefresh(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormSostoyanie.ApplyFilterExecute(Sender: TObject);
begin
  DataModule.SetFilter(DBGrid,table,labelCount);
end;

procedure TFormSostoyanie.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSostoyanie.DBGridEnter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable;
end;

procedure TFormSostoyanie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormSostoyanie.FormShow(Sender: TObject);
begin
  setCount();
end;

procedure TFormSostoyanie.RefreshExecute(Sender: TObject);
begin
  Table.Requery();
end;

procedure TFormSostoyanie.RemoveFilterExecute(Sender: TObject);
begin
  DataModule.RemoveFilter(table,labelCount);
end;

end.
