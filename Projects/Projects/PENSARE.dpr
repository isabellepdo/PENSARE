program PENSARE;

uses
  Vcl.Forms,
  Uinicial in 'Uinicial.pas' {Finicial},
  Ucontagem in 'Ucontagem.pas' {Fcontagem},
  Uorganizar in 'Uorganizar.pas' {Forganizar},
  Uorganizacao in 'Uorganizacao.pas' {Forganizacao},
  Urelatorios in 'Urelatorios.pas' {Frelatorios},
  Uassociar in 'Uassociar.pas' {Fassociar},
  Uvisualizador in 'Uvisualizador.pas' {FVisualizador},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cyan Dusk');
  Application.CreateForm(TFinicial, Finicial);
  Application.CreateForm(TFcontagem, Fcontagem);
  Application.CreateForm(TForganizar, Forganizar);
  Application.CreateForm(TForganizacao, Forganizacao);
  Application.CreateForm(TFrelatorios, Frelatorios);
  Application.CreateForm(TFassociar, Fassociar);
  Application.CreateForm(TFVisualizador, FVisualizador);
  Application.Run;
end.
