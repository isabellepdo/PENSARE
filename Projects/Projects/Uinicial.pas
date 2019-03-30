unit Uinicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IniFiles;

type
  TFinicial = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
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
  Finicial: TFinicial;

   hostINI : string;
   DataBaseINI :string;
implementation

{$R *.dfm}

uses Uorganizacao, Ucontagem, Uorganizar, Urelatorios;

procedure TFinicial.BitBtn1Click(Sender: TObject);
begin
  Fcontagem.showmodal;
end;

procedure TFinicial.BitBtn2Click(Sender: TObject);
begin
   Forganizar.showmodal;
end;

procedure TFinicial.BitBtn3Click(Sender: TObject);
begin
  Forganizacao.ShowModal;
end;

procedure TFinicial.BitBtn4Click(Sender: TObject);
begin
  Frelatorios.showmodal;
end;

procedure TFinicial.FormActivate(Sender: TObject);
var
arqini : TIniFIle;
hostname : string;
database : string;
imgpath : string;
teste    : string;
linha : string;
multidb : string;
foto : TMemoryStream;
begin
   try
      if not FileExists(ExtractFilePath(Application.ExeName)+'Pensare.ini') then
        begin
          showmessage('Voc� precisa de um arquivo .ini associado a seu programa PENSARE');
        end
      else
        begin
           ArqINI :=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Pensare.ini');
           hostINI := ArqINI.ReadString('geral','hostname',hostINI);
           DataBaseINI := ArqINI.ReadString('geral','database',DataBaseINI);
        end;
   except on E: Exception do
      showmessage('ERRO AO LER O INI: ' + E.Message);
   end;

   try
      Forganizacao.dbgeral.disconnect;
      Forganizacao.DBGERAL.HostName := hostINI;
      Forganizacao.DBGERAL.Database := DataBaseINI;

      try
        if Forganizacao.DBGERAL.Connected then
          Forganizacao.dbgeral.disconnect;

          Forganizacao.DBGERAL.Connected;
      except

        On E:exception do
        begin
          Showmessage('ERRO AO CONECTAR O BANCO DE DADOS: '+ E.Message);
        end;
      end;
   except on E: Exception do
      Showmessage('ERRO AO CAPTAR DADOS PARA O BANCO DE DADOS: '+ E.Message);
   end;


end;

end.
