unit Uorganizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForganizacao = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    idkit: TLabeledEdit;
    BitBtn1: TBitBtn;
    tipokit: TLabeledEdit;
    tombo: TLabeledEdit;
    DBGERAL: TZConnection;
    querycontagem: TZQuery;
    dscontagem: TDataSource;
    queryaux: TZQuery;
    dsaux: TDataSource;
    querykits: TZQuery;
    dskits: TDataSource;
    GroupBox3: TGroupBox;
    edtnome: TLabeledEdit;
    edttelefone: TLabeledEdit;
    BitBtn2: TBitBtn;
    edtemail: TLabeledEdit;
    GroupBox4: TGroupBox;
    edtano: TLabeledEdit;
    BitBtn3: TBitBtn;
    edthorario: TLabeledEdit;
    edtescola: TLabeledEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure querycontagemAfterOpen(DataSet: TDataSet);
    procedure querykitsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Forganizacao: TForganizacao;

implementation

{$R *.dfm}

uses Uassociar, Ucontagem, Uorganizar;

procedure TForganizacao.BitBtn1Click(Sender: TObject);
var
  idkitt : string;
  peca : string;
begin
  with queryaux do
    begin
      close;
      sql.Clear;
      sql.Add('INSERT INTO kits (numero, tipo, tombo) '+
      'VALUES ("'+idkit.text+'", "'+tipokit.text+'", "'+tombo.Text+'")');
      execsql;

      close;
      sql.Clear;
      sql.Add('SELECT * FROM kits ORDER BY id desc');
      open;

      idkitt := fieldbyname('id').AsString;

      close;
      sql.Clear;
      sql.Add('SELECT * FROM contagem ');
      open;

      while not eof do
       begin
        peca := fieldbyname('nomedapeca').AsString;
         with querycontagem do
            begin
               close;
               sql.Clear;
               sql.Add('INSERT INTO organizacao (idkit, nomepeca) '+
               'VALUES ("'+idkitt+'", "'+peca+'")');
               execsql;
            end;

         next;
       end;
    end;

    showmessage('Kit cadastrado');
    idkit.Text := '';
    tipokit.Text := '';
    tombo.Text := '';
end;

procedure TForganizacao.BitBtn2Click(Sender: TObject);
begin
  with queryaux do
    begin
      close;
      sql.Clear;
      sql.Add('INSERT INTO bolsista (nome, email, telefone, horario, escola) '+
      'VALUES ("'+edtnome.text+'", "'+edtemail.text+'", "'+edttelefone.text+'", '+
      ' "'+edthorario.text+'", "'+edtescola.text+'")');
      execsql;

      showmessage('Inserido com sucesso');
      edtnome.Text := '';
      edtemail.Text := '';
      edttelefone.Text := '';
      edthorario.Text := '';
      edtescola.Text := '';
    end;
end;

procedure TForganizacao.BitBtn3Click(Sender: TObject);
begin
  Fassociar.showmodal;
end;

procedure TForganizacao.querycontagemAfterOpen(DataSet: TDataSet);
begin
  try
    Fcontagem.dbgrid1.Columns[0].Width := 250;
  except on E: Exception do
  end;
end;

procedure TForganizacao.querykitsAfterOpen(DataSet: TDataSet);
begin
  try
    Forganizar.dbgrid1.Columns[0].Width := 250;
  except on E: Exception do
  end;
end;

end.
