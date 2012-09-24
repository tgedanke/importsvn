unit fmDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList, RzSplit, RzDBEdit,
  Buttons;

type
  TFormDocs = class(TForm)
    PanelBottom: TRzPanel;
    labelCaountlabel: TRzLabel;
    labelCount: TRzLabel;
    PanelBottomButtons: TRzPanel;
    ButtonSave: TRzButton;
    ButtonClose: TRzButton;
    DBNavigator: TRzDBNavigator;
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
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzDBMemo1: TRzDBMemo;
    RzLabel3: TRzLabel;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    RzLabel4: TRzLabel;
    RzDBMemo2: TRzDBMemo;
    Table2id: TAutoIncField;
    Table2nsd_id: TIntegerField;
    Table2num: TStringField;
    Table2description: TMemoField;
    table: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure tableBeforePost(DataSet: TDataSet);
    procedure ADOQuery1NewRecord(DataSet: TDataSet);
    procedure dsTableDataChange(Sender: TObject; Field: TField);
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
  FormDocs: TFormDocs;

implementation



{$R *.dfm}

function replace(where,what:AnsiString):AnsiString;
var
  p,l: integer;
begin
  l := length(what);
  while true do
  begin
    p := pos(what,where);
    if p = 0 then break;
    where := copy(where,1,p-1)+copy(where,p+l,length(where));
  end;
  result := where;
end;

function makespaces(where:AnsiString):AnsiString;
var
  i: integer;
begin
  for I := 1 to length(where) do
  if (where[i]=#10) or (where[i]=#13) then
  begin
    where[i] := ' ';
  end;
  result := where;
end;

procedure TFormDocs.setCount;
begin
  if DBGrid.Focused then
    labelCount.Caption := inttostr(Table.RecordCount) else
    labelCount.Caption := inttostr(Table2.RecordCount)
end;

procedure TFormDocs.TableAfterDelete(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormDocs.TableAfterInsert(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormDocs.TableAfterPost(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormDocs.TableAfterRefresh(DataSet: TDataSet);
begin
  setCount();
end;

procedure TFormDocs.tableBeforePost(DataSet: TDataSet);
var
  s: WideString;
begin
    s := nz(DataSet.FieldByName('name').Value,'');
    s := trim(s);
    s := makespaces(s);
    DataSet.FieldByName('name').Value := s;
end;

procedure TFormDocs.ADOQuery1NewRecord(DataSet: TDataSet);
begin
  dataset.FieldByName('nsd_id').Value := table.FieldByName('id').Value;
end;

procedure TFormDocs.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormDocs.DBGridEnter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable;
  setCount();
end;

procedure TFormDocs.dsTableDataChange(Sender: TObject; Field: TField);
begin
  ADOQuery1.SQL.Text := 'select * from tb_nsd_punkt where nsd_id = ' +inttostr(Table.FieldByName('id').Value) + ' order by num asc';
  ADOQuery1.Active := true;
end;

procedure TFormDocs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormDocs.FormShow(Sender: TObject);
begin
  setCount();
end;

procedure TFormDocs.DBGrid2Enter(Sender: TObject);
begin
  DBNavigator.DataSource := dsTable2;
  setCount();
end;

end.
