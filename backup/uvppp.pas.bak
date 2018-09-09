unit uvppp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls, Grids, XMLRead, XMLWrite, DOM;

type

  { Tvppp }

  Tvppp = class(TForm)
    btnagregar1: TBitBtn;
    btncargar: TBitBtn;
    btncargar1: TBitBtn;
    btndelete1: TBitBtn;
    btnguardar1: TBitBtn;
    btnlimpiar1: TBitBtn;
    comboppp: TComboBox;
    comboform: TComboBox;
    editplantel: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    stgplantel: TStringGrid;
    stgppp: TStringGrid;
    procedure btnagregar1Click(Sender: TObject);
    procedure btncargar1Click(Sender: TObject);
    procedure btncargarClick(Sender: TObject);
    procedure btndelete1Click(Sender: TObject);
    procedure btnguardar1Click(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnlimpiar1Click(Sender: TObject);
    procedure comboformChange(Sender: TObject);
    procedure combopppChange(Sender: TObject);
    procedure combopppExit(Sender: TObject);
    procedure editplantelChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure stgplantelSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure stgpppSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vppp: Tvppp;
  fila1,fila2:Integer;

implementation

{$R *.lfm}

{ Tvppp }

procedure Tvppp.btncargarClick(Sender: TObject);
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

procedure Tvppp.btndelete1Click(Sender: TObject);
begin
  if stgppp.RowCount=2 then
   begin
     MessageDlg('No se Puede eliminar Modifique la Columna que Queda', mtWarning,[mbOK],0);
   end;

if stgppp.RowCount>2 then
 begin
  if stgppp.Cells[0,fila2]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara una Celda con Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        stgppp.DeleteRow(fila2);
       end;
  end
  else
    stgppp.DeleteRow(fila2);
 end;
end;

procedure Tvppp.btnguardar1Click(Sender: TObject);
var
Doc: TXMLDocument;
RootNode, ElementNode,ItemNode,TextNode: TDOMNode;
i,control,control2,j: integer;
nombrenodo:Array[0..50] of String;
begin

  //NOMBRE DE LOS NODOS HIJOS
  nombrenodo[0]:='plantel';
  nombrenodo[1]:='ejecutado';
  nombrenodo[2]:='formado';
  nombrenodo[3]:='cod_est';
  nombrenodo[4]:='id_ppp';

   for i:=0 to (stgppp.RowCount-1) do
     begin
        for j:=0 to (stgppp.ColCount-1) do
          begin
               if stgppp.Cells[j,i]='' then
               begin
                 stgppp.Cells[j,i]:='0';
               end;
          end;

     end;

   //GUARDAR XML DE PLANES PROYECTOS Y PROGRAMAS
     try
       // Crear el documento
       Doc := TXMLDocument.Create;
       // Crear el nodo raiz
       RootNode := Doc.CreateElement('plantel');
       Doc.Appendchild(RootNode);
       RootNode:= Doc.DocumentElement;
       control:=stgppp.RowCount;
       control2:=stgppp.ColCount;
       //CREAR LOS NODOS
       for i := 0 to (control-1) do
         begin
           ElementNode:=Doc.CreateElement('p_p_p');
             for j:=0 to (control2-1) do
               begin
                 ItemNode:=Doc.CreateElement(nombrenodo[j]);
                 TextNode:=Doc.CreateTextNode(stgppp.Cells[j,i]);
                 ItemNode.AppendChild(TextNode);
                 ElementNode.AppendChild(ItemNode);
               end;
           RootNode.AppendChild(ElementNode);
         end;
         // Guardar el XML
         WriteXMLFile(Doc,'save/plantel/plantel_ppp.xml');
         Doc.Free;
         MessageDlg('Se Ha Guardado el Archivo',mtInformation,[mbOK],0);
     Except
         MessageDlg('No se Guardo el Archivo', mtError,[mbOK],0);
     end;

end;

procedure Tvppp.btnguardarClick(Sender: TObject);
begin

end;


procedure Tvppp.btnlimpiar1Click(Sender: TObject);
var
i,j:Integer;
begin
if stgppp.Cells[0,1]<>'' then
  begin
     Beep;
     if mrYes=MessageDlg('Eliminara Todos los Registros ¿Esta Seguro?',mtConfirmation,[mbYes,mbNo],0) then
       begin
        for i:=0 to (stgppp.RowCount-1) do
           begin
              for j:=0 to (stgppp.ColCount-1) do
                begin
                     stgppp.Cells[j,i]:='';
                end;
           end;
       end;
  end
  else
     for i:=0 to (stgppp.RowCount-1) do
       begin
          for j:=0 to (stgppp.ColCount-1) do
            begin
                 stgppp.Cells[j,i]:='';
            end;
       end;

end;

procedure Tvppp.comboformChange(Sender: TObject);
begin
     stgppp.Cells[2,fila2]:=comboform.Text;
end;

procedure Tvppp.combopppChange(Sender: TObject);
begin
  stgppp.Cells[1,fila2]:=comboppp.Text;
  stgppp.Cells[0,fila2]:=editplantel.Text;
  stgppp.Cells[3,fila2]:=stgplantel.Cells[1,fila1];
  stgppp.AutoSizeColumn(0);
end;

procedure Tvppp.combopppExit(Sender: TObject);
begin
  stgppp.Cells[0,fila2]:=editplantel.Text;
  stgppp.Cells[4,fila2]:=IntToStr(comboppp.ItemIndex);
end;

procedure Tvppp.btnagregar1Click(Sender: TObject);
begin
  stgppp.RowCount:=stgppp.RowCount+1;
end;

procedure Tvppp.btncargar1Click(Sender: TObject);
var
   Doc: TXMLDocument;
   i,j: Integer;
begin
  // ARCHIVO DE LOS DATOS DEL PLANTEL
  try
   ReadXMLFile(Doc,'save/plantel/plantel_ppp.xml');
   with Doc.DocumentElement.ChildNodes do
        begin
            for i:=0 to (Count-1) do
                begin
                stgppp.RowCount:=Count;
                    for j:=0 to (Item[i].ChildNodes.Count-1) do
                        Begin
                            with Item[i].ChildNodes do
                                 begin
                                     with stgppp do
                                          begin
                                             Cells[j,i]:=Item[j].FirstChild.NodeValue;
                                          end;
                                 end;
                        end;
                end;
        Doc.Free;
        end;
   stgppp.AutoSizeColumns;
   MessageDlg('Carga Exitosa de los Datos',mtInformation,[mbOK],0);
    Except
       MessageDlg('Error al Cargar DATA, Verifique si se encuentra el archivo en el directorio "save/plantel/plantel_ppp.xml"',mtError,[mbOK],0);
     end;
end;


procedure Tvppp.editplantelChange(Sender: TObject);
begin
stgppp.AutoSizeColumn(0);

  if editplantel.Text<>'' then
    begin
      comboppp.Enabled:=true;
      comboform.Enabled:=true;
      btnlimpiar1.Enabled:=true;
      btnagregar1.Enabled:=true;
      btnguardar1.Enabled:=true;
      btncargar1.Enabled:=true;
      btndelete1.Enabled:=true;
      stgppp.Enabled:=true;
    end;
  if editplantel.Text='' then
   begin
      comboppp.Enabled:=false;
      comboform.Enabled:=false;
      btnlimpiar1.Enabled:=false;
      btnagregar1.Enabled:=false;
      btnguardar1.Enabled:=false;
      btncargar1.Enabled:=false;
      btndelete1.Enabled:=false;
      stgppp.Enabled:=false;
   end;

end;

procedure Tvppp.FormActivate(Sender: TObject);
begin
    btncargar.SetFocus;
end;

procedure Tvppp.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  beep;
  CanClose := MessageDlg('¿Realmente desea salir de la ventana?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk
end;


procedure Tvppp.stgplantelSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  fila1:=aRow;
  editplantel.Text:=stgplantel.Cells[0,aRow];
end;

procedure Tvppp.stgpppSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin
  fila2:=aRow;
  comboppp.Text:=stgppp.Cells[1,aRow];
  comboform.Text:=stgppp.Cells[2,aRow];
end;

end.

