unit fmProfPost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList, RzSplit;

type
  TFormProfPost = class(TForm)
    PanelBottom: TRzPanel;
    labelCaountlabel: TRzLabel;
    labelCount: TRzLabel;
    PanelBottomButtons: TRzPanel;
    ButtonSave: TRzButton;
    ButtonClose: TRzButton;
    DBNavigator: TRzDBNavigator;
    Table: TADOTable;
    dsTable: TDataSource;
    RzSplitter1: TRzSplitter;
    RzPanel2: TRzPanel;
    RzLabel1: TRzLabel;
    DBGrid: TRzDBGrid;
    TopPanel: TRzPanel;
    Table2: TADOTable;
    dsTable2: TDataSource;
    RzPanel1: TRzPanel;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    DBGrid2: TRzDBGrid;
    Tableid: TAutoIncField;
    Tablename: TStringField;
    Tablecode: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGridEnter(Sender: TObject);
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
  FormProfPost: TFormProfPost;

implementation



{$R *.dfm}

procedure TFormProfPost.setCount;
begin
  labelCount.Caption := inttostr(Table.RecordCount);
end;

procedure TFormProfPost.TableAfterDelete(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormProfPost.TableAfterInsert(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormProfPost.TableAfterPost(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormProfPost.TableAfterRefresh(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormProfPost.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormProfPost.DBGridEnter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable;
 // DBGrid.
end;

procedure TFormProfPost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormProfPost.FormCreate(Sender: TObject);
begin
  Table.Sort := 'name';
  Table2.Sort := 'name';
end;

procedure TFormProfPost.FormShow(Sender: TObject);
begin
  setCount();
end;

procedure TFormProfPost.DBGrid2Enter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable2;
end;

end.
