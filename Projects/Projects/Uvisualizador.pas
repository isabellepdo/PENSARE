unit Uvisualizador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JPEg, Vcl.Imaging.pngimage;

type
  TFVisualizador = class(TForm)
    Image1: TImage;
    function CarregaFoto(foto: TStream): TPersistent;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVisualizador: TFVisualizador;

implementation

{$R *.dfm}

 function TFVisualizador.CarregaFoto(foto: TStream): TPersistent;
var
  png: TPngImage;
  jpg: TJpegImage;
  aux: string;
begin
  aux := 'JPG';
  try
    jpg := TJpegImage.Create;
    foto.Position := 0;
    jpg.LoadFromStream(foto);
    result := jpg;
    exit;
  except
    aux := 'PNG';
    try
      jpg.Free;
    except

    end;
  end;

  if aux <> 'JPG' then
  begin
    try
      png := TPngImage.Create;
      foto.Position := 0;
      png.LoadFromStream(foto);
      result := png;
      exit;
    except
      aux := 'ERROR';
      png.Free;

    end;
  end;

  result := nil;

end;

end.
