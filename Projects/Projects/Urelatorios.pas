unit Urelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, frxClass,
  frxDBSet, frxGradient;

type
  TFrelatorios = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    frxReport3: TfrxReport;
    frxGradientObject1: TfrxGradientObject;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frelatorios: TFrelatorios;

implementation

{$R *.dfm}

uses Uorganizacao;

procedure TFrelatorios.BitBtn1Click(Sender: TObject);
var
  dt : Tdate;
begin
  with forganizacao.queryaux do
    begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM asosciarkits, bolsista '+
        'WHERE nomebolsista = nome');
        open;

        dt := now;
        frxReport1.Variables.Variables['data'] := QuotedStr(datetostr(dt));
        frxReport1.PrepareReport(true);
        frxReport1.ShowPreparedReport;
    end;
end;

procedure TFrelatorios.BitBtn2Click(Sender: TObject);
var
  dt : Tdate;
begin
  with forganizacao.queryaux do
    begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM contagem');
        open;
        dt := now;
        frxReport2.Variables.Variables['data'] := QuotedStr(datetostr(dt));
        frxReport2.PrepareReport(true);
        frxReport2.ShowPreparedReport;
    end;
end;

procedure TFrelatorios.BitBtn3Click(Sender: TObject);
var
  dt : Tdate;
begin
  with forganizacao.queryaux do
    begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM organizacao ORDER BY idkit');
        open;

        dt := now;
        frxReport3.Variables.Variables['data'] := QuotedStr(datetostr(dt));
        frxReport3.PrepareReport(true);
        frxReport3.ShowPreparedReport;
    end;
end;

procedure TFrelatorios.BitBtn4Click(Sender: TObject);
begin
  showmessage('Em desenvolvimento');
end;

end.
