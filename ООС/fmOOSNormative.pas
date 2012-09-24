unit fmOOSNormative;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, GridsEh, DBGridEh, StdCtrls, RzLabel,
  DB, ADODB,DataModule;

type
  TFormOOSNormative = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzButton1: TRzButton;
    RzPanel3: TRzPanel;
    DBGridEh1: TDBGridEh;
    RzLabel1: TRzLabel;
    tblNormative: TADOTable;
    dsNormative: TDataSource;
    RzLabel2: TRzLabel;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    procedure dsNormativeStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButton4Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOOSNormative: TFormOOSNormative;

implementation

{$R *.dfm}

procedure TFormOOSNormative.dsNormativeStateChange(Sender: TObject);
begin
  if tblNormative.State in [dsInsert,dsEdit] then
  begin
    RzButton2.Enabled := false;
    RzButton3.Enabled := true;
    RzButton4.Enabled := true;
  end else
  begin
    RzButton2.Enabled := true;
    RzButton3.Enabled := false;
    RzButton4.Enabled := false;
  end;
end;

procedure TFormOOSNormative.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tblNormative.State in [dsInsert,dsEdit] then
  try
    tblNormative.Post;
  except
  end;
  
  Action := caFree;
end;

procedure TFormOOSNormative.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOOSNormative.RzButton2Click(Sender: TObject);
begin
  tblNormative.Insert;
end;

procedure TFormOOSNormative.RzButton3Click(Sender: TObject);
begin
  if tblNormative.State in [dsInsert,dsEdit] then
  tblNormative.Post;
end;

procedure TFormOOSNormative.RzButton4Click(Sender: TObject);
begin
  if tblNormative.State in [dsInsert,dsEdit] then
  tblNormative.Cancel;
end;

end.
