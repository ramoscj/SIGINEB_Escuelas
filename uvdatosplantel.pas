unit uvdatosplantel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  ComCtrls, ExtCtrls, StdCtrls, maskedit,
  Buttons, EditBtn, Spin, XMLRead, XMLWrite, DOM, uvcargando;

type

  { Tvdatosplantel }

  Tvdatosplantel = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btndelete: TBitBtn;
    btncargar: TBitBtn;
    btnagrg: TBitBtn;
    btndelete1: TBitBtn;
    btnedit: TBitBtn;
    btnedit1: TBitBtn;
    btnguardar: TBitBtn;
    btnotro: TBitBtn;
    cantmm: TSpinEdit;
    cantbano: TSpinEdit;
    cantcbit: TSpinEdit;
    cantmedida: TSpinEdit;
    cantmf: TSpinEdit;
    cantpiso: TSpinEdit;
    cantcom: TSpinEdit;
    cantcd: TSpinEdit;
    cantbb: TSpinEdit;
    cantofi: TSpinEdit;
    comboturno: TComboBox;
    comboplanc: TComboBox;
    comboinfra: TComboBox;
    combotene: TComboBox;
    combococina: TComboBox;
    combocerca: TComboBox;
    comboagb: TComboBox;
    comboagn: TComboBox;
    combosec: TComboBox;
    combomuni: TComboBox;
    combodep: TComboBox;
    combotipo: TComboBox;
    comboner: TComboBox;
    combohorario: TComboBox;
    combonivel: TComboBox;
    comboubi: TComboBox;
    combogrado: TComboBox;
    datehinte: TDateEdit;
    descddep: TEdit;
    editparro: TEdit;
    edit2: TEdit;
    editadm: TEdit;
    editdea: TEdit;
    editest: TEdit;
    editcorreo: TEdit;
    editlong: TEdit;
    editlatt: TEdit;
    editplantel: TEdit;
    edit1: TEdit;
    editcambio: TEdit;
    GroupBox1: TGroupBox;
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
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    lblplantel: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    masktlf: TMaskEdit;
    memodire: TMemo;
    memorese: TMemo;
    memosoce: TMemo;
    memosocp: TMemo;
    datosplantel: TPageControl;
    pnlner: TPanel;
    cantaula: TSpinEdit;
    stgplantel: TStringGrid;
    stgmatricula: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btndelete1Click(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure btnagrgClick(Sender: TObject);
    procedure btncargarClick(Sender: TObject);
    procedure btnedit1Click(Sender: TObject);
    procedure btneditClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnotroClick(Sender: TObject);
    procedure combodepExit(Sender: TObject);
    procedure combomuniExit(Sender: TObject);
    procedure combonerChange(Sender: TObject);
    procedure combonerExit(Sender: TObject);
    procedure combotipoChange(Sender: TObject);
    procedure descddepExit(Sender: TObject);
    procedure descddepKeyPress(Sender: TObject; var Key: char);
    procedure edit2KeyPress(Sender: TObject; var Key: char);
    procedure editadmKeyPress(Sender: TObject; var Key: char);
    procedure editcorreoKeyPress(Sender: TObject; var Key: char);
    procedure editdeaKeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure stgmatriculaSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure stgplantelSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet1Exit(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure TabSheet3Exit(Sender: TObject);
    procedure TabSheet5Exit(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vdatosplantel: Tvdatosplantel;
  fila,fila2:Integer;

implementation

{$R *.lfm}

{ Tvdatosplantel }

procedure Tvdatosplantel.combonerChange(Sender: TObject);
begin
  if comboner.Items[comboner.ItemIndex]='SI' then
  begin
     datosplantel.Enabled:=true;
     pnlner.Enabled:=true;
     descddep.Enabled:=false;
     lblplantel.Visible:=true;
     editplantel.Visible:=true;
     stgmatricula.Columns[0].Visible:=true;  //OCULTAR COMLUMNAS
  end;
  if comboner.Items[comboner.ItemIndex]='NO' then
  begin
     datosplantel.Enabled:=true;
     pnlner.Enabled:=false;
     descddep.Enabled:=true;
     lblplantel.Visible:=false;
     editplantel.Visible:=false;
     stgmatricula.Columns[0].Visible:=false;
  end;
  if comboner.Items[comboner.ItemIndex]='' then
  begin
     datosplantel.Enabled:=false;
     pnlner.Enabled:=false;
     descddep.Enabled:=true;
     lblplantel.Visible:=false;
     editplantel.Visible:=false;
     stgmatricula.Columns[0].Visible:=false;
  end;
end;

procedure Tvdatosplantel.combonerExit(Sender: TObject);
begin
  stgplantel.Cells[1,fila]:=comboner.Text;
  if comboner.Items[comboner.ItemIndex]='NO' then
  begin
     stgplantel.Cells[0,fila]:=stgplantel.Cells[4,fila];
     editplantel.Text:=stgplantel.Cells[0,1];
     stgplantel.AutoSizeColumns;
  end;

end;

procedure Tvdatosplantel.combotipoChange(Sender: TObject);
begin
  if combotipo.ItemIndex=3 then
  begin
     datehinte.Enabled:=true;
  end
  else
     datehinte.Enabled:=false;
end;

procedure Tvdatosplantel.descddepExit(Sender: TObject);
begin
  stgplantel.Cells[4,fila]:=descddep.Text;
end;

procedure Tvdatosplantel.descddepKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['A'..'Z','0'..'9',' ','.',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvdatosplantel.edit2KeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['A'..'Z',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvdatosplantel.editadmKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvdatosplantel.editcorreoKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['a'..'z','0'..'9','.','@','_','-',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvdatosplantel.editdeaKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['A'..'Z','0'..'9',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvdatosplantel.btnotroClick(Sender: TObject);
begin
  if editcambio.Text<>'' then
    begin
      stgplantel.Cells[0,fila]:=editcambio.Text;
      stgplantel.Cells[1,fila]:=stgplantel.Cells[1,1];
      stgplantel.Cells[4,fila]:=stgplantel.Cells[4,1];
      stgplantel.AutoSizeColumns;
      stgplantel.RowCount:=stgplantel.RowCount+1;
    end
  else
    MessageDlg('No puede Dejar la Casilla Vacia',mtInformation,[mbOK],0);
    editcambio.SetFocus;
end;

procedure Tvdatosplantel.btnagrgClick(Sender: TObject);
begin
  if (combogrado.Text<>'') and (combosec.Text<>'') and (cantmm.Text<>'') and (cantmf.Text<>'') and (comboturno.Text<>'') and (combonivel.Text<>'') then
   begin
    stgmatricula.Cells[0,fila2]:=editplantel.Text;
    stgmatricula.Cells[1,fila2]:=combogrado.Text;
    stgmatricula.Cells[2,fila2]:=combosec.Text;
    stgmatricula.Cells[3,fila2]:=cantmm.Text;
    stgmatricula.Cells[4,fila2]:=cantmf.Text;
    stgmatricula.Cells[5,fila2]:=comboturno.Text;
    stgmatricula.Cells[6,fila2]:=combonivel.Text;
    stgmatricula.Cells[7,fila2]:=stgplantel.Cells[8,fila];
    stgmatricula.AutoSizeColumns;
    stgmatricula.RowCount:=stgmatricula.RowCount+1;
   end
  else
    MessageDlg('Verfique que Todos los Campos estes Llenos (*Sección, *Grado, *Matricula,*Turno,*Nivel)',mtInformation,[mbOK],0);
end;

procedure Tvdatosplantel.btndeleteClick(Sender: TObject);
begin

if stgplantel.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

if stgplantel.RowCount>2 then
 begin
  if stgplantel.Cells[0,fila]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        stgplantel.DeleteRow(fila);
       end;
  end
  else
    stgplantel.DeleteRow(fila);
 end;

end;

procedure Tvdatosplantel.btndelete1Click(Sender: TObject);
begin
  if stgmatricula.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

if stgmatricula.RowCount>2 then
 begin
  if stgmatricula.Cells[1,fila2]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        stgmatricula.DeleteRow(fila2);
       end;
  end
  else
    stgmatricula.DeleteRow(fila2);
 end;
end;

procedure Tvdatosplantel.BitBtn1Click(Sender: TObject);
begin
  if edit1.Text<>'' then
    begin
      combogrado.Items.Add(edit1.Text);
    end;
end;

procedure Tvdatosplantel.BitBtn2Click(Sender: TObject);
begin
  if edit2.Text<>'' then
    begin
      combosec.Items.Add(edit2.Text);
    end;
end;

procedure Tvdatosplantel.btncargarClick(Sender: TObject);
var
   Doc, Doc2: TXMLDocument;
   i,j: Integer;
begin
  // ARCHIVO DE LOS DATOS DEL PLANTEL
  try
   ReadXMLFile(Doc,'save/plantel/datos_plantel.xml');
   with Doc.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                stgplantel.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with stgplantel do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;
                                 end;
                        end;
                end;
        Doc.Free;
        end;
   stgplantel.AutoSizeColumns;
   MessageDlg('Carga Exitosa de los Datos del Plantel',mtInformation,[mbOK],0);
    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "save/plantel/datos_plantel.xml"',mtError,[mbOK],0);
     end;

   // ARCHIVO DE LA MATRICULA DEL PLANTEL
   try
   ReadXMLFile(Doc2,'save/plantel/matricula_plantel.xml');
   with Doc2.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                stgmatricula.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with stgmatricula do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;
                                 end;
                        end;
                end;
        Doc2.Free;
        end;
   stgmatricula.AutoSizeColumns;
   vcargando.Close;
   MessageDlg('Carga Exitosa de la Matricula del Plantel',mtInformation,[mbOK],0);
   datosplantel.Enabled:=true;
   //PASAR DATOS PARA LA PRIMERA CARGA POR SI NO ES UN N.E.R

  //DATOS GENERALES
  editplantel.Text:=stgplantel.Cells[0,1];
  descddep.Text:=stgplantel.Cells[4,1];
  combomuni.Text:=stgplantel.Cells[2,1];
  combodep.Text:=stgplantel.Cells[3,1];
  combotipo.Text:=stgplantel.Cells[5,1];
  editadm.Text:=stgplantel.Cells[6,1];
  editdea.Text:=stgplantel.Cells[7,1];
  editest.Text:=stgplantel.Cells[8,1];
  masktlf.Text:=stgplantel.Cells[9,1];
  editcorreo.Text:=stgplantel.Cells[10,1];
  combohorario.Text:=stgplantel.Cells[11,1];
  editparro.Text:=stgplantel.Cells[12,1];
  memodire.Clear;
  memodire.Text:=stgplantel.Cells[13,1];
  comboubi.Text:=stgplantel.Cells[14,1];
  editlong.Text:=stgplantel.Cells[15,1];
  editlatt.Text:=stgplantel.Cells[16,1];
  memorese.Clear;
  memorese.Text:=stgplantel.Cells[17,1];
  memosoce.Clear;
  memosoce.Text:=stgplantel.Cells[18,1];
  memosocp.Clear;
  memosocp.Text:=stgplantel.Cells[19,1];
  editplantel.Text:=stgplantel.Cells[0,1];

  //INFRAESTRUCUTRA
  comboinfra.Text:=stgplantel.Cells[20,1];
  combotene.Text:=stgplantel.Cells[21,1];
  cantmedida.Text:=stgplantel.Cells[22,1];
  comboplanc.Text:=stgplantel.Cells[23,1];
  cantaula.Text:=stgplantel.Cells[24,1];
  cantbano.Text:=stgplantel.Cells[25,1];
  cantofi.Text:=stgplantel.Cells[26,1];
  combococina.Text:=stgplantel.Cells[27,1];
  cantcd.Text:=stgplantel.Cells[28,1];
  cantbb.Text:=stgplantel.Cells[29,1];
  cantcom.Text:=stgplantel.Cells[30,1];
  combocerca.Text:=stgplantel.Cells[31,1];
  cantcbit.Text:=stgplantel.Cells[32,1];
  cantpiso.Text:=stgplantel.Cells[33,1];
  comboagb.Text:=stgplantel.Cells[34,1];
  comboagn.Text:=stgplantel.Cells[35,1];

    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "save/plantel/matricula_plantel.xml"',mtError,[mbOK],0);
     end;
end;

procedure Tvdatosplantel.btnedit1Click(Sender: TObject);
begin
    stgmatricula.Cells[0,fila2]:=editplantel.Text;
    stgmatricula.Cells[1,fila2]:=combogrado.Text;
    stgmatricula.Cells[2,fila2]:=combosec.Text;
    stgmatricula.Cells[3,fila2]:=cantmm.Text;
    stgmatricula.Cells[4,fila2]:=cantmf.Text;
    stgmatricula.Cells[5,fila2]:=comboturno.Text;
    stgmatricula.Cells[6,fila2]:=combonivel.Text;
    stgmatricula.Cells[7,fila2]:=stgplantel.Cells[8,fila];
    stgmatricula.AutoSizeColumns;
end;

procedure Tvdatosplantel.btneditClick(Sender: TObject);
begin
  stgplantel.Cells[0,fila]:=editcambio.Text;
  stgplantel.Cells[1,fila]:=stgplantel.Cells[1,1];
  stgplantel.Cells[4,fila]:=stgplantel.Cells[4,1];
end;

procedure Tvdatosplantel.btnguardarClick(Sender: TObject);
var
 Doc, Doc2: TXMLDocument;
 RootNode, ElementNode,ItemNode,TextNode: TDOMNode;
 i,control,control2,j: integer;
 nombrenodo:Array[0..50] of String;
 nombrenodo2:Array[0..50] of String;
begin

//NOMBRE DE LOS NODOS HIJOS
  nombrenodo[0]:='plantel';
  nombrenodo[1]:='ner';
  nombrenodo[2]:='municipio';
  nombrenodo[3]:='dependencia';
  nombrenodo[4]:='des_cdep';
  nombrenodo[5]:='tipo';
  nombrenodo[6]:='cod_adm';
  nombrenodo[7]:='cod_dea';
  nombrenodo[8]:='cod_est';
  nombrenodo[9]:='telefono';
  nombrenodo[10]:='correo';
  nombrenodo[11]:='horario';
  nombrenodo[12]:='parroquia';
  nombrenodo[13]:='direccion';
  nombrenodo[14]:='ubic_geograf';
  nombrenodo[15]:='longitud';
  nombrenodo[16]:='latitud';
  nombrenodo[17]:='resena';
  nombrenodo[18]:='act_soce';
  nombrenodo[19]:='act_socp';
  nombrenodo[20]:='infraestructura';
  nombrenodo[21]:='tenencia';
  nombrenodo[22]:='medidas_terreno';
  nombrenodo[23]:='plantel_constr';
  nombrenodo[24]:='n_aulas';
  nombrenodo[25]:='n_banos';
  nombrenodo[26]:='n_oficina';
  nombrenodo[27]:='area_cocina';
  nombrenodo[28]:='cancha_dep';
  nombrenodo[29]:='bilioteca';
  nombrenodo[30]:='comedor';
  nombrenodo[31]:='cerca_perime';
  nombrenodo[32]:='sala_compu';
  nombrenodo[33]:='n_pisos';
  nombrenodo[34]:='agua_blanca';
  nombrenodo[35]:='agua_negra';
  nombrenodo[36]:='feha_hinte';


  for i:=0 to (stgplantel.RowCount-1) do
     begin
        for j:=0 to (stgplantel.ColCount-1) do
          begin
               if stgplantel.Cells[j,i]='' then
               begin
                 stgplantel.Cells[j,i]:='0';
               end;
          end;

     end;
  for i:=0 to (stgmatricula.RowCount-1) do
     begin
        for j:=0 to (stgmatricula.ColCount-1) do
          begin
               if stgmatricula.Cells[j,i]='' then
               begin
                 stgmatricula.Cells[j,i]:='0';
               end;
          end;

     end;
   //GUARDAR XML DE DATOS
   try
     // Crear el documento
     Doc:= TXMLDocument.Create;
     // Crear el nodo raiz
     RootNode := Doc.CreateElement('plantel');
     Doc.Appendchild(RootNode);
     RootNode:= Doc.DocumentElement;
     control:=stgplantel.RowCount;
     control2:=stgplantel.ColCount;
     // Crear los nodos
     for i := 0 to (control-1) do
       begin
         ElementNode:=Doc.CreateElement('datos_plantel');
          for j:=0 to  (control2-1) do
            begin
             ItemNode:=Doc.CreateElement(nombrenodo[j]);
             TextNode:=Doc.CreateTextNode(stgplantel.Cells[j,i]);
             ItemNode.AppendChild(TextNode);
             ElementNode.AppendChild(ItemNode);
            end;
         RootNode.AppendChild(ElementNode);

       end;
       // Guardar el XML
       WriteXMLFile(Doc,'save/plantel/datos_plantel.xml');
       Doc.Free;
       MessageDlg('Se Ha Guardado el Archivo de los datos del Plantel',mtInformation,[mbOK],0);
     Except
        MessageDlg('No se Guardo los Datos del Plantel', mtError,[mbOK],0);
     end;

//NOMBRE DE LOS NODOS HIJOS
  nombrenodo2[0]:='plantel';
  nombrenodo2[1]:='grado';
  nombrenodo2[2]:='seccion';
  nombrenodo2[3]:='matricula_m';
  nombrenodo2[4]:='matricula_f';
  nombrenodo2[5]:='turno';
  nombrenodo2[6]:='nivel';
  nombrenodo2[7]:='cod_est';

     //GUARDAR XML DE MATRICULA
     try
       // Crear el documento
       Doc2 := TXMLDocument.Create;
       // Crear el nodo raiz
       RootNode := Doc2.CreateElement('plantel');
       Doc2.Appendchild(RootNode);
       RootNode:= Doc2.DocumentElement;
       control:=stgmatricula.RowCount;
       control2:=stgmatricula.ColCount;
       // Crear los nodos
       for i := 0 to (control-1) do
         begin
           ElementNode:=Doc2.CreateElement('matricula_plantel');
            for j:=0 to (control2-1) do
             begin
               ItemNode:=Doc2.CreateElement(nombrenodo2[j]);
               TextNode:=Doc2.CreateTextNode(stgmatricula.Cells[j,i]);
               ItemNode.AppendChild(TextNode);
               ElementNode.AppendChild(ItemNode);
             end;
           RootNode.AppendChild(ElementNode);
         end;
         // Guardar el XML
         WriteXMLFile(Doc2,'save/plantel/matricula_plantel.xml');
         Doc2.Free;
         MessageDlg('Se Ha Guardado el Archivo de la Matricula del Plantel',mtInformation,[mbOK],0);
     Except
         MessageDlg('No se Guardo la Matricula del Plantel', mtError,[mbOK],0);
     end;


end;

procedure Tvdatosplantel.combodepExit(Sender: TObject);
begin
  stgplantel.Cells[3,fila]:=combodep.Text;
end;

procedure Tvdatosplantel.combomuniExit(Sender: TObject);
begin
  stgplantel.Cells[2,fila]:=combomuni.Text;
end;

procedure Tvdatosplantel.FormActivate(Sender: TObject);

begin
  stgplantel.AutoSizeColumns;
  stgmatricula.AutoSizeColumns;
  btncargar.SetFocus;
end;

procedure Tvdatosplantel.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea salir de la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;


procedure Tvdatosplantel.stgmatriculaSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);

begin
  fila2:=aRow;
  combogrado.Text:=stgmatricula.Cells[1,aRow];
  combosec.Text:=stgmatricula.Cells[2,aRow];
  cantmm.Text:=stgmatricula.Cells[3,aRow];
  cantmf.Text:=stgmatricula.Cells[4,aRow];
  comboturno.Text:=stgmatricula.Cells[5,aRow];
  combonivel.Text:=stgmatricula.Cells[6,aRow];
end;


procedure Tvdatosplantel.stgplantelSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
  fila:=aRow;
  editplantel.Text:=stgplantel.Cells[0,aRow];
  descddep.Text:=stgplantel.Cells[4,1];
  comboner.Text:=stgplantel.Cells[1,aRow];
  combomuni.Text:=stgplantel.Cells[2,aRow];
  combodep.Text:=stgplantel.Cells[3,aRow];
  combotipo.Text:=stgplantel.Cells[5,aRow];
  editadm.Text:=stgplantel.Cells[6,aRow];
  editdea.Text:=stgplantel.Cells[7,aRow];
  editest.Text:=stgplantel.Cells[8,aRow];
  masktlf.Text:=stgplantel.Cells[9,aRow];
  editcorreo.Text:=stgplantel.Cells[10,aRow];
  combohorario.Text:=stgplantel.Cells[11,aRow];
  editparro.Text:=stgplantel.Cells[12,aRow];
  memodire.Clear;
  memodire.Text:=stgplantel.Cells[13,aRow];
  comboubi.Text:=stgplantel.Cells[14,aRow];
  editlong.Text:=stgplantel.Cells[15,aRow];
  editlatt.Text:=stgplantel.Cells[16,aRow];
  memorese.Clear;
  memorese.Text:=stgplantel.Cells[17,aRow];
  memosoce.Clear;
  memosoce.Text:=stgplantel.Cells[18,aRow];
  memosocp.Clear;
  memosocp.Text:=stgplantel.Cells[19,aRow];

  editcambio.Text:=stgplantel.Cells[0,aRow];//PASAR DATO AL AGREGAR PLANTEL

  comboinfra.Text:=stgplantel.Cells[20,aRow];
  combotene.Text:=stgplantel.Cells[21,aRow];
  cantmedida.Text:=stgplantel.Cells[22,aRow];
  comboplanc.Text:=stgplantel.Cells[23,aRow];
  cantaula.Text:=stgplantel.Cells[24,aRow];
  cantbano.Text:=stgplantel.Cells[25,aRow];
  cantofi.Text:=stgplantel.Cells[26,aRow];
  combococina.Text:=stgplantel.Cells[27,aRow];
  cantcd.Text:=stgplantel.Cells[28,aRow];
  cantbb.Text:=stgplantel.Cells[29,aRow];
  cantcom.Text:=stgplantel.Cells[30,aRow];
  combocerca.Text:=stgplantel.Cells[31,aRow];
  cantcbit.Text:=stgplantel.Cells[32,aRow];
  cantpiso.Text:=stgplantel.Cells[33,aRow];
  comboagb.Text:=stgplantel.Cells[34,aRow];
  comboagn.Text:=stgplantel.Cells[35,aRow];
  datehinte.Text:=stgplantel.Cells[36,aRow];
  datehinte.Enabled:=false;
end;

procedure Tvdatosplantel.TabSheet1Exit(Sender: TObject);
begin
  stgplantel.Cells[5,fila]:=combotipo.Text;
  stgplantel.Cells[6,fila]:=editadm.Text;
  stgplantel.Cells[7,fila]:=editdea.Text;
  stgplantel.Cells[8,fila]:=editest.Text;
  stgplantel.Cells[9,fila]:=masktlf.Text;
  stgplantel.Cells[10,fila]:=editcorreo.Text;
  stgplantel.Cells[11,fila]:=combohorario.Text;
  stgplantel.Cells[36,fila]:=datehinte.Text;
end;

procedure Tvdatosplantel.TabSheet2Exit(Sender: TObject);
begin
  stgplantel.Cells[12,fila]:=editparro.Text;
  stgplantel.Cells[13,fila]:=memodire.Text;
  stgplantel.Cells[14,fila]:=comboubi.Text;
  stgplantel.Cells[15,fila]:=editlong.Text;
  stgplantel.Cells[16,fila]:=editlatt.Text;
end;

procedure Tvdatosplantel.TabSheet3Exit(Sender: TObject);
begin
  stgplantel.Cells[17,fila]:=memorese.Text;
  stgplantel.Cells[18,fila]:=memosoce.Text;
  stgplantel.Cells[19,fila]:=memosocp.Text;
end;

procedure Tvdatosplantel.TabSheet5Exit(Sender: TObject);
begin
  stgplantel.Cells[20,fila]:=comboinfra.Text;
  stgplantel.Cells[21,fila]:=combotene.Text;
  stgplantel.Cells[22,fila]:=cantmedida.Text;
  stgplantel.Cells[23,fila]:=comboplanc.Text;
  stgplantel.Cells[24,fila]:=cantaula.Text;
  stgplantel.Cells[25,fila]:=cantbano.Text;
  stgplantel.Cells[26,fila]:=cantofi.Text;
  stgplantel.Cells[27,fila]:=combococina.Text;
  stgplantel.Cells[28,fila]:=cantcd.Text;
  stgplantel.Cells[29,fila]:=cantbb.Text;
  stgplantel.Cells[30,fila]:=cantcom.Text;
  stgplantel.Cells[31,fila]:=combocerca.Text;
  stgplantel.Cells[32,fila]:=cantcbit.Text;
  stgplantel.Cells[33,fila]:=cantpiso.Text;
  stgplantel.Cells[34,fila]:=comboagb.Text;
  stgplantel.Cells[35,fila]:=comboagn.Text;
end;



end.

