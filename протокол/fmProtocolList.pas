unit fmProtocolList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, ADODB, DBCtrls, RzDBNav, RzButton,
  StdCtrls, RzLabel, ExtCtrls, RzPanel,DataModule, ActnList, Menus, RzCmboBx;

type
  TFormProtocolList = class(TForm)
    PanelBottom: TRzPanel;
    labelCaountlabel: TRzLabel;
    labelCount: TRzLabel;
    PanelBottomButtons: TRzPanel;
    ButtonSave: TRzButton;
    ButtonClose: TRzButton;
    DBNavigator: TRzDBNavigator;
    DBGrid: TRzDBGrid;
    dsQuery: TDataSource;
    ChildActionList: TActionList;
    ApplyFilter: TAction;
    RemoveFilter: TAction;
    Refresh: TAction;
    SortAsc: TAction;
    SortDesc: TAction;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    query: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ProtocolOpen: TAction;
    ProtocolNew: TAction;
    ProtocolDelete: TAction;
    queryid: TIntegerField;
    querynum: TStringField;
    queryodate: TDateTimeField;
    querycode: TStringField;
    querypredpriatie_id: TIntegerField;
    queryuchastok_id: TIntegerField;
    queryprof_id: TIntegerField;
    queryprof_comment: TStringField;
    querypost_id: TIntegerField;
    queryattestator_id: TIntegerField;
    querysootv1: TBooleanField;
    querysootv2: TBooleanField;
    querysootv3: TBooleanField;
    querysootv4: TBooleanField;
    queryuslovia_class: TIntegerField;
    queryuchastok: TStringField;
    listUchastok: TADOQuery;
    RzComboBox1: TRzComboBox;
    RzLabel1: TRzLabel;
    Rjgbhjdfnm1: TMenuItem;
    spCopyProtocol: TADOStoredProc;
    procedure Rjgbhjdfnm1Click(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
    procedure queryCalcFields(DataSet: TDataSet);
    procedure ProtocolDeleteExecute(Sender: TObject);
    procedure ProtocolNewExecute(Sender: TObject);
    procedure ProtocolOpenExecute(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure SortAscExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure RemoveFilterExecute(Sender: TObject);
    procedure ApplyFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setCount;
    procedure OnProtocolClose(sender:TForm);

    procedure CopyProtocol(id:integer);
  end;

var
  FormProtocolList: TFormProtocolList;

implementation

uses fmProtocolNew;

{$R *.dfm}

procedure TFormProtocolList.CopyProtocol(id:integer);
begin
  spCopyProtocol.Active := false;
  spCopyProtocol.Parameters.ParamValues['@id'] := id;
  try
    spCopyProtocol.Active := true;
  except

  end;
  query.Requery();
end;

procedure TFormProtocolList.setCount;
begin
  labelCount.Caption := inttostr(query.RecordCount);
end;

procedure TFormProtocolList.SortAscExecute(Sender: TObject);
begin
  DataModule.SetSort(DBGrid,query,true);
end;

procedure TFormProtocolList.ApplyFilterExecute(Sender: TObject);
begin
  DataModule.SetFilter(DBGrid,query,labelCount);
end;

procedure TFormProtocolList.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormProtocolList.DBGridDblClick(Sender: TObject);
begin
  ProtocolOpen.Execute;
end;

procedure TFormProtocolList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormProtocolList.FormShow(Sender: TObject);
begin
  setCount();
  RzComboBox1.Clear;
  if not listUchastok.Active then listUchastok.Active := true;
  listUchastok.First;
  RzComboBox1.AddItemValue('Все',inttostr(0));
  while not listUchastok.Eof do
  begin
    RzComboBox1.AddItemValue(listUchastok.FieldByName('name').Value,inttostr(Integer(listUchastok.FieldByName('id').Value)));
    listUchastok.Next();
  end;
  RzComboBox1.ItemIndex := 0;
end;

procedure TFormProtocolList.ProtocolDeleteExecute(Sender: TObject);
begin
  if (query.FieldByName('id')<>nil) and (MessageBox(Handle,'Удалить протокол?','Удаление',MB_YESNO or MB_ICONQUESTION) = IDYES) then
  begin
    ExecSQLQuery(
    'delete from tb_protocol '+
    'where id='+inttostr(query.FieldByName('id').Value)
    );
    query.Requery();
  end;

end;

procedure TFormProtocolList.ProtocolNewExecute(Sender: TObject);
begin
  OpenChildForm(TForm(Owner),TFormProtocolNew,TForm(FormProtocolNew));
  FormProtocolNew.OnProtocolClose := OnProtocolClose;
end;

procedure TFormProtocolList.ProtocolOpenExecute(Sender: TObject);
begin
  if query.FieldByName('id')<>nil then
  begin
    OpenChildForm(TForm(Owner),TFormProtocolNew,TForm(FormProtocolNew));
    FormProtocolNew.ProtocolEdit(query.FieldByName('id').Value);
    FormProtocolNew.OnProtocolClose := OnProtocolClose;
  end;
end;

procedure TFormProtocolList.queryCalcFields(DataSet: TDataSet);
var
  id,pid: integer;

begin
  if not listUchastok.Active then listUchastok.Active := true;
  
  id := DataSet.FieldByName('uchastok_id').Value;
  pid := DataSet.FieldByName('predpriatie_id').Value;
  DataSet.FieldByName('uchastok').Value := nz(listUchastok.Lookup('id',inttostr(id),'name'),'');
end;

procedure TFormProtocolList.RefreshExecute(Sender: TObject);
begin
  query.Requery();
end;

procedure TFormProtocolList.RemoveFilterExecute(Sender: TObject);
begin
  DataModule.RemoveFilter(query,labelCount);
end;

procedure TFormProtocolList.Rjgbhjdfnm1Click(Sender: TObject);
var
  id: integer;
begin
  if query.FieldByName('id')<>nil then
  begin
    id := query.FieldByName('id').Value;
    CopyProtocol(id);
    //asdasd
  end;
end;

procedure TFormProtocolList.RzComboBox1Change(Sender: TObject);
var
  id: integer;
begin
  id := strtoint(RzComboBox1.Value);
  if id= 0 then
  begin
    query.Filtered := false;
  end else
  begin
    query.Filter := 'uchastok_id='+inttostr(id);
    query.Filtered := true;
  end;
end;

procedure TFormProtocolList.OnProtocolClose(sender:TForm);
begin
  Refresh.Execute;
end;

end.
