unit uvconstancia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, lr_e_pdf, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, Buttons, IdDayTime, Zipper;

type

  { Tvconstancia }

  Tvconstancia = class(TForm)
    btnconstancia: TBitBtn;
    btnreporte: TBitBtn;
    combodep: TComboBox;
    combomuni: TComboBox;
    editcodest: TEdit;
    editplantel: TEdit;
    frTNPDFExport1: TfrTNPDFExport;
    imgadm1: TImage;
    imgadm2: TImage;
    imgdatos: TImage;
    imgdoc1: TImage;
    imgdoc2: TImage;
    imginfra: TImage;
    imgmat: TImage;
    imgmatri: TImage;
    imgperso: TImage;
    imgppp: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    rpconstancia: TfrReport;
    Ventanapdf: TSaveDialog;
    VentanaGuardar: TSaveDialog;
    procedure btnconstanciaClick(Sender: TObject);
    procedure btnreporteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormShow(Sender: TObject);
    procedure rpconstanciaGetValue(const ParName: String; var ParValue: Variant
      );
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vconstancia: Tvconstancia;
  dia, mes, ano: Word;
  mes2:String;
  existe: array [0..9] of String;

implementation

{$R *.lfm}

{ Tvconstancia }



procedure Tvconstancia.FormShow(Sender: TObject);
begin

  //PLANTEL
  if FileExists('save/plantel/datos_plantel.xml') then
    begin
      imgdatos.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/plantel/matricula_plantel.xml') then
    begin
      imgmatri.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/plantel/plantel_ppp.xml') then
    begin
      imgppp.Picture.LoadFromFile('img/img1.png');
    end;

  //NOMINA
  if FileExists('save/nomina/doc_1.xml') then
    begin
      imgdoc1.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/nomina/doc_2.xml') then
    begin
      imgdoc2.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/nomina/adm_obr_1.xml') then
    begin
      imgadm1.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/nomina/adm_obr_2.xml') then
    begin
      imgadm2.Picture.LoadFromFile('img/img1.png');
    end;

  //NECESIDADES
  if FileExists('save/necesidades/nece_infra.xml') then
    begin
      imginfra.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/necesidades/nece_material.xml') then
    begin
      imgmat.Picture.LoadFromFile('img/img1.png');
    end;
  if FileExists('save/necesidades/nece_personal.xml') then
    begin
      imgperso.Picture.LoadFromFile('img/img1.png');
    end;
  btnreporte.SetFocus;
end;

procedure Tvconstancia.rpconstanciaGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName='plantel' then
    ParValue:=editplantel.Text;
  if ParName='cod_est' then
    ParValue:=editcodest.Text;
  if ParName='municipio' then
    ParValue:=combomuni.Text;
  if ParName='dependencia' then
    ParValue:=combodep.Text;
  if ParName='d1' then
    ParValue:=existe[0];
  if ParName='d2' then
    ParValue:=existe[1];
  if ParName='d3' then
    ParValue:=existe[2];
  if ParName='d4' then
    ParValue:=existe[3];
  if ParName='d5' then
    ParValue:=existe[4];
  if ParName='d6' then
    ParValue:=existe[5];
  if ParName='d7' then
    ParValue:=existe[6];
  if ParName='d8' then
    ParValue:=existe[7];
  if ParName='d9' then
    ParValue:=existe[8];
  if ParName='d10' then
    ParValue:=existe[9];
  //FECHA
  if ParName='dia' then
    ParValue:=dia;
  if ParName='mes' then
    ParValue:=mes2;
  if ParName='año' then
    ParValue:=ano;


end;

procedure Tvconstancia.btnreporteClick(Sender: TObject);
var
  OurZipper: TZipper;
  xml:array [0..9] of string;
  i:Integer;
begin

   //PLANTEL
  if FileExists('save/plantel/datos_plantel.xml') then
    begin
      xml[0]:='save/plantel/datos_plantel.xml';
    end;
  if FileExists('save/plantel/matricula_plantel.xml') then
    begin
      xml[1]:='save/plantel/matricula_plantel.xml';
    end;
  if FileExists('save/plantel/plantel_ppp.xml') then
    begin
      xml[2]:='save/plantel/plantel_ppp.xml';
    end;

  //NOMINA
  if FileExists('save/nomina/doc_1.xml') then
    begin
      xml[3]:='save/nomina/doc_1.xml';
    end;
  if FileExists('save/nomina/doc_2.xml') then
    begin
      xml[4]:='save/nomina/doc_2.xml';
    end;
  if FileExists('save/nomina/adm_obr_1.xml') then
    begin
      xml[5]:='save/nomina/adm_obr_1.xml';
    end;
  if FileExists('save/nomina/adm_obr_2.xml') then
    begin
      xml[6]:='save/nomina/adm_obr_2.xml';
    end;

  //NECESIDADES
  if FileExists('save/necesidades/nece_infra.xml') then
    begin
      xml[7]:='save/necesidades/nece_infra.xml';
    end;
  if FileExists('save/necesidades/nece_material.xml') then
    begin
      xml[8]:='save/necesidades/nece_material.xml';
    end;
  if FileExists('save/necesidades/nece_personal.xml') then
    begin
      xml[9]:='save/necesidades/nece_personal.xml';
    end;

  if VentanaGuardar.Execute then
  begin
     OurZipper := TZipper.Create;
     try
       OurZipper.FileName := VentanaGuardar.FileName;
       for i:=0 to 9 do
         begin
              if xml[i]<>'' then
                begin
                  OurZipper.Entries.AddFileEntry(xml[i]);
                  existe[i]:='X';
                end;
         OurZipper.ZipAllFiles;
         end;

       MessageDlg('Se ha Generado el Archivo', mtInformation,[mbOK],0);
     except
       MessageDlg('Error al Generar el Archivo', mtInformation,[mbOK],0);
     end;
  end;
 btnconstancia.Enabled:=true;
end;

procedure Tvconstancia.btnconstanciaClick(Sender: TObject);
var
  hoy: TDateTime;
begin
  hoy:=Now;
  DecodeDate(hoy, ano, mes, dia);
  case mes of
  1:mes2:='Enero';
  2:mes2:='Febrero';
  3:mes2:='Marzo';
  4:mes2:='Abril';
  5:mes2:='Mayo';
  6:mes2:='Junio';
  7:mes2:='Julio';
  8:mes2:='Agosto';
  9:mes2:='Septiembre';
  10:mes2:='Octubre';
  11:mes2:='Noviembre';
  12:mes2:='Diciembre';
  end;

  if (editplantel.Text<>'') and (editcodest.Text<>'') and (combomuni.Text<>'') and (combodep.Text<>'') then
    begin
      if Ventanapdf.Execute then
    begin
    rpconstancia.LoadFromFile('constancia/constancia_entrega.lrf');
      if rpconstancia.PrepareReport then
        begin
          rpconstancia.ExportTo(TfrTNPDFExportFilter,Ventanapdf.FileName);
          MessageDlg('Archivo guardado exitosamente',mtInformation,[mbOK],0);
        end
      else
          MessageDlg('Error al generar archivo',mtError,[mbOK],0);
      end;
    end
  else
    begin
      MessageDlg('Complete todos los campos *Plantel, *Cod estadistico, *Municipio, *Dependencia',mtWarning,[mbOK],0);
    end;

end;

procedure Tvconstancia.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea cerrar la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;

end.

