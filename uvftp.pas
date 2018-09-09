unit uvftp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Buttons, ExtCtrls, IdFTP,IdFTPList ,  IdComponent, uvcargarftp;

type

  { Tvftp }

  Tvftp = class(TForm)
    btnarchivo: TBitBtn;
    btnbuscar: TBitBtn;
    btncargar: TBitBtn;
    btncnx: TBitBtn;
    btndesc: TBitBtn;
    combomuni: TComboBox;
    comboplantel: TComboBox;
    editarchivo: TEdit;
    editsearch: TEdit;
    IdFTP: TIdFTP;
    FTP: TIdFTP;
    FTPsearch: TIdFTP;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    pnldesc: TPanel;
    pnldesc1: TPanel;
    ToggleBox1: TToggleBox;
    VentanaGuardar: TSaveDialog;
    VentanaAbrir: TOpenDialog;
    procedure btnarchivoClick(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncargarClick(Sender: TObject);
    procedure btncnxClick(Sender: TObject);
    procedure btndescClick(Sender: TObject);
    procedure combomuniChange(Sender: TObject);
    procedure comboplantelChange(Sender: TObject);
    procedure editarchivoChange(Sender: TObject);
    procedure editsearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64
      );
    procedure FTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure FTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure ToggleBox1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vftp: Tvftp;
  aux,aux2:Int64;

implementation

{$R *.lfm}

{ Tvftp }

procedure Tvftp.btncnxClick(Sender: TObject);
begin

   TIdFTP.Create(nil);
   IdFTP.Username:='sistemazona@engineersworld.com.ve';
   IdFTP.Password:='5325106';
   IdFTP.Host:='ftp.engineersworld.com.ve';
  try
   IdFTP.Connect;
   Image1.Visible:=false;
   pnldesc1.Enabled:=true;
   btncnx.Enabled:=false;
   //IdFTP.Disconnect;
  except
    MessageDlg('Error al conectar con servidor',mtError,[mbOK],0);
    pnldesc1.Enabled:=false;
end;

end;

procedure Tvftp.btndescClick(Sender: TObject);
var
  F:File of byte;
  archivo:String;
begin

   FTP.Username:='sistemazona@engineersworld.com.ve';
   FTP.Password:='5325106';
   FTP.Host:='ftp.engineersworld.com.ve';
  try
   FTP.Connect;
   FTP.ChangeDir('/nominas');
   vcargaftp.barra.Max:=FTP.Size(ExtractFileName(editsearch.Text+'.xml')) div 1024;

  //buscar archivo en el directorio para remplazarlo
  if FileExists('save/nomina/doc1.xml') then
       begin
          beep;
          if MessageDlg('¿El Archivo ya Existe desea Remplazarlo?',mtConfirmation,[mbOK,mbCancel],0)=mrOK then
              begin
                 //descargar el achivo
                 DeleteFile('save/nomina/doc1.xml');
                 FTP.Get(ExtractFileName(editsearch.Text+'.xml'),'save/nomina/doc1.xml',false,false);
                 FTP.Disconnect;
              end
            else
              begin
                 FTP.Disconnect;
                 MessageDlg('Eror debe eliminar el archivo existente',mtWarning,[mbOK],0);
              end;
       end;
  if not FileExists('save/nomina/doc1.xml') then
      begin
        //descargar el achivo
        FTP.Get(ExtractFileName(editsearch.Text+'.xml'),'save/nomina/doc1.xml',false,false);
        FTP.Disconnect;
      end;

  except
    FTP.Disconnect;
    MessageDlg('Eror al conectar',mtError,[mbOK],0);
  end;


end;

procedure Tvftp.combomuniChange(Sender: TObject);
begin
  if (comboplantel.Text<>'') and (combomuni.Text<>'') then
    begin
      btnarchivo.Enabled:=true;
      btncargar.Enabled:=true;
    end
  else
      btnarchivo.Enabled:=false;
      btncargar.Enabled:=false;
end;

procedure Tvftp.comboplantelChange(Sender: TObject);
begin
  if (comboplantel.Text<>'') and (combomuni.Text<>'') then
    begin
      btnarchivo.Enabled:=true;
      btncargar.Enabled:=true;
    end
  else
      btnarchivo.Enabled:=false;
      btncargar.Enabled:=false;
end;

procedure Tvftp.btnarchivoClick(Sender: TObject);
begin
   if VentanaAbrir.Execute then
     begin
        editarchivo.Text:=VentanaAbrir.FileName;
     end
   else
       editarchivo.Text:='';
end;

procedure Tvftp.btnbuscarClick(Sender: TObject);
var
  i:Integer;
  MysList: TStringList;
  iLines, iPesoArchivo:Integer;
  sDir:String;
  existe:Boolean;
begin

   //desconectando la carga por si esta activa
   IdFTP.Disconnect;
   Image1.Visible:=true;
   btnarchivo.Enabled:=false;
   btncargar.Enabled:=false;
   btncnx.Enabled:=true;
   editarchivo.Text:='';
   btncnx.SetFocus;

   FTPsearch.Username:='sistemazona@engineersworld.com.ve';
   FTPsearch.Password:='5325106';
   FTPsearch.Host:='ftp.engineersworld.com.ve';
  try
   FTPsearch.Connect;
   FTPsearch.ChangeDir('/nominas');
  //Carga en una ListBox las Capetas y en Otra Los Archivos
  MysList := TStringList.Create;
  ListBox1.Items.Clear;
  ListBox2.Items.Clear;
  FTPsearch.List(MysList,'',False);
  For iLines := 0 to MysList.Count -1 do
    begin
      sDir:= MysList[iLines];
      iPesoArchivo := FTPsearch.Size(sDir);
      if iPesoArchivo = -1 then // Carpetas
           ListBox1.Items.Add(sDir)
      else ListBox2.Items.Add(sDir); //Archivos
    end;
   FTPsearch.Disconnect;

   //se busca el archivo
   existe:=false;
   for i:=0 to ListBox2.Count-1 do
     begin
       if ListBox2.Items[i]=editsearch.Text+'.xml' then
         begin
           existe:=true;
         end
     end;

   //respuesta si existe el archivo
   if existe=true then
     begin
        MessageDlg('Existe el archivo y esta listo para descargar',mtInformation,[mbOK],0);
        btndesc.Enabled:=True;
     end;
   if existe=false then
     begin
       MessageDlg('No existe el archivo',mtError,[mbOK],0);
       btndesc.Enabled:=false;
     end;

  except
    FTPsearch.Disconnect;
    MessageDlg('Error al conectar al servidor',mtError,[mbOK],0);
  end;



end;

procedure Tvftp.btncargarClick(Sender: TObject);
var
    F: File of byte;
begin
  //directorio donde se guardara
  IdFTP.ChangeDir('/planteles/'+combomuni.Text+'/'+comboplantel.Text);

  //calculando peso del archivo
  AssignFile(F,editarchivo.Text);
  Reset( F );
  aux:= FileSize( F ) div 1024;
  CloseFile( F );
  //cargando archivo
  try
  IdFTP.Put(editarchivo.Text,ExtractFileName(editarchivo.Text), False);
  //desconexion
  IdFTP.Disconnect;
  Image1.Visible:=true;
  combomuni.ItemIndex:=0;
  comboplantel.ItemIndex:=0;
  btncnx.Enabled:=true;
  editarchivo.Text:='';
  btncnx.SetFocus;
  pnldesc1.Enabled:=false;
  except
    IdFTP.Disconnect;
    MessageDlg('Error al cargar archivo',mtError,[mbOK],0);
  end;

end;


procedure Tvftp.editarchivoChange(Sender: TObject);
begin

  if editarchivo.Text='' then
    begin
       btncargar.Enabled:=false;
    end;
  if editarchivo.Text<>'' then
    begin
       btncargar.Enabled:=true;
    end;

end;

procedure Tvftp.editsearchChange(Sender: TObject);
begin
 btndesc.Enabled:=false;
end;

procedure Tvftp.FormActivate(Sender: TObject);
begin

end;

procedure Tvftp.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  IdFTP.Disconnect;
  FTP.Disconnect;
  FTPsearch.Disconnect;
end;

procedure Tvftp.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea salir de la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;


//TRABAJO DE DESCARGA FTP
procedure Tvftp.FTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
    progreso:Integer;
begin

  vcargaftp.Update;
  progreso:=AWorkCount;
  vcargaftp.lblprogres2.Caption:=FormatFloat(',0',progreso)+' Kbyte';
  vcargaftp.lblprogres2.Update;
  vcargaftp.barra.Position:=AWorkCount div 1024;
  vcargaftp.barra.Update;

end;

procedure Tvftp.FTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
var
    peso:Integer;
begin
  vcargaftp.barra.Position:=0;
  peso:=vcargaftp.barra.Max;
  vcargaftp.lblestado.Caption:='Se Descargan los Datos...';
  vcargaftp.lblpeso.Caption:=FormatFloat(',0',peso)+ ' Kbyte';
  vcargaftp.Show;
  vcargaftp.Update;

end;

procedure Tvftp.FTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin

   MessageDlg('Descarga Realiazada Satisfactoriamente',mtInformation,[mbOK],0);
   vcargaftp.Close;

end;

//TRABAJO DE CARGA FTP
procedure Tvftp.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
    progreso:Integer;
begin
  vcargaftp.Update;
  progreso:=AWorkCount;
  vcargaftp.lblprogres2.Caption:=FormatFloat(',0',progreso)+' Kyte';
  vcargaftp.lblprogres2.Update;
  vcargaftp.barra.Max:=aux;
  vcargaftp.barra.Position:=AWorkCount div 1024;
  vcargaftp.barra.Update;

end;

procedure Tvftp.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
var
    peso:Integer;
begin

  vcargaftp.lblestado.Caption:='Se Cargan los Datos...';
  peso:=aux;
  vcargaftp.lblpeso.Caption:=FormatFloat(',0',peso)+ ' Kbyte';
  vcargaftp.Show;
  vcargaftp.Update;

end;

procedure Tvftp.IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin

   MessageDlg('Carga Realiazada Satisfactoriamente',mtInformation,[mbOK],0);
   vcargaftp.Close;

end;

procedure Tvftp.ToggleBox1Change(Sender: TObject);
begin
 if ToggleBox1.Checked then
   begin
     btncnx.Enabled:=true;
   end
 else
   begin
     pnldesc1.Enabled:=false;
     btncnx.Enabled:=false;
     Image1.Visible:=True;
     IdFTP.Disconnect;
     FTP.Disconnect;
     FTPsearch.Disconnect;
   end;
end;


end.

