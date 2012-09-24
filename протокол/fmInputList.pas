unit fmInputList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, DB, ADODB, Grids, DBGrids, RzDBGrid,
  DataModule, DBCtrls, RzDBCmbo;

type
  TFormInputList = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzButton1: TRzButton;
    RzDBGrid1: TRzDBGrid;
    dsObor: TDataSource;
    tObor: TADOTable;
    RzButton2: TRzButton;
    RazdelList: TRzDBLookupComboBox;
    tRazdel: TADOTable;
    dsRazdel: TDataSource;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzDBGrid1DblClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    selected_id: TList;
    razdel_id: integer;
  end;

var
  FormInputList: TFormInputList;


function InputOborudovanie(var oid:TList;var rid:integer):boolean;

implementation

{$R *.dfm}

function InputOborudovanie(var oid:TList;var rid:integer):boolean;
var
  r: integer;
begin
    FormInputList := TFormInputList.Create(Application.MainForm);
    if FormInputList.ShowModal = mrOK then
    begin
      oid.Clear;
      oid.Assign(FormInputList.selected_id);
      rid := FormInputList.razdel_id;
      result := true;
      FormInputList.Free;
      exit;
    end;
    result := false;
    FormInputList.Free;
end;

procedure TFormInputList.FormCreate(Sender: TObject);
begin
  selected_id := TList.Create;
end;

procedure TFormInputList.FormDestroy(Sender: TObject);
begin
  selected_id.Free;
end;

procedure TFormInputList.FormShow(Sender: TObject);
begin
  tObor.Requery();
  selected_id.Clear;
end;

procedure TFormInputList.RzButton1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  hide;
end;

procedure TFormInputList.RzButton2Click(Sender: TObject);
var
  i,v: integer;
  bm: OleVariant;
begin
  if varisnull(RazdelList.KeyValue) then
  begin
    MessageBox(Handle,'Не указан раздел!','Ошибка',MB_OK or MB_ICONERROR);
    exit;
  end;

  razdel_id := strtoint(RazdelList.GetKeyValue);

  bm := tobor.Recordset.Bookmark;
  tobor.DisableControls;
  selected_id.Clear;
  
  for i:=0 to RzDBGrid1.SelectedRows.Count-1 do
  begin
    tobor.GotoBookmark(Pointer(RzDBGrid1.SelectedRows[i]));
    v := nz(tobor.FieldByName('id').Value,0);
    selected_id.Add(Pointer(v));
  end;
  tobor.Recordset.Bookmark := bm;
  tobor.EnableControls;
  ModalResult := mrOK;
  hide;
end;

procedure TFormInputList.RzDBGrid1DblClick(Sender: TObject);
var
  i: integer;
begin

  if varisnull(RazdelList.KeyValue) then
  begin
    MessageBox(Handle,'Не указан раздел!','Ошибка',MB_OK or MB_ICONERROR);
    exit;
  end;

  selected_id.Clear;
  
  razdel_id := strtoint(RazdelList.GetKeyValue);
  i:= nz(tObor.FieldByName('id').Value,0);
  if i<>0 then
    selected_id.Add(Pointer(i));
  ModalResult := mrOK;

  hide;
end;

end.
