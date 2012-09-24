unit fmOOSWaste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, GridsEh, DBGridEh, ExtCtrls, RzPanel, DB, ADODB,
  DataModule, StdCtrls, Mask, RzEdit, RzLabel;

type
  TFormOOSWaste = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    DBGridEh1: TDBGridEh;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    tblCodes: TADOTable;
    dsCodes: TDataSource;
    RzLabel1: TRzLabel;
    RzEdit1: TRzEdit;
    procedure RzEdit1Change(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOOSWaste: TFormOOSWaste;

implementation

{$R *.dfm}

procedure TFormOOSWaste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormOOSWaste.RzButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOOSWaste.RzButton2Click(Sender: TObject);
begin
  tblCodes.Insert;
end;

procedure TFormOOSWaste.RzEdit1Change(Sender: TObject);
begin
  if RzEdit1.Text='' then
  begin
    tblCodes.Filtered := false;
    exit;
  end;

  tblCodes.Filter :=  ' name like ''%' + RzEdit1.Text+'%''';
  tblCodes.Filtered := true;

end;

end.

