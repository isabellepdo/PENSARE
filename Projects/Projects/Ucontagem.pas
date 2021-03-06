unit Ucontagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  TFcontagem = class(TForm)
    GroupBox1: TGroupBox;
    nome: TLabeledEdit;
    qtd: TLabeledEdit;
    cor: TLabeledEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    ckanexo: TCheckBox;
    PictureDialog: TOpenPictureDialog;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure BitBtn1Click(Sender: TObject);
    function StringFoto(caminho: string): string;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcontagem: TFcontagem;

implementation

{$R *.dfm}

uses Uorganizacao, Uvisualizador;

procedure TFcontagem.BitBtn2Click(Sender: TObject);
begin
  with forganizacao.querycontagem do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM contagem WHERE nomedapeca like "%'+edit1.text+'%"');
      open;
    end;
end;

procedure TFcontagem.DBGrid1DblClick(Sender: TObject);
var
  foto, frente, verso, fotoassinatura: TMemoryStream;
begin
  with FVisualizador do
    begin
      foto := TMemoryStream.Create;
      (forganizacao.querycontagem.fieldbyname('imagem') as TBlobField).SaveToStream(foto);
      Image1.Picture := nil;
      Image1.Picture.Assign(CarregaFoto(foto));
      showmodal;
    end;
end;

function TFcontagem.StringFoto(caminho: string): string;
var
  ArqFoto: TFileStream;
  StrStream: TStringStream;
begin
  try
    ArqFoto := TFileStream.Create(caminho, fmOpenRead);
    StrStream := TStringStream.Create;
    StrStream.CopyFrom(ArqFoto, ArqFoto.Size);
    result := StrStream.DataString;
  finally
    ArqFoto.Free;
    StrStream.Free;
  end;
end;

procedure TFcontagem.BitBtn1Click(Sender: TObject);
var
  idimovel : string;
  png1: TPngImage;
  jpg1: TJpegImage;
  idkitt : string;
begin
  if ckanexo.Checked then
    begin
       if PictureDialog.Execute then
        begin
          if PictureDialog.FileName <> '' then
          begin
            with forganizacao.querycontagem do
              begin
                close;
                sql.clear;
                sql.Add('INSERT INTO contagem(nomedapeca, qtd, cor, imagem) '+
                'VALUES ("'+nome.text+'", "'+qtd.text+'", "'+cor.text+'", :anexo)');
                parambyname('anexo').asstring := StringFoto(PictureDialog.FileName);
                execsql;

              end;
          end
          else
          begin
            ShowMessage('Por Favor Selecione uma Imagem!');
            exit;
          end;
        end;
    end
  else
    begin
       with forganizacao.querycontagem do
          begin
            close;
            sql.clear;
            sql.Add('INSERT INTO contagem(nomedapeca, qtd, cor) '+
            'VALUES ("'+nome.text+'", "'+qtd.text+'", "'+cor.text+'")');
            execsql;

          end;
    end;


    //colocar nos kits ja cadastrados
    with forganizacao.queryaux do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT * FROM kits ');
        open;

        while not eof do
         begin
          idkitt := fieldbyname('numero').AsString;
           with forganizacao.querycontagem do
              begin
                 close;
                 sql.Clear;
                 sql.Add('INSERT INTO organizacao (idkit, nomepeca) '+
                 'VALUES ("'+idkitt+'", "'+nome.Text+'")');
                 execsql;
              end;

           next;
         end;
      end;

    ShowMessage('Pe�a Armazenada em Banco Com Sucesso!');
    nome.Text := '';
    qtd.Text := '';
    cor.text := '';
end;

end.
