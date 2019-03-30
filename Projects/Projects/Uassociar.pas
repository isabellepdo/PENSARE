unit Uassociar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFassociar = class(TForm)
    cbbx: TComboBox;
    cbbx2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fassociar: TFassociar;

implementation

{$R *.dfm}

uses Uorganizacao;

procedure TFassociar.BitBtn1Click(Sender: TObject);
begin
  with forganizacao.queryaux do
    begin
      close;
      sql.Clear;
      sql.Add('INSERT INTO asosciarkits (nomebolsista, idkit, ano) '+
      'VALUES ("'+cbbx.text+'", "'+cbbx2.text+'", "'+Forganizacao.edtano.text+'")');
      execsql;
    end;

    cbbx.Text := '';
    cbbx2.Text := '';
    showmessage('Cadastrado com sucesso!');
    fassociar.Close;
end;

procedure TFassociar.FormActivate(Sender: TObject);
begin
  with Forganizacao.queryaux do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM bolsista');
      open;

      while not eof do
        begin
          cbbx.Items.Add(fieldbyname('nome').asstring);
          next;
        end;

      close;
      sql.Clear;
      sql.Add('SELECT * FROM kits');
      open;

      while not eof do
        begin
          cbbx2.Items.Add(fieldbyname('numero').asstring);
          next;
        end;

    end;
end;

end.
