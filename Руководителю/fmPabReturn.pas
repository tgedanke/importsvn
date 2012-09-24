unit fmPabReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzEdit, RzButton;

type
  TFormPabReturn = class(TForm)
    RzMemo1: TRzMemo;
    RzPanel1: TRzPanel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function PabReturnGetText:string;
  procedure pabReturnSetText(text:string);
  
var
  FormPabReturn: TFormPabReturn;

implementation

{$R *.dfm}

function PabReturnGetText:string;
begin
  FormPabReturn := TFormPabReturn.Create(nil);
  FormPabReturn.RzMemo1.Text := '';
  if FormPabReturn.ShowModal=mrOK then
  begin
    result := FormPabReturn.RzMemo1.Text;
  end else
  begin
    result := '';
  end;
  FormPabReturn.Free;
end;

procedure pabReturnSetText(text:string);
begin
  FormPabReturn := TFormPabReturn.Create(nil);
  FormPabReturn.RzMemo1.Text := text;
  FormPabReturn.RzMemo1.ReadOnly := true;
  FormPabReturn.RzButton2.Visible := false;
  FormPabReturn.ShowModal;
  FormPabReturn.Free;
end;

procedure TFormPabReturn.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  ModalResult := mrCancel;
end;

procedure TFormPabReturn.RzButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormPabReturn.RzButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
