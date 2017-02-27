Function LoadAFile : String;
Var
   OpenDialog : TOpenDialog;
Begin
     Result := '';
     OpenDialog := TOpenDialog.Create(nil);
     OpenDialog.InitialDir := 'C:\';
     // Display the OpenDialog component
     OpenDialog.Filter := 'XML Files|*.XML|All Files|*';
     OpenDialog.Execute;
     // Obtain the file name of the selected file.
     Result := OpenDialog.Filename;
     OpenDialog.Free;
End;

Function SaveAFile : String;
Var
   SaveDialog : TSaveDialog;
Begin
     Result := '';
     SaveDialog := TSaveDialog.Create(nil);
     SaveDialog.InitialDir := 'C:\';
     // Display the OpenDialog component
     SaveDialog.Filter := 'XML Files|*.XML|All Files|*';
     SaveDialog.Execute;
     // Obtain the file name of the selected file.
     Result := SaveDialog.Filename;
     SaveDialog.Free;
End;

Function UnitToString2(U : TUnit;) : TPCBString;
var
   i     :int;
Begin
     Result := '';
     Case U of 1 : Result := 'mil'; 0 : Result := 'mm';
     End;
End;

Procedure AddHeader(XMLIn : TStringList; FileS : String; UnitsDist : String;); // Форимрование заголовка
uses  DateUtils,SysUtils;
Var
   Times                : String;
   Date                 : String;
   Version              : String;
Begin
     Version := '1.1.3';
     Date := 'dd.mm.yyyy';
     //Times := DateTimeToStr(Time);
     Times := GetCurrentTimeString();

     //*******Заголовок XML Файла********//
     XMLIn.Add('<?xml version="1.0" encoding="UTF-8"?>');
     XMLIn.Add('');
     XMLIn.Add('<!--**********************************************************************-->');
     XMLIn.Add('<!--   File    :' + FileS +' -->');
     XMLIn.Add('<!--   Format  : TopoR PCB file                                           -->');
     XMLIn.Add('<!--   Version : '+Version+'                                                    -->');
     XMLIn.Add('<!--   Program : Altium Designer Script by Wolfit                         -->');
     XMLIn.Add('<!--   Date    : '+FormatDateTime(Date,Now)+'                                               -->');
     XMLIn.Add('<!--   Time    : ' +  Times  + '                                                 -->');
     XMLIn.Add('<!--**********************************************************************-->');
     XMLIn.Add('');

     XMLIn.Add('<TopoR_PCB_File>');  // Создаем основание дерева

     //*******Заголовок <Header> согласно формата fst********//
     XMLIn.Add(#9+'<Header>');
     XMLIn.Add(#9+#9+'<Format>TopoR PCB file</Format>');
     XMLIn.Add(#9+#9+'<Version>'+Version+'</Version>');
     XMLIn.Add(#9+#9+'<Program>Altium Designer Script by Wolfit</Program>');
     XMLIn.Add(#9+#9+'<Date>'+FormatDateTime(Date,Now)+' ' + Times +'</Date>');
     XMLIn.Add(#9+#9+'<OriginalFormat>Altium Designer API</OriginalFormat>');
     XMLIn.Add(#9+#9+'<OriginalFile>'+ FileS + '</OriginalFile>');
     XMLIn.Add(#9+#9+'<Units dist="'+UnitsDist+'" time="ps"/>');
     XMLIn.Add(#9+'</Header>');
End;

Function LayerIDtoStr(LayerID : TLayer;) : String;    // преобразование типа слоя в текстовый формат
begin
           Result := 'Doc';
           Case LayerID of
                1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,
                25,26,27,28,29,30,31,32 :  Result := 'Signal';
                0                       :  Result := 'Dielectric';
                35,36                   :  Result := 'Paste';
                33,34                   :  Result := 'Silk';
                37,38                   :  Result := 'Mask';
                39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,
                54                      :  Result := 'Plane';
           end;
end;

Procedure AddLayers(XMLIn : TStringList;  Stack : IPCB_LayerStack; Units: String;);    //формирование слоев
uses SysUtils;
var
 LyrObj                   : IPCB_LayerObject;
 LyrSign                  : IPCB_SignalLayer;
 LyrMask                  : IPCB_SolderMaskLayer;
 LyrDiel                  : IPCB_DielectricLayer;
 LyrMeh                   : IPCB_MechanicalLayer;
 LyrClass                 : TlayerClassID;
 LayerName                : String;
 LayerThickness           : String;
 LayerTypeStr             : String;
 LayerType                : Tlayer;
Begin
     LyrClass := eLayerClass_Physical;        // задаем тип слоя
     LyrObj := Stack.First(LyrClass);         // получаем первый слой


     XMLIn.Add(#9+'<Layers version="1.1">');
     XMLIn.Add(#9+#9+'<StackUpLayers>');
     If LyrObj = Nil then
     Begin
          ShowError('Отсутствуют слои типа: ' + FloatToStr(LyrClass));
          exit;
     End;
     //*******Получаем все физические слои********//
     Repeat
           LayerName := LyrObj.Name;

           LayerThickness := FloatToStrF(0,ffFixed,3,3);;
           LayerTypeStr := LayerIDtoStr(LyrObj.LayerID);

           if ((LayerTypeStr =  'Signal') or (LayerTypeStr =  'Plane')) then
           begin
                LyrSign := LyrObj;
                LayerThickness := FloatToStr(LyrSign.CopperThickness / 10000);
                if Units = 'mm' then  LayerThickness := FloatToStrF(LyrSign.CopperThickness / 10000 * 0.0254,ffFixed,3,3);
           end;

           if LayerTypeStr =  'Mask' then
           begin
                LyrMask := LyrObj;
                LayerThickness := FloatToStr(lyrMask.DielectricHeight / 10000);
                if Units = 'mm' then  LayerThickness := FloatToStrF(lyrMask.DielectricHeight / 10000 * 0.0254,ffFixed,3,3);
           end;

           if LayerTypeStr =  'Dielectric' then
           begin
                LyrDiel := LyrObj;
                LayerThickness := FloatToStr(LyrDiel.DielectricHeight / 10000);
                if Units = 'mm' then  LayerThickness := FloatToStrF(LyrDiel.DielectricHeight / 10000 * 0.0254,ffFixed,3,3);
           end;

           LayerThickness := StringReplace(LayerThickness, ',', '.', rfReplaceAll);
           //LayerStr := Layer2String(LayerType);
           XMLIn.Add(#9+#9+#9+'<Layer name="'+LayerName+'" type="'+LayerTypeStr+'" thickness="'+LayerThickness+'"/>');
           LyrObj := Stack.Next(LyrClass, LyrObj)
     Until LyrObj = Nil;
     XMLIn.Add(#9+#9+'</StackUpLayers>');

     //*******Получаем все механические слои********//
     XMLIn.Add(#9+#9+'<UnStackLayers>');

     for LayerType := eMechanical1 to eMechanical16 do
     begin
        LyrMeh := Stack.LayerObject[LayerType];
        If LyrMeh.MechanicalLayerEnabled  then
        XMLIn.Add(#9+#9+#9+'<Layer name="'+LyrMeh.Name+'" type="Doc"/>');
     end;
     XMLIn.Add(#9+#9+'</UnStackLayers>');
     XMLIn.Add(#9+'</Layers>');
End;

Function PadTemplate(Pad : IPCB_Pad; TUnit : TUnit;) : String;    //функция получения типа пада  !!!
Var
FirstSimbol    : String;
SecondSimbol   : String;
XSize          : TReal;
YSize          : TReal;
XSizeStr       : String;
YSizeStr       : String;
Shape          : String;
PadSurf        : Boolean;
Pad2           : IPCB_Pad2;
Radius         : TReal;
ShapeType      : Tshape;
CornerPercent  : Integer;
Begin
     Pad2 := Pad;
     Shape := '';
     //Нужно будет обработать случаи с разными формами в зависимости от стека
     If Pad.IsSurfaceMount = True then
     Begin
          FirstSimbol := 'r';
          XSize := CoordToMMs(Pad.XSizeOnLayer[1])*100;
          YSize := CoordToMMs(Pad.YSizeOnLayer[1])*100;
          XSizeStr := floattostr(XSize);
          YSizeStr := floattostr(YSize);

          Radius := CoordToMMs(Pad2.CornerRadius[1]);
          CornerPercent := Radius*2*100/XSize*100;

          ShapeType := Pad.ShapeOnLayer[1];
          Case ShapeType of
               eRectangular    : Shape := '';
               eOctagonal      : Shape := 'c'+'50';
               eRounded        : Shape := 'r'+'100';
               eRoundedRectangular : Shape := 'r'+IntToStr(CornerPercent);
          End;
     Result := FirstSimbol + XsizeStr+ '_'+YsizeStr+ Shape;
     End;

     If Pad.IsSurfaceMount = False then
     Begin
          FirstSimbol := 's';
          XSize := CoordToMMs(Pad.XSizeOnLayer[1])*100;
          XSizeStr := floattostr(XSize);
          Radius := CoordToMMs(Pad2.CornerRadius[1]);
          CornerPercent := Radius*2*100/XSize*100;

          ShapeType := Pad.ShapeOnLayer[1];
          if ShapeType = eRounded then FirstSimbol := 'c';

          Case ShapeType of
               eRectangular    : Shape := 'h90';
               eOctagonal      : Shape := 'h90c50';
               eRounded        : Shape := 'h90';
               eRoundedRectangular : Shape := 'h90r'+IntToStr(CornerPercent);
          End;

          Result := FirstSimbol + XsizeStr+ Shape;
    End;

End;

Function TrackToXML(Board :IPCB_Board; Track : IPCB_Track; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Detail lineWidth="'+FloatToStr(CoordToMMs(Track.Width))+'">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Track.Layer)+'" name="'+Board.LayerName(Track.Layer)+'"/>');//ИМя!
  ResultString.Add(StringTab+#9+'<Line>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x1 ))+'" y="'+FloatToStr(CoordToMMs( Track.y1))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x2 ))+'" y="'+FloatToStr(CoordToMMs( Track.y2))+'"/>');
  ResultString.Add(StringTab+#9+'</Line>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

Function FillToXML(Board :IPCB_Board; Fill : IPCB_Fill; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Detail lineWidth="0.001">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Fill.Layer)+'" name="'+Board.LayerName(Fill.Layer)+'"/>');//ИМя!
  ResultString.Add(StringTab+#9+'<Polygon>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X1Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y1Location))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X1Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y2Location))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X2Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y2Location))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X2Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y1Location))+ '"/>');
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

Function PolygonToXML(Board :IPCB_Board; Poly : IPCB_Polygon; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
 AStartX   : TCoord;
 AStartY   : TCoord;
 AEndX     : TCoord;
 AEndY     : TCoord;
 AMidX     : TCoord;
 AMidY     : TCoord;
 Temp      : float;

Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Detail lineWidth="0.001">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Poly.Layer)+'" name="'+Board.LayerName(Poly.Layer)+'"/>');//ИМя!
  ResultString.Add(StringTab+#9+'<Polygon>');
  For I := 0 To Poly.PointCount - 1 Do //перебор всех примитивов
  Begin
    If Poly.Segments[I].Kind = ePolySegmentLine Then  // Если сегмент представляет собой линию
    Begin
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Poly.Segments[I].vx ))+'" y="'+FloatToStr(CoordToMMs( Poly.Segments[I].vy))+ '"/>');
    End
    Else  // если дуга то описываем ее через 5 точек
    Begin
      AStartX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AStartY := Poly.Segments[I].cy;
      AEndX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AEndY := Poly.Segments[I].cy;
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AStartX,AStartY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle1);
      RotateCoordsAroundXY(AEndX,AEndY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle2);
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/4));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AStartX ))+'" y="'+FloatToStr(CoordToMMs( AStartY))+ '"/>'); // Точка в начале дуги
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // точка в 1/4 дуги
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/2));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // точка в 1/2 дуги
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*3/4));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // точка в 3/4 дуги
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // точка в конце дуги
    End;
  End;
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

Function RegionToXML(Board :IPCB_Board; Region : IPCB_Region; TabCount: integer;) : TStringList;  // пока не работает.. нужно разобраться
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
 AStartX   : TCoord;
 AStartY   : TCoord;
 AEndX     : TCoord;
 AEndY     : TCoord;
 AMidX     : TCoord;
 AMidY     : TCoord;
 Temp      : float;
 Poly      : IPCB_Polygon;

Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  Poly := Region.Polygon;
  I := Region.Polygon.PointCount;  // По какой то причине для региона не передается свойство полигон!
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Detail lineWidth="0.001">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Region.Layer)+'" name="'+Board.LayerName(Region.Layer)+'"/>');//ИМя!
  ResultString.Add(StringTab+#9+'<Polygon>');
  For I := 0 To Poly.PointCount - 1 Do //перебор всех примитивов
  Begin
    If Poly.Segments[I].Kind = ePolySegmentLine Then  // Если сегмент представляет собой линию
    Begin
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Poly.Segments[I].vx ))+'" y="'+FloatToStr(CoordToMMs( Poly.Segments[I].vy))+ '"/>');
    End
    Else  // если дуга то описываем ее через 5 точек
    Begin
      AStartX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AStartY := Poly.Segments[I].cy;
      AEndX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AEndY := Poly.Segments[I].cy;
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AStartX,AStartY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle1);
      RotateCoordsAroundXY(AEndX,AEndY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle2);
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/4));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AStartX ))+'" y="'+FloatToStr(CoordToMMs( AStartY))+ '"/>'); // Точка в начале дуги
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // точка в 1/4 дуги
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/2));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // точка в 1/2 дуги
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*3/4));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // точка в 3/4 дуги
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // точка в конце дуги
    End;
  End;
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;
 //нужно отфильтровать текст принадлижащий компонентам!
Function TextToXML(Board :IPCB_Board; Text : IPCB_Text; TabCount: integer; FileXmlTSt : TStringList;)  : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
 TextStyle    : String;
 TextMirror   : String;
 PozTextStyle : integer;
 TestString   : String;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  TextStyle := 'Arial'+ FloatToStr(CoordToMMs(Text.Size)*100);
  PozTextStyle := 0;
  PozTextStyle := Pos(TextStyle, FileXmlTSt.Text);
  if  PozTextStyle = 0 then  //если текстового стиля нет то создаем
  begin
  FileXmlTSt.Add(#9+#9+'<TextStyle name="'+TextStyle+ '" fontName="Arial" height="'+FloatToStr(CoordToMMs(Text.Size))+'"/>');
  end;  //конец созадния нового текстового стиля

  //заполняем текстовую информацию
  TextMirror := 'off';
  if Text.MirrorFlag = true then TextMirror := 'on';
  ResultString.Add(StringTab+'<Text text="'+Text.Text+'" align="LB" angle="'+inttostr(Text.Rotation)+'" mirror="'+TextMirror+'">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Text.Layer)+'" name="'+Board.LayerName(Text.Layer)+'"/>');//ИМя!
  ResultString.Add(StringTab+#9+'<TextStyleRef name="'+TextStyle+'"/>');
  ResultString.Add(StringTab+#9+'<Org x="'+FloatToStr(CoordToMMs(Text.X1Location))+'" y="'+FloatToStr(CoordToMMs(Text.X1Location))+'"/>');
  ResultString.Add(StringTab+'</Text>');
  Result := ResultString;
End;


Function ArcToXML(Board :IPCB_Board; Arc : IPCB_Arc; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;

  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Detail lineWidth="'+FloatToStr(CoordToMMs(Arc.LineWidth))+'">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Arc.Layer)+'" name="'+Board.LayerName(Arc.Layer)+'"/>');//ИМя!
  if (Arc.StartAngle = 0 & Arc.EndAngle = 360) then // Если полный круг
  Begin
  ResultString.Add(StringTab+#9+'<Circle diameter="'+FloatToStr(CoordToMMs(Arc.Radius*2))+'">');
  ResultString.Add(StringTab+#9+#9+'<Center x="'+FloatToStr(CoordToMMs(Arc.XCenter))+'" y="'+FloatToStr(CoordToMMs( Arc.YCenter))+'"/>');
  ResultString.Add(StringTab+#9+'</Circle>');
  End
  Else  // Если разорванный круг
  Begin
  ResultString.Add(StringTab+#9+'<Arc>');
  ResultString.Add(StringTab+#9+#9+'<Center x="'+FloatToStr(CoordToMMs( Arc.XCenter))+'" y="'+FloatToStr(CoordToMMs( Arc.YCenter))+'"/>');
  ResultString.Add(StringTab+#9+#9+'<Start x="'+FloatToStr(CoordToMMs( Arc.StartX ))+'" y="'+FloatToStr(CoordToMMs( Arc.StartY))+'"/>');
  ResultString.Add(StringTab+#9+#9+'<End x="'+FloatToStr(CoordToMMs( Arc.EndX))+'" y="'+FloatToStr(CoordToMMs( Arc.EndY ))+'"/>');
  ResultString.Add(StringTab+#9+'</Arc>');
  End;
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;

End;

// да эту процедурку можно было разбить еще штук на 5.. но как-то несложилось;) думал что с компонентами проще будет разобраться
Procedure AddLL(XMLInL : TStringList; Board : IPCB_Board; Units: String; FileXmlTSt : TStringList;FileXMLCOB : TStringList; ViastacksLL : TStringList;);  // Компоненты
uses SysUtils;
Var // жуть...
   Padstacks               : TStringList;
   Footprints              : TStringList;
   Components              : TStringList;
   Packages                : TStringList;
   Component               : IPCB_Component;
   ComponentIteratorHandle : IPCB_BoardIterator;
   TrackCount              : Integer;
   ComponentCount          : Integer;
   padNum                  : Integer;
   Track                   : IPCB_Track;
   Arc                     : IPCB_Arc;
   Poly                    : IPCB_Polygon;
   Text                    : IPCB_Text;
   Pad                     : IPCB_Pad;
   IteratorHandle          : IPCB_GroupIterator;
   PadIteratorHandle       : IPCB_GroupIterator;
   TextIteratorHandle      : IPCB_GroupIterator;
   NameComp                : String;
   TestString              : String;
   PadAngle                : String;
   PadStackName            : String;
   PozPadstack             : Integer;
   PadStacksAllName        : String;
   Padx                    : String;
   PadxReal                : Treal;
   PadY                    : String;
   PadYReal                : Treal;
   PadTypeSurf             : String;
   PadPlated               : String;
   padType                 : String;
   ShapeType               : TShape;
   Pad2                    : IPCB_Pad2;
   TextStyle               : String;
   PozTextStyle            : String;
   TextMirror              : String;
   TextLayer               : IPCB_LayerObject;
   TextLayerType           : String;
   TextX                   : String;
   TextY                   : String;
   LyrTV6                  : TV6_Layer;
   lyrObj                  : PCB_LayerObject;
   I                       : Integer;
   CompFix                 : String;

Begin
     TrackCount := 0;
     padNum     := 0;
     ComponentCount := 0;
     PadStacksAllName := '';
     XMLInL.Add(#9+'<LocalLibrary version="1.1">');
     FileXMLCOB.Add(#9+'<ComponentsOnBoard version="1.1">');
     Padstacks := TStringList.Create;
     Footprints := TStringList.Create;
     Components := TStringList.Create;
     Packages  := TStringList.Create;
     Padstacks.Add(#9+#9+'<Padstacks>');
     Footprints.Add(#9+#9+'<Footprints>');
     Components.Add(#9+#9+'<Components>');
     FileXMLCOB.Add(#9+#9+'<Components>');
     Packages.Add(#9+#9+'<Packages>');

     //*******Инизиализация перебора всех компонентов на плате на всех слоях********//
     ComponentIteratorHandle := Board.BoardIterator_Create;
     ComponentIteratorHandle.AddFilter_ObjectSet(MkSet(eComponentObject));
     ComponentIteratorHandle.AddFilter_LayerSet(AllLayers);
     ComponentIteratorHandle.AddFilter_Method(eProcessAll);
     Component := ComponentIteratorHandle.FirstPCBObject; // получаем первый компонент

     //*******перебор всех компонентов********//
     While (Component <> Nil) Do
     Begin
           NameComp := Component.Name.Text;                        // Имя компонента
           Footprints.Add(#9+#9+#9+'<Footprint name="'+Component.Pattern+'$' +NameComp + '">');
           //Component.GetState_FootprintDescription;
           Components.Add(#9+#9+#9+'<Component name="'+NameComp + '">');
           Components.Add(#9+#9+#9+#9+'<Pins>');
           Packages.Add(#9+#9+#9+'<Package>');
           Packages.Add(#9+#9+#9+#9+'<ComponentRef name="'+NameComp+'"/>');
           Packages.Add(#9+#9+#9+#9+'<FootprintRef name="'+Component.Pattern+'$' +NameComp +'"/>');
           CompFix := 'on';
           if component.Moveable = true then CompFix := 'off';

           FileXMLCOB.Add(#9+#9+#9+'<CompInstance name="'+NameComp+'" side="'+LayerIDtoStr(Component.Layer)+
                                    '" angle="'+inttostr(Component.Rotation)+'" fixed="'+CompFix+'">');
           FileXMLCOB.Add(#9+#9+#9+#9+'<ComponentRef name="'+NameComp+'"/>');
           FileXMLCOB.Add(#9+#9+#9+#9+'<FootprintRef name="'+Component.Pattern+'$' +NameComp +'"/>');
           FileXMLCOB.Add(#9+#9+#9+#9+'<Org x="'+FloatToStr(CoordToMMs(Component.x))+'" y="'+FloatToStr(CoordToMMs(Component.y))+'"/>');
           FileXMLCOB.Add(#9+#9+#9+#9+'<Pins>');


           //*******перебор всех падов компонента********//
           Footprints.Add(#9+#9+#9+#9+'<Pads>');
           PadIteratorHandle := Component.GroupIterator_Create;
           PadIteratorHandle.AddFilter_ObjectSet(MkSet(ePadObject));
           Pad := PadIteratorHandle.FirstPCBObject;
           While (Pad <> Nil) Do
           Begin
                inc (PadNum);
                PadAngle := IntToStr(Pad.Rotation);
                Footprints.Add(#9+#9+#9+#9+#9+'<Pad padNum="'+IntToStr(PadNum)+'" name="'+Pad.Name+'" angle="'+PadAngle+'">');
                Components.Add(#9+#9+#9+#9+#9+'<Pin pinNum="'+IntToStr(PadNum)+'" name="'+Pad.Name+'"/>');
                Packages.Add(#9+#9+#9+#9+'<Pinpack pinNum="'+IntToStr(PadNum)+'" padNum="'+IntToStr(PadNum)+'"/>');
                FileXMLCOB.Add(#9+#9+#9+#9+#9+'<Pin padNum="'+IntToStr(PadNum)+'" name="'+Pad.Name+'">');
                TestString := Pad.Name;
                // проверяем был ли ранее пад такого же типа
                PadStackName := PadTemplate(Pad,Board.DisplayUnit);
                PozPadstack := 0;
                PozPadstack := Pos(PadStackName, PadStacksAllName);

                if PozPadstack = 0 then // если небыло подстака до нужно его создать
                Begin
                     PadStacksAllName :=  PadStacksAllName +PadStackName+'&';
                     Pad2 := Pad;
                     PadPlated := 'off';
                     if Pad2.plated then PadPlated := 'on';
                     If Pad.IsSurfaceMount = True then // поверхностномонтируемая КП
                     Begin
                          PadTypeSurf := 'SMD';
                          Padstacks.Add(#9+#9+#9+'<Padstack name="'+PadStackName+'" type="'+PadTypeSurf+'" metallized="'+PadPlated+'">');
                          Padstacks.Add(#9+#9+#9+#9+'<Thermal/>');
                          Padstacks.Add(#9+#9+#9+#9+'<Pads>');
                          ShapeType := Pad.ShapeOnLayer[1];
                          Case ShapeType of
                               eRectangular    :
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[1]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[1]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="Top Layer"/>'); // !!! нужно вводить определение слоя
                                 End;
                               eOctagonal      : // !!! сделано как для прямоугольного хорошо бы исправить!
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[1]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[1]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="Top Layer"/>'); // !!! нужно вводить определение слоя
                                 End;
                               eRounded        :
                                 Begin
                                   PadType := 'PadOval';
                                   PadXReal := CoordToMMs(Pad.XSizeOnLayer[1]);
                                   PadYReal := CoordToMMs(Pad.YSizeOnLayer[1]);
                                   if PadXReal < PadYReal then
                                   Begin
                                     Padstacks.Add(#9+#9+#9+#9+#9+'<PadOval diameter="'+floattostr(PadXReal)+'">');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="Top Layer"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Stretch x="0.000" y="'+floattostr(PadYReal-PadXReal)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Shift x="0.000" y="0.000"/>');
                                   End
                                   Else
                                   Begin
                                     Padstacks.Add(#9+#9+#9+#9+#9+'<PadOval diameter="'+floattostr(PadYReal)+'">');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="Top Layer"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Stretch x="'+floattostr(PadXReal - PadYReal)+'" y="0.000"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Shift x="0.000" y="0.000"/>');
                                   End;
                                 End;
                               eRoundedRectangular :
                                 Begin
                                   Pad2 := Pad;
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[1]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[1]))+'"'+
                                   ' handling="Rounding" handlingValue="'+floattostr(CoordToMMs(Pad2.CornerRadius[1]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="Top Layer"/>'); // !!! нужно вводить определение слоя
                                 End;
                          End;
                     End; // конец поверхностномонтируемых

                     If Pad.IsSurfaceMount = false then  // Сквозная КП
                          Begin
                          PadTypeSurf := 'Through';

                          Padstacks.Add(#9+#9+#9+'<Padstack name="'+PadStackName+'" holeDiameter="'+
                          floattostr(CoordToMMs(Pad.HoleSize))+'" type="'+PadTypeSurf+'" metallized="'+PadPlated+'">');
                          Padstacks.Add(#9+#9+#9+#9+'<Thermal/>');
                          Padstacks.Add(#9+#9+#9+#9+'<Pads>');

                          ShapeType := Pad.ShapeOnLayer[1];
                          Case ShapeType of
                               eRectangular    :
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[1]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[1]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                               eOctagonal      : // !!! сделано как для прямоугольного хорощо бы исправить!
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[1]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[1]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                               eRounded        :
                                 Begin
                                   PadType := 'PadCircle';
                                   PadXReal := CoordToMMs(Pad.XSizeOnLayer[1]);
                                   PadYReal := CoordToMMs(Pad.YSizeOnLayer[1]);
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadCircle diameter="'+floattostr(PadXReal)+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                               eRoundedRectangular :   // !!! сделано как для прямоугольного хорощо бы исправить!
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[1]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[1]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                          End;// конец Case ShapeType
                     End; // конец сквозных КП

                Padstacks.Add(#9+#9+#9+#9+#9+'</'+PadType+'>');
                Padstacks.Add(#9+#9+#9+#9+'</Pads>');
                Padstacks.Add(#9+#9+#9+'</Padstack>');
                end; // конец создания подстака


                Footprints.Add(#9+#9+#9+#9+#9+#9+'<PadstackRef name="'+PadStackName+'"/>');
                FileXMLCOB.Add(#9+#9+#9+#9+#9+#9+'<PadstackRef name="'+PadStackName+'"/>');

                PadX   := FloatToStr(CoordToMMs( Pad.x - Component.x ));
                PadY   := FloatToStr(CoordToMMs( pad.y - Component.y ));

                FileXMLCOB.Add(#9+#9+#9+#9+#9+#9+'<Org x="'+PadX+'" y="'+PadY+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<Org x="'+PadX+'" y="'+PadY+'"/>');
                FileXMLCOB.Add(#9+#9+#9+#9+#9+'</Pin>');
                Footprints.Add(#9+#9+#9+#9+#9+'</Pad>');
                Pad := PadIteratorHandle.NextPCBObject;
           End;// Конец создания падов
           Components.Add(#9+#9+#9+#9+'</Pins>');
           Components.Add(#9+#9+#9+'</Component>');
           Packages.Add(#9+#9+#9+'</Package>');
           padNum := 0;
           Footprints.Add(#9+#9+#9+#9+'</Pads>');
           FileXMLCOB.Add(#9+#9+#9+#9+'</Pins>');
           //*******Начинаем перебор всей текстовой информации компонента********//
           TextIteratorHandle := Component.GroupIterator_Create;
           TextIteratorHandle.AddFilter_ObjectSet(MkSet(eTextObject));
           Text := TextIteratorHandle.FirstPCBObject;


           if TextIteratorHandle.FirstPCBObject <> Nil then
           Footprints.Add(#9+#9+#9+#9+'<Texts>');


           While (Text <> Nil) Do
           Begin
                //разбираемся с текстовым стилем
                TextStyle := 'Arial'+ FloatToStr(CoordToMMs(Text.Size)*100);
                PozTextStyle := 0;
                PozTextStyle := Pos(TextStyle, FileXmlTSt.Text);
                if  PozTextStyle = 0 then  //если текстового стиля нет то создаем
                begin
                     FileXmlTSt.Add(#9+#9+'<TextStyle name="'+TextStyle+
                     '" fontName="Arial" height="'+FloatToStr(CoordToMMs(Text.Size))+'"/>');
                end;  //конец созадния нового текстового стиля

                //заполняем текстовую информацию
                TextMirror := 'off';
                if Text.MirrorFlag = true then TextMirror := 'on';

                Footprints.Add(#9+#9+#9+#9+#9+'<Text text="'+ Text.text
                +'" align="LB" angle="'+inttostr(Text.Rotation)+'" mirror="'+TextMirror+'">'); // !!! не получена информация о align="LB"
                // Информация о текстовом слое

                Case Text.Layer of
                1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,
                25,26,27,28,29,30,31,32 :  TextLayerType := 'Signal';
                33,34                   :  TextLayerType := 'Silk';
                39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,
                54                      :  TextLayerType := 'Plane';
                end;

                Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+TextLayerType+'" name="'+Board.LayerName(Text.Layer)+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<TextStyleRef name="'+TextStyle+'"/>');

                TextX   := FloatToStr(CoordToMMs( Text.X1Location - Component.x ));
                TextY   := FloatToStr(CoordToMMs( Text.Y1Location - Component.y ));
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<Org x="'+TextX+'" y="'+TextY+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+'</Text>');
                Text := TextIteratorHandle.NextPCBObject; //следующий текст
           End;


           if TextIteratorHandle.FirstPCBObject <> Nil then
           Footprints.Add(#9+#9+#9+#9+'</Texts>');
           //*******Заканчиваем перебор всей текстовой информации компонента********//
           Component.GroupIterator_Destroy(TextIteratorHandle);

           Footprints.Add(#9+#9+#9+#9+'<Details>');// Дополнительные справочные слои посадочного
           //*******Начинаем перебор всех линий, окружностей, полигонов********//
            //*******линии ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(eTrackObject));
           Track := IteratorHandle.FirstPCBObject;

           While (Track <> Nil) Do
           Begin
                //lyrObj := Track.Layer;
                //LyrTV6 := Track.Layer_V6;

                Footprints.Add(#9+#9+#9+#9+#9+'<Detail lineWidth="'+FloatToStr(CoordToMMs(Track.Width))+'">');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Track.Layer)+
                '" name="'+Board.LayerName(Track.Layer)+'"/>');//ИМя!
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<Line>');

                Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x1 - Component.x ))+
                '" y="'+FloatToStr(CoordToMMs( Track.y1 - Component.y ))+ '"/>');
                Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x2 - Component.x ))+
                '" y="'+FloatToStr(CoordToMMs( Track.y2 - Component.y ))+'"/>');

                Footprints.Add(#9+#9+#9+#9+#9+#9+'</Line>');
                Footprints.Add(#9+#9+#9+#9+#9+'</Detail>');
                Track := IteratorHandle.NextPCBObject; //следующая линия
           End;
           Component.GroupIterator_Destroy(IteratorHandle);

           //*******Окружности ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(eArcObject));
           Arc := IteratorHandle.FirstPCBObject;

           While (Arc <> Nil) Do
           Begin
                Footprints.Add(#9+#9+#9+#9+#9+'<Detail lineWidth="'+FloatToStr(CoordToMMs(Arc.LineWidth))+'">');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Arc.Layer)+
                '" name="'+Board.LayerName(Arc.Layer)+'"/>');
                TestString :=  FloatToStr(Arc.EndAngle);
                if (Arc.StartAngle = 0 & Arc.EndAngle = 360) then // Если полный круг
                Begin
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'<Circle diameter="'+FloatToStr(CoordToMMs(Arc.Radius*2))+'">');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Center x="'+FloatToStr(CoordToMMs( Arc.XCenter - Component.x ))+
                  '" y="'+FloatToStr(CoordToMMs( Arc.YCenter - Component.y ))+'"/>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'</Circle>');
                End
                Else  // Если разорванный круг
                Begin
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'<Arc>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Center x="'+FloatToStr(CoordToMMs( Arc.XCenter - Component.x ))+
                  '" y="'+FloatToStr(CoordToMMs( Arc.YCenter - Component.y ))+'"/>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Start x="'+FloatToStr(CoordToMMs( Arc.StartX - Component.x ))+
                  '" y="'+FloatToStr(CoordToMMs( Arc.StartY - Component.y ))+'"/>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<End x="'+FloatToStr(CoordToMMs( Arc.EndX - Component.x ))+
                  '" y="'+FloatToStr(CoordToMMs( Arc.EndY - Component.y ))+'"/>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'</Arc>');
                End;
                Footprints.Add(#9+#9+#9+#9+#9+'</Detail>');
                Arc := IteratorHandle.NextPCBObject; //следующая окружность
           End;
           Component.GroupIterator_Destroy(IteratorHandle);

           //*******Полигоны ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(ePolyObject));
           Poly :=  IteratorHandle.FirstPCBObject;
           //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           While (Poly <> Nil) Do // Нуждается в проверке!!!!
           Begin
                 Footprints.Add(#9+#9+#9+#9+#9+'<Detail lineWidth="0.001">');
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Poly.Layer)+
                 '" name="'+Board.LayerName(Poly.Layer)+'"/>');
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'<Polygon>');
                 For I := 0 To Poly.PointCount - 1 Do
                 Begin
                      If Poly.Segments[I].Kind = ePolySegmentLine Then
                      Begin
                      Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Poly.Segments[I].vx - Component.x ))+
                      '" y="'+FloatToStr(CoordToMMs( Poly.Segments[I].vy - Component.y ))+'"/>');
                      End
                      Else
                      Begin // нужно сделать для арков!!!!
                      //PolygonRpt.Add(' Polygon Segment Arc 1  : ' + FloatToStr(Polygon.Segments[I].Angle1));
                      //PolygonRpt.Add(' Polygon Segment Arc 2  : ' + FloatToStr(Polygon.Segments[I].Angle2));
                      //PolygonRpt.Add(' Polygon Segment Radius : ' + FloatToStr(Polygon.Segments[I].Radius));
                      End;
                 End;
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'</Polygon>');
                 Footprints.Add(#9+#9+#9+#9+#9+'</Detail>');
                 Poly := IteratorHandle.NextPCBObject; //следующий полигон
           End;
           Component.GroupIterator_Destroy(IteratorHandle);

           Footprints.Add(#9+#9+#9+#9+'</Details>');
           //*******Заканчиваем перебор всех линий,окружностей,полигонов ********//


           // следующий компонент
           Component := ComponentIteratorHandle.NextPCBObject;
           Inc(ComponentCount);
           Footprints.Add(#9+#9+#9+'</Footprint>');
           FileXMLCOB.Add(#9+#9+#9+'</CompInstance>');
     End;  // заканчиваем обрабатывать этот компонент
     Board.BoardIterator_Destroy(ComponentIteratorHandle);

     Padstacks.Add(#9+#9+'</Padstacks>');
     ViastacksLL.Add(#9+#9+'</Viastacks>');
     Footprints.Add(#9+#9+'</Footprints>');
     Components.Add(#9+#9+'</Components>');
     FileXMLCOB.Add(#9+#9+'</Components>');
     Packages.Add(#9+#9+'</Packages>');
     XMLInL.AddStrings(Padstacks);
     XMLInL.AddStrings(ViastacksLL);
     XMLInL.AddStrings(Footprints);
     XMLInL.AddStrings(Components);
     XMLInL.AddStrings(Packages);
     XMLInL.Add(#9+'</LocalLibrary>');
     FileXMLCOB.Add(#9+'</ComponentsOnBoard>');

     //*******Подмитаем********//
     Padstacks.Free;
     Footprints.Free;
     Components.Free;
     Packages.Free;
End;

Procedure AddContruct(Constructive :TStringList; Board : IPCB_Board; FileXmlTSt : TStringList;);
var
Count     : integer;
I         : Integer;
X0        : float;
Y0        : float;
XEnd      : Integer;
YEnd      : Integer;
AStartX   : TCoord;
AStartY   : TCoord;
AEndX     : TCoord;
AEndY     : TCoord;
StringText: String;
MechIterH : IPCB_BoardIterator;
Track     : IPCB_Track;
Arc       : IPCB_Arc;
Text      : IPCB_Text;
Region    : IPCB_Region;
Poly      : IPCB_Polygon;
Fill      : IPCB_Fill;
LID       : Integer;

BoardOutline: IPCB_BoardOutline;
Begin
     Constructive.Add(#9+'<Constructive version="1.0">');
     //*******Контур платы********//
     Constructive.Add(#9+#9+'<BoardOutline>');
     Constructive.Add(#9+#9+#9+'<Contour>');
     BoardOutline  := Board.BoardOutline;
     Count         := BoardOutline.PointCount;

     X0 := BoardOutline.Segments[0].vx;
     Y0 := BoardOutline.Segments[0].vy;
     XEnd := X0;
     YEnd := Y0;

     For I:=0 To BoardOutline.PointCount - 1 Do //перебор всех примитивов контура платы
       Begin
         If I = 0 then
         If BoardOutline.Segments[0].Kind = ePolySegmentLine Then I := 1;

         If BoardOutline.Segments[I].Kind = ePolySegmentLine Then  // Если сегмент представляет собой линию
            Begin
              Constructive.Add(#9+#9+#9+#9+'<Shape lineWidth="0.001">');
              Constructive.Add(#9+#9+#9+#9+#9+'<Line>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( XEnd))+
                      '" y="'+FloatToStr(CoordToMMs( YEnd))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].vx))+
                      '" y="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].vy))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+'</Line>');
              Constructive.Add(#9+#9+#9+#9+'</Shape">');
              XEnd := BoardOutline.Segments[I].vx;
              YEnd := BoardOutline.Segments[I].vy;
              If I = (BoardOutline.PointCount - 1) Then
              Begin
              Constructive.Add(#9+#9+#9+#9+'<Shape lineWidth="0.001">');
                Constructive.Add(#9+#9+#9+#9+#9+'<Line>');
                Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].vx))+
                      '" y="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].vy))+'"/>');
                Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( X0))+
                      '" y="'+FloatToStr(CoordToMMs( Y0))+'"/>');
                Constructive.Add(#9+#9+#9+#9+#9+'</Line>');
                Constructive.Add(#9+#9+#9+#9+'</Shape">');
              End;

            End
            Else // Если сегмент представляет собой дугу
            Begin
              AStartX := BoardOutline.Segments[I].cx+BoardOutline.Segments[I].Radius;
              AStartY := BoardOutline.Segments[I].cy;
              AEndX := BoardOutline.Segments[I].cx+BoardOutline.Segments[I].Radius;
              AEndY := BoardOutline.Segments[I].cy;

              RotateCoordsAroundXY(AStartX,AStartY,BoardOutline.Segments[I].cx,BoardOutline.Segments[I].cy,BoardOutline.Segments[I].Angle1);
              RotateCoordsAroundXY(AEndX,AEndY,BoardOutline.Segments[I].cx,BoardOutline.Segments[I].cy,BoardOutline.Segments[I].Angle2);
              Constructive.Add(#9+#9+#9+#9+'<Shape lineWidth="0.001">');
              Constructive.Add(#9+#9+#9+#9+#9+'<Line>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( XEnd))+
                                                    '" y="'+FloatToStr(CoordToMMs( YEnd))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AStartX))+
                                                    '" y="'+FloatToStr(CoordToMMs( AStartY))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+'</Line>');
              Constructive.Add(#9+#9+#9+#9+'</Shape">');
              XEnd := AEndX;
              YEnd := AEndY;
              Constructive.Add(#9+#9+#9+#9+'<Shape lineWidth="0.001">');
              Constructive.Add(#9+#9+#9+#9+#9+'<Arc>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Center x="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].cx))+
              '" y="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].cy))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Start x="'+FloatToStr(CoordToMMs( AStartX))+
              '" y="'+FloatToStr(CoordToMMs( AStartY))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<End x="'+FloatToStr(CoordToMMs( AEndX))+
              '" y="'+FloatToStr(CoordToMMs( AEndY))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+'</Arc>');
              Constructive.Add(#9+#9+#9+#9+'</Shape">');
            End;

       End;// конец перебора всех примитивов контура платы


     Constructive.Add(#9+#9+#9+'</Contour>');
     Constructive.Add(#9+#9+'</BoardOutline>');

     //*******Механические слои********//
     Constructive.Add(#9+#9+'<MechLayerObjects>');

     //*******Перебираем трэки********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eTrackObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Track := MechIterH.FirstPCBObject; //первый трэк на механическом слое

     While (Track <> Nil) Do
     Begin
       Constructive.AddStrings(TrackToXML(Board,Track,3));
       LID := Track.Layer;
       Track := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     //*******Перебираем окружности********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eArcObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Arc := MechIterH.FirstPCBObject; //первый трэк на механическом слое

     While (Arc <> Nil) Do
     Begin
       Constructive.AddStrings(ArcToXML(Board,Arc,3));
       Arc := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     //*******Перебираем Филы********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eFillObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Fill := MechIterH.FirstPCBObject; //первый трэк на механическом слое

     While (Fill <> Nil) Do
     Begin
       Constructive.AddStrings(FillToXML(Board,Fill,3));
       Fill := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     //*******Перебираем Полигоны********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(ePolyObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Poly := MechIterH.FirstPCBObject; //первый трэк на механическом слое

     While (Poly <> Nil) Do
     Begin
       Constructive.AddStrings(PolygonToXML(Board,Poly,3));
       Poly := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     //******* !!!!!!!!!!!!!!!!!!!!!!!!!!!! Регионы пока не получились********//
     //******* !!!!!!!!!!!!!!!!!!!!!!!!!!!! Отложено********//
     //*******Перебираем Регионы********//
     //MechIterH := Board.BoardIterator_Create;
     //MechIterH.AddFilter_LayerSet(MkSet(57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     //MechIterH.AddFilter_ObjectSet(MkSet(eRegionObject));
     //MechIterH.AddFilter_Method(eProcessAll);
     //Region := MechIterH.FirstPCBObject; //первый регион на механическом слое

     //While (Region <> Nil) Do
     //Begin
     //  Constructive.AddStrings(RegionToXML(Board,Region,3));
     //  Region := MechIterH.NextPCBObject;
     //End;
     //Board.BoardIterator_Destroy(MechIterH);
     Constructive.Add(#9+#9+'</MechLayerObjects>');

     //*******Перебираем Текстовую информацию********//
     Constructive.Add(#9+#9+'<Texts>');

     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(AllLayers);
     MechIterH.AddFilter_ObjectSet(MkSet(eTextObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Text := MechIterH.FirstPCBObject; //первый текстовый обьект на любом слое

     While (Text <> Nil) Do
     Begin
       if Text.Component = Nil then
       Constructive.AddStrings(TextToXML(Board,Text,3,FileXmlTSt));
       Text := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     Constructive.Add(#9+#9+'</Texts>');

     Constructive.Add(#9+'</Constructive>');
End;

Procedure AddNetList(FileXMLNList :TStringList; Board : IPCB_Board;);
var
   //Net : IPCB_Net;
   Net : IPCB_Net;
   Pad : IPCB_Pad;
   PadNet : IPCB_Net;

   IteratorHandle : IPCB_BoardIterator;
   PadIteratorHandle : IPCB_BoardIterator;
   I : integer;
   TestString : string;
Begin
     FileXMLNList.Add(#9+'<NetList version="1.0">');
     //*******Перебираем неты********//
     IteratorHandle := Board.BoardIterator_Create;
     IteratorHandle.AddFilter_ObjectSet(MkSet(eNetObject));
     IteratorHandle.AddFilter_LayerSet(AllLayers);
     IteratorHandle.AddFilter_Method(eProcessAll);
     Net := IteratorHandle.FirstPCBObject; //первая цепь

     //Неэффективно!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     While (Net <> Nil) Do //Принадлежность цепи проверяем перебором всех пинов платы!
     Begin
       FileXMLNList.Add(#9+#9+'<Net name="'+Net.Name+'">');
          /// необходимо получить информацию о пинах принадлежащих цепи.
          PadIteratorHandle := Board.BoardIterator_Create;
          PadIteratorHandle.AddFilter_ObjectSet(MkSet(ePadObject));
          PadIteratorHandle.AddFilter_LayerSet(AllLayers);
          PadIteratorHandle.AddFilter_Method(eProcessAll);
          pad := PadIteratorHandle.FirstPCBObject; //первая цепь
          While (pad <> Nil) Do // СОБСТВЕННО долгий перебор !!!!!!!!!!!!!!!!!!!!!!!!!!!
          Begin
            TestString := pad.Component.Name.Text;
            TestString := pad.Name;
            if pad.Net <> Nil then
            Begin
            TestString := pad.Net.Name;
            if pad.Net.Name = Net.Name then
            FileXMLNList.Add(#9+#9+#9+'<PinRef compName="'+pad.Component.Name.Text+'" pinName="'+pad.Name+'"/>');
            End;
            pad := PadIteratorHandle.NextPCBObject;
          End;
          Board.BoardIterator_Destroy(PadIteratorHandle);
       FileXMLNList.Add(#9+#9+'</Net>');
       Net := IteratorHandle.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(IteratorHandle);
     FileXMLNList.Add(#9+'</NetList>');
End;

Procedure AddGroups(FileXMLGroup :TStringList; Board : IPCB_Board;);
var
   NetClass   : IPCB_ObjectClass;
   IterClass  : IPCB_BoardIterator;
   IterObj    : IPCB_BoardIterator;
   BoardSetM  : IPCB_BoardLayerSetManager;
   BoardSet   : IPCB_BoardLayerSet;
   Net        : IPCB_Net;
   Component  : IPCB_Component;
   Layer      : IPCB_LayerObject;
   GrIter     : IPCB_GroupIterator;
   Prim       : IPCB_Primitive;
   c          : IPCB_ObjectClass;
   LyrIter    : IPCB_LayerIterator;
   LayerGroups: TStringList;
   NetGroups  : TStringList;
   CompGroups : TStringList;
   TestString : String;
   I          : integer;
   LyrObj     : IPCB_LayerObject;
   LyrID      : Integer;
   LyrSet     : IPCB_LayerSet;
Begin
  LayerGroups := TStringList.Create;
  NetGroups := TStringList.Create;
  CompGroups := TStringList.Create;
  FileXMLGroup.Add(#9+'<Groups version="1.1">');

  LayerGroups.Add(#9+#9+'<LayerGroups>');
  NetGroups.Add(#9+#9+'<NetGroups>');
  CompGroups.Add(#9+#9+'<CompGroups>');

  IterClass := Board.BoardIterator_Create;
  IterClass.SetState_FilterAll;
  IterClass.AddFilter_ObjectSet(MkSet(eClassObject));
  c := IterClass.FirstPCBObject;


  While c <> NIl Do
   Begin
       //Если группа цепей
       If c.MemberKind = eClassMemberKind_Net Then
       Begin
           TestString := c.Name;
           NetGroups.Add(#9+#9+#9+'<NetGroup name="'+c.Name+'">');

           IterObj := Board.BoardIterator_Create; // перебираем цепи
           IterObj.SetState_FilterAll;
           IterObj.AddFilter_ObjectSet(MkSet(eNetObject));
           Net := IterObj.FirstPCBObject;
           TestString := Net.Name;
           While Net <> NIl Do
           Begin
              TestString := Net.Name;
              If c.IsMember(Net) Then
                NetGroups.Add(#9+#9+#9+#9+'<NetRef name="'+Net.Name+'"/>');

              Net := IterObj.NextPCBObject;
           End;
           NetGroups.Add(#9+#9+#9+'</NetGroup>');
           Board.BoardIterator_Destroy(IterObj);
       End;// конец создания группы цепей

       //Если группа компонентов
       If c.MemberKind = eClassMemberKind_Component Then
       Begin
           TestString := c.Name;
           CompGroups.Add(#9+#9+#9+'<CompGroup name="'+c.Name+'">');

           IterObj := Board.BoardIterator_Create; // перебираем компоненты
           IterObj.AddFilter_ObjectSet(MkSet(eComponentObject));
           IterObj.AddFilter_LayerSet(AllLayers);
           IterObj.AddFilter_Method(eProcessAll);
           Component := IterObj.FirstPCBObject;
           TestString := Component.Name.Text;
           While Component <> NIl Do
           Begin
              If c.IsMember(Component) Then
                CompGroups.Add(#9+#9+#9+#9+'<CompInstanceRef name="'+Component.Name.Text+'"/>');

              Component := IterObj.NextPCBObject;
           End;
           CompGroups.Add(#9+#9+#9+'</CompGroup>');
           Board.BoardIterator_Destroy(IterObj);
       End;// конец создания группы компонентов



       c := IterClass.NextPCBObject;
   End;
   Board.BoardIterator_Destroy(IterClass);

   //группа слоев

   //Stack := Board.LayerStack;
   BoardSetM := Board.BoardLayerSetManager;
   For I:=0 to BoardSetM.AllSetsCount-1 do
   Begin
     BoardSet := BoardSetM.BoardLayerSetByIndex[I];
     TestString := BoardSet.Name;

     LyrSet := BoardSet.Layers;
     LyrIter := LyrSet.LayerIterator;
     LyrIter.First;
     //LyrID := LyrIter.Layer;
     If LyrSet.IsEmpty = false then
     Begin
     LayerGroups.Add(#9+#9+#9+'<LayerGroup name="'+BoardSet.Name+'">');
     LyrObj := Board.LayerStack.LayerObject(LyrIter.Layer);
     TestString := LyrObj.Name;
       Repeat
       TestString := LyrObj.Name;
       LayerGroups.Add(#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(LyrObj.LayerID)+'" name="'+LyrObj.Name+'"/>');
       LyrIter.Next;
       TestString := IntToStr(LyrIter.Layer);
       LyrObj := Board.LayerStack.LayerObject(LyrIter.Layer);
       Until LyrObj = Nil;
     LayerGroups.Add(#9+#9+#9+'</LayerGroup>');
     End;
   End;



   LayerGroups.Add(#9+'</LayerGroups>');
   NetGroups.Add(#9+#9+'</NetGroups>');
   CompGroups.Add(#9+#9+'</CompGroups>');
   FileXMLGroup.AddStrings(LayerGroups);
   FileXMLGroup.AddStrings(NetGroups);
   FileXMLGroup.AddStrings(CompGroups);
   FileXMLGroup.Add(#9+'</Groups>');
   LayerGroups.Free;
   NetGroups.Free;
   CompGroups.Free;
End;

Procedure AddRules (FileXMLRul :TStringList;FileXMLHSRul :TStringList; Board : IPCB_Board; Viastacks : TStringList; );
Var
   Rule          : IPCB_Rule;
   RuleDiff      : IPCB_DifferentialPairsRoutingRule;
   RuleWidth     : IPCB_MaxMinWidthConstraint;
   RuleClear     : IPCB_ClearanceConstraint;
   RuleClearComp : IPCB_ComponentClearanceConstraint;
   BoardIterator : IPCB_BoardIterator;
   Teststring    : String;
   oldRuleName   : String;
   LyrClass      : TlayerClassID;
   LyrObj        : IPCB_LayerObject;
   Stack         : IPCB_LayerStack;
   RuleWidthS    : TStringList;
   RuleClearS    : TStringList;
   RuleClearCompS: TStringList;
   RuleNetS      : TStringList;
   IteratorNet   : IPCB_BoardIterator;
   Net           : IPCB_Net;

Begin
   RuleWidthS := TStringList.Create;
   RuleClearS := TStringList.Create;
   RuleClearCompS := TStringList.Create;
   RuleNetS  := TStringList.Create;
   RuleWidth := '';
   RuleClear := '';
   RuleClearComp := '';

   Stack := Board.LayerStack;
   FileXMLHSRul.Add(#9+'<HiSpeedRules version="2.1">');
   FileXMLRul.Add(#9+'<Rules version="1.2">');
   FileXMLHSRul.Add(#9+#9+'<RulesImpedances>');
   RuleWidthS.Add(#9+#9+'<RulesWidthOfWires>');
   RuleClearS.Add(#9+#9+'<RulesClearancesNetToNet>');
   RuleClearCompS.Add(#9+#9+'<RulesClearancesCompToComp>');
   RuleNetS.Add(#9+#9+'<NetProperties>');

   // Создаем итератор правил дифф пар
   BoardIterator        := Board.BoardIterator_Create;
   BoardIterator.AddFilter_ObjectSet(MkSet(eRuleObject));
   BoardIterator.AddFilter_LayerSet(AllLayers);
   BoardIterator.AddFilter_Method(eProcessAll);
   Rule := BoardIterator.FirstPCBObject;
   While (Rule <> Nil) Do
   Begin// начало перебора всех правил
     if Rule.RuleKind = eRule_DifferentialPairsRouting Then
     Begin// если правило дифф пар
       RuleDiff := Rule;
       FileXMLHSRul.Add(#9+#9+#9+'<ImpedanceDiff name="'+RuleDiff.name+'" Z0="100">');
       LyrClass := eLayerClass_Electrical;        // задаем тип слоя
       LyrObj := Stack.First(LyrClass);         // получаем первый слой
       Repeat
         Teststring := FloatToStr(CoordToMMs(RuleDiff.PreferedWidth[LyrObj.LayerID]));
         Teststring := FloatToStr(CoordToMMs(RuleDiff.PreferedGap[LyrObj.LayerID]));
         Teststring := LyrObj.Name;
         FileXMLHSRul.Add(#9+#9+#9+#9+'<LayerRule width="'+FloatToStr(CoordToMMs(RuleDiff.PreferedWidth[LyrObj.LayerID]))+
                                                 '" gap="'+FloatToStr(CoordToMMs(RuleDiff.PreferedGap[LyrObj.LayerID]))+'">');
         FileXMLHSRul.Add(#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(LyrObj.LayerID)+'" name="'+LyrObj.Name+'"/>');
         FileXMLHSRul.Add(#9+#9+#9+#9+'</LayerRule>');
       LyrObj := Stack.Next(LyrClass, LyrObj)
       Until LyrObj = Nil;
       FileXMLHSRul.Add(#9+#9+#9+'</ImpedanceDiff>');
     End;//конец правила дифф пар

     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     //Просто создается одно общее правило на основе первого попавшегося

     if Rule.RuleKind = eRule_MaxMinWidth Then
     Begin // если правило ширины проводников
       if RuleWidth = '' Then
       Begin
         RuleWidth := Rule;
         RuleWidthS.Add(#9+#9+#9+'<WidthOfWires enabled="on" widthMin="'+FloatToStr(CoordToMMs(RuleWidth.MinWidth[1]))+
                                                          '" widthNom="'+FloatToStr(CoordToMMs(RuleWidth.FavoredWidth[1]))+'">');
         RuleWidthS.Add(#9+#9+#9+#9+'<AllLayers/>');
         RuleWidthS.Add(#9+#9+#9+#9+'<ObjectsAffected>');
         RuleWidthS.Add(#9+#9+#9+#9+#9+'<AllNets/>');
         RuleWidthS.Add(#9+#9+#9+#9+'</ObjectsAffected>');
         RuleWidthS.Add(#9+#9+#9+'</WidthOfWires>');
       End;
     End; // конец создания правила ширины проводников

     if Rule.RuleKind = eRule_Clearance Then
     Begin // если правило зазора проводников
       if RuleClear = '' Then
       Begin
         RuleClear := Rule;
         RuleClearS.Add(#9+#9+#9+'<ClearanceNetToNet enabled="on" clrnMin="'+FloatToStr(CoordToMMs(RuleClear.Gap ))+
                                                               '" clrnNom="'+FloatToStr(CoordToMMs(RuleClear.Gap *3))+'">');
         //Номинальный зазор равный 3-ем минимальным взят согласно проведенным исследованиям и исходя из опыта работы

         RuleClearS.Add(#9+#9+#9+#9+'<AllLayers/>');
         RuleClearS.Add(#9+#9+#9+#9+'<ObjectsAffected>');
         RuleClearS.Add(#9+#9+#9+#9+#9+'<AllNets/>');
         RuleClearS.Add(#9+#9+#9+#9+#9+'<AllNets/>');
         RuleClearS.Add(#9+#9+#9+#9+'</ObjectsAffected>');
         RuleClearS.Add(#9+#9+#9+'</ClearanceNetToNet>');
       End;
     End; // конец создания правила зазора проводников

     if Rule.RuleKind = eRule_ComponentClearance Then
     Begin // если правило зазора Компонентов
       if RuleClearComp = '' Then
       Begin
         RuleClearComp := Rule;
         RuleClearCompS.Add(#9+#9+#9+'<ClearanceCompToComp enabled="on" clrn="'+FloatToStr(CoordToMMs(RuleClearComp.Gap))+'">');
         RuleClearCompS.Add(#9+#9+#9+#9+'<ObjectsAffected>');
         RuleClearCompS.Add(#9+#9+#9+#9+#9+'<AllComps/>');
         RuleClearCompS.Add(#9+#9+#9+#9+#9+'<AllComps/>');
         RuleClearCompS.Add(#9+#9+#9+#9+'</ObjectsAffected>');
         RuleClearCompS.Add(#9+#9+#9+'</ClearanceCompToComp>');
       End;
     End; // конец создания правила зазора компонентов

   Rule := BoardIterator.NextPCBObject;
   End;// конец перебора всех правил
   Board.BoardIterator_Destroy(BoardIterator);

  //*******Перебираем неты********//
  IteratorNet := Board.BoardIterator_Create;
  IteratorNet.AddFilter_ObjectSet(MkSet(eNetObject));
  IteratorNet.AddFilter_LayerSet(AllLayers);
  IteratorNet.AddFilter_Method(eProcessAll);
  Net := IteratorNet.FirstPCBObject; //первая цепь
  While (Net <> Nil) Do
  Begin
    RuleNetS.Add(#9+#9+#9+'<NetProperty route="on">');
    RuleNetS.Add(#9+#9+#9+#9+'<NetRef name="'+Net.Name+'"/>');
    RuleNetS.Add(#9+#9+#9+'</NetProperty>');
    Net := IteratorNet.NextPCBObject;
  End;


   RuleWidthS.Add(#9+#9+'</RulesWidthOfWires>');
   FileXMLRul.AddStrings(RuleWidthS); // добавляем группу правил ширины проводников

   RuleClearS.Add(#9+#9+'</RulesClearancesNetToNet>');
   FileXMLRul.AddStrings(RuleClearS);  //добавляем группу правил цепь-цепь

   RuleClearCompS.Add(#9+#9+'</RulesClearancesCompToComp>');
   FileXMLRul.AddStrings(RuleClearCompS);  //добавляем группу правил компонент-компонент

   Viastacks.Add(#9+#9+'</RulesViastacksOfNets>');
   FileXMLRul.AddStrings(Viastacks); //добавляем группу правил переходных отверстий

   RuleNetS.Add(#9+#9+'</NetProperties>');
   FileXMLRul.AddStrings(RuleNetS); //добавляем группу правил свойств цепей

   FileXMLRul.Add(#9+'</Rules>');
   FileXMLHSRul.Add(#9+#9+'</RulesImpedances>');
   FileXMLHSRul.Add(#9+'</HiSpeedRules>');

   RuleWidthS.Free;
   RuleClearS.Free;
   RuleClearCompS.Free;
   RuleNetS.Free
End;

Procedure AddConnectivity (FileXMLCon :TStringList;Board : IPCB_Board; ViastacksLL : TStringList; ViastacksRul : TStringList; );
  Begin
  End;

Procedure Main;
uses
 Classes, SysUtils, Dos;
Var
   Board       : IPCB_Board;
   Track       : IPCB_Track;
   Pad         : IPCB_Pad;
   Primitive   : IPCB_Primitive;
   Iterator    : IPCB_BoardIterator;
   PrimNumber  : Integer;
   FileName    : String;
   BoardName   : String;
   UnitsDist   : String;
   FileXml     : TStringList; // Итоговый файл fst в формате xml <TopoR_PCB_File>
   FileXmlTSt  : TStringList; // Ветвь текстовых стилей  <TextStyles version="1.0">
   FileXmlLL   : TStringList; // Ветвь Локальной библиотеки <LocalLibrary version="1.1">
   FileXMLContr: TStringList; // Ветвь конструктива платы <Constructive version="1.0">
   FileXMLCOB  : TStringList; // Ветвь компонентов на плате <ComponentsOnBoard version="1.1">
   FileXMLNList: TStringList; // Ветвь нетлиста <NetList version="1.0">
   FileXMLGroup: TStringList; // Ветвь групп <Groups version="1.1">
   FileXMLHSRul: TStringList; // Ветвь высокоскоростных правил <HiSpeedRules version="2.1">
   FileXMLRul  : TStringList; // Ветвь правил <Rules version="1.2">
   FileXMLCon  : TStringList; // Ветвь соединений <Connectivity version="1.1">
   FileXMLDispC: TStringList; // Ветвь отображения <DisplayControl version="1.3">
   ViastacksLL : TStringList; // группа переходных отверстий  Библиотеки
   ViastacksRul: TStringList; // группа переходных отверстий  Правил
   TextStyleAll: String;
   //

Begin
     //*******Подготовка********//
     FileXml := TStringList.Create;                      // Создание обьекта класса
     FileXmlTSt := TStringList.Create;
     FileXmlLL := TStringList.Create;
     FileXMLContr := TStringList.Create;
     FileXMLCOB := TStringList.Create;
     FileXMLNList := TStringList.Create;
     FileXMLGroup := TStringList.Create;
     FileXMLHSRul := TStringList.Create;
     FileXMLRul := TStringList.Create;
     ViastacksLL := TStringList.Create;
     FileXMLDispC := TStringList.Create;
     FileXMLCon   := TStringList.Create;
     ViastacksLL.Add(#9+#9+'<Viastacks>');
     ViastacksRul := TStringList.Create;
     ViastacksRul.Add(#9+#9+'<RulesViastacksOfNets>');

     Board := PCBServer.GetCurrentPCBBoard;              // Получение Текущей платы
     TextStyleAll := '';
     If Board = nil then Begin ShowError('Open board!'); Exit; End; // Если платы нет то выходим
     UnitsDist := UnitToString2(Board.DisplayUnit);      //Получение текущего типа метрики
     If (UnitsDist = 'mm') then
     Begin
       FileXMLDispC.Add(#9+'<DisplayControl version="1.3">');
       FileXMLDispC.Add(#9+#9+'<Units preference="Metric"/>');
       FileXMLDispC.Add(#9+'</DisplayControl>');
     End
     Else Begin ShowError('Switch to metric units!'); Exit; End; // Пока поддерживается только метрическая система

     //*******Создаем Шапку (Header)********//
     AddHeader(FileXml,Board.FileName,UnitsDist);

     //*******Создаем список слоев********//
     AddLayers(FileXML,Board.LayerStack,UnitsDist);

     //*******Создаем текстовые стили********//
     FileXmlTSt.Add(#9+'<TextStyles version="1.0">');
     FileXmlTSt.Add(#9+#9+'<TextStyle name="(Default)" fontName="QUALITY" height="2.5"/>'); // дефолтный текстовый стиль

     //*******Создаем конструктив платы********//
     AddContruct(FileXMLContr,Board,FileXmlTSt);

     //*******Создаем Соединения********//
     AddConnectivity(FileXMLCon,Board,ViastacksLL,ViastacksRul);

     //*******Создаем локальную билблиотеку FileXmlLL********//
     //*******Дополняются текстовые стили********//
     //*******Создается информация о установке компонентов на плату********//
     AddLL(FileXmlLL,Board,UnitsDist,FileXmlTSt, FileXMLCOB, ViastacksLL);
      FileXmlTSt.Add(#9+'</TextStyles>');

     //*******Создаем Нетлист********//
     AddNetList(FileXMLNList,Board);

     //*******Создаем Группы********//
     AddGroups(FileXMLGroup,Board);

     //*******Создаем Правила********//
     AddRules(FileXMLRul,FileXMLHSRul,Board,ViastacksRul);

     //*******Объединяем все в 1 файл********//
     FileXml.AddStrings(FileXmlTSt);   // подгружаем итоговый список текстовых стилей
     FileXml.AddStrings(FileXmlLL);    // подгружаем локальную библиотеку компонентов
     FileXml.AddStrings(FileXMLContr); // подгружаем конструктив платы
     FileXml.AddStrings(FileXMLCOB); // подгружаем информацию о расположении компонентов
     FileXml.AddStrings(FileXMLNList); // подгружаем нетлист
     FileXml.AddStrings(FileXMLGroup); // подгружаем Группы
     FileXml.AddStrings(FileXMLHSRul); // подгружаем Высокоскоростные правила
     FileXml.AddStrings(FileXMLRul);   // подгружаем  правила
     FileXml.AddStrings(FileXMLCon);   // подгружаем  соединения
     FileXml.AddStrings(FileXMLDispC); // подгружаем  контроль отображения
     FileXml.Add('</TopoR_PCB_File>'); // закрываем тег формата данных

     //*******Сохранение XML Файла********//
     FileName := SaveAFile();
     FileXml.SaveToFile(FileName + '.xml');


     //*******Уборка********//
     FileXml.Free;
     FileXmlTSt.Free;
     FileXmlLL.Free;
     FileXMLContr.Free;
     FileXMLCOB.Free;
     FileXMLNList.Free;
     FileXMLGroup.Free;
     FileXMLRul.Free;
     FileXMLHSRul.Free;
     ViastacksLL.Free;
     ViastacksRul.Free;
     FileXMLDispC.Free;
     FileXMLCon.Free;
End;

//ToDo
// Обработать все варианты падстаков
// Обработать правила проектирования
// Обработать боттом слой
// Обработать не метрическую систему измерения
// Мб сделать красивую шапку
