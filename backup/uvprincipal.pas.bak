unit uvprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, ComCtrls, Menus, StdCtrls, Grids,
  DbCtrls, Buttons, EditBtn, maskedit, DOM, XMLWrite, XMLRead, uvcargando;

type

  { Tvprincipal }

  Tvprincipal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnagregar: TBitBtn;
    btnlimpiar: TBitBtn;
    btnborrar: TBitBtn;
    btnsave: TBitBtn;
    btnload1: TBitBtn;
    combofuncion: TComboBox;
    combodep: TComboBox;
    combonivel: TComboBox;
    combogrado: TComboBox;
    comboest: TComboBox;
    comboseccion: TComboBox;
    combosexo: TComboBox;
    combolaborasino: TComboBox;
    combotipo: TComboBox;
    dateingreso: TDateEdit;
    editcdgcargo: TEdit;
    editcodadm: TEdit;
    editddep: TEdit;
    editcedula: TEdit;
    editnombre: TEdit;
    editcargo: TEdit;
    editmatf: TEdit;
    DatosGenerales: TPageControl;
    Edit4correo: TEdit;
    editmatm: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    editdonde: TEdit;
    editotrafun: TEdit;
    gpseleccion: TGroupBox;
    Image1: TImage;
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
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    masktlf: TMaskEdit;
    memestd: TMemo;
    Panel1: TPanel;
    DataPersonal: TStringGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    datosgene: TTabSheet;
    datosubi: TTabSheet;
    datosfun: TTabSheet;
    datosestu: TTabSheet;
    rdbpersonal: TRadioButton;
    rdbpersonal1: TRadioButton;
    rdbsicobra: TRadioButton;
    rdbnocobra: TRadioButton;
    datosextra: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnlimpiarClick(Sender: TObject);
    procedure btnload1Click(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure comboestExit(Sender: TObject);
    procedure combolaborasinoChange(Sender: TObject);
    procedure combonivelExit(Sender: TObject);
    procedure combotipoChange(Sender: TObject);
    procedure DataPersonalSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure datosubiExit(Sender: TObject);
    procedure Edit4correoKeyPress(Sender: TObject; var Key: char);
    procedure editcargoExit(Sender: TObject);
    procedure editcargoKeyPress(Sender: TObject; var Key: char);
    procedure editcdgcargoExit(Sender: TObject);
    procedure editcdgcargoKeyPress(Sender: TObject; var Key: char);
    procedure editcedulaExit(Sender: TObject);
    procedure editcodadmExit(Sender: TObject);
    procedure editcodadmKeyPress(Sender: TObject; var Key: char);
    procedure editmatmKeyPress(Sender: TObject; var Key: char);
    procedure Edit6KeyPress(Sender: TObject; var Key: char);
    procedure editdondeKeyPress(Sender: TObject; var Key: char);
    procedure editnombreExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure memestdExit(Sender: TObject);
    procedure RadioButton5Change(Sender: TObject);
    procedure RadioButton5Exit(Sender: TObject);
    procedure RadioButton6Change(Sender: TObject);
    procedure RadioButton6Exit(Sender: TObject);
    procedure datosgeneExit(Sender: TObject);
    procedure datosfunExit(Sender: TObject);
    procedure rdbnocobraClick(Sender: TObject);
    procedure rdbpersonalChange(Sender: TObject);
    procedure rdbpersonalClick(Sender: TObject);
    procedure rdbsicobraChange(Sender: TObject);
    procedure rdbsicobraClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vprincipal: Tvprincipal;
  fila:Integer;
  xml:String;
  CanClose: boolean;
implementation

{$R *.lfm}

{ Tvprincipal }

procedure Tvprincipal.FormActivate(Sender: TObject);
begin
  DataPersonal.AdjustSize;
  combotipo.SetFocus;
end;

procedure Tvprincipal.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea salir de la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;

procedure Tvprincipal.BitBtn1Click(Sender: TObject);
begin
  if Edit6.Text='' then
  begin
    MessageDlg('¡No puede estar vacio!',mtInformation,[mbOK],0);
    end
  else
  combogrado.Items.Add(Edit6.Text);
  end;

procedure Tvprincipal.BitBtn2Click(Sender: TObject);
begin
  if Edit7.Text='' then
  begin
    MessageDlg('¡No puede estar vacio!',mtInformation,[mbOK],0);
    end
  else
  comboseccion.Items.Add(Edit7.Text);
end;

procedure Tvprincipal.BitBtn4Click(Sender: TObject);
begin
   beep;
  CanClose := MessageDlg('¿Realmente desea salir de la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk;
  if mrOK=mrOK then
       begin
         vprincipal.Close;
       end;
end;

procedure Tvprincipal.btnagregarClick(Sender: TObject);
begin
  DataPersonal.RowCount:=DataPersonal.RowCount+1;
end;

procedure Tvprincipal.btnborrarClick(Sender: TObject);
begin
  if DataPersonal.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

  if DataPersonal.RowCount>2 then
   begin
    if DataPersonal.Cells[0,fila]<>'' then
      begin
         Beep;
         if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
           begin
            DataPersonal.DeleteRow(fila);
           end;
      end
    else
      DataPersonal.DeleteRow(fila);
   end;
end;

procedure Tvprincipal.btnlimpiarClick(Sender: TObject);
var
i,j:Integer;
begin
  if DataPersonal.Cells[0,1]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara Todos los Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        for i:=0 to (DataPersonal.RowCount-1) do
           begin
              for j:=0 to (DataPersonal.ColCount-1) do
                begin
                     DataPersonal.Cells[j,i]:='';
                end;
           end;
       end;
  end
  else
     for i:=0 to (DataPersonal.RowCount-1) do
       begin
          for j:=0 to (DataPersonal.ColCount-1) do
            begin
                 DataPersonal.Cells[j,i]:='';
            end;
       end;
end;

procedure Tvprincipal.btnload1Click(Sender: TObject);
var
   Doc: TXMLDocument;
   i,j: Integer;
begin
  if (rdbpersonal.Checked=true) and  (rdbsicobra.Checked=True) then
    begin
      xml:='save/nomina/doc_1.xml';
    end;
  if (rdbpersonal.Checked=true) and  (rdbnocobra.Checked=True) then
    begin
      xml:='save/nomina/doc_2.xml';
    end;
  if (rdbpersonal1.Checked=true) and  (rdbsicobra.Checked=True) then
    begin
      xml:='save/nomina/adm_obr_1.xml';
    end;
  if (rdbpersonal1.Checked=true) and  (rdbnocobra.Checked=True) then
    begin
      xml:='save/nomina/adm_obr_2.xml';
    end;
   vcargando.Update;
   try
   ReadXMLFile(Doc,xml);
   DataPersonal.Clear;
   vcargando.Show;
   vcargando.lblestado.Caption:='Se Cargan los Datos...';
   vcargando.Caption:='Cargando...';
   vcargando.barra.Position:=0;
   with Doc.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                DataPersonal.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with DataPersonal do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;

                                 end;
                        end;
                      vcargando.Update;
                      vcargando.barra.Max:=Count+50;
                      vcargando.barra.Position:=vcargando.barra.Position+1;
                      vcargando.barra.Update;
                end;
        Doc.Free;
        end;
   DataPersonal.AutoSizeColumns;
   vcargando.Close;
   MessageDlg('Carga Exitosa del Personal',mtInformation,[mbOK],0);
   DataPersonal.Enabled:=True;
   DatosGenerales.Enabled:=True;
   gpseleccion.Enabled:=True;
    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "'+ xml+'"',mtError,[mbOK],0);
     end;
end;

procedure Tvprincipal.btnsaveClick(Sender: TObject);
  var
   Doc: TXMLDocument;
   RootNode, ElementNode,ItemNode,TextNode: TDOMNode;
   i,j,control,control2: integer;
   nombrenodo:Array[0..50] of String;
 begin

 //NOMBRE DE LOS NODOS HIJOS
  nombrenodo[0]:='cedula';
  nombrenodo[1]:='nombre_apellido';
  nombrenodo[2]:='desc_dependencia';
  nombrenodo[3]:='cod_depen';
  nombrenodo[4]:='cod_cargo';
  nombrenodo[5]:='desc_cargo';
  nombrenodo[6]:='dependencia';
  nombrenodo[7]:='funcion';
  nombrenodo[8]:='otra_funcion';
  nombrenodo[9]:='telefono';
  nombrenodo[10]:='correo';
  nombrenodo[11]:='labora_plant';
  nombrenodo[12]:='donde_labora';
  nombrenodo[13]:='matricula_m';
  nombrenodo[14]:='matricula_f';
  nombrenodo[15]:='sexo';
  nombrenodo[16]:='grado';
  nombrenodo[17]:='seccion';
  nombrenodo[18]:='fcha_ingplant';
  nombrenodo[19]:='nivel_instru';
  nombrenodo[20]:='estudia';
  nombrenodo[21]:='detalle_estudio';
  nombrenodo[22]:='nivel_select';

   for i:=0 to (DataPersonal.RowCount-1) do
     begin
        for j:=0 to (DataPersonal.ColCount-1) do
          begin
               if DataPersonal.Cells[j,i]='' then
               begin
                 DataPersonal.Cells[j,i]:='0';
               end;
          end;

     end;
   try
     // Crear el documento
     Doc := TXMLDocument.Create;
     // Crear el nodo raiz
     RootNode := Doc.CreateElement('nomina');
     Doc.Appendchild(RootNode);
     RootNode:= Doc.DocumentElement;
     control:=DataPersonal.RowCount;
     control2:=DataPersonal.ColCount;
     // Crear los nodos
     for i := 0 to (control-1) do
       begin
         ElementNode:=Doc.CreateElement('recurso');
          for j:=0 to (control2-1) do
            begin
             ItemNode:=Doc.CreateElement(nombrenodo[j]);
             TextNode:=Doc.CreateTextNode(DataPersonal.Cells[j,i]);
             ItemNode.AppendChild(TextNode);
             ElementNode.AppendChild(ItemNode);
            end;
         RootNode.AppendChild(ElementNode);
       end;
       // Guardar el XML
       WriteXMLFile(Doc,xml);
       Doc.Free;
       MessageDlg('Se Ha Guardado el Archivo del Personal del Plantel',mtInformation,[mbOK],0);
     Except
     MessageDlg('No se Guardo el Archivo', mtError,[mbOK],0);
     end;
end;

procedure Tvprincipal.comboestExit(Sender: TObject);
begin
  DataPersonal.Cells[20,fila]:=comboest.Text;
end;

procedure Tvprincipal.combolaborasinoChange(Sender: TObject);
begin
  //dateingreso.Enabled:=false;
  if combolaborasino.Text='SI' then
    begin
         dateingreso.Enabled:=true;
         editdonde.Text:=DataPersonal.Cells[2,fila];
         editdonde.Enabled:=false;
    end;
  if combolaborasino.Text='NO' then
    begin
         editdonde.Enabled:=true;
         dateingreso.Enabled:=false;
    end

end;

procedure Tvprincipal.combonivelExit(Sender: TObject);
begin
    DataPersonal.Cells[19,fila]:=IntToStr(combonivel.ItemIndex);
    DataPersonal.Cells[22,fila]:=combonivel.Text;
end;

procedure Tvprincipal.combotipoChange(Sender: TObject);
begin
  btnload1.Enabled:=false;
  btnsave.Enabled:=false;
  DataPersonal.Enabled:=false;
  DatosGenerales.Enabled:=false;
  gpseleccion.Enabled:=false;
  rdbpersonal.Checked:=false;
  rdbpersonal1.Checked:=false;
  Panel3.Visible:=false;
  if combotipo.Text='Nacional' then
  begin
      rdbnocobra.Enabled:=true;
      rdbnocobra.Checked:=false;
      rdbsicobra.Enabled:=true;
  end;
  if combotipo.Text='Estadal' then
  begin
     rdbnocobra.Enabled:=true;
     rdbnocobra.Checked:=false;
     rdbsicobra.Enabled:=false;
     rdbsicobra.Checked:=false;
  end
  else
  rdbsicobra.Checked:=false;
  rdbnocobra.Checked:=false;

end;


procedure Tvprincipal.DataPersonalSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
var
 nivel:QWord;
begin
   fila:=aRow;
   editcedula.Text:=DataPersonal.Cells[0,aRow];
   editnombre.Text:=DataPersonal.Cells[1,aRow];
   editcodadm.Text:=DataPersonal.Cells[3,aRow];
   editcdgcargo.Text:=DataPersonal.Cells[4,aRow];
   editcargo.Text:=DataPersonal.Cells[5,aRow];
   masktlf.Text:=DataPersonal.Cells[9,aRow];
   Edit4correo.Text:=DataPersonal.Cells[10,aRow];
   combodep.Text:=DataPersonal.Cells[6,aRow];
   combosexo.Text:=DataPersonal.Cells[15,aRow];
   combofuncion.Items.Strings[0]:=DataPersonal.Cells[7,aRow];
   combofuncion.ItemIndex:=0;
   combogrado.Items.Strings[0]:=DataPersonal.Cells[16,aRow];
   combogrado.ItemIndex:=0;
   comboseccion.Items.Strings[0]:=DataPersonal.Cells[17,aRow];
   comboseccion.ItemIndex:=0;
   editmatm.Text:=DataPersonal.Cells[13,aRow];
   editmatf.Text:=DataPersonal.Cells[14,aRow];
   editddep.Text:=DataPersonal.Cells[2,aRow];
   combolaborasino.Text:=DataPersonal.Cells[11,aRow];
   editotrafun.Text:=DataPersonal.Cells[8,aRow];
   dateingreso.Text:=DataPersonal.Cells[18,aRow];
   editdonde.Text:=DataPersonal.Cells[12,aRow];
   combonivel.Text:=DataPersonal.Cells[22,aRow];
   comboest.Text:=DataPersonal.Cells[20,aRow];
   memestd.Clear;
   memestd.Text:=DataPersonal.Cells[21,aRow];
   if DataPersonal.Cells[11,aRow]='SI' then
     begin
     editdonde.Text:=DataPersonal.Cells[2,aRow];
     end;

end;

procedure Tvprincipal.datosubiExit(Sender: TObject);
begin
  DataPersonal.Cells[2,fila]:=editddep.Text;
  DataPersonal.Cells[11,fila]:=combolaborasino.Text;
  DataPersonal.Cells[12,fila]:=editdonde.Text;
  DataPersonal.Cells[18,fila]:=dateingreso.Text;
  DataPersonal.Cells[8,fila]:=editotrafun.Text;
end;

procedure Tvprincipal.Edit4correoKeyPress(Sender: TObject; var Key: char);
begin
if not (key in ['a'..'z', '0'..'9' , '@', '.', '_', '-' ,#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;


procedure Tvprincipal.editcargoExit(Sender: TObject);
begin
  DataPersonal.Cells[5,fila]:=editcargo.Text;
end;

procedure Tvprincipal.editcargoKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['A'..'Z', '0'..'9' ,' ','.', '/' ,#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvprincipal.editcdgcargoExit(Sender: TObject);
begin
  DataPersonal.Cells[4,fila]:=editcdgcargo.Text;
end;

procedure Tvprincipal.editcdgcargoKeyPress(Sender: TObject; var Key: char);
begin
      if not (key in ['A'..'Z', '0'..'9' ,' ', '.', '-','/' ,#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvprincipal.editcedulaExit(Sender: TObject);
begin
    DataPersonal.Cells[0,fila]:=editcedula.Text;
end;

procedure Tvprincipal.editcodadmExit(Sender: TObject);
begin
  DataPersonal.Cells[3,fila]:=editcodadm.Text;
end;

procedure Tvprincipal.editcodadmKeyPress(Sender: TObject; var Key: char);
begin
      if not (key in ['0'..'9',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvprincipal.editmatmKeyPress(Sender: TObject; var Key: char);
begin
    if not (key in ['0'..'9',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvprincipal.Edit6KeyPress(Sender: TObject; var Key: char);
begin
    if not (key in ['A'..'Y', '0'..'9' ,' ', ',',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;


procedure Tvprincipal.editdondeKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['A'..'Z',' ','.', '/' ,#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvprincipal.editnombreExit(Sender: TObject);
begin
   DataPersonal.Cells[1,fila]:=editnombre.Text;
end;

//CARGA DEL FORM
procedure Tvprincipal.FormCreate(Sender: TObject);
begin
  DataPersonal.AutoSizeColumns;
  dateingreso.Enabled:=false;
end;


procedure Tvprincipal.memestdExit(Sender: TObject);
begin
   DataPersonal.Cells[21,fila]:=memestd.Text;
end;

procedure Tvprincipal.RadioButton5Change(Sender: TObject);
begin
  Panel1.Enabled:=true;
end;

procedure Tvprincipal.RadioButton5Exit(Sender: TObject);
begin
  if rdbpersonal.Checked=True then
    begin
      Panel1.Enabled:=True;
      combofuncion.Items.Clear;
      combofuncion.AddItem('',nil);
      combofuncion.AddItem('DIRECTOR',nil);
      combofuncion.AddItem('SUBDIRECTOR',nil);
      combofuncion.AddItem('COORD. DEL PLANTEL',nil);
      combofuncion.AddItem('COOR. P.A.E.',nil);
      combofuncion.AddItem('COOR. PEDAG',nil);
      combofuncion.AddItem('DOCENTE EN AULA',nil);
      combofuncion.AddItem('DOC. ED. FISICA',nil);
      combofuncion.AddItem('DOC. ED. MUSICA',nil);
      combofuncion.AddItem('DOC. EDU. ESPECIAL',nil);
      combofuncion.AddItem('TEC. AGROPECUARIO',nil);
      combofuncion.AddItem('DOC. INGLES',nil);
      combofuncion.AddItem('DOC. BIBLIOTECARIO',nil);
      combofuncion.AddItem('DOC. COMPUTACION',nil);
      combofuncion.AddItem('DOC. AJEDRES',nil);
      combofuncion.AddItem('DOC. DANZA',nil);
      combofuncion.AddItem('DOC. TEATRO',nil);
      combofuncion.AddItem('DOC. MANUALIDADES',nil);
      combofuncion.AddItem('DOC. ADMINISTRATIVO',nil);
      combofuncion.AddItem('ORIENTADOR',nil);
      combofuncion.ItemIndex:=0;
    end;
  if rdbpersonal1.Checked=True then
    begin
      Panel1.Enabled:=false;
      combofuncion.Items.Clear;
      combofuncion.AddItem('',nil);
      combofuncion.AddItem('ADMINISTRATIVO',nil);
      combofuncion.AddItem('AUX. DE PREESCOLAR',nil);
      combofuncion.AddItem('ASEADOR',nil);
      combofuncion.AddItem('VIGILANTE',nil);
      combofuncion.AddItem('JARDINERO',nil);
      combofuncion.AddItem('CHOFER',nil);
      combofuncion.AddItem('PORTERO',nil);
      combofuncion.AddItem('OBR. FUN. ADMINISTRATIVA',nil);
      combofuncion.ItemIndex:=0;
    end;
end;

procedure Tvprincipal.RadioButton6Change(Sender: TObject);
begin
    Panel1.Enabled:=false;
end;

procedure Tvprincipal.RadioButton6Exit(Sender: TObject);
begin
   combofuncion.Items.Clear;
   combofuncion.AddItem('',nil);
   combofuncion.AddItem('SE DESCONOCE SU UBICACION',nil);
   combofuncion.AddItem('REPOSO MEDICO',nil);
   combofuncion.AddItem('PERMISO ESPECIAL',nil);
   combofuncion.AddItem('PROCESO DE JUBILACION',nil);
   combofuncion.AddItem('LABORA EN OTRA INSTITUCION',nil);
   combofuncion.AddItem('COMISION DE SERVICIO',nil);
   combofuncion.AddItem('REPOSO PRE Y POST NATAL',nil);
   combofuncion.ItemIndex:=0;
end;

procedure Tvprincipal.datosgeneExit(Sender: TObject);
begin
   DataPersonal.Cells[9,fila]:=masktlf.Text;
   DataPersonal.Cells[10,fila]:=Edit4correo.Text;
   DataPersonal.Cells[15,fila]:=combosexo.Text;
   DataPersonal.Cells[6,fila]:=combodep.Text;
end;


procedure Tvprincipal.datosfunExit(Sender: TObject);
begin
  DataPersonal.Cells[7,fila]:=combofuncion.Text;
  DataPersonal.Cells[16,fila]:=combogrado.Text;
  DataPersonal.Cells[17,fila]:=comboseccion.Text;
  DataPersonal.Cells[13,fila]:=editmatm.Text;
  DataPersonal.Cells[14,fila]:=editmatf.Text;

  if combofuncion.Items[combofuncion.ItemIndex]='SE DESCONOCE SU UBICACION' then
  begin
    editdonde.Enabled:=false;
    editdonde.Text:='SE DESCONOCE SU UBICACION';
    combolaborasino.ItemIndex:=2;
    combolaborasino.Enabled:=false;
    dateingreso.Enabled:=false;
    end;
if combofuncion.Items[combofuncion.ItemIndex]<>'SE DESCONOCE SU UBICACION' then
  begin
    editdonde.Enabled:=true;
    editdonde.Text:='';
    combolaborasino.ItemIndex:=0;
    combolaborasino.Enabled:=true;
    end

end;

procedure Tvprincipal.rdbnocobraClick(Sender: TObject);
begin
editddep.ReadOnly:=false;
if rdbnocobra.Checked=True then
     begin
     DataPersonal.Clean;
     DataPersonal.RowCount:=2;
     btnload1.Enabled:=true;
     btnsave.Enabled:=true;
     editnombre.ReadOnly:=false;
     editcedula.ReadOnly:=false;
     editcargo.ReadOnly:=false;
     btnagregar.Enabled:=true;
     btnborrar.Enabled:=true;
     btnlimpiar.Enabled:=true;
     datosextra.Visible:=false;
     datosextra.Enabled:=true;
     DataPersonal.Enabled:=true;
     DatosGenerales.Enabled:=true;
     gpseleccion.Enabled:=true;
     end;
end;

procedure Tvprincipal.rdbpersonalChange(Sender: TObject);
begin
  btnload1.Enabled:=false;
  btnsave.Enabled:=false;
  DataPersonal.Enabled:=false;
  DatosGenerales.Enabled:=false;
  gpseleccion.Enabled:=false;
  btnagregar.Enabled:=false;
  btnborrar.Enabled:=false;
  btnlimpiar.Enabled:=false;
  datosextra.Visible:=false;
end;


procedure Tvprincipal.rdbpersonalClick(Sender: TObject);
begin
   Panel3.Visible:=true;
   rdbsicobra.Checked:=false;
   rdbnocobra.Checked:=false;
end;

procedure Tvprincipal.rdbsicobraChange(Sender: TObject);
begin
  DataPersonal.Enabled:=false;
  DatosGenerales.Enabled:=false;
  gpseleccion.Enabled:=false;
end;

procedure Tvprincipal.rdbsicobraClick(Sender: TObject);
begin
editddep.ReadOnly:=true;
if rdbsicobra.Checked=True then
     begin
     btnload1.Enabled:=true;
     btnsave.Enabled:=true;
     editnombre.ReadOnly:=true;
     editcedula.ReadOnly:=true;
     editcargo.ReadOnly:=true;
     btnagregar.Enabled:=false;
     btnborrar.Enabled:=false;
     btnlimpiar.Enabled:=false;
     datosextra.Visible:=false;
     datosextra.Enabled:=false;
     end;
end;


end.
