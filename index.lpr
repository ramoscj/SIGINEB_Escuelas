program index;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, vindex, uvprincipal, uvdatosplantel, uvnecesidades, uvcargando, uvppp,
  uvftp, uvcargarftp, uvconstancia, lazreportpdfexport
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Tuvindex, uvindex);
  Application.CreateForm(Tvcargando, vcargando);
  Application.CreateForm(Tvcargaftp, vcargaftp);
  Application.Run;
end.

