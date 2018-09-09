unit uvnecesidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  Grids, StdCtrls, Buttons, ExtCtrls, XMLRead, XMLWrite, DOM;

type

  { Tvnecesidades }

  Tvnecesidades = class(TForm)
    btnagregar1: TBitBtn;
    btncargar1: TBitBtn;
    btndelete1: TBitBtn;
    btneditar1: TBitBtn;
    btnguardar1: TBitBtn;
    btnguardar2: TBitBtn;
    btnguardar3: TBitBtn;
    btndelete3: TBitBtn;
    btnlimpiar1: TBitBtn;
    btnlimpiar2: TBitBtn;
    btnlimpiar3: TBitBtn;
    btnagregar3: TBitBtn;
    btncargar3: TBitBtn;
    btncargar2: TBitBtn;
    btncargar: TBitBtn;
    btneditar2: TBitBtn;
    btndelete2: TBitBtn;
    bntagregar2: TBitBtn;
    btneditar3: TBitBtn;
    combofuncion: TComboBox;
    combopersonal: TComboBox;
    combomat: TComboBox;
    combounidad: TComboBox;
    combonece: TComboBox;
    ComboBox3: TComboBox;
    editcontrol: TEdit;
    editcant: TEdit;
    editcontrol1: TEdit;
    editcontrol2: TEdit;
    editplantel: TEdit;
    editcant1: TEdit;
    edittipo1: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    memodescrip: TMemo;
    memodescrip1: TMemo;
    memomat: TMemo;
    Panel2: TPanel;
    panelnecesi: TPageControl;
    Panel1: TPanel;
    stginfra: TStringGrid;
    stgplantel: TStringGrid;
    stgpersonal: TStringGrid;
    stgmateriales: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure btncargar1Click(Sender: TObject);
    procedure btncargar2Click(Sender: TObject);
    procedure btncargar3Click(Sender: TObject);
    procedure btndelete2Click(Sender: TObject);
    procedure bntagregar2Click(Sender: TObject);
    procedure btnagregar1Click(Sender: TObject);
    procedure btndelete1Click(Sender: TObject);
    procedure btncargarClick(Sender: TObject);
    procedure btndelete3Click(Sender: TObject);
    procedure btneditar1Click(Sender: TObject);
    procedure btneditar2Click(Sender: TObject);
    procedure btneditar3Click(Sender: TObject);
    procedure btnguardar1Click(Sender: TObject);
    procedure btnguardar2Click(Sender: TObject);
    procedure btnguardar3Click(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnlimpiar1Click(Sender: TObject);
    procedure btnlimpiar2Click(Sender: TObject);
    procedure btnagregar3Click(Sender: TObject);
    procedure btnlimpiar3Click(Sender: TObject);
    procedure combofuncionChange(Sender: TObject);
    procedure combofuncionExit(Sender: TObject);
    procedure combomatExit(Sender: TObject);
    procedure comboneceChange(Sender: TObject);
    procedure comboneceExit(Sender: TObject);
    procedure combomatChange(Sender: TObject);
    procedure combopersonalChange(Sender: TObject);
    procedure combopersonalExit(Sender: TObject);
    procedure combounidadExit(Sender: TObject);
    procedure editcant1Exit(Sender: TObject);
    procedure editcantExit(Sender: TObject);
    procedure editcantKeyPress(Sender: TObject; var Key: char);
    procedure editplantelChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure memodescrip1Exit(Sender: TObject);
    procedure memodescripExit(Sender: TObject);
    procedure memomatExit(Sender: TObject);
    procedure rdbadmClick(Sender: TObject);
    procedure rdbdocClick(Sender: TObject);
    procedure rdbobrClick(Sender: TObject);
    procedure stginfraSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure stgmaterialesSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure stgpersonalSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure stgplantelSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet1Enter(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vnecesidades: Tvnecesidades;
  fila1,fila2,fila3,fplantel:Integer;

implementation

{$R *.lfm}

{ Tvnecesidades }

procedure Tvnecesidades.FormActivate(Sender: TObject);
begin
  stginfra.AutoSizeColumns;
  btncargar.SetFocus;
end;

procedure Tvnecesidades.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea salir de la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;

procedure Tvnecesidades.memodescrip1Exit(Sender: TObject);
begin
  stgpersonal.Cells[3,fila2]:=memodescrip1.Text;
end;

procedure Tvnecesidades.memodescripExit(Sender: TObject);
begin
  stginfra.Cells[4,fila1]:=memodescrip.Text;
end;

procedure Tvnecesidades.memomatExit(Sender: TObject);
begin
  stgmateriales.Cells[2,fila3]:=memomat.Text;
end;

procedure Tvnecesidades.rdbadmClick(Sender: TObject);
begin

end;


procedure Tvnecesidades.rdbdocClick(Sender: TObject);
begin

end;

procedure Tvnecesidades.rdbobrClick(Sender: TObject);
begin

end;


procedure Tvnecesidades.stginfraSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
  fila1:=aRow;
  combounidad.Text:=stginfra.Cells[1,aRow];
  combonece.Text:=stginfra.Cells[2,aRow];
  editcant.Text:=stginfra.Cells[3,aRow];
  memodescrip.Clear;
  memodescrip.Text:=stginfra.Cells[4,aRow];
  //editprueba.Text:=stginfra.c;
end;

procedure Tvnecesidades.stgmaterialesSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
  fila3:=aRow;
  combomat.Text:=stgmateriales.Cells[1,aRow];
  memomat.Clear;
  memomat.Text:=stgmateriales.Cells[2,aRow];
  {if stgmateriales.Cells[2,aRow]='' then
    begin

    end; }

end;

procedure Tvnecesidades.stgpersonalSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
  fila2:=aRow;
  combopersonal.Text:=stgpersonal.Cells[7,aRow];
  combofuncion.Items.Strings[0]:=stgpersonal.Cells[1,aRow];
  combofuncion.ItemIndex:=0;
  editcant1.Text:=stgpersonal.Cells[2,fila2];
  memodescrip1.Clear;
  memodescrip1.Text:=stgpersonal.Cells[3,fila2];
end;

procedure Tvnecesidades.stgplantelSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
   fplantel:=aRow;
   editplantel.Text:=stgplantel.Cells[0,aRow];
end;

procedure Tvnecesidades.TabSheet1Enter(Sender: TObject);
begin
  memodescrip.Clear;
end;

procedure Tvnecesidades.TabSheet2Enter(Sender: TObject);
begin
  memodescrip1.Clear;
end;

procedure Tvnecesidades.TabSheet3Enter(Sender: TObject);
begin
  memomat.Clear;
end;

procedure Tvnecesidades.btncargarClick(Sender: TObject);
var
   Doc: TXMLDocument;
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
                                             Cells[0,i]:=Item[0].FirstChild.NodeValue;
                                             Cells[1,i]:=Item[8].FirstChild.NodeValue;
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
    editplantel.Text:=stgplantel.Cells[0,1];
end;

procedure Tvnecesidades.btndelete3Click(Sender: TObject);
begin

if stgmateriales.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

if stgmateriales.RowCount>2 then
 begin
  if stgmateriales.Cells[0,fila3]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        stgmateriales.DeleteRow(fila3);
       end;
  end
  else
    stgmateriales.DeleteRow(fila3);
 end;

end;

procedure Tvnecesidades.btneditar1Click(Sender: TObject);
begin
  stginfra.Cells[1,fila1]:=combounidad.Text;
  stginfra.Cells[2,fila1]:=combonece.Text;
  stginfra.Cells[3,fila1]:=editcant.Text;
  stginfra.Cells[4,fila1]:=memodescrip.Text;
  stginfra.Cells[6,fila1]:=stgplantel.Cells[1,fplantel];

end;

procedure Tvnecesidades.btneditar2Click(Sender: TObject);
begin
  stgpersonal.Cells[0,fila2]:=editplantel.Text;
  stgpersonal.Cells[1,fila2]:=combofuncion.Text;
  stgpersonal.Cells[2,fila2]:=editcant1.Text;
  stgpersonal.Cells[3,fila2]:=memodescrip1.Text;
  stgpersonal.Cells[6,fila2]:=stgplantel.Cells[1,fplantel];
end;

procedure Tvnecesidades.btneditar3Click(Sender: TObject);
begin
  stgmateriales.Cells[1,fila3]:=combomat.Text;
  stgmateriales.Cells[2,fila3]:=memomat.Text;
  stgmateriales.Cells[4,fila3]:=stgplantel.Cells[1,fplantel];
end;

procedure Tvnecesidades.btnguardar1Click(Sender: TObject);
var
Doc: TXMLDocument;
RootNode, ElementNode,ItemNode,TextNode: TDOMNode;
i,control,control2,j: integer;
nombrenodo:Array[0..50] of String;
begin
  //NOMBRE DE LOS NODOS HIJOS
  nombrenodo[0]:='plantel';
  nombrenodo[1]:='unidad';
  nombrenodo[2]:='necesidad';
  nombrenodo[3]:='cantidad';
  nombrenodo[4]:='descripcion';
  nombrenodo[5]:='identificador';
  nombrenodo[6]:='tipo';
  nombrenodo[7]:='cod_est';

   for i:=0 to (stginfra.RowCount-1) do
     begin
        for j:=0 to (stginfra.ColCount-1) do
          begin
               if stginfra.Cells[j,i]='' then
               begin
                 stginfra.Cells[j,i]:='0';
               end;
          end;

     end;

   //GUARDAR XML DE NECESIDAD DE INFRAESTRUCTURA
     try
       // Crear el documento
       Doc := TXMLDocument.Create;
       // Crear el nodo raiz
       RootNode := Doc.CreateElement('plantel');
       Doc.Appendchild(RootNode);
       RootNode:= Doc.DocumentElement;
       control:=stginfra.RowCount;
       control2:=stginfra.ColCount;
       // Crear los nodos
       for i := 0 to (control-1) do
         begin
           ElementNode:=Doc.CreateElement('necesidad_infra');
             for j:=0 to (control2-1) do
               begin
                 ItemNode:=Doc.CreateElement(nombrenodo[j]);
                 TextNode:=Doc.CreateTextNode(stginfra.Cells[j,i]);
                 ItemNode.AppendChild(TextNode);
                 ElementNode.AppendChild(ItemNode);
               end;
           RootNode.AppendChild(ElementNode);
         end;
         // Guardar el XML
         WriteXMLFile(Doc,'save/necesidades/nece_infra.xml');
         Doc.Free;
         MessageDlg('Se Ha Guardado el Archivo de la Infraestructura del Plantel',mtInformation,[mbOK],0);
     Except
         MessageDlg('No se Guardo el Archivo', mtError,[mbOK],0);
     end;

end;

procedure Tvnecesidades.btnguardar2Click(Sender: TObject);
var
Doc: TXMLDocument;
RootNode, ElementNode,ItemNode,TextNode: TDOMNode;
i,control,control2,j: integer;
nombrenodo:Array[0..50] of String;
begin
  //NOMBRE DE LOS NODOS HIJOS
  nombrenodo[0]:='plantel';
  nombrenodo[1]:='funcion';
  nombrenodo[2]:='cantidad';
  nombrenodo[3]:='descripcion';
  nombrenodo[4]:='identificador';
  nombrenodo[5]:='tipo';
  nombrenodo[6]:='cod_est';
  nombrenodo[7]:='escogido';

   for i:=0 to (stgpersonal.RowCount-1) do
     begin
        for j:=0 to (stgpersonal.ColCount-1) do
          begin
               if stgpersonal.Cells[j,i]='' then
               begin
                 stgpersonal.Cells[j,i]:='0';
               end;
          end;

     end;

   //GUARDAR XML DE NECESIDAD DE PERSONAL
     try
       // Crear el documento
       Doc := TXMLDocument.Create;
       // Crear el nodo raiz
       RootNode := Doc.CreateElement('plantel');
       Doc.Appendchild(RootNode);
       RootNode:= Doc.DocumentElement;
       control:=stgpersonal.RowCount;
       control2:=stgpersonal.ColCount;
       // Crear los nodos
       for i := 0 to (control-1) do
         begin
           ElementNode:=Doc.CreateElement('necesidad_personal');
             for j:=0 to (control2-1) do
               begin
                 ItemNode:=Doc.CreateElement(nombrenodo[j]);
                 TextNode:=Doc.CreateTextNode(stgpersonal.Cells[j,i]);
                 ItemNode.AppendChild(TextNode);
                 ElementNode.AppendChild(ItemNode);
               end;
           RootNode.AppendChild(ElementNode);
         end;
         // Guardar el XML
         WriteXMLFile(Doc,'save/necesidades/nece_personal.xml');
         Doc.Free;
         MessageDlg('Se Ha Guardado el Archivo del Personal del Plantel',mtInformation,[mbOK],0);
     Except
         MessageDlg('No se Guardo el Archivo', mtError,[mbOK],0);
     end;

end;

procedure Tvnecesidades.btnguardar3Click(Sender: TObject);
var
Doc: TXMLDocument;
RootNode, ElementNode,ItemNode,TextNode: TDOMNode;
i,control,control2,j: integer;
nombrenodo:Array[0..50] of String;
begin
  //NOMBRE DE LOS NODOS HIJOS
  nombrenodo[0]:='plantel';
  nombrenodo[1]:='necesidad';
  nombrenodo[2]:='descripcion';
  nombrenodo[3]:='identificador';
  nombrenodo[4]:='cod_est';

   for i:=0 to (stgmateriales.RowCount-1) do
     begin
        for j:=0 to (stgmateriales.ColCount-1) do
          begin
               if stgmateriales.Cells[j,i]='' then
               begin
                 stgmateriales.Cells[j,i]:='0';
               end;
          end;

     end;

   //GUARDAR XML DE NECESIDAD DE MATERIAL
     try
       // Crear el documento
       Doc := TXMLDocument.Create;
       // Crear el nodo raiz
       RootNode := Doc.CreateElement('plantel');
       Doc.Appendchild(RootNode);
       RootNode:= Doc.DocumentElement;
       control:=stgmateriales.RowCount;
       control2:=stgmateriales.ColCount;
       // Crear los nodos
       for i := 0 to (control-1) do
         begin
           ElementNode:=Doc.CreateElement('necesidad_material');
             for j:=0 to (control2-1) do
               begin
                 ItemNode:=Doc.CreateElement(nombrenodo[j]);
                 TextNode:=Doc.CreateTextNode(stgmateriales.Cells[j,i]);
                 ItemNode.AppendChild(TextNode);
                 ElementNode.AppendChild(ItemNode);
               end;
           RootNode.AppendChild(ElementNode);
         end;
         // Guardar el XML
         WriteXMLFile(Doc,'save/necesidades/nece_material.xml');
         Doc.Free;
         MessageDlg('Se Ha Guardado el Archivo',mtInformation,[mbOK],0);
     Except
         MessageDlg('No se Guardo el Archivo', mtError,[mbOK],0);
     end;

end;

procedure Tvnecesidades.btnguardarClick(Sender: TObject);
begin

end;

procedure Tvnecesidades.btnlimpiar1Click(Sender: TObject);
var
i,j:Integer;
begin
if stginfra.Cells[0,1]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara Todos los Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        for i:=0 to (stginfra.RowCount-1) do
           begin
              for j:=0 to (stginfra.ColCount-1) do
                begin
                     stginfra.Cells[j,i]:='';
                end;
           end;
       end;
  end
  else
     for i:=0 to (stginfra.RowCount-1) do
       begin
          for j:=0 to (stginfra.ColCount-1) do
            begin
                 stginfra.Cells[j,i]:='';
            end;
       end;
end;

procedure Tvnecesidades.btnlimpiar2Click(Sender: TObject);
var
i,j:Integer;
begin
if stgpersonal.Cells[0,1]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara Todos los Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        for i:=0 to (stgpersonal.RowCount-1) do
           begin
              for j:=0 to (stgpersonal.ColCount-1) do
                begin
                     stgpersonal.Cells[j,i]:='';
                end;
           end;
       end;
  end
  else
     for i:=0 to (stgpersonal.RowCount-1) do
       begin
          for j:=0 to (stgpersonal.ColCount-1) do
            begin
                 stgpersonal.Cells[j,i]:='';
            end;
       end;
end;

procedure Tvnecesidades.btnagregar3Click(Sender: TObject);
begin
  stgmateriales.RowCount:=stgmateriales.RowCount+1;
end;

procedure Tvnecesidades.btnlimpiar3Click(Sender: TObject);
var
i,j:Integer;
begin
if stgmateriales.Cells[0,1]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara Todos los Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        for i:=0 to (stgmateriales.RowCount-1) do
           begin
              for j:=0 to (stgmateriales.ColCount-1) do
                begin
                     stgmateriales.Cells[j,i]:='';
                end;
           end;
       end;
  end
  else
     for i:=0 to (stgmateriales.RowCount-1) do
       begin
          for j:=0 to (stgmateriales.ColCount-1) do
            begin
                 stgmateriales.Cells[j,i]:='';
            end;
       end;
end;

procedure Tvnecesidades.combofuncionChange(Sender: TObject);
begin

   if combofuncion.Items[combofuncion.ItemIndex]='DIRECTOR' then
     begin
         editcontrol1.Text:=IntToStr(14);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='SUBDIRECTOR' then
     begin
         editcontrol1.Text:=IntToStr(15);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='COORD. DEL PLANTEL' then
     begin
         editcontrol1.Text:=IntToStr(16);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='COOR. P.A.E.' then
     begin
         editcontrol1.Text:=IntToStr(17);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='COOR. PEDAG' then
     begin
         editcontrol1.Text:=IntToStr(18);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOCENTE EN AULA' then
     begin
         editcontrol1.Text:=IntToStr(19);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. ED. FISICA' then
     begin
         editcontrol1.Text:=IntToStr(20);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. ED. MUSICA' then
     begin
         editcontrol1.Text:=IntToStr(21);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='DOC. EDU. ESPECIAL' then
     begin
         editcontrol1.Text:=IntToStr(22);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='TEC. AGROPECUARIO' then
     begin
         editcontrol1.Text:=IntToStr(23);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. INGLES' then
     begin
         editcontrol1.Text:=IntToStr(24);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. BIBLIOTECARIO' then
     begin
         editcontrol1.Text:=IntToStr(25);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. COMPUTACION' then
     begin
         editcontrol1.Text:=IntToStr(26);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. AJEDRES' then
     begin
         editcontrol1.Text:=IntToStr(27);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='DOC. DANZA' then
     begin
         editcontrol1.Text:=IntToStr(28);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. TEATRO' then
     begin
         editcontrol1.Text:=IntToStr(29);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='DOC. MANUALIDADES' then
     begin
         editcontrol1.Text:=IntToStr(30);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='DOC. ADMINISTRATIVO' then
     begin
         editcontrol1.Text:=IntToStr(31);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='ORIENTADOR' then
     begin
         editcontrol1.Text:=IntToStr(32);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='ADMINISTRATIVO' then
     begin
         editcontrol1.Text:=IntToStr(12);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='AUX. DE PREESCOLAR' then
     begin
         editcontrol1.Text:=IntToStr(13);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='ASEADOR' then
     begin
         editcontrol1.Text:=IntToStr(33);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='VIGILANTE' then
     begin
         editcontrol1.Text:=IntToStr(34);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='JARDINERO' then
     begin
         editcontrol1.Text:=IntToStr(35);
     end;
      if combofuncion.Items[combofuncion.ItemIndex]='CHOFER' then
     begin
         editcontrol1.Text:=IntToStr(36);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='PORTERO' then
     begin
         editcontrol1.Text:=IntToStr(37);
     end;
   if combofuncion.Items[combofuncion.ItemIndex]='OBR. FUN. ADMINISTRATIVA' then
     begin
         editcontrol1.Text:=IntToStr(38);
     end;

   if combofuncion.Items[combofuncion.ItemIndex]='' then
     begin
         editcontrol1.Text:='';
     end;
   stgpersonal.Cells[4,fila2]:=editcontrol1.Text;

end;

procedure Tvnecesidades.combofuncionExit(Sender: TObject);
begin
   stgpersonal.Cells[1,fila2]:=combofuncion.Text;
   stgpersonal.AutoSizeColumns;
end;

procedure Tvnecesidades.combomatExit(Sender: TObject);
begin
  stgmateriales.Cells[1,fila3]:=combomat.Text;
  stgmateriales.Cells[0,fila3]:=editplantel.Text;
  stgmateriales.Cells[4,fila3]:=stgplantel.Cells[1,fplantel];
  stgmateriales.AutoSizeColumns;
end;

procedure Tvnecesidades.comboneceChange(Sender: TObject);
begin
   if combonece.Items[combonece.ItemIndex]='CONSTRUCCION' then
     begin
         editcontrol.Text:=IntToStr(4);
     end;
   if combonece.Items[combonece.ItemIndex]='AMPLIACION' then
     begin
         editcontrol.Text:=IntToStr(5);
     end;
   if combonece.Items[combonece.ItemIndex]='REHABILITACION' then
     begin
         editcontrol.Text:=IntToStr(6);
     end;
   if combonece.Items[combonece.ItemIndex]='' then
     begin
         editcontrol.Text:='';
     end;
   stginfra.Cells[5,fila1]:=editcontrol.Text;
end;

procedure Tvnecesidades.btnagregar1Click(Sender: TObject);
begin
  stginfra.RowCount:=stginfra.RowCount+1;
end;

procedure Tvnecesidades.bntagregar2Click(Sender: TObject);
begin
  stgpersonal.RowCount:=stgpersonal.RowCount+1;
end;

procedure Tvnecesidades.btndelete2Click(Sender: TObject);
begin

if stgpersonal.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

if stgpersonal.RowCount>2 then
 begin
  if stgpersonal.Cells[0,fila2]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        stgpersonal.DeleteRow(fila2);
       end;
  end
  else
    stgpersonal.DeleteRow(fila2);
 end;

end;

procedure Tvnecesidades.btncargar1Click(Sender: TObject);
var
Doc: TXMLDocument;
i,j: Integer;
begin
  // ARCHIVO DE LOS DATOS DEL PLANTEL
  try
   ReadXMLFile(Doc,'save/necesidades/nece_infra.xml');
   with Doc.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                stginfra.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with stginfra do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;
                                 end;
                        end;
                end;
        Doc.Free;
        end;
   stginfra.AutoSizeColumns;
   MessageDlg('Carga Exitosa',mtInformation,[mbOK],0);
    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "save/necesidades/nece_infra.xml"',mtError,[mbOK],0);
     end;

end;

procedure Tvnecesidades.btncargar2Click(Sender: TObject);
var
Doc: TXMLDocument;
i,j: Integer;
begin
  // ARCHIVO DE LOS DATOS DEL PLANTEL
  try
   ReadXMLFile(Doc,'save/necesidades/nece_personal.xml');
   with Doc.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                stgpersonal.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with stgpersonal do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;
                                 end;
                        end;
                end;
        Doc.Free;
        end;
   stgpersonal.AutoSizeColumns;
   MessageDlg('Carga Exitosa',mtInformation,[mbOK],0);
    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "save/necesidades/nece_personal.xml"',mtError,[mbOK],0);
     end;

end;

procedure Tvnecesidades.btncargar3Click(Sender: TObject);
var
Doc: TXMLDocument;
i,j: Integer;
begin
  // ARCHIVO DE LOS DATOS DEL PLANTEL
  try
   ReadXMLFile(Doc,'save/necesidades/nece_material.xml');
   with Doc.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                stgmateriales.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with stgmateriales do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;
                                 end;
                        end;
                end;
        Doc.Free;
        end;
   stgmateriales.AutoSizeColumns;
   MessageDlg('Carga Exitosa',mtInformation,[mbOK],0);
    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "save/necesidades/nece_material.xml"',mtError,[mbOK],0);
     end;

end;

procedure Tvnecesidades.btndelete1Click(Sender: TObject);
begin

if stginfra.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

if stginfra.RowCount>2 then
 begin
  if stginfra.Cells[0,fila1]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        stginfra.DeleteRow(fila1);
       end;
  end
  else
    stginfra.DeleteRow(fila1);
 end;
end;

procedure Tvnecesidades.comboneceExit(Sender: TObject);
begin
   stginfra.Cells[2,fila1]:=combonece.Text;
   stginfra.AutoSizeColumns;

end;

procedure Tvnecesidades.combomatChange(Sender: TObject);
begin

  if combomat.Items[combomat.ItemIndex]<>'' then
    begin
       memomat.Enabled:=True;
    end
  else
       memomat.Enabled:=false;

  //ASIGNANDO IDENTIFICADOR DE LOS MATERIALES

  if combomat.Items[combomat.ItemIndex]='ARTICULOS DE OFICINA' then
     begin
         editcontrol2.Text:=IntToStr(7);
     end;
   if combomat.Items[combomat.ItemIndex]='ARTICULOS DE LIMPIEZA' then
     begin
         editcontrol2.Text:=IntToStr(8);
     end;
   if combomat.Items[combomat.ItemIndex]='ARTICULOS DEPORTIVOS' then
     begin
         editcontrol2.Text:=IntToStr(9);
     end;
   if combomat.Items[combomat.ItemIndex]='MOBILIARIO DE OFICINA ' then
     begin
         editcontrol2.Text:=IntToStr(10);
     end;
   if combomat.Items[combomat.ItemIndex]='MESAS SILLAS' then
     begin
         editcontrol2.Text:=IntToStr(11);
     end;
   if combomat.Items[combomat.ItemIndex]='' then
     begin
         editcontrol2.Text:='';
     end;
   stgmateriales.Cells[3,fila3]:=editcontrol2.Text;

end;

procedure Tvnecesidades.combopersonalChange(Sender: TObject);
begin

   if combopersonal.Items[combopersonal.ItemIndex]='DOCENTE' then
     begin
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

   if combopersonal.Items[combopersonal.ItemIndex]='ADMINISTRATIVO' then
     begin
      combofuncion.Items.Clear;
      combofuncion.AddItem('',nil);
      combofuncion.AddItem('ADMINISTRATIVO',nil);
      combofuncion.AddItem('AUX. DE PREESCOLAR',nil);
      combofuncion.ItemIndex:=0;
     end;

   if combopersonal.Items[combopersonal.ItemIndex]='OBRERO' then
     begin
      combofuncion.Items.Clear;
      combofuncion.AddItem('',nil);
      combofuncion.AddItem('ASEADOR',nil);
      combofuncion.AddItem('VIGILANTE',nil);
      combofuncion.AddItem('JARDINERO',nil);
      combofuncion.AddItem('CHOFER',nil);
      combofuncion.AddItem('PORTERO',nil);
      combofuncion.AddItem('OBR. FUN. ADMINISTRATIVA',nil);
      combofuncion.ItemIndex:=0;
     end;
   if combopersonal.Items[combopersonal.ItemIndex]='' then
     begin
       combofuncion.Items.Clear;
     end;

   //ASIGNAR IDENTIFICADOR DEL TIPO DE PERSONAL


   if combopersonal.Items[combopersonal.ItemIndex]='DOCENTE' then
     begin
         edittipo1.Text:=IntToStr(2);
     end;
   if combopersonal.Items[combopersonal.ItemIndex]='ADMINISTRATIVO' then
     begin
         edittipo1.Text:=IntToStr(0);
     end;
   if combopersonal.Items[combopersonal.ItemIndex]='OBRERO' then
     begin
         edittipo1.Text:=IntToStr(1);
     end;
   if combopersonal.Items[combopersonal.ItemIndex]='' then
     begin
         edittipo1.Text:='';
     end;
   stgpersonal.Cells[5,fila2]:=edittipo1.Text;

end;

procedure Tvnecesidades.combopersonalExit(Sender: TObject);
begin
  stgpersonal.Cells[0,fila2]:=editplantel.Text;
  stgpersonal.Cells[6,fila2]:=stgplantel.Cells[1,fplantel];
  stgpersonal.Cells[7,fila2]:=combopersonal.Text;
  stgpersonal.AutoSizeColumns;
end;


procedure Tvnecesidades.combounidadExit(Sender: TObject);
begin
  stginfra.Cells[1,fila1]:=combounidad.Text;
  stginfra.Cells[0,fila1]:=editplantel.Text;
  stginfra.Cells[6,fila1]:=stgplantel.Cells[1,fplantel];
  stginfra.AutoSizeColumns;
end;

procedure Tvnecesidades.editcant1Exit(Sender: TObject);
begin
   stgpersonal.Cells[2,fila2]:=editcant1.Text;
end;

procedure Tvnecesidades.editcantExit(Sender: TObject);
begin
  stginfra.Cells[3,fila1]:=editcant.Text;
  stginfra.AutoSizeColumns;
end;

procedure Tvnecesidades.editcantKeyPress(Sender: TObject; var Key: char);
begin
    if not (key in ['0'..'9',#7, #8, #13]) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure Tvnecesidades.editplantelChange(Sender: TObject);
begin
    if editplantel.Text<>'' then
      begin
         panelnecesi.Enabled:=true;
      end
    else
         panelnecesi.Enabled:=false;
end;



end.

