unit vindex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, Forms, Controls, Graphics, Dialogs,
  Buttons, ExtCtrls, ComCtrls, StdCtrls, uvprincipal, uvdatosplantel,
  uvnecesidades, uvppp, uvftp, Zipper, uvcargando, uvconstancia;

type

  { Tuvindex }

  Tuvindex = class(TForm)
    btnpersonal: TBitBtn;
    btnplante: TBitBtn;
    btnnec: TBitBtn;
    btnplanes: TBitBtn;
    btnreporte: TBitBtn;
    btncrearreport: TBitBtn;
    contancia: TfrReport;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    imgmenu: TImageList;
    lblfecha: TLabel;
    lblhora: TLabel;
    lblhora1: TLabel;
    lblhora2: TLabel;
    menucabecera: TToolBar;
    Panel1: TPanel;
    reloj: TTimer;
    VentanaGuardar: TSaveDialog;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton16: TToolButton;
    ToolButton18: TToolButton;
    ToolButton2: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton24: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton3: TToolButton;
    ToolButton31: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure btncrearreportClick(Sender: TObject);
    procedure btnpersonalClick(Sender: TObject);
    procedure btnplanteClick(Sender: TObject);
    procedure btnnecClick(Sender: TObject);
    procedure btnplanesClick(Sender: TObject);
    procedure btnreporteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure relojTimer(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure generarconstancia();
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  uvindex: Tuvindex;
  vprincipal: Tvprincipal;
  vdatosplantel: Tvdatosplantel;
  vnecesidades: Tvnecesidades;
  vppp: Tvppp;
  vftp: Tvftp;
  vconstancia:Tvconstancia;


implementation

{$R *.lfm}

{ Tuvindex }

procedure Tuvindex.btnpersonalClick(Sender: TObject);
begin
  vprincipal:=Tvprincipal.Create(self);
  vprincipal.ShowModal;
end;

procedure Tuvindex.btncrearreportClick(Sender: TObject);
var
 OurZipper: TZipper;
begin

  MessageDlg('Para generar el arcivo recuerde colocar el nombre del Plantel seguidamente del municipio al que pertenece, para facilitar la busqueda de sus datos.                        Ejemplo "E.B.B. JUAN ESCALONA-BARINAS"',mtInformation,[mbOK],0);
  vconstancia:=Tvconstancia.Create(Self);
  vconstancia.ShowModal;

end;

procedure Tuvindex.btnplanteClick(Sender: TObject);
begin
  vdatosplantel:=Tvdatosplantel.Create(self);
  vdatosplantel.ShowModal;
end;

procedure Tuvindex.btnnecClick(Sender: TObject);
begin
  vnecesidades:=Tvnecesidades.Create(self);
  vnecesidades.ShowModal;
end;

procedure Tuvindex.btnplanesClick(Sender: TObject);
begin
   vppp:=Tvppp.Create(self);
   vppp.ShowModal;
end;

procedure Tuvindex.btnreporteClick(Sender: TObject);
begin
  vftp:=Tvftp.Create(self);
  vftp.ShowModal;
end;


procedure Tuvindex.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea salir de la Aplicación?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;

procedure Tuvindex.FormCreate(Sender: TObject);
var
 fecha:String;
begin
 lblfecha.Caption:=DateToStr(now);
end;

procedure Tuvindex.relojTimer(Sender: TObject);
begin
  lblhora.Caption:=FormatDateTime('h:mm:ss',Now);
end;


procedure Tuvindex.ToolButton24Click(Sender: TObject);
begin
   uvindex.Close;
end;

procedure Tuvindex.generarconstancia();
var
 existe:array [0..9999] of String;
begin

  //PLANTEL
  if FileExists('save/plantel/datos_plantel.xml') then
    begin
      existe[0]:='X';
    end;
  if FileExists('save/plantel/matricula_plantel.xml') then
    begin
      existe[1]:='X';
    end;
  if FileExists('save/plantel/plantel_ppp.xml') then
    begin
      existe[2]:='X';
    end;
  //NOMINA
  if FileExists('save/nomina/doc_1.xml') then
    begin
      existe[3]:='X';
    end;
  if FileExists('save/nomina/adm_obr_1.xml') then
    begin
      existe[4]:='X';
    end;
  if FileExists('save/nomina/doc_2.xml') then
    begin
      existe[5]:='X';
    end;
  if FileExists('save/nomina/adm_obr_2.xml') then
    begin
      existe[6]:='X';
    end;
  //NECESIDADES
  if FileExists('save/necesidades/nece_infra.xml') then
    begin
      existe[7]:='X';
    end;
  if FileExists('save/necesidades/nece_material.xml') then
    begin
      existe[8]:='X';
    end;
  if FileExists('save/necesidades/nece_personal.xml') then
    begin
      existe[9]:='X';
    end

end;

end.

