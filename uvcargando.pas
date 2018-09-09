unit uvcargando;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls;

type

  { Tvcargando }

  Tvcargando = class(TForm)
    lblproceso: TLabel;
    barra: TProgressBar;
    lblestado: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vcargando: Tvcargando;

implementation

{$R *.lfm}

end.

