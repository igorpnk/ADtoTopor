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

Procedure SaveConfig ();
var
  Board       : IPCB_Board;
  TopoRFile   :TStringList;

begin
  Board := PCBServer.GetCurrentPCBBoard;              // ��������� ������� �����
  TopoRFile := TStringList.Create;
  TopoRFile.Add(tTopor.Text);     // 0 - ���� � ������
  TopoRFile.Add(tProject.Text);   // 1 - ���� � ������� ������
  TopoRFile.Add(tExport.Text);    // 2 - ���� � ����� fst ��������
  TopoRFile.Add(tImport.Text);    // 3 - ���� � ����� fst �������
  TopoRFile.SaveToFile(Board.FileName+'.scon');
  TopoRFile.Free;
end;

Function LoadAFileExe : String;
Var
   OpenDialog : TOpenDialog;
Begin
     Result := '';
     OpenDialog := TOpenDialog.Create(nil);
     OpenDialog.InitialDir := 'C:\';
     // Display the OpenDialog component
     OpenDialog.Filter := 'EXE Files|*.exe|All Files|*';
     OpenDialog.Execute;
     // Obtain the file name of the selected file.
     Result := OpenDialog.Filename;
     OpenDialog.Free;
End;

Function LoadAFilePrj : String;
Var
   OpenDialog : TOpenDialog;
Begin
     Result := '';
     OpenDialog := TOpenDialog.Create(nil);
     OpenDialog.InitialDir := 'C:\';
     // Display the OpenDialog component
     OpenDialog.Filter := 'TopoR Project Files|*.fsproj|All Files|*';
     OpenDialog.Execute;
     // Obtain the file name of the selected file.
     Result := OpenDialog.Filename;
     OpenDialog.Free;
End;

Function LoadAFileFST : String;
Var
   OpenDialog : TOpenDialog;
Begin
     Result := '';
     OpenDialog := TOpenDialog.Create(nil);
     OpenDialog.InitialDir := 'C:\';
     // Display the OpenDialog component
     OpenDialog.Filter := 'TopoR Text Files|*.fst|All Files|*';
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
     SaveDialog.Filter := 'FST Files|*.fst|All Files|*';
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

Procedure AddHeader(XMLIn : TStringList; FileS : String; UnitsDist : String;); // ������������ ���������
Var
   Times                : String;
   Date                 : String;
   Version              : String;
   ch                   : char;
   BOM                  : String;

Begin

     Version := cb_Version.Text;

     Date := 'dd.mm.yyyy';
     //Times := DateTimeToStr(Time);
     Times := GetCurrentTimeString();

     //*******��������� XML �����********//
     XMLIn.Add(   '<?xml version="1.0" encoding="UTF-8"?>');
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

     XMLIn.Add('<TopoR_PCB_File>');  // ������� ��������� ������

     //*******��������� <Header> �������� ������� fst********//
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

Function LayerIDtoStr(LayerID : TLayer;) : String;    // ���������� ��� ���� �� ��� ID
var
LyrMehPairs              : IPCB_MechanicalLayerPairs;
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

           LyrMehPairs := PCBServer.GetCurrentPCBBoard.MechanicalPairs;
           if LyrMehPairs.LayerUsed(LayerID) = true then Result := 'Mechanical';

end;

Procedure AddLayers(XMLIn : TStringList;  Board : IPCB_Board; Units: String;);    //������������ �����
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
 LayerType2               : Tlayer;
 LyrMehPairs              : IPCB_MechanicalLayerPairs;
 i                        : Integer;
 Stack                    : IPCB_LayerStack;
 LayerPairS               : array[0..16,0..2] of Tlayer;



Begin
     Stack := Board.LayerStack;
     LyrClass := eLayerClass_Physical;        // ������ ��� ����
     LyrMehPairs := Board.MechanicalPairs;


     XMLIn.Add(#9+'<Layers version="1.1">');
     XMLIn.Add(#9+#9+'<StackUpLayers>');
     If LyrObj = Nil then
     Begin
          ShowError('����������� ���� ����: ' + FloatToStr(LyrClass));
          exit;
     End;

     //*******�������� ��� ���������� � ������ ������������ ����********//

     //������� ��� ���� ����� ��������� ������ ��� LayerPair[I : Integer] ���������� TMechanicalLayerPair  � ������� ��������� ��� ������.
      i := 0;
      for LayerType := eMechanical1 to eMechanical16 do
        for LayerType2 := LayerType to eMechanical16 do
        begin
          if LyrMehPairs.PairDefined(LayerType,LayerType2) then
          begin
           LayerPairS[i,0] := LayerType;
           LayerPairS[i,1] := LayerType2;
           inc(i);
          end;
        end;

     //������������ ���
     For i := 0 To LyrMehPairs.Count - 1 Do
     Begin
       LyrObj := Stack.LayerObject[LayerPairS[LyrMehPairs.Count - 1 -i,0]];
       LayerName := LyrObj.Name;
       LayerTypeStr := 'Mechanical';
       LayerThickness := FloatToStrF(0,ffFixed,3,3);
       XMLIn.Add(#9+#9+#9+'<Layer name="'+LayerName+'" type="'+LayerTypeStr+'" thickness="'+LayerThickness+'"/>');
     end;

     LyrObj := Stack.First(LyrClass);         // �������� ������ ����
     //����������
     Repeat
           LayerName := LyrObj.Name;

           LayerThickness := FloatToStrF(0,ffFixed,3,3);
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

     //������������ ������
     For i := 0 To LyrMehPairs.Count - 1 Do
     Begin
       LyrObj := Stack.LayerObject[LayerPairS[i,1]];
       LayerName := LyrObj.Name;
       LayerTypeStr := 'Mechanical';
       LayerThickness := FloatToStrF(0,ffFixed,3,3);
       XMLIn.Add(#9+#9+#9+'<Layer name="'+LayerName+'" type="'+LayerTypeStr+'" thickness="'+LayerThickness+'"/>');
     end;

     XMLIn.Add(#9+#9+'</StackUpLayers>');
     //*******�������� ��� ��������������� ����********//
     XMLIn.Add(#9+#9+'<UnStackLayers>');

     for LayerType := eMechanical1 to eMechanical16 do
     begin
        LyrMeh := Stack.LayerObject[LayerType];
        if LyrMehPairs.LayerUsed(LyrMeh.LayerID) = false then
        Begin
          If LyrMeh.MechanicalLayerEnabled  then
          XMLIn.Add(#9+#9+#9+'<Layer name="'+LyrMeh.Name+'" type="Doc"/>');
        end;
     end;
     XMLIn.Add(#9+#9+#9+'<Layer name="'+Board.LayerName(56)+'" type="Doc"/>');
     XMLIn.Add(#9+#9+'</UnStackLayers>');
     XMLIn.Add(#9+'</Layers>');
End;

Function PadTemplate(Pad : IPCB_Pad; TUnit : TUnit;) : String;    //������� ��������� ���� ����  !!!
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
     //����� ����� ���������� ������ � ������� ������� � ����������� �� �����
     If Pad.IsSurfaceMount = True then
     Begin
          FirstSimbol := 'r';
          XSize := CoordToMMs(Pad.XSizeOnLayer[Pad.Layer])*100;
          YSize := CoordToMMs(Pad.YSizeOnLayer[Pad.Layer])*100;
          XSizeStr := floattostr(XSize);
          YSizeStr := floattostr(YSize);

          Radius := CoordToMMs(Pad2.CornerRadius[Pad.Layer]);
          CornerPercent := Radius*2*100/XSize*100;

          ShapeType := Pad.ShapeOnLayer[Pad.Layer];
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
          XSize := CoordToMMs(Pad.XSizeOnLayer[Pad.Layer])*100;
          XSizeStr := floattostr(XSize);
          YSize := CoordToMMs(Pad.YSizeOnLayer[Pad.Layer])*100;
          YSizeStr := floattostr(YSize);
          Radius := CoordToMMs(Pad2.CornerRadius[Pad.Layer]);
          CornerPercent := Radius*2*100/XSize*100;

          ShapeType := Pad.ShapeOnLayer[Pad.Layer];
          if ShapeType = eRounded then FirstSimbol := 'c';

          Case ShapeType of
               eRectangular    : Shape := 'h90';
               eOctagonal      : Shape := 'h90c50';
               eRounded        : Shape := 'r90'; // ������� h �� r
               eRoundedRectangular : Shape := 'h90r'+IntToStr(CornerPercent);
          End;

          Result := FirstSimbol + XsizeStr+ '_'+YsizeStr + Shape;
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
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Track.Layer)+'" name="'+Board.LayerName(Track.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+'<Line>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x1 ))+'" y="'+FloatToStr(CoordToMMs( Track.y1))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x2 ))+'" y="'+FloatToStr(CoordToMMs( Track.y2))+'"/>');
  ResultString.Add(StringTab+#9+'</Line>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

Function TrackKeepoutToXML(Board :IPCB_Board; Track : IPCB_Track; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Keepout>');
  ResultString.Add(StringTab+#9+'<Role>');
  ResultString.Add(StringTab+#9+#9+'<Trace>');
  ResultString.Add(StringTab+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Track.Layer)+'" name="'+Board.LayerName(Track.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+#9+'</Trace>');
  ResultString.Add(StringTab+#9+'</Role>');
  ResultString.Add(StringTab+#9+'<Line>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x1 ))+'" y="'+FloatToStr(CoordToMMs( Track.y1))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Track.x2 ))+'" y="'+FloatToStr(CoordToMMs( Track.y2))+'"/>');
  ResultString.Add(StringTab+#9+'</Line>');
  ResultString.Add(StringTab+'</Keepout>');
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
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Fill.Layer)+'" name="'+Board.LayerName(Fill.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+'<Polygon>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X1Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y1Location))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X1Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y2Location))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X2Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y2Location))+ '"/>');
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Fill.X2Location ))+'" y="'+FloatToStr(CoordToMMs( Fill.Y1Location))+ '"/>');
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

Function FillKeepoutToXML(Board :IPCB_Board; Fill : IPCB_Fill; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
 X1           : String;
 Y1           : String;
 X1Coord      : Tcoord;
 Y1Coord      : Tcoord;
 X            : String;
 Y            : String;
 XCoord       : Tcoord;
 YCoord       : Tcoord;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Keepout>');
  ResultString.Add(StringTab+#9+'<Role>');
  ResultString.Add(StringTab+#9+#9+'<Trace>');
  ResultString.Add(StringTab+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Fill.Layer)+'" name="'+Board.LayerName(Fill.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+#9+'</Trace>');
  ResultString.Add(StringTab+#9+'</Role>');


  ResultString.Add(StringTab+#9+'<Polygon>');
  XCoord := Fill.X1Location;
  YCoord := Fill.Y1Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');


  XCoord := Fill.X1Location;
  YCoord := Fill.Y2Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');

  XCoord := Fill.X2Location;
  YCoord := Fill.Y2Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');

  XCoord := Fill.X2Location;
  YCoord := Fill.Y1Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');
  ResultString.Add(StringTab+#9+'</Polygon>');

  ResultString.Add(StringTab+'</Keepout>');
  Result := ResultString;
End;

// ��������������� �������� � ������������ �����
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
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Poly.Layer)+'" name="'+Board.LayerName(Poly.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+'<Polygon>');
  For I := 0 To Poly.PointCount - 1 Do //������� ���� ����������
  Begin
    If Poly.Segments[I].Kind = ePolySegmentLine Then  // ���� ������� ������������ ����� �����
    Begin
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Poly.Segments[I].vx ))+'" y="'+FloatToStr(CoordToMMs( Poly.Segments[I].vy))+ '"/>');
    End
    Else  // ���� ���� �� ��������� �� ����� 5 �����
    Begin
      AStartX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AStartY := Poly.Segments[I].cy;
      AEndX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AEndY := Poly.Segments[I].cy;
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AStartX,AStartY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle1);
      RotateCoordsAroundXY(AEndX,AEndY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle2);
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // ����� � ����� ����
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*3/4));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // ����� � 3/4 ����
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/2));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // ����� � 1/2 ����
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/4));
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // ����� � 1/4 ����
      ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AStartX ))+'" y="'+FloatToStr(CoordToMMs( AStartY))+ '"/>'); // ����� � ������ ����
    End;
  End;
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

// ��������������� �������� � ���������� �����
Function PolygonSignalToXML(Board :IPCB_Board; Poly : IPCB_Polygon; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 TestString   : String;
 I            : integer;
 AStartX   : TCoord;
 AStartY   : TCoord;
 AEndX     : TCoord;
 AEndY     : TCoord;
 AMidX     : TCoord;
 AMidY     : TCoord;
 Temp      : float;
 PolyType  : String;
 PolyNet   : String;

Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  TestString := FloatToStr(Poly.PolygonType);
  Case Poly.PolygonType of
    ePolySolid : PolyType := 'Solid';
    ePolyHHatch :  PolyType := 'Hatched';

  end;
  if Poly.Net = Nil then Begin PolyNet := 'No_Net'; End else begin PolyNet := Poly.Net.Name; end;

  ResultString.Add(StringTab+'<Copper connectPad="Thermal" lineWidth="'+FloatToStr(CoordToMMs(Poly.TrackSize))+
                                                          '" lineClr="'+FloatToStr(CoordToMMs(Poly.Grid))+
                                                        '" minSquare="'+FloatToStr(CoordToMMs(Poly.ArcApproximation))+
                                                        '" fillType="Solid">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Poly.Layer)+'" name="'+Board.LayerName(Poly.Layer)+'"/>');
  ResultString.Add(StringTab+#9+'<NetRef name="'+PolyNet+'"/>');
  ResultString.Add(StringTab+#9+'<ThermalPad>');
  ResultString.Add(StringTab+#9+#9+'<Thermal spokeNum="'+FloatToStr(Poly.ReliefEntries)+
                                        '" spokeWidth="'+FloatToStr(CoordToMMs(Poly.ReliefConductorWidth))+
                                           '" backoff="'+FloatToStr(CoordToMMs(Poly.ReliefAirGap))+'"/>');
  ResultString.Add(StringTab+#9+'</ThermalPad>');
  ResultString.Add(StringTab+#9+'<ThermalVia/>');
  ResultString.Add(StringTab+#9+'<Shape>');

  ResultString.Add(StringTab+#9+#9+'<Polygon>');
  For I := 0 To Poly.PointCount - 1 Do //������� ���� ����������
  Begin
    If Poly.Segments[I].Kind = ePolySegmentLine Then  // ���� ������� ������������ ����� �����
    Begin
      ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Poly.Segments[I].vx ))+'" y="'+FloatToStr(CoordToMMs( Poly.Segments[I].vy))+ '"/>');
    End
    Else  // ���� ���� �� ��������� �� ����� 5 �����
    Begin
      AStartX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AStartY := Poly.Segments[I].cy;
      AEndX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AEndY := Poly.Segments[I].cy;
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AStartX,AStartY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle1);
      RotateCoordsAroundXY(AEndX,AEndY,Poly.Segments[I].cx,Poly.Segments[I].cy,Poly.Segments[I].Angle2);
      ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AEndX ))+'" y="'+FloatToStr(CoordToMMs( AEndY))+ '"/>'); // ����� � ����� ����
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*3/4));
      ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // ����� � 3/4 ����
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/2));
      ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // ����� � 1/2 ����
      AMidX := Poly.Segments[I].cx+Poly.Segments[I].Radius;
      AMidY := Poly.Segments[I].cy;
      RotateCoordsAroundXY(AMidX,AMidY,Poly.Segments[I].cx,Poly.Segments[I].cy,(Poly.Segments[I].Angle1 + (Poly.Segments[I].Angle2-Poly.Segments[I].Angle1)*1/4));
      ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AMidX ))+'" y="'+FloatToStr(CoordToMMs( AMidY))+ '"/>'); // ����� � 1/4 ����
      ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( AStartX ))+'" y="'+FloatToStr(CoordToMMs( AStartY))+ '"/>'); // ����� � ������ ����
    End;
  End;
  ResultString.Add(StringTab+#9+#9+'</Polygon>');
  ResultString.Add(StringTab+#9+'</Shape>');
  ResultString.Add(StringTab+#9+'<Voids/>');
  ResultString.Add(StringTab+#9+'<Islands/>');
  ResultString.Add(StringTab+'</Copper>');
  Result := ResultString;
End;

Function FillSignalToXML(Board :IPCB_Board; Fill : IPCB_Fill; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 FillNet      : String;
 X            : String;
 Y            : String;
 XCoord       : Tcoord;
 YCoord       : Tcoord;
 i            : integer;
begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Copper connectPad="Thermal" lineWidth="'+'0.1'+
                                                          '" lineClr="'+'0.1'+
                                                        '" minSquare="'+'0.01'+
                                                        '" fillType="Solid">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Fill.Layer)+'" name="'+Board.LayerName(Fill.Layer)+'"/>');
  if Fill.Net = Nil then Begin FillNet := 'No_Net'; End else begin FillNet := Fill.Net.Name; end;
  ResultString.Add(StringTab+#9+'<NetRef name="'+FillNet+'"/>');
  ResultString.Add(StringTab+#9+'<ThermalPad>');
  ResultString.Add(StringTab+#9+#9+'<Thermal spokeNum="'+'4'+
                                        '" spokeWidth="'+'0.2'+
                                           '" backoff="'+'0.2'+'"/>');
  ResultString.Add(StringTab+#9+'</ThermalPad>');
  ResultString.Add(StringTab+#9+'<ThermalVia/>');
  ResultString.Add(StringTab+#9+'<Shape>');
  ResultString.Add(StringTab+#9+#9+'<Polygon>');
  XCoord := Fill.X1Location;
  YCoord := Fill.Y1Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');


  XCoord := Fill.X1Location;
  YCoord := Fill.Y2Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');

  XCoord := Fill.X2Location;
  YCoord := Fill.Y2Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');

  XCoord := Fill.X2Location;
  YCoord := Fill.Y1Location;
  RotateCoordsAroundXY(XCoord,YCoord,(Fill.X1Location+(Fill.X2Location-Fill.X1Location)/2),Fill.Y1Location+(Fill.Y2Location-Fill.Y1Location)/2,Fill.Rotation);
  X   := FloatToStr(CoordToMMs( XCoord));
  Y   := FloatToStr(CoordToMMs( YCoord));
  ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');

  ResultString.Add(StringTab+#9+#9+'</Polygon>');
  ResultString.Add(StringTab+#9+'</Shape>');
  ResultString.Add(StringTab+#9+'<Voids/>');
  ResultString.Add(StringTab+#9+'<Islands/>');
  ResultString.Add(StringTab+'</Copper>');
  Result := ResultString;
end;

Function RegionSignalToXML(Board :IPCB_Board; Region : IPCB_Region; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 RegionNet    : String;
 X            : String;
 Y            : String;
 XCoord       : Tcoord;
 YCoord       : Tcoord;
 i            : integer;
 PolyGeom     : IPCB_GeometricPolygon;
 Contour      : IPCB_Contour;
begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  PolyGeom := Region.GeometricPolygon;
  Contour := PolyGeom.Contour[0];

  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Copper connectPad="Thermal" lineWidth="'+'0.1'+
                                                          '" lineClr="'+'0.1'+
                                                        '" minSquare="'+'0.01'+
                                                        '" fillType="Solid">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Region.Layer)+'" name="'+Board.LayerName(Region.Layer)+'"/>');
  if Region.Net = Nil then Begin RegionNet := 'No_Net'; End else begin RegionNet := Region.Net.Name; end;
  ResultString.Add(StringTab+#9+'<NetRef name="'+RegionNet+'"/>');
  ResultString.Add(StringTab+#9+'<ThermalPad>');
  ResultString.Add(StringTab+#9+#9+'<Thermal spokeNum="'+'4'+
                                        '" spokeWidth="'+'0.2'+
                                           '" backoff="'+'0.2'+'"/>');
  ResultString.Add(StringTab+#9+'</ThermalPad>');
  ResultString.Add(StringTab+#9+'<ThermalVia/>');
  ResultString.Add(StringTab+#9+'<Shape>');
  ResultString.Add(StringTab+#9+#9+'<Polygon>');
  For I := 0 To Contour.Count - 1 Do //������� ���� ����������
  Begin
    ResultString.Add(StringTab+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Contour.x[I] ))+'" y="'+FloatToStr(CoordToMMs( Contour.y[I]))+ '"/>');
  End;

  ResultString.Add(StringTab+#9+#9+'</Polygon>');
  ResultString.Add(StringTab+#9+'</Shape>');
  ResultString.Add(StringTab+#9+'<Voids/>');
  ResultString.Add(StringTab+#9+'<Islands/>');
  ResultString.Add(StringTab+'</Copper>');
  Result := ResultString;
end;

// ��������������� ������� � ������������ �����
Function RegionToXML(Board :IPCB_Board; Region : IPCB_Region; TabCount: integer;) : TStringList;
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
 PolyGeom  : IPCB_GeometricPolygon;
 Contour   : IPCB_Contour;

Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  PolyGeom := Region.GeometricPolygon;
  Contour := PolyGeom.Contour[0];

  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Detail lineWidth="0.001">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Region.Layer)+'" name="'+Board.LayerName(Region.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+'<Polygon>');
  For I := 0 To Contour.Count - 1 Do //������� ���� ����������
  Begin
    ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Contour.x[I] ))+'" y="'+FloatToStr(CoordToMMs( Contour.y[I]))+ '"/>');
  End;
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Detail>');
  Result := ResultString;
End;

// ��������������� ������� � ���� �������
Function RegionKeepoutToXML(Board :IPCB_Board; Region : IPCB_Region; TabCount: integer;) : TStringList;  // ���� �� ��������.. ����� �����������
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
 PolyGeom  : IPCB_GeometricPolygon;
 Contour   : IPCB_Contour;

Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;
  PolyGeom := Region.GeometricPolygon;
  Contour := PolyGeom.Contour[0];
  ResultString := TStringList.Create;

  ResultString.Add(StringTab+'<Keepout>');
  ResultString.Add(StringTab+#9+'<Role>');
  ResultString.Add(StringTab+#9+#9+'<Trace>');
  ResultString.Add(StringTab+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Region.Layer)+'" name="'+Board.LayerName(Region.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+#9+'</Trace>');
  ResultString.Add(StringTab+#9+'</Role>');

  ResultString.Add(StringTab+#9+'<Polygon>');
  For I := 0 To Contour.Count - 1 Do //������� ���� ����������
  Begin
    ResultString.Add(StringTab+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( Contour.x[I] ))+'" y="'+FloatToStr(CoordToMMs( Contour.y[I]))+ '"/>');
  End;
  ResultString.Add(StringTab+#9+'</Polygon>');
  ResultString.Add(StringTab+'</Keepout>');
  Result := ResultString;
End;

//����� ������������� ����� ������������� �����������!
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
  if  PozTextStyle = 0 then  //���� ���������� ����� ��� �� �������
  begin
  FileXmlTSt.Add(#9+#9+'<TextStyle name="'+TextStyle+ '" fontName="Arial" height="'+FloatToStr(CoordToMMs(Text.Size))+'"/>');
  end;  //����� �������� ������ ���������� �����

  //��������� ��������� ����������
  TextMirror := 'off';
  if Text.MirrorFlag = true then TextMirror := 'on';

  ResultString.Add(StringTab+'<Text text="'+Text.Text+'" align="LB" angle="'+inttostr(Text.Rotation)+'" mirror="'+TextMirror+'">');
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Text.Layer)+'" name="'+Board.LayerName(Text.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+'<TextStyleRef name="'+TextStyle+'"/>');

  ResultString.Add(StringTab+#9+'<Org x="'+FloatToStr(CoordToMMs(Text.XLocation))+'" y="'+FloatToStr(CoordToMMs(Text.YLocation))+'"/>');
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
  ResultString.Add(StringTab+#9+'<LayerRef type="'+LayerIDtoStr(Arc.Layer)+'" name="'+Board.LayerName(Arc.Layer)+'"/>');//���!
  if (Arc.StartAngle = 0 & Arc.EndAngle = 360) then // ���� ������ ����
  Begin
  ResultString.Add(StringTab+#9+'<Circle diameter="'+FloatToStr(CoordToMMs(Arc.Radius*2))+'">');
  ResultString.Add(StringTab+#9+#9+'<Center x="'+FloatToStr(CoordToMMs(Arc.XCenter))+'" y="'+FloatToStr(CoordToMMs( Arc.YCenter))+'"/>');
  ResultString.Add(StringTab+#9+'</Circle>');
  End
  Else  // ���� ����������� ����
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

Function ArcKeepoutToXML(Board :IPCB_Board; Arc : IPCB_Arc; TabCount: integer;) : TStringList;
Var
 ResultString : TStringList;
 StringTab    : String;
 I            : integer;
Begin
  StringTab := '';
  For I:=0 to TabCount-1 do StringTab := StringTab + #9;

  ResultString := TStringList.Create;
  ResultString.Add(StringTab+'<Keepout>');
  ResultString.Add(StringTab+#9+'<Role>');
  ResultString.Add(StringTab+#9+#9+'<Trace>');
  ResultString.Add(StringTab+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Arc.Layer)+'" name="'+Board.LayerName(Arc.Layer)+'"/>');//���!
  ResultString.Add(StringTab+#9+#9+'</Trace>');
  ResultString.Add(StringTab+#9+'</Role>');


  if (Arc.StartAngle = 0 & Arc.EndAngle = 360) then // ���� ������ ����
  Begin
  ResultString.Add(StringTab+#9+'<Circle diameter="'+FloatToStr(CoordToMMs(Arc.Radius*2))+'">');
  ResultString.Add(StringTab+#9+#9+'<Center x="'+FloatToStr(CoordToMMs(Arc.XCenter))+'" y="'+FloatToStr(CoordToMMs( Arc.YCenter))+'"/>');
  ResultString.Add(StringTab+#9+'</Circle>');
  End
  Else  // ���� ����������� ����
  Begin
  ResultString.Add(StringTab+#9+'<Arc>');
  ResultString.Add(StringTab+#9+#9+'<Center x="'+FloatToStr(CoordToMMs( Arc.XCenter))+'" y="'+FloatToStr(CoordToMMs( Arc.YCenter))+'"/>');
  ResultString.Add(StringTab+#9+#9+'<Start x="'+FloatToStr(CoordToMMs( Arc.StartX ))+'" y="'+FloatToStr(CoordToMMs( Arc.StartY))+'"/>');
  ResultString.Add(StringTab+#9+#9+'<End x="'+FloatToStr(CoordToMMs( Arc.EndX))+'" y="'+FloatToStr(CoordToMMs( Arc.EndY ))+'"/>');
  ResultString.Add(StringTab+#9+'</Arc>');
  End;
  ResultString.Add(StringTab+'</Keepout>');
  Result := ResultString;

End;

Procedure PadstacksAdd(Padstacks : TStringList;  Pad: IPCB_Pad; PadStackName : String;);
var
   Pad2                    : IPCB_Pad2;
   PadPlated               : String;
   PadTypeSurf             : String;
   ShapeType               : TShape;
   padType                 : String;
   PadxReal                : Treal;
   PadYReal                : Treal;
   Board                   : IPCB_Board;
Begin
                     Board := PCBServer.GetCurrentPCBBoard;
                     Pad2 := Pad;
                     PadPlated := 'off';
                     if Pad2.plated then PadPlated := 'on';
                     If Pad.IsSurfaceMount = True then // ����������������������� ��
                     Begin
                          PadTypeSurf := 'SMD';
                          Padstacks.Add(#9+#9+#9+'<Padstack name="'+PadStackName+'" type="'+PadTypeSurf+'" metallized="'+PadPlated+'">');
                          Padstacks.Add(#9+#9+#9+#9+'<Thermal/>');
                          Padstacks.Add(#9+#9+#9+#9+'<Pads>');
                          ShapeType := Pad.ShapeOnLayer[Pad.Layer];
                          Case ShapeType of
                               eRectangular    :
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(1)+'"/>');
                                 End;
                               eOctagonal      : // !!! ������� ��� ��� �������������� � ������ 1,1,4 ����� ����� ���������!
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(1)+'"/>');
                                 End;
                               eRounded        :
                                 Begin
                                   PadType := 'PadOval';
                                   PadXReal := CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]);
                                   PadYReal := CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]);
                                   if PadXReal < PadYReal then
                                   Begin
                                     Padstacks.Add(#9+#9+#9+#9+#9+'<PadOval diameter="'+floattostr(PadXReal)+'">');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(1)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Stretch x="0.000" y="'+floattostr(PadYReal-PadXReal)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Shift x="0.000" y="0.000"/>');
                                   End
                                   Else
                                   Begin
                                     Padstacks.Add(#9+#9+#9+#9+#9+'<PadOval diameter="'+floattostr(PadYReal)+'">');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(1)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Stretch x="'+floattostr(PadXReal - PadYReal)+'" y="0.000"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Shift x="0.000" y="0.000"/>');
                                   End;
                                 End;
                               eRoundedRectangular :
                                 Begin
                                   Pad2 := Pad;
                                   PadType := 'PadRect';

                                   if cb_Version.Text = '1.1.3' then
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'">');

                                   if (cb_Version.Text = '1.1.4' | cb_Version.Text = '1.1.5') then
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'"'+
                                   ' handling="Rounding" handlingValue="'+floattostr(CoordToMMs(Pad2.CornerRadius[Pad.Layer]))+'">');

                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(eTopLayer)+'"/>');
                                 End;
                          End;
                     End; // ����� �����������������������

                     If Pad.IsSurfaceMount = false then  // �������� ��
                          Begin
                          PadTypeSurf := 'Through';

                          Padstacks.Add(#9+#9+#9+'<Padstack name="'+PadStackName+'" holeDiameter="'+
                          floattostr(CoordToMMs(Pad.HoleSize))+'" type="'+PadTypeSurf+'" metallized="'+PadPlated+'">');
                          Padstacks.Add(#9+#9+#9+#9+'<Thermal/>');
                          Padstacks.Add(#9+#9+#9+#9+'<Pads>');

                          ShapeType := Pad.ShapeOnLayer[Pad.Layer];
                          Case ShapeType of
                               eRectangular    :
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                               eOctagonal      : // !!! ������� ��� ��� �������������� ������ �� ���������!
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                               eRounded        :
                                 Begin

                                   PadType := 'PadOval';
                                   PadXReal := CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]);
                                   PadYReal := CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]);
                                   if PadXReal < PadYReal then
                                   Begin
                                     Padstacks.Add(#9+#9+#9+#9+#9+'<PadOval diameter="'+floattostr(PadXReal)+'">');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(1)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Stretch x="0.000" y="'+floattostr(PadYReal-PadXReal)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Shift x="0.000" y="0.000"/>');
                                   End
                                   Else
                                   Begin
                                     Padstacks.Add(#9+#9+#9+#9+#9+'<PadOval diameter="'+floattostr(PadYReal)+'">');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+Board.LayerName(1)+'"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Stretch x="'+floattostr(PadXReal - PadYReal)+'" y="0.000"/>');
                                     Padstacks.Add(#9+#9+#9+#9+#9+#9+'<Shift x="0.000" y="0.000"/>');
                                   End;
                                 End;
                               eRoundedRectangular :   // !!! ������� ��� ��� �������������� ������ �� ���������!
                                 Begin
                                   PadType := 'PadRect';
                                   Padstacks.Add(#9+#9+#9+#9+#9+'<PadRect width="'+
                                   floattostr(CoordToMMs(Pad.XSizeOnLayer[Pad.Layer]))+
                                   '" height="'+floattostr(CoordToMMs(Pad.YSizeOnLayer[Pad.Layer]))+'">');
                                   Padstacks.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
                                 End;
                          End;// ����� Case ShapeType
                     End; // ����� �������� ��

                Padstacks.Add(#9+#9+#9+#9+#9+'</'+PadType+'>');
                Padstacks.Add(#9+#9+#9+#9+'</Pads>');
                Padstacks.Add(#9+#9+#9+'</Padstack>');

End;

// �� ��� ���������� ����� ���� ������� ��� ���� �� 5.. �� ���-�� �����������;) ����� ��� � ������������ ����� ����� �����������
Procedure AddLL(XMLInL : TStringList; Board : IPCB_Board; Units: String; FileXmlTSt : TStringList;FileXMLCOB : TStringList; ViastacksLL : TStringList;);  // ����������
uses SysUtils;
Var // ����...
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
   Fill                    : IPCB_Fill;
   Region                  : IPCB_Region;
   PadSide                 : String;
   IteratorHandle          : IPCB_GroupIterator;
   PadIteratorHandle       : IPCB_GroupIterator;
   TextIteratorHandle      : IPCB_GroupIterator;
   NameComp                : String;
   TestString              : String;
   PadAngle                : String;
   PadStackName            : String;
   PozPadstack             : Integer;
   PadStacksAllName        : String;
   X                       : String;
   Y                       : String;
   XCoord                  : Tcoord;
   YCoord                  : Tcoord;
   X1Coord                 : Tcoord;
   Y1Coord                 : Tcoord;
   X2Coord                 : Tcoord;
   Y2Coord                 : Tcoord;
   X3Coord                 : Tcoord;
   Y3Coord                 : Tcoord;
   PadxReal                : Treal;
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
   LyrTV6                  : TV6_Layer;
   lyrObj                  : PCB_LayerObject;
   I                       : Integer;
   CompFix                 : String;
   PadFlip                 : String;
   LayerName               : String;
   CompSide                : String;
   LyrMehPairs             : IPCB_MechanicalLayerPairs;
   LayerPairS              : array[0..16,0..2] of Tlayer;
   LayerType               : Tlayer;
   LayerType2              : Tlayer;
   PadIteratorHandle2      : IPCB_BoardIterator;
   NetName                 : string;
   IDcomp                  : string;
   PolyGeom                : IPCB_GeometricPolygon;
   Contour                 : IPCB_Contour;
   Compcoord               : String;
   FillCoord               : String;
   Width                   : String;
   Height                  : String;


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
     LyrMehPairs := Board.MechanicalPairs;
     //if LyrMehPairs <> nil then
     //LyrMehPairs.LayerPair[0];
     //������� ��� ���� ����� ��������� ������ ��� LayerPair[I : Integer] ���������� TMechanicalLayerPair  � ������� ��������� ��� ������.
      i := 0;
      for LayerType := eMechanical1 to eMechanical16 do
        for LayerType2 := LayerType to eMechanical16 do
        begin
          if LyrMehPairs.PairDefined(LayerType,LayerType2) then
          begin
           LayerPairS[i,0] := LayerType;
           LayerPairS[i,1] := LayerType2;
           inc(i);
          end;
        end;


     //*******������������� �������� ���� ����������� �� ����� �� ���� �����********//
     ComponentIteratorHandle := Board.BoardIterator_Create;
     ComponentIteratorHandle.AddFilter_ObjectSet(MkSet(eComponentObject));
     ComponentIteratorHandle.AddFilter_LayerSet(AllLayers);
     ComponentIteratorHandle.AddFilter_Method(eProcessAll);
     Component := ComponentIteratorHandle.FirstPCBObject; // �������� ������ ���������

     //*******������� ���� �����������********//
     While (Component <> Nil) Do
     Begin
           NameComp := Component.Name.Text;                        // ��� ����������
           IDcomp := Component.UniqueId;                           // ������ ����� ���������� ID
           PadFlip := 'off';

           if pos('"'+NameComp+'"',Components.Text) <> 0 then begin
           ShowMessage('Components with the same name: '+NameComp);
           NameComp := NameComp +'$' +IDcomp;
           end;
           lbProcess.Caption := 'Component: ' + NameComp;
           Form1.Refresh;
           Footprints.Add(#9+#9+#9+'<Footprint name="'+Component.Pattern+'$' +NameComp +'$' +IDcomp+ '">');
           //Component.GetState_FootprintDescription;
           Components.Add(#9+#9+#9+'<Component name="'+NameComp + '">');
           Components.Add(#9+#9+#9+#9+'<Pins>');
           Packages.Add(#9+#9+#9+'<Package>');
           Packages.Add(#9+#9+#9+#9+'<ComponentRef name="'+NameComp+'"/>');
           Packages.Add(#9+#9+#9+#9+'<FootprintRef name="'+Component.Pattern+'$' +NameComp +'$' +IDcomp+ '"/>');
           CompFix := 'on';
           if Component.Moveable = true then CompFix := 'off';

           if Component.Layer = 1 then begin CompSide := 'Top'; end else begin CompSide := 'Bottom'; end;

           FileXMLCOB.Add(#9+#9+#9+'<CompInstance name="'+NameComp+'" side="'+CompSide+
                                    '" angle="'+inttostr(Component.Rotation)+'" fixed="'+CompFix+'">');
           FileXMLCOB.Add(#9+#9+#9+#9+'<ComponentRef name="'+NameComp+'"/>');
           FileXMLCOB.Add(#9+#9+#9+#9+'<FootprintRef name="'+Component.Pattern+'$' +NameComp +'$' +IDcomp+ '"/>');
           FileXMLCOB.Add(#9+#9+#9+#9+'<Org x="'+FloatToStr(CoordToMMs(Component.x))+'" y="'+FloatToStr(CoordToMMs(Component.y))+'"/>');
           FileXMLCOB.Add(#9+#9+#9+#9+'<Pins>');


           //*******������� ���� ����� ����������********//
           Footprints.Add(#9+#9+#9+#9+'<Pads>');
           PadIteratorHandle := Component.GroupIterator_Create;
           PadIteratorHandle.AddFilter_ObjectSet(MkSet(ePadObject));
           Pad := PadIteratorHandle.FirstPCBObject;
           While (Pad <> Nil) Do
           Begin
                inc (PadNum);
                PadAngle := IntToStr(Pad.Rotation-Component.Rotation);
                PadFlip := 'off';
                //if (Component.Layer = 32 & Pad.IsSurfaceMount = false )  then PadFlip := 'on';
                if (Component.Layer <> Pad.Layer & Pad.IsSurfaceMount)then PadFlip := 'on';
                Footprints.Add(#9+#9+#9+#9+#9+'<Pad padNum="'+IntToStr(PadNum)+'" name="'+Pad.Name+'" angle="'+PadAngle+'" flipped="'+PadFlip+'">');
                Components.Add(#9+#9+#9+#9+#9+'<Pin pinNum="'+IntToStr(PadNum)+'" name="'+Pad.Name+'"/>');
                Packages.Add(#9+#9+#9+#9+'<Pinpack pinNum="'+IntToStr(PadNum)+'" padNum="'+IntToStr(PadNum)+'"/>');
                FileXMLCOB.Add(#9+#9+#9+#9+#9+'<Pin padNum="'+IntToStr(PadNum)+'" name="'+Pad.Name+'">');
                TestString := Pad.Name;
                // ��������� ��� �� ����� ��� ������ �� ����
                PadStackName := PadTemplate(Pad,Board.DisplayUnit);
                PozPadstack := 0;
                PozPadstack := Pos(PadStackName+'&', PadStacksAllName);

                if PozPadstack = 0 then // ���� ������ �������� �� ����� ��� �������
                Begin
                     PadStacksAllName :=  PadStacksAllName +PadStackName+'&';
                     PadstacksAdd(Padstacks,pad,PadStackName);
                end; // ����� �������� ��������


                Footprints.Add(#9+#9+#9+#9+#9+#9+'<PadstackRef name="'+PadStackName+'"/>');
                FileXMLCOB.Add(#9+#9+#9+#9+#9+#9+'<PadstackRef name="'+PadStackName+'"/>');

                XCoord := Pad.x - Component.x;
                YCoord := Pad.y - Component.y;
                RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                if Component.Layer = 32 then XCoord := -XCoord;
                X   := FloatToStr(CoordToMMs( XCoord));
                Y   := FloatToStr(CoordToMMs( YCoord));

                FileXMLCOB.Add(#9+#9+#9+#9+#9+#9+'<Org x="'+X+'" y="'+Y+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<Org x="'+X+'" y="'+Y+'"/>');
                FileXMLCOB.Add(#9+#9+#9+#9+#9+'</Pin>');
                Footprints.Add(#9+#9+#9+#9+#9+'</Pad>');
                Pad := PadIteratorHandle.NextPCBObject;
           End;// ����� �������� �����
           Components.Add(#9+#9+#9+#9+'</Pins>');
           Components.Add(#9+#9+#9+'</Component>');
           Packages.Add(#9+#9+#9+'</Package>');
           padNum := 0;
           Footprints.Add(#9+#9+#9+#9+'</Pads>');
           FileXMLCOB.Add(#9+#9+#9+#9+'</Pins>');
           //*******�������� ������� ���� ��������� ���������� ����������********//
           TextIteratorHandle := Component.GroupIterator_Create;
           TextIteratorHandle.AddFilter_ObjectSet(MkSet(eTextObject));
           Text := TextIteratorHandle.FirstPCBObject;


           if TextIteratorHandle.FirstPCBObject <> Nil then
           Footprints.Add(#9+#9+#9+#9+'<Texts>');


           While (Text <> Nil) Do
           Begin
                //����������� � ��������� ������
                TextStyle := 'Arial'+ FloatToStr(CoordToMMs(Text.Size)*100);
                PozTextStyle := 0;
                PozTextStyle := Pos(TextStyle, FileXmlTSt.Text);
                if  PozTextStyle = 0 then  //���� ���������� ����� ��� �� �������
                begin
                     FileXmlTSt.Add(#9+#9+'<TextStyle name="'+TextStyle+
                     '" fontName="Arial" height="'+FloatToStr(CoordToMMs(Text.Size))+'"/>');
                end;  //����� �������� ������ ���������� �����

                //��������� ��������� ����������
                TextMirror := 'off';
                if Text.MirrorFlag = true then
                  Begin
                    TextMirror := 'on';
                    if Component.Layer = 32 then TextMirror := 'off';;
                  end;


                Footprints.Add(#9+#9+#9+#9+#9+'<Text text="'+ Text.text
                +'" align="LB" angle="'+inttostr(Text.Rotation-Component.Rotation)+'" mirror="'+TextMirror+'">'); // !!! �� �������� ���������� � align="LB"
                // ���������� � ��������� ����

                TextLayerType := LayerIDtoStr(Text.Layer);
                LayerName := Board.LayerName(Text.Layer);
                if LayerName = 'Bottom Overlay' then LayerName := 'Top Overlay';

                //���� ������ ���� �� ���������!
                if TextLayerType = 'Mechanical' then
                  For i := 0 To LyrMehPairs.Count - 1 Do
                     if Text.Layer = LayerPairS[i,1] then
                      LayerName := Board.LayerName(LayerPairS[i,0]);

                Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+TextLayerType+'" name="'+LayerName+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<TextStyleRef name="'+TextStyle+'"/>');

                XCoord := Text.XLocation - Component.x;
                YCoord := Text.YLocation - Component.y;
                RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                if Component.Layer = 32 then XCoord := -XCoord;
                X   := FloatToStr(CoordToMMs( XCoord));
                Y   := FloatToStr(CoordToMMs( YCoord));

                Footprints.Add(#9+#9+#9+#9+#9+#9+'<Org x="'+X+'" y="'+Y+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+'</Text>');
                Text := TextIteratorHandle.NextPCBObject; //��������� �����
           End;


           if TextIteratorHandle.FirstPCBObject <> Nil then
           Footprints.Add(#9+#9+#9+#9+'</Texts>');
           //*******����������� ������� ���� ��������� ���������� ����������********//
           Component.GroupIterator_Destroy(TextIteratorHandle);

           Footprints.Add(#9+#9+#9+#9+'<Details>');// �������������� ���������� ���� �����������

           //*******�������� ������� ���� �����, �����������********//
            //*******����� ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(eTrackObject));
           Track := IteratorHandle.FirstPCBObject;

           While (Track <> Nil) Do
           Begin
                //lyrObj := Track.Layer;
                //LyrTV6 := Track.Layer_V6;


                LayerName := Board.LayerName(Track.Layer);
                if Track.Layer = 34 then LayerName := Board.LayerName(33);

                //���� ������ ���� �� ���������!
                if LayerIDtoStr(Track.Layer) = 'Mechanical' then
                  For i := 0 To LyrMehPairs.Count - 1 Do
                     if Track.Layer = LayerPairS[i,1] then
                      LayerName := Board.LayerName(LayerPairS[i,0]);


                Footprints.Add(#9+#9+#9+#9+#9+'<Detail lineWidth="'+FloatToStr(CoordToMMs(Track.Width))+'">');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Track.Layer)+
                '" name="'+LayerName+'"/>');//���!
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<Line>');

                XCoord := Track.x1 - Component.x;
                YCoord := Track.y1 - Component.y;
                RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                if Component.Layer = 32 then XCoord := -XCoord;
                X   := FloatToStr(CoordToMMs( XCoord));
                Y   := FloatToStr(CoordToMMs( YCoord));
                Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');

                XCoord := Track.x2 - Component.x;
                YCoord := Track.y2 - Component.y;
                RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                if Component.Layer = 32 then XCoord := -XCoord;
                X   := FloatToStr(CoordToMMs( XCoord));
                Y   := FloatToStr(CoordToMMs( YCoord));
                Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+'"/>');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'</Line>');
                Footprints.Add(#9+#9+#9+#9+#9+'</Detail>');
                Track := IteratorHandle.NextPCBObject; //��������� �����
           End;
           Component.GroupIterator_Destroy(IteratorHandle);

           //*******���������� ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(eArcObject));
           Arc := IteratorHandle.FirstPCBObject;

           While (Arc <> Nil) Do
           Begin

                LayerName := Board.LayerName(Arc.Layer);
                if Arc.Layer = 34 then LayerName := Board.LayerName(33);
                //���� ������ ���� �� ���������!
                if LayerIDtoStr(Arc.Layer) = 'Mechanical' then
                  For i := 0 To LyrMehPairs.Count - 1 Do
                     if Arc.Layer = LayerPairS[i,1] then
                      LayerName := Board.LayerName(LayerPairS[i,0]);


                Footprints.Add(#9+#9+#9+#9+#9+'<Detail lineWidth="'+FloatToStr(CoordToMMs(Arc.LineWidth))+'">');
                Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Arc.Layer)+
                '" name="'+LayerName+'"/>');
                TestString :=  FloatToStr(Arc.EndAngle);
                if (Arc.StartAngle = 0 & Arc.EndAngle = 360) then // ���� ������ ����
                Begin
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'<Circle diameter="'+FloatToStr(CoordToMMs(Arc.Radius*2))+'">');
                  XCoord := Arc.XCenter - Component.x;
                  YCoord := Arc.YCenter - Component.y;
                  RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                  if Component.Layer = 32 then XCoord := -XCoord;
                  X   := FloatToStr(CoordToMMs( XCoord));
                  Y   := FloatToStr(CoordToMMs( YCoord));
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Center x="'+X+'" y="'+Y+'"/>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'</Circle>');
                End
                Else  // ���� ����������� ����
                Begin
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'<Arc>');
                  XCoord := Arc.XCenter - Component.x;
                  YCoord := Arc.YCenter - Component.y;
                  RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                  if Component.Layer = 32 then XCoord := -XCoord;
                  X   := FloatToStr(CoordToMMs( XCoord));
                  Y   := FloatToStr(CoordToMMs( YCoord));
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Center x="'+X+'" y="'+Y+'"/>');


                  XCoord := Arc.StartX - Component.x;
                  YCoord := Arc.StartY - Component.y;
                  if Component.Layer = 32 then
                  Begin
                    XCoord := Arc.EndX - Component.x;
                    YCoord := Arc.EndY - Component.y;
                  end;
                  RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                  if Component.Layer = 32 then XCoord := -XCoord;
                  X   := FloatToStr(CoordToMMs( XCoord));
                  Y   := FloatToStr(CoordToMMs( YCoord));
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Start x="'+X+'" y="'+Y+'"/>');


                  XCoord := Arc.EndX - Component.x;
                  YCoord := Arc.EndY - Component.y;
                  if Component.Layer = 32 then
                  Begin
                    XCoord := Arc.StartX - Component.x;
                    YCoord := Arc.StartY - Component.y;
                  end;
                  RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                   if Component.Layer = 32 then XCoord := -XCoord;
                  X   := FloatToStr(CoordToMMs( XCoord));
                  Y   := FloatToStr(CoordToMMs( YCoord));
                  Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<End x="'+X+'" y="'+Y+'"/>');
                  Footprints.Add(#9+#9+#9+#9+#9+#9+'</Arc>');
                End;
                Footprints.Add(#9+#9+#9+#9+#9+'</Detail>');
                Arc := IteratorHandle.NextPCBObject; //��������� ����������
           End;
           Component.GroupIterator_Destroy(IteratorHandle);


           Footprints.Add(#9+#9+#9+#9+'</Details>');
           //*******����������� ������� ���� �����,����������� ********//


           //*******��������� ������� ********//
           Footprints.Add(#9+#9+#9+#9+'<KeepoutsTrace>');
           //*******���� ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(eFillObject));
           Fill :=  IteratorHandle.FirstPCBObject;

           While (Fill <> Nil) Do
           Begin
             if Fill.IsKeepout = true then // ���� ���� ���� �������
             begin
                LayerName := Board.LayerName(Fill.Layer);
                if Fill.Layer = 32 then LayerName := Board.LayerName(1);
                //���� ������ ���� �� ��������� � ������ �� ���!
                //if LayerIDtoStr(Fill.Layer) = 'Mechanical' then
                //  For i := 0 To LyrMehPairs.Count - 1 Do
                //     if Fill.Layer = LayerPairS[i,1] then
                //      LayerName := Board.LayerName(LayerPairS[i,0]);
                 Footprints.Add(#9+#9+#9+#9+#9+'<Keepout>');
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Fill.Layer)+
                 '" name="'+LayerName+'"/>');
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'<Polygon>');

                 Width := Fill.X2Location - Fill.X1Location;
                 Height := Fill.Y2Location - Fill.Y1Location;
                 XCoord := Fill.XLocation;
                 YCoord := Fill.YLocation;
                 X1Coord := XCoord + Width;
                 Y1Coord := YCoord;
                 X2Coord := XCoord + Width;
                 Y2Coord := YCoord + Height;
                 X3Coord := XCoord;
                 Y3Coord := YCoord + Height;
                 RotateCoordsAroundXY(X1Coord,Y1Coord,XCoord,YCoord,Fill.Rotation);
                 RotateCoordsAroundXY(X2Coord,Y2Coord,XCoord,YCoord,Fill.Rotation);
                 RotateCoordsAroundXY(X3Coord,Y3Coord,XCoord,YCoord,Fill.Rotation);
                 XCoord := XCoord - Component.x;
                 YCoord := YCoord - Component.y;
                 X1Coord := X1Coord - Component.x;
                 Y1Coord := Y1Coord - Component.y;
                 X2Coord := X2Coord - Component.x;
                 Y2Coord := Y2Coord - Component.y;
                 X3Coord := X3Coord - Component.x;
                 Y3Coord := Y3Coord - Component.y;

                 RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                 RotateCoordsAroundXY(X1Coord,Y1Coord,0,0,-Component.Rotation);
                 RotateCoordsAroundXY(X2Coord,Y2Coord,0,0,-Component.Rotation);
                 RotateCoordsAroundXY(X3Coord,Y3Coord,0,0,-Component.Rotation);
                 if Component.Layer = 32 then begin
                   XCoord := -XCoord;
                   X1Coord := -X1Coord;
                   X2Coord := -X2Coord;
                   X3Coord := -X3Coord;
                 end;



                 X   := FloatToStr(CoordToMMs( XCoord));
                 Y   := FloatToStr(CoordToMMs( YCoord));
                 Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');
                 X   := FloatToStr(CoordToMMs( X1Coord));
                 Y   := FloatToStr(CoordToMMs( Y1Coord));
                 Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');
                 X   := FloatToStr(CoordToMMs( X2Coord));
                 Y   := FloatToStr(CoordToMMs( Y2Coord));
                 Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');
                 X   := FloatToStr(CoordToMMs( X3Coord));
                 Y   := FloatToStr(CoordToMMs( Y3Coord));
                 Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');


                 Footprints.Add(#9+#9+#9+#9+#9+#9+'</Polygon>');
                 Footprints.Add(#9+#9+#9+#9+#9+'</Keepout>');
             end;
             Fill := IteratorHandle.NextPCBObject; //��������� ����
           End;
           Component.GroupIterator_Destroy(IteratorHandle);

           //*******������� ********//
           IteratorHandle := Component.GroupIterator_Create;
           IteratorHandle.AddFilter_ObjectSet(MkSet(eRegionObject));
           Region :=  IteratorHandle.FirstPCBObject;

           While (Region <> Nil) Do
           Begin
             if Region.IsKeepout = true then // ���� ������ ���� �������
             begin
                LayerName := Board.LayerName(Region.Layer);
                if Region.Layer = 32 then LayerName := Board.LayerName(1);
                //���� ������ ���� �� ��������� � ������ �� ���!
                //if LayerIDtoStr(Region.Layer) = 'Mechanical' then
                //  For i := 0 To LyrMehPairs.Count - 1 Do
                //     if Region.Layer = LayerPairS[i,1] then
                //      LayerName := Board.LayerName(LayerPairS[i,0]);
                 Footprints.Add(#9+#9+#9+#9+#9+'<Keepout>');
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Region.Layer)+
                 '" name="'+LayerName+'"/>');
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'<Polygon>');
                 PolyGeom := Region.GeometricPolygon;
                 Contour := PolyGeom.Contour[0];

                 For I := 0 To Contour.Count - 1 Do //������� ���� ����������
                 Begin
                   XCoord := Contour.x[I] - Component.x;
                   YCoord := Contour.y[I] - Component.y;
                   RotateCoordsAroundXY(XCoord,YCoord,0,0,-Component.Rotation);
                   if Component.Layer = 32 then XCoord := -XCoord;
                   X   := FloatToStr(CoordToMMs( XCoord));
                   Y   := FloatToStr(CoordToMMs( YCoord));
                   Footprints.Add(#9+#9+#9+#9+#9+#9+#9+'<Dot x="'+X+'" y="'+Y+ '"/>');
                 End;
                 Footprints.Add(#9+#9+#9+#9+#9+#9+'</Polygon>');
                 Footprints.Add(#9+#9+#9+#9+#9+'</Keepout>');
             end;
             Region := IteratorHandle.NextPCBObject; //��������� ������
           End;
           Component.GroupIterator_Destroy(IteratorHandle);

           Footprints.Add(#9+#9+#9+#9+'</KeepoutsTrace>');

           // ��������� ���������
           Component := ComponentIteratorHandle.NextPCBObject;
           Inc(ComponentCount);
           Footprints.Add(#9+#9+#9+'</Footprint>');
           FileXMLCOB.Add(#9+#9+#9+'</CompInstance>');
     End;  // ����������� ������������ ���� ���������
     Board.BoardIterator_Destroy(ComponentIteratorHandle);
     FileXMLCOB.Add(#9+#9+'</Components>');
     FileXMLCOB.Add(#9+#9+'<FreePads>');
     //*******������� ���� �����********//
     PadIteratorHandle2 := Board.BoardIterator_Create;
     PadIteratorHandle2.AddFilter_ObjectSet(MkSet(ePadObject));
     PadIteratorHandle2.AddFilter_LayerSet(AllLayers);
     PadIteratorHandle2.AddFilter_Method(eProcessAll);
     Pad := PadIteratorHandle2.FirstPCBObject; //������ ����
          While (pad <> Nil) Do
          Begin
            if (pad.Component = Nil) then
            Begin//���� ��� �� ����������� ����������
              TestString := pad.Name;
              PadSide := 'Top';
              if pad.layer = 32 then PadSide := 'Bottom';
              FileXMLCOB.Add(#9+#9+#9+'<FreePad side="'+PadSide+'" angle="'+IntToStr(pad.Rotation)+'" fixed="off">');
              PadStackName := PadTemplate(Pad,Board.DisplayUnit);

              PozPadstack := 0;
              PozPadstack := Pos(PadStackName+'&', PadStacksAllName);

              if PozPadstack = 0 then // ���� ������ �������� �� ����� ��� �������
              Begin
                     PadStacksAllName :=  PadStacksAllName +PadStackName+'&';
                     PadstacksAdd(Padstacks,pad,PadStackName);
              end; // ����� �������� ��������
              //���� ������ �������� ��� �� ��� ����� �������

              FileXMLCOB.Add(#9+#9+#9+#9+'<PadstackRef name="'+PadStackName+'"/>');
              NetName := 'No_Net';
              if pad.Net <> Nil then
              Begin
                NetName := Pad.Net.Name;
              End;
              FileXMLCOB.Add(#9+#9+#9+#9+'<NetRef name="'+NetName+'"/>');
              FileXMLCOB.Add(#9+#9+#9+#9+'<Org x="'+FloatToStr(CoordToMMs(Pad.x))+'" y="'+FloatToStr(CoordToMMs(Pad.y))+'"/>');
              FileXMLCOB.Add(#9+#9+#9+'</FreePad>');
            end;
            pad := PadIteratorHandle2.NextPCBObject;
          End;
     Board.BoardIterator_Destroy(PadIteratorHandle2);


     FileXMLCOB.Add(#9+#9+'</FreePads>');

     Padstacks.Add(#9+#9+'</Padstacks>');
     ViastacksLL.Add(#9+#9+'</Viastacks>');
     Footprints.Add(#9+#9+'</Footprints>');
     Components.Add(#9+#9+'</Components>');

     Packages.Add(#9+#9+'</Packages>');
     XMLInL.AddStrings(Padstacks);
     XMLInL.AddStrings(ViastacksLL);
     XMLInL.AddStrings(Footprints);
     XMLInL.AddStrings(Components);
     XMLInL.AddStrings(Packages);
     XMLInL.Add(#9+'</LocalLibrary>');
     FileXMLCOB.Add(#9+'</ComponentsOnBoard>');

     //*******���������********//
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
NetName   : String;

BoardOutline: IPCB_BoardOutline;
Begin
     Constructive.Add(#9+'<Constructive version="1.0">');
     //*******������ �����********//
     Constructive.Add(#9+#9+'<BoardOutline>');
     Constructive.Add(#9+#9+#9+'<Contour>');
     BoardOutline  := Board.BoardOutline;
     Count         := BoardOutline.PointCount;

     X0 := BoardOutline.Segments[0].vx;
     Y0 := BoardOutline.Segments[0].vy;
     XEnd := X0;
     YEnd := Y0;
     lbProcess.Caption := 'PCB Contour '; Form1.Refresh;
     For I:=0 To BoardOutline.PointCount - 1 Do //������� ���� ���������� ������� �����
       Begin
         If I = 0 then
         If BoardOutline.Segments[0].Kind = ePolySegmentLine Then I := 1;

         If BoardOutline.Segments[I].Kind = ePolySegmentLine Then  // ���� ������� ������������ ����� �����
            Begin
              Constructive.Add(#9+#9+#9+#9+'<Shape lineWidth="0.001">');
              Constructive.Add(#9+#9+#9+#9+#9+'<Line>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( XEnd))+
                      '" y="'+FloatToStr(CoordToMMs( YEnd))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+#9+'<Dot x="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].vx))+
                      '" y="'+FloatToStr(CoordToMMs( BoardOutline.Segments[I].vy))+'"/>');
              Constructive.Add(#9+#9+#9+#9+#9+'</Line>');
              Constructive.Add(#9+#9+#9+#9+'</Shape>');
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
                Constructive.Add(#9+#9+#9+#9+'</Shape>');
              End;

            End
            Else // ���� ������� ������������ ����� ����
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
              Constructive.Add(#9+#9+#9+#9+'</Shape>');
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
              Constructive.Add(#9+#9+#9+#9+'</Shape>');
            End;

       End;// ����� �������� ���� ���������� ������� �����

     Constructive.Add(#9+#9+#9+'</Contour>');
     Constructive.Add(#9+#9+'</BoardOutline>');

     //*******������������ ����********//
     Constructive.Add(#9+#9+'<MechLayerObjects>');

     //*******���������� �����********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eTrackObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Track := MechIterH.FirstPCBObject; //������ ���� �� ������������ ����

     lbProcess.Caption := 'Tracks In Mechanical Layers'; Form1.Refresh;
     While (Track <> Nil) Do
     Begin
       if Track.Component = Nil then
       Begin
         Constructive.AddStrings(TrackToXML(Board,Track,3));
         LID := Track.Layer;
       End;
       Track := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Arc In Mechanical Layers'; Form1.Refresh;
     //*******���������� ����������********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eArcObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Arc := MechIterH.FirstPCBObject; //������ ���������� �� ������������ ����

     While (Arc <> Nil) Do
     Begin
       if Arc.Component = Nil then
       Begin
         Constructive.AddStrings(ArcToXML(Board,Arc,3));
       End;
       Arc := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Fill In Mechanical Layers'; Form1.Refresh;
     //*******���������� ����********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eFillObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Fill := MechIterH.FirstPCBObject; //������ ���� �� ������������ ����

     While (Fill <> Nil) Do
     Begin
       if Fill.Component = Nil then
       Begin
       Constructive.AddStrings(FillToXML(Board,Fill,3));
       End;
       Fill := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Poly In Mechanical Layers'; Form1.Refresh;
     //*******���������� ��������********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(ePolyObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Poly := MechIterH.FirstPCBObject; //������ ������� �� ������������ ����

     While (Poly <> Nil) Do
     Begin
       if Poly.Component = Nil then
       Begin
         Constructive.AddStrings(PolygonToXML(Board,Poly,3));
       End;
       Poly := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Region In Mechanical Layers'; Form1.Refresh;
     //*******���������� �������********//
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72));
     MechIterH.AddFilter_ObjectSet(MkSet(eRegionObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Region := MechIterH.FirstPCBObject; //������ ������ �� ������������ ����

     While (Region <> Nil) Do
     Begin
       Constructive.AddStrings(RegionToXML(Board,Region,3));
       Region := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);
     Constructive.Add(#9+#9+'</MechLayerObjects>');


      //*******���������� �������********//
     Constructive.Add(#9+#9+'<Keepouts>');

     lbProcess.Caption := 'Fills keepouts'; Form1.Refresh;
     // ����
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     MechIterH.AddFilter_ObjectSet(MkSet(eFillObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Fill := MechIterH.FirstPCBObject; //������ ����

     While (Fill <> Nil) Do
     Begin
       if (Fill.Component = Nil & Fill.IsKeepout = true) then
       Begin
         Constructive.AddStrings(FillKeepoutToXML(Board,Fill,3));
       End;
       Fill := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Regions keepouts'; Form1.Refresh;
     // �������
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     MechIterH.AddFilter_ObjectSet(MkSet(eRegionObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Region := MechIterH.FirstPCBObject; //������ ������

     While (Region <> Nil) Do
     Begin
       if (Region.Component = Nil & Region.IsKeepout = true) then
       Begin
         Constructive.AddStrings(RegionKeepoutToXML(Board,Region,3));
       End;
       Region := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Lines keepouts'; Form1.Refresh;
     //�����
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     MechIterH.AddFilter_ObjectSet(MkSet(eTrackObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Track := MechIterH.FirstPCBObject; //������ �����

     While (Track <> Nil) Do
     Begin
       if (Track.Component = Nil & Track.IsKeepout = true) then
       Begin
         Constructive.AddStrings(TrackKeepoutToXML(Board,Track,3));
         LID := Track.Layer;
       End;
       Track := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);

     lbProcess.Caption := 'Arc keepouts'; Form1.Refresh;
     //����������
     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     MechIterH.AddFilter_ObjectSet(MkSet(eArcObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Arc := MechIterH.FirstPCBObject; //������ ����������

     While (Arc <> Nil) Do
     Begin
       if (Arc.Component = Nil & Arc.IsKeepout = true) then
       Begin
         Constructive.AddStrings(ArcKeepoutToXML(Board,Arc,3));
       End;
       Arc := MechIterH.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(MechIterH);


     Constructive.Add(#9+#9+'</Keepouts>');

     //*******���������� ��������� ����������********//
     Constructive.Add(#9+#9+'<Texts>');

     MechIterH := Board.BoardIterator_Create;
     MechIterH.AddFilter_LayerSet(AllLayers);
     MechIterH.AddFilter_ObjectSet(MkSet(eTextObject));
     MechIterH.AddFilter_Method(eProcessAll);
     Text := MechIterH.FirstPCBObject; //������ ��������� ������ �� ����� ����
     While (Text <> Nil) Do
     Begin
       if Text.Component = Nil then
       Begin
         lbProcess.Caption := 'Texts: ' + Text.Text ; Form1.Refresh;
         Constructive.AddStrings(TextToXML(Board,Text,3,FileXmlTSt));
       End;
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
   FintString : String;
   indexString: integer;
Begin
     FileXMLNList.Add(#9+'<NetList version="1.0">');
     //*******���������� ����********//
     IteratorHandle := Board.BoardIterator_Create;
     IteratorHandle.AddFilter_ObjectSet(MkSet(eNetObject));
     IteratorHandle.AddFilter_LayerSet(AllLayers);
     IteratorHandle.AddFilter_Method(eProcessAll);
     Net := IteratorHandle.FirstPCBObject; //������ ����
     FileXMLNList.Add(#9+#9+'<Net name="No_Net">');
     FileXMLNList.Add(#9+#9+'</Net>');

     lbProcess.Caption := 'Nets'; Form1.Refresh;
     While (Net <> Nil) Do
     Begin

       FileXMLNList.Add(#9+#9+'<Net name="'+Net.Name+'">');
       FileXMLNList.Add(#9+#9+'</Net>');
       Net := IteratorHandle.NextPCBObject;
     End;


     /// ���������� �������� ���������� � ����� ������������� ����.
     lbProcess.Caption := 'Pins to Nets'; Form1.Refresh;
     PadIteratorHandle := Board.BoardIterator_Create;
     PadIteratorHandle.AddFilter_ObjectSet(MkSet(ePadObject));
     PadIteratorHandle.AddFilter_LayerSet(AllLayers);
     PadIteratorHandle.AddFilter_Method(eProcessAll);
     pad := PadIteratorHandle.FirstPCBObject; //������ ����
     //�������������� ���� ��������� ��������� ���� ����� �����!
     While (pad <> Nil) Do
          Begin
            if (pad.Component <> Nil & pad.Net <> Nil) then //���� ��� ����������� ���������� � ����� ����
              Begin
                FintString := (#9+#9+'<Net name="'+pad.Net.Name+'">');
                indexString := FileXMLNList.IndexOf(FintString)+1;
                FileXMLNList.Insert(indexString,(#9+#9+#9+'<PinRef compName="'+pad.Component.Name.Text+'" pinName="'+pad.Name+'"/>'));
              End;
          pad := PadIteratorHandle.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(PadIteratorHandle);

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
   LyrGrName  : String;
   I          : integer;
   LyrObj     : IPCB_LayerObject;
   LyrID      : Integer;
   LyrSet     : IPCB_LayerSet;
Begin
  LayerGroups := TStringList.Create;
  NetGroups := TStringList.Create;
  CompGroups := TStringList.Create;
  FileXMLGroup.Add(#9+'<Groups version="1.1">');
  lbProcess.Caption := 'Groups'; Form1.Refresh;
  LayerGroups.Add(#9+#9+'<LayerGroups>');
  NetGroups.Add(#9+#9+'<NetGroups>');
  CompGroups.Add(#9+#9+'<CompGroups>');

  IterClass := Board.BoardIterator_Create;
  IterClass.SetState_FilterAll;
  IterClass.AddFilter_ObjectSet(MkSet(eClassObject));
  c := IterClass.FirstPCBObject;


  While c <> NIl Do
   Begin

       //���� ������ �����
       If c.MemberKind = eClassMemberKind_Net Then
       Begin
           lbProcess.Caption := 'Grooup Net: '+c.Name; Form1.Refresh;
           TestString := c.Name;
           NetGroups.Add(#9+#9+#9+'<NetGroup name="'+c.Name+'">');

           IterObj := Board.BoardIterator_Create; // ���������� ����
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
       End;// ����� �������� ������ �����

       //���� ������ �����������
       If c.MemberKind = eClassMemberKind_Component Then
       Begin
           lbProcess.Caption := 'Grooup Component: '+c.Name; Form1.Refresh;
           TestString := c.Name;
           CompGroups.Add(#9+#9+#9+'<CompGroup name="'+c.Name+'">');

           IterObj := Board.BoardIterator_Create; // ���������� ����������
           IterObj.AddFilter_ObjectSet(MkSet(eComponentObject));
           IterObj.AddFilter_LayerSet(AllLayers);
           IterObj.AddFilter_Method(eProcessAll);
           Component := IterObj.FirstPCBObject;

           While Component <> NIl Do
           Begin
              If c.IsMember(Component) Then
                CompGroups.Add(#9+#9+#9+#9+'<CompInstanceRef name="'+Component.Name.Text+'"/>');

              Component := IterObj.NextPCBObject;
           End;
           CompGroups.Add(#9+#9+#9+'</CompGroup>');
           Board.BoardIterator_Destroy(IterObj);
       End;// ����� �������� ������ �����������

       c := IterClass.NextPCBObject;
   End;
   Board.BoardIterator_Destroy(IterClass);

   //������ �����

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
     LyrGrName := BoardSet.Name;
     Delete(LyrGrName,Pos('&',LyrGrName),1); // ����� �� ������������ � ��������� ������ '&'
     LayerGroups.Add(#9+#9+#9+'<LayerGroup name="'+LyrGrName+'">');
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

Procedure AddRules (FileXMLRul :TStringList;FileXMLHSRul :TStringList; Board : IPCB_Board;  );
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
   Viastacks     : TStringList;

Begin
   RuleWidthS := TStringList.Create;
   RuleClearS := TStringList.Create;
   RuleClearCompS := TStringList.Create;
   RuleNetS  := TStringList.Create;
   Viastacks := TStringList.Create;
   RuleWidth := Nil;
   RuleClear := Nil;
   RuleClearComp := Nil;
   lbProcess.Caption := 'Rules'; Form1.Refresh;
   Stack := Board.LayerStack;
   FileXMLHSRul.Add(#9+'<HiSpeedRules version="2.1">');
   FileXMLRul.Add(#9+'<Rules version="1.2">');
   FileXMLHSRul.Add(#9+#9+'<RulesImpedances>');
   RuleWidthS.Add(#9+#9+'<RulesWidthOfWires>');
   RuleClearS.Add(#9+#9+'<RulesClearancesNetToNet>');
   RuleClearCompS.Add(#9+#9+'<RulesClearancesCompToComp>');
   RuleNetS.Add(#9+#9+'<NetProperties>');
   Viastacks.Add(#9+#9+'<RulesViastacksOfNets>');

   // ������� �������� ������ ���� ���
   BoardIterator        := Board.BoardIterator_Create;
   BoardIterator.AddFilter_ObjectSet(MkSet(eRuleObject));
   BoardIterator.AddFilter_LayerSet(AllLayers);
   BoardIterator.AddFilter_Method(eProcessAll);
   Rule := BoardIterator.FirstPCBObject;
   While (Rule <> Nil) Do
   Begin// ������ �������� ���� ������
     if Rule.RuleKind = eRule_DifferentialPairsRouting Then
     Begin// ���� ������� ���� ���
       RuleDiff := Rule;
       FileXMLHSRul.Add(#9+#9+#9+'<ImpedanceDiff name="'+RuleDiff.name+'" Z0="100">');
       LyrClass := eLayerClass_Electrical;        // ������ ��� ����
       LyrObj := Stack.First(LyrClass);         // �������� ������ ����
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
     End;//����� ������� ���� ���

     //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     //������ ��������� ���� ����� ������� �� ������ ������� �����������

     if Rule.RuleKind = eRule_MaxMinWidth Then
     Begin // ���� ������� ������ �����������
       if RuleWidth = Nil Then
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
     End; // ����� �������� ������� ������ �����������

     if Rule.RuleKind = eRule_Clearance Then
     Begin // ���� ������� ������ �����������
       if RuleClear = Nil Then
       Begin
         RuleClear := Rule;
         RuleClearS.Add(#9+#9+#9+'<ClearanceNetToNet enabled="on" clrnMin="'+FloatToStr(CoordToMMs(RuleClear.Gap ))+
                                                               '" clrnNom="'+FloatToStr(CoordToMMs(RuleClear.Gap *3))+'">');
         //����������� ����� ������ 3-�� ����������� ���� �������� ����������� ������������� � ������ �� ����� ������

         RuleClearS.Add(#9+#9+#9+#9+'<AllLayers/>');
         RuleClearS.Add(#9+#9+#9+#9+'<ObjectsAffected>');
         RuleClearS.Add(#9+#9+#9+#9+#9+'<AllNets/>');
         RuleClearS.Add(#9+#9+#9+#9+#9+'<AllNets/>');
         RuleClearS.Add(#9+#9+#9+#9+'</ObjectsAffected>');
         RuleClearS.Add(#9+#9+#9+'</ClearanceNetToNet>');
       End;
     End; // ����� �������� ������� ������ �����������

     if Rule.RuleKind = eRule_ComponentClearance Then
     Begin // ���� ������� ������ �����������
       if RuleClearComp = Nil Then
       Begin
         RuleClearComp := Rule;
         RuleClearCompS.Add(#9+#9+#9+'<ClearanceCompToComp enabled="on" clrn="'+FloatToStr(CoordToMMs(RuleClearComp.Gap))+'">');
         RuleClearCompS.Add(#9+#9+#9+#9+'<ObjectsAffected>');
         RuleClearCompS.Add(#9+#9+#9+#9+#9+'<AllComps/>');
         RuleClearCompS.Add(#9+#9+#9+#9+#9+'<AllComps/>');
         RuleClearCompS.Add(#9+#9+#9+#9+'</ObjectsAffected>');
         RuleClearCompS.Add(#9+#9+#9+'</ClearanceCompToComp>');
       End;
     End; // ����� �������� ������� ������ �����������

   Rule := BoardIterator.NextPCBObject;
   End;// ����� �������� ���� ������
   Board.BoardIterator_Destroy(BoardIterator);

  //*******������� ����� ������� ������������********//
  Viastacks.Add(#9+#9+#9+'<ViastacksOfNets enabled="on">');
  Viastacks.Add(#9+#9+#9+#9+'<ObjectsAffected>');
  Viastacks.Add(#9+#9+#9+#9+#9+'<AllNets/>');
  Viastacks.Add(#9+#9+#9+#9+'</ObjectsAffected>');
  Viastacks.Add(#9+#9+#9+#9+'<Viastacks>');
  Viastacks.Add(#9+#9+#9+#9+#9+'<AllViastacks/>');
  Viastacks.Add(#9+#9+#9+#9+'</Viastacks>');
  Viastacks.Add(#9+#9+#9+'</ViastacksOfNets>');

  //*******���������� ����********//
  IteratorNet := Board.BoardIterator_Create;
  IteratorNet.AddFilter_ObjectSet(MkSet(eNetObject));
  IteratorNet.AddFilter_LayerSet(AllLayers);
  IteratorNet.AddFilter_Method(eProcessAll);
  Net := IteratorNet.FirstPCBObject; //������ ����
  While (Net <> Nil) Do
  Begin
    RuleNetS.Add(#9+#9+#9+'<NetProperty route="on">');
    RuleNetS.Add(#9+#9+#9+#9+'<NetRef name="'+Net.Name+'"/>');
    RuleNetS.Add(#9+#9+#9+'</NetProperty>');
    Net := IteratorNet.NextPCBObject;
  End;


   RuleWidthS.Add(#9+#9+'</RulesWidthOfWires>');
   FileXMLRul.AddStrings(RuleWidthS); // ��������� ������ ������ ������ �����������

   RuleClearS.Add(#9+#9+'</RulesClearancesNetToNet>');
   FileXMLRul.AddStrings(RuleClearS);  //��������� ������ ������ ����-����

   RuleClearCompS.Add(#9+#9+'</RulesClearancesCompToComp>');
   FileXMLRul.AddStrings(RuleClearCompS);  //��������� ������ ������ ���������-���������

   Viastacks.Add(#9+#9+'</RulesViastacksOfNets>');
   FileXMLRul.AddStrings(Viastacks); //��������� ������ ������ ���������� ���������

   RuleNetS.Add(#9+#9+'</NetProperties>');
   FileXMLRul.AddStrings(RuleNetS); //��������� ������ ������ ������� �����

   FileXMLRul.Add(#9+'</Rules>');
   FileXMLHSRul.Add(#9+#9+'</RulesImpedances>');
   FileXMLHSRul.Add(#9+'</HiSpeedRules>');

   RuleWidthS.Free;
   RuleClearS.Free;
   RuleClearCompS.Free;
   RuleNetS.Free
End;

Function CompareVia (Via1 :IPCB_Via, Via2 :IPCB_Via): Boolean;
var i : integer;
Begin
  Result := true;
  For i := 1 to 32 do
  Begin // ��������� ������� ������������ �� ���� �����
    if Via1.SizeOnLayer[i] <> Via2.SizeOnLayer[i] then Result := false;
  end;
  if Via2.StartLayer <> Via1.StartLayer then Result := false;
  if Via2.StopLayer <> Via1.StopLayer then Result := false;
  if Via2.IsTenting_Top <> Via1.IsTenting_Top then Result := false;
  if Via2.IsTenting_Bottom <> Via1.IsTenting_Bottom then Result := false;
  if Via2.SolderMaskExpansion <> Via1.SolderMaskExpansion then Result := false;
End;

Procedure AddConnectivity (FileXMLCon :TStringList; Board : IPCB_Board; ViastacksLL : TStringList; );
uses Classes, Generics.Collections;
var
  BoardIterator : IPCB_BoardIterator;
  LyrObj        : IPCB_LayerObject;
  Via           : IPCB_Via;
  Track         : IPCB_Track;
  Arc           : IPCB_Arc;
  Poly          : IPCB_Polygon;
  Fill          : IPCB_Fill;
  Region        : IPCB_Region;
  ViaName       : String;
  ViaPoz        : Integer;
  ViaMass       : array[0..99] of IPCB_Via; // ���� ���������� ����������� ������ ����� �����������
  ViaMassi      : integer;
  i             : integer;
  f             : integer;
  ViaTemplate   : Boolean;
  ViaSingle     : Boolean;
  oldSize       : TCoord;
  ViaStart      : Boolean;
  TestString    : String;
  NetName       : String;

  Begin
    FileXMLCon.Add(#9+'<Connectivity version="1.2">');
    FileXMLCon.Add(#9+#9+'<Vias>');
    lbProcess.Caption := 'Vias'; Form1.Refresh;
    ViaMassi := -1;
    // ������� �������� �������� ���������� ���������
    BoardIterator        := Board.BoardIterator_Create;
    BoardIterator.AddFilter_ObjectSet(MkSet(eViaObject));
    BoardIterator.AddFilter_LayerSet(AllLayers);
    BoardIterator.AddFilter_Method(eProcessAll);
    Via := BoardIterator.FirstPCBObject;

    While (Via <> Nil) Do
    Begin // ���������� ���������� ���������
      ViaTemplate := true;  // ����� �� ��������� ����� ��� ������������
      For i := 0 to ViaMassi do
      Begin
        if CompareVia(Via,ViaMass[i]) then
        Begin
          ViaName := 'Via'+FloatToStr(i);
          ViaTemplate := false;
        end;
      end;

      if ViaTemplate = true then // ���� ����� ����� ��� �� ������� ���
      Begin
        inc(ViaMassi);
        if ViaMassi > 98 then Begin ShowError('It is not allowed more than 99 types of vias.'); Exit; end;
        ViaMass[ViaMassi] := Via;
        ViaName := 'Via'+FloatToStr(ViaMassi);

          //������� ���������� ��������� ��� LocalLibrary
          ViastacksLL.Add(#9+#9+#9+'<Viastack name="'+ViaName+'" holeDiameter="'+FloatToStr(CoordToMMs(Via.HoleSize))+'">');
          ViastacksLL.Add(#9+#9+#9+#9+'<LayerRange>');
          If (Via.StartLayer.layerID = 1 & Via.StopLayer.layerID = 32) then Begin
            ViastacksLL.Add(#9+#9+#9+#9+#9+'<AllLayers/>'); end
          else Begin
            ViastacksLL.Add(#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Via.StartLayer.layerID)+
                                                   '" name="'+Via.StartLayer.Name+'"/>');
            ViastacksLL.Add(#9+#9+#9+#9+#9+'<LayerRef type="'+LayerIDtoStr(Via.StopLayer.layerID)+
                                                   '" name="'+Via.StopLayer.Name+'"/>');
          End;
          ViastacksLL.Add(#9+#9+#9+#9+'</LayerRange>');

          ViastacksLL.Add(#9+#9+#9+#9+'<ViaPads>');

          //���������� ������������� ������ ���������� � ���� �����
          ViaSingle := true;
          LyrObj := Board.LayerStack.First(eLayerClass_Signal);
          oldSize := Via.SizeOnLayer[LyrObj.LayerID];
          Repeat
            if Via.SizeOnLayer[LyrObj.LayerID] <> oldSize then Begin ViaSingle := false; Break; end;
            oldSize := Via.SizeOnLayer[LyrObj.LayerID];
            LyrObj := Board.LayerStack.Next(eLayerClass_Signal, LyrObj)
          Until LyrObj = Nil;

          if ViaSingle then // ���� ��� ���� ����������
          Begin
            ViastacksLL.Add(#9+#9+#9+#9+#9+'<PadCircle diameter="'+FloatToStr(CoordToMMs(Via.SizeOnLayer[1]))+'">');
            ViastacksLL.Add(#9+#9+#9+#9+#9+#9+'<LayerTypeRef type="Signal"/>');
            ViastacksLL.Add(#9+#9+#9+#9+#9+'</PadCircle>');
          end
          else
          begin // ���� ��� ���� ������
            ViaStart := False;
            LyrObj := Board.LayerStack.First(eLayerClass_Signal);

            Repeat
              if Via.StartLayer.layerID = LyrObj.LayerID then ViaStart := true;

              if ViaStart = true then // ���������� ��������� ��� � �����
              Begin
              ViastacksLL.Add(#9+#9+#9+#9+#9+'<PadCircle diameter="'+FloatToStr(CoordToMMs(Via.SizeOnLayer[LyrObj.LayerID]))+'">');
              ViastacksLL.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Signal" name="'+LyrObj.Name+'"/>');
              ViastacksLL.Add(#9+#9+#9+#9+#9+'</PadCircle>');
              end;

              if Via.StopLayer.layerID = LyrObj.LayerID then break;
              LyrObj := Board.LayerStack.Next(eLayerClass_Signal, LyrObj)
            Until LyrObj = Nil;

          end;

          // �������� ���������� � �����
          if Via.IsTenting_Top = false then
          Begin
            LyrObj := Board.LayerStack.LayerObject(37);
            TestString := LyrObj.Name;
            ViastacksLL.Add(#9+#9+#9+#9+#9+'<PadCircle diameter="'+FloatToStr(CoordToMMs(Via.SizeOnLayer[37]))+'">');
            ViastacksLL.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Mask" name="'+LyrObj.Name+'"/>');
            ViastacksLL.Add(#9+#9+#9+#9+#9+'</PadCircle>');
          End;
          if Via.IsTenting_Bottom = false then
          Begin
            LyrObj := Board.LayerStack.LayerObject(38);
            TestString := LyrObj.Name;
            ViastacksLL.Add(#9+#9+#9+#9+#9+'<PadCircle diameter="'+FloatToStr(CoordToMMs(Via.SizeOnLayer[38]))+'">');
            ViastacksLL.Add(#9+#9+#9+#9+#9+#9+'<LayerRef type="Mask" name="'+LyrObj.Name+'"/>');
            ViastacksLL.Add(#9+#9+#9+#9+#9+'</PadCircle>');
          End;

          ViastacksLL.Add(#9+#9+#9+#9+'</ViaPads>');
          ViastacksLL.Add(#9+#9+#9+'</Viastack>');
      end;//����� �������� ������ �����������

      FileXMLCon.Add(#9+#9+#9+'<Via>');
      FileXMLCon.Add(#9+#9+#9+#9+'<ViastackRef name="'+ViaName+'"/>');
      if Via.Net <> nil then NetName := Via.Net.Name;
      if Via.Net = nil then NetName := 'No_Net';
      FileXMLCon.Add(#9+#9+#9+#9+'<NetRef name="'+NetName+'"/>');
      FileXMLCon.Add(#9+#9+#9+#9+'<Org x="'+FloatToStr(CoordToMMs(Via.x))+
                                    '" y="'+FloatToStr(CoordToMMs(Via.y))+'"/>');
      FileXMLCon.Add(#9+#9+#9+'</Via>');
      Via := BoardIterator.NextPCBObject;
    end; //����������� ������� ������������
    Board.BoardIterator_Destroy(BoardIterator);
    FileXMLCon.Add(#9+#9+'</Vias>');


    FileXMLCon.Add(#9+#9+'<Wires>');
    lbProcess.Caption := 'Wires - Track'; Form1.Refresh;
    // ������� �������� �������� �����������
    BoardIterator        := Board.BoardIterator_Create;
    BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                         16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
    BoardIterator.AddFilter_ObjectSet(MkSet(eTrackObject));
    BoardIterator.AddFilter_Method(eProcessAll);
    Track := BoardIterator.FirstPCBObject;
    While (Track <> Nil) Do
     Begin
       if (Track.IsKeepout <> true & Track.Polygon = Nil) then
       begin // ���� ����� �� �������
       FileXMLCon.Add(#9+#9+#9+'<Wire>');
       LyrObj := Board.LayerStack.LayerObject(Track.Layer);
       TestString := LyrObj.Name;

       if Track.Net = nil then       begin
         NetName := 'No_Net';
       end        else       begin
        NetName := Track.Net.Name;
       end;
       FileXMLCon.Add(#9+#9+#9+#9+'<LayerRef type="Signal" name="'+LyrObj.Name+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+'<NetRef name="'+NetName+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+'<Subwire width="'+FloatToStr(CoordToMMs(Track.Width))+'">');
       FileXMLCon.Add(#9+#9+#9+#9+#9+'<Start x="'+FloatToStr(CoordToMMs(Track.x1))+
                                          '" y="'+FloatToStr(CoordToMMs(Track.y1))+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+'<TrackLine>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+#9+'<End x="'+FloatToStr(CoordToMMs(Track.x2))+
                                           '" y="'+FloatToStr(CoordToMMs(Track.y2))+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+'</TrackLine>');
       FileXMLCon.Add(#9+#9+#9+#9+'</Subwire>');
       FileXMLCon.Add(#9+#9+#9+'</Wire>');

       end;//���� ����� �� ������ �� ��������� �����
       Track := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);

     lbProcess.Caption := 'Wires - Arc'; Form1.Refresh;
    // ������� �������� �������� �����������
    BoardIterator        := Board.BoardIterator_Create;
    BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                         16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
    BoardIterator.AddFilter_ObjectSet(MkSet(eArcObject));
    BoardIterator.AddFilter_Method(eProcessAll);
    Arc := BoardIterator.FirstPCBObject;

    While (Arc <> Nil) Do
     Begin
       if (Arc.IsKeepout <> true & Arc.Polygon = Nil) then
       begin // ���� ��� �� �������
       FileXMLCon.Add(#9+#9+#9+'<Wire>');
       LyrObj := Board.LayerStack.LayerObject(Arc.Layer);
       FileXMLCon.Add(#9+#9+#9+#9+'<LayerRef type="Signal" name="'+LyrObj.Name+'"/>');
       if Arc.Net = nil then       begin
         NetName := 'No_Net';
       end        else       begin
        NetName := Arc.Net.Name;
       end;

       FileXMLCon.Add(#9+#9+#9+#9+'<NetRef name="'+NetName+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+'<Subwire width="'+FloatToStr(CoordToMMs(Arc.LineWidth))+'">');
       FileXMLCon.Add(#9+#9+#9+#9+#9+'<Start x="'+FloatToStr(CoordToMMs(Arc.StartX))+
                                          '" y="'+FloatToStr(CoordToMMs(Arc.StartY))+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+'<TrackArc>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+#9+'<Center x="'+FloatToStr(CoordToMMs(Arc.XCenter))+
                                              '" y="'+FloatToStr(CoordToMMs(Arc.YCenter))+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+#9+'<End x="'+FloatToStr(CoordToMMs(Arc.EndX))+
                                           '" y="'+FloatToStr(CoordToMMs(Arc.EndY))+'"/>');
       FileXMLCon.Add(#9+#9+#9+#9+#9+'</TrackArc>');
       FileXMLCon.Add(#9+#9+#9+#9+'</Subwire>');
       FileXMLCon.Add(#9+#9+#9+'</Wire>');
       end; //���� ��� ������ �� ��������� ���
       Arc := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);
     FileXMLCon.Add(#9+#9+'</Wires>');
     //*******���������� ������� ������������********//
     FileXMLCon.Add(#9+#9+'<Coppers>');
     lbProcess.Caption := 'Coppers'; Form1.Refresh;
     //��������
     BoardIterator := Board.BoardIterator_Create;
     BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                         16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     BoardIterator.AddFilter_ObjectSet(MkSet(ePolyObject));
     BoardIterator.AddFilter_Method(eProcessAll);
     Poly := BoardIterator.FirstPCBObject; //������ �������

     While (Poly <> Nil) Do
     Begin
       FileXMLCon.AddStrings(PolygonSignalToXML(Board,Poly,3));
       Poly := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);


     // ����
     BoardIterator := Board.BoardIterator_Create;
     BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                       16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     BoardIterator.AddFilter_ObjectSet(MkSet(eFillObject));
     BoardIterator.AddFilter_Method(eProcessAll);
     Fill := BoardIterator.FirstPCBObject; //������ ����

     While (Fill <> Nil) Do
     Begin
       if (Fill.Component = Nil & Fill.IsKeepout = false) then
       Begin
         FileXMLCon.AddStrings(FillSignalToXML(Board,Fill,3));
       End;
       Fill := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);

     // �������
     BoardIterator := Board.BoardIterator_Create;
     BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                       16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     BoardIterator.AddFilter_ObjectSet(MkSet(eRegionObject));
     BoardIterator.AddFilter_Method(eProcessAll);
     Region := BoardIterator.FirstPCBObject; //������ ����

     While (Region <> Nil) Do
     Begin
       if (Region.Component = Nil & Region.IsKeepout = false) then
       Begin
         FileXMLCon.AddStrings(RegionSignalToXML(Board,Region,3));
       End;
       Region := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);


    FileXMLCon.Add(#9+#9+'</Coppers>');

    FileXMLCon.Add(#9+'</Connectivity>');
  End;

Function GetHexFrom(a : TColor) : String;
var r,g,b : integer;
begin
 b := a div $10000;
 g := (a mod $10000) div $100;
 r := a mod $100;
 Result := IntToHex(r,2) + IntToHex(g,2) + IntToHex(b,2);
end;

Procedure AddDispControl(FileXMLDispC :TStringList; Board : IPCB_Board;);
var
UnitsDist     : String;
LyrObj        : IPCB_LayerObject;
SysOpt        : IPCB_SystemOptions;
Stack         : IPCB_LayerStack;
LyrMeh        : IPCB_MechanicalLayer;
LyrClass      : String;
LyrColor      : TColor;
LyrColorS     : String;
LyrColorint   : integer;
LayerType     : Tlayer;

begin
     SysOpt := PCBServer.SystemOptions;
     //��������� �������� ���� �������
     lbProcess.Caption := 'Add DisplayControl'; Form1.Refresh;
     UnitsDist := UnitToString2(Board.DisplayUnit);
     FileXMLDispC.Add(#9+'<DisplayControl version="1.3">');
     If (UnitsDist = 'mm') then
     Begin
       FileXMLDispC.Add(#9+#9+'<Units preference="Metric"/>');
     End
     Else Begin ShowError('Switch to metric units!'); Exit; End; // ���� �������������� ������ ����������� �������

     // ���������� � ������ ����������� �����
     FileXMLDispC.Add(#9+#9+'<Colors hilightRate="42" darkRate="0"');
     FileXMLDispC.Add(#9+#9+'background="#030b10" board="#d4d4d4" netLines="#af7d3a"');
     FileXMLDispC.Add(#9+#9+'keepoutPlaceBoth="#f79646" keepoutWireAll="#ff0000" keepoutPlaceTop="#259500" keepoutPlaceBot="#00aaaa"');
     FileXMLDispC.Add(#9+#9+'compsBound="#ffffff" compsName="#ffffff" pinsName="#bad3ef" pinsNet="#bad3ef"');
     FileXMLDispC.Add(#9+#9+'clrThroughPads="#c0c0c0" clrThroughVias="#949494" clrBurriedVias="#949494" clrBlindVias="#949494" clrFixedVias="#7070b8"');
     FileXMLDispC.Add(#9+#9+'drcViolation="#ffffff" narrow="#ff00ff" trimmed="#038bef"/>');

     // ���������� � ������������ ���������
     FileXMLDispC.Add(#9+#9+'<Show');
     FileXMLDispC.Add(#9+#9+'showBoardOutline="on"');
     FileXMLDispC.Add(#9+#9+'showWires="on"');
     FileXMLDispC.Add(#9+#9+'showCoppers="on"');
     FileXMLDispC.Add(#9+#9+'showTexts="on"');
     FileXMLDispC.Add(#9+#9+'throughVia="on" burriedVia="on" blindVia="on" fixedVia="on"');
     FileXMLDispC.Add(#9+#9+'showVias="on"');
     FileXMLDispC.Add(#9+#9+'showTopMechDetails="on" showBotMechDetails="on"');
     FileXMLDispC.Add(#9+#9+'showSignalLayers="on" showTopMechLayers="on" showBotMechLayers="on" showDocLayers="on"');
     FileXMLDispC.Add(#9+#9+'showTopMechDetails="on" showBotMechDetails="on"');
     FileXMLDispC.Add(#9+#9+'showMetalPads="on" showTopMechPads="on" showBotMechPads="on"');
     FileXMLDispC.Add(#9+#9+'showNetLines="on" showMountingHoles="on"');
     FileXMLDispC.Add(#9+#9+'showComponents="on" showCompTop="on" showCompBot="on" showCompsDes="on" showPinsName="on" showPinsNet="on"');
     FileXMLDispC.Add(#9+#9+'showLabelRefDes="on" showLabelPartName="on" showLabelOther="on"');
     FileXMLDispC.Add(#9+#9+'showViolations="on" showTrimmed="on" showDRCViolations="on"');
     FileXMLDispC.Add(#9+#9+'showKeepouts="on" showRouteKeepouts="on"');
     FileXMLDispC.Add(#9+#9+'showSerpentArea="on"/>');

     // ���������� � �����
     FileXMLDispC.Add(#9+#9+'<Grid gridColor="#f2f2f2" gridKind="Dots">');
     FileXMLDispC.Add(#9+#9+#9+'<GridSpace x="5000" y="5000"/>');  //0,5��
     FileXMLDispC.Add(#9+#9+'</Grid>');

     //���������� � ������ �����
     FileXMLDispC.Add(#9+#9+'<LayersVisualOptions>');
     Stack := Board.LayerStack;
     LyrObj := Stack.First(eLayerClass_All);
     Repeat
       LyrColor := SysOpt.LayerColors[LyrObj.LayerId];
       LyrColorS := GetHexFrom(LyrColor);
       FileXMLDispC.Add(#9+#9+#9+'<LayerOptions>');
       FileXMLDispC.Add(#9+#9+#9+#9+'<LayerRef name="'+LyrObj.Name+'"/>');
       FileXMLDispC.Add(#9+#9+#9+#9+'<Colors details="#'+LyrColorS+'" pads="#'+LyrColorS+'" fix="#'+LyrColorS+'"/>');
       FileXMLDispC.Add(#9+#9+#9+#9+'<Show visible="on" details="on" pads="on"/>');
       FileXMLDispC.Add(#9+#9+#9+'</LayerOptions>');
       LyrObj := Stack.Next(eLayerClass_All,LyrObj);
     until LyrObj = Nil;

     for LayerType := eMechanical1 to eMechanical16 do
     begin
       LyrMeh := Stack.LayerObject[LayerType];
       if LyrMeh.MechanicalLayerEnabled then
       begin
       LyrColor := SysOpt.LayerColors[LyrMeh.LayerId];
       LyrColorS := GetHexFrom(LyrColor);
       FileXMLDispC.Add(#9+#9+#9+'<LayerOptions>');
       FileXMLDispC.Add(#9+#9+#9+#9+'<LayerRef name="'+LyrMeh.Name+'"/>');
       FileXMLDispC.Add(#9+#9+#9+#9+'<Colors details="#'+LyrColorS+'" pads="#'+LyrColorS+'" fix="#'+LyrColorS+'"/>');
       FileXMLDispC.Add(#9+#9+#9+#9+'<Show visible="on" details="on" pads="on"/>');
       FileXMLDispC.Add(#9+#9+#9+'</LayerOptions>');
       end;
     end;

     FileXMLDispC.Add(#9+#9+'</LayersVisualOptions>');
     FileXMLDispC.Add(#9+#9+'<ColorNets enabled="on" colorizeWire="on" colorizePad="on" colorizeCopper="on" colorizeVia="on" colorizeNetline="on"/>');
     FileXMLDispC.Add(#9+'</DisplayControl>');
end;

Procedure ADtoTopoR;
Var
   UTF8Str     : UTF8String;
   Board       : IPCB_Board;
   Track       : IPCB_Track;
   Pad         : IPCB_Pad;
   Primitive   : IPCB_Primitive;
   Iterator    : IPCB_BoardIterator;
   PrimNumber  : Integer;
   FileName    : String;
   BoardName   : String;
   UnitsDist   : String;
   FileXml     : TStringList; // �������� ���� fst � ������� xml <TopoR_PCB_File>
   FileXml2    : TStringList;
   FileXmlTSt  : TStringList; // ����� ��������� ������  <TextStyles version="1.0">
   FileXmlLL   : TStringList; // ����� ��������� ���������� <LocalLibrary version="1.1">
   FileXMLContr: TStringList; // ����� ������������ ����� <Constructive version="1.0">
   FileXMLCOB  : TStringList; // ����� ����������� �� ����� <ComponentsOnBoard version="1.1">
   FileXMLNList: TStringList; // ����� �������� <NetList version="1.0">
   FileXMLGroup: TStringList; // ����� ����� <Groups version="1.1">
   FileXMLHSRul: TStringList; // ����� ���������������� ������ <HiSpeedRules version="2.1">
   FileXMLRul  : TStringList; // ����� ������ <Rules version="1.2">
   FileXMLCon  : TStringList; // ����� ���������� <Connectivity version="1.1">
   FileXMLDispC: TStringList; // ����� ����������� <DisplayControl version="1.3">
   ViastacksLL : TStringList; // ������ ���������� ���������  ����������
   TopoRCommand : TStringList; // ��������� ���� �����!
   TextStyleAll: String;
   StartTime   : String;
   i           : integer;
   wBOM        : integer;
   FS          : TFileStream;
   UTF8BOM     : array[0..2] of Byte;
Begin
     //*******����������********//
     UTF8BOM[0] := $EF;
     UTF8BOM[1] := $BB;
     UTF8BOM[2] := $BF;
     FileXml := TStringList.Create;                      // �������� ������� ������
     FileXml.DefaultEncoding := TEncoding.UTF8;
     FileXml2:= TStringList.Create;
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
     TopoRCommand := TStringList.Create;
     ViastacksLL.Add(#9+#9+'<Viastacks>');
     l_H.Font.Color := clRed;
     l_L.Font.Color := clRed;
     l_C.Font.Color := clRed;
     l_LL.Font.Color := clRed;
     l_N.Font.Color := clRed;
     l_G.Font.Color := clRed;
     l_R.Font.Color := clRed;
     l_D.Font.Color := clRed;

     //StartTime := GetCurrentTimeString();

     Board := PCBServer.GetCurrentPCBBoard;              // ��������� ������� �����
     TextStyleAll := '';
     If Board = nil then Begin ShowError('Open board!'); Exit; End; // ���� ����� ��� �� �������

     UnitsDist := UnitToString2(Board.DisplayUnit);
     //*******������� ����� (Header)********//
     AddHeader(FileXml,Board.FileName,UnitsDist);
     l_H.Font.Color := clGreen;     Form1.Refresh;

     //*******������� ������ �����********//
     AddLayers(FileXML,Board,UnitsDist);
     l_L.Font.Color := clGreen;     Form1.Refresh;

     //*******������� ��������� �����********//
     FileXmlTSt.Add(#9+'<TextStyles version="1.0">');
     FileXmlTSt.Add(#9+#9+'<TextStyle name="(Default)" fontName="QUALITY" height="2.5"/>'); // ��������� ��������� �����

     //*******������� ����������� �����********//
     AddContruct(FileXMLContr,Board,FileXmlTSt);


     //*******������� ����������********//
     AddConnectivity(FileXMLCon,Board,ViastacksLL);
     l_C.Font.Color := clGreen;     Form1.Refresh;

     //*******������� ��������� ����������� FileXmlLL********//
     //*******����������� ��������� �����********//
     //*******��������� ���������� � ��������� ����������� �� �����********//
     AddLL(FileXmlLL,Board,UnitsDist,FileXmlTSt, FileXMLCOB, ViastacksLL);
     FileXmlTSt.Add(#9+'</TextStyles>');
     l_LL.Font.Color := clGreen;     Form1.Refresh;

     //*******������� �������********//
     AddNetList(FileXMLNList,Board);
     l_N.Font.Color := clGreen;     Form1.Refresh;

     //*******������� ������********//
     AddGroups(FileXMLGroup,Board);
     l_G.Font.Color := clGreen;      Form1.Refresh;

     //*******������� �������********//
     AddRules(FileXMLRul,FileXMLHSRul,Board);
     l_R.Font.Color := clGreen;  Form1.Refresh;

     //*******������� ��������� �����������******//
     AddDispControl(FileXMLDispC, Board);
     l_D.Font.Color := clGreen;  Form1.Refresh;
     //*******���������� ��� � 1 ����********//
     FileXml.AddStrings(FileXmlTSt);   // ���������� �������� ������ ��������� ������
     FileXml.AddStrings(FileXmlLL);    // ���������� ��������� ���������� �����������
     FileXml.AddStrings(FileXMLContr); // ���������� ����������� �����
     FileXml.AddStrings(FileXMLCOB); // ���������� ���������� � ������������ �����������
     FileXml.AddStrings(FileXMLNList); // ���������� �������
     FileXml.AddStrings(FileXMLGroup); // ���������� ������
     FileXml.AddStrings(FileXMLHSRul); // ���������� ���������������� �������
     FileXml.AddStrings(FileXMLRul);   // ����������  �������
     FileXml.AddStrings(FileXMLCon);   // ����������  ����������
     FileXml.AddStrings(FileXMLDispC); // ����������  �������� �����������
     FileXml.Add('</TopoR_PCB_File>'); // ��������� ��� ������� ������


     //ShowMessage('AddNetList: ' +StartTime +' - '+ GetCurrentTimeString());

     //*******���������� XML �����********//
     if cbStartTopoR.Checked then   // ���� ����� �� ����� ��������� ����� � �����������
     //!!!!!!!!!!�� ��������
     // �� ������� ������ ���������� ������� ������ ����������
     begin
       if tExport.Text = '' then begin
         FileName := StringReplace(Board.FileName,'.PcbDoc','_exp.fst',rfReplaceAll);
       end else begin
         FileName := tExport.Text;
       end;
       FileXml.SaveToFile(FileName);


       TopoRCommand.Add('<?xml version="1.0" encoding="UTF-8"?>');
       TopoRCommand.Add('<Version>1.0</Version>');
       TopoRCommand.Add('<Commands>');
       if tProject.Text ='' then begin
         TopoRCommand.Add(#9+'<Import name="'+FileName+'"/> '); end
       else     begin
         topoRCommand.Add(#9+'<Import name="'+FileName+'" project="'+tProject.Text+'"/> ');
       end;
       TopoRCommand.Add(#9+'<Enable logging="off" messagecompletion="off"/>');
       TopoRCommand.Add('</Commands>');

       TopoRCommand.SaveToFile(Board.FileName+'.fsa');

       // ��� ����� ����� �� ������� ��������� �����
     end
     else // ������ ��������� ����
     begin
       if tExport.Text = '' then begin
         FileName := SaveAFile()+'.fst';
       end else begin
         FileName := tExport.Text;
       end;
       if FileName <> '' then begin
         FileXml.SaveToFile(FileName);
         ShowMessage('FST ����: '+FileName+' - ������! � ������� �� ' +IntToStr(FileXml.Count) + ' �����.');
       end else begin
         ShowMessage('��������� ��� FST �����!');
       end;
     end;

     lbProcess.Caption := 'End'; Form1.Refresh;
     //*******������********//
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
     FileXMLDispC.Free;
     FileXMLCon.Free;
     TopoRCommand.Free;
End;

// ������� ��� ���������� � ���������� �����
Procedure RemoveTrackinSignal(Board       : IPCB_Board;);
var
  BoardIterator : IPCB_BoardIterator;
  LyrObj        : IPCB_LayerObject;
  Via           : IPCB_Via;
  Track         : IPCB_Track;
  Arc           : IPCB_Arc;
  Prim          : IPCB_Primitive;
begin

    // ������� �������� �������� �����������
    BoardIterator        := Board.BoardIterator_Create;
    BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                         16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
    BoardIterator.AddFilter_ObjectSet(MkSet(eTrackObject));
    BoardIterator.AddFilter_Method(eProcessAll);
    Track := BoardIterator.FirstPCBObject;

    While (Track <> Nil) Do
     Begin
       if Track.IsKeepout <> true then
       begin // ���� ����� �� �������
        Board.RemovePCBObject(Track);
       end;//���� ����� �� ������ �� ��������� �����
       Track := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);

    // ������� �������� �������� ���
    BoardIterator        := Board.BoardIterator_Create;
    BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                         16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
    BoardIterator.AddFilter_ObjectSet(MkSet(eArcObject));
    BoardIterator.AddFilter_Method(eProcessAll);
    Arc := BoardIterator.FirstPCBObject;

    While (Arc <> Nil) Do
     Begin
       if Arc.IsKeepout <> true then
       begin // ���� ���� �� �������
        Board.RemovePCBObject(Arc);
       end;//���� ���� �� ������ �� ��������� ����
       Arc := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);
end;

// ������� ��� ����������� � ���������� �����
Procedure RemoveViainSignal(Board       : IPCB_Board;);
var
  BoardIterator : IPCB_BoardIterator;
  LyrObj        : IPCB_LayerObject;
  Via           : IPCB_Via;
  Track         : IPCB_Track;
  Arc           : IPCB_Arc;
  Prim          : IPCB_Primitive;
begin

    // ������� �������� �������� �����������
    BoardIterator        := Board.BoardIterator_Create;
    BoardIterator.AddFilter_LayerSet(AllLayers);
    BoardIterator.AddFilter_ObjectSet(MkSet(eViaObject));
    BoardIterator.AddFilter_Method(eProcessAll);
    Via := BoardIterator.FirstPCBObject;

    While (Via <> Nil) Do
     Begin
       Board.RemovePCBObject(Via);
       Via := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);
end;

// ������� ��� FreePads � ���������� �����
Procedure RemoveFreePadinSignal(Board : IPCB_Board;);
Var
PadIteratorHandle : IPCB_BoardIterator;
Pad               : IPCB_Pad;
Begin
  PadIteratorHandle := Board.BoardIterator_Create;
  PadIteratorHandle.AddFilter_ObjectSet(MkSet(ePadObject));
  PadIteratorHandle.AddFilter_LayerSet(AllLayers);
  PadIteratorHandle.AddFilter_Method(eProcessAll);
  Pad := PadIteratorHandle.FirstPCBObject; //������ ����
    While (pad <> Nil) Do
    Begin
      if (pad.Component = Nil) then
      Begin//���� ��� �� ����������� ����������
        Board.RemovePCBObject(Pad);
      end;
      Pad := PadIteratorHandle.NextPCBObject;
    end;
end;

// �������� �������� ���������
Function XMLGetAttrValue (InputStr : String; AttrName : String) : String;
Var
i      : integer;
WriteS : bolean;
s      : String;
ResultS: String;
Begin
 WriteS := false;
 ResultS:= '';
 if pos(AttrName,InputStr) >0 then
 For i := pos(AttrName,InputStr)+length(AttrName) to length(InputStr) do
 begin
   s := InputStr[i];
   if writeS then
   begin
     if InputStr[i] = '"' then break;
     Results := Results + InputStr[i];
   end;
   if InputStr[i] = '"'  then WriteS := true;
 end;
 Result := ResultS;
end;

// �������� ID ���� �� �����
Function GetLyrId (InLyrName : String; Stack : IPCB_LayerStack) : integer;
var
LyrObj     : IPCB_LayerObject;
LayerName  : String;
LyrClass   : TlayerClassID;
begin
     result := Nil;
     LyrClass := eLayerClass_Physical;
     LyrObj := Stack.First(LyrClass);         // �������� ������ ����
     //����������
     Repeat
           LayerName := LyrObj.Name;
           if LayerName = InLyrName then begin result := LyrObj.layerID; break; end;
           LyrObj := Stack.Next(LyrClass, LyrObj);
     Until LyrObj = Nil;
end;

//������ �����������
Procedure AddTrackinSignal(Board : IPCB_Board; FileXml : TStringList;);
var

IteratorHandle : IPCB_BoardIterator;
i           : integer;
StartInd    : integer;
EndInd      : integer;
CurrentStr  : String;
bWires      : Boolean;
Track       : IPCB_Track;
Arc         : IPCB_Arc;
Net         : IPCB_Net;
layerID     : TLayer;
NetName     : String;
StartX      : Double;
StartY      : Double;
EndX        : Double;
EndY        : Double;
CenterX     : Double;
CenterY     : Double;
Width       : Double;
i2          : integer;
r           : Double;
d           : Double;
angle       : Double;
testDouble  : Double;

begin

  CurrentStr :=  FileXML.Strings[0];

  for i:=0 to FileXML.Count - 1 do
  if pos('<Connectivity', FileXML.Strings[i]) > 0 then begin StartInd := i; break; end;

  for i:=StartInd to FileXML.Count - 1 do
  if pos('</Connectivity>', FileXML.Strings[i]) > 0 then begin EndInd := i; break; end;

  //For i := StartInd to EndInd do FileXMLCon.Add(FileXml.Get(i));

  //******** ����������� ���������� *********//
  bWires := false;

  i:=StartInd;
  try
  Repeat
    CurrentStr := FileXML.Get(i);
    if pos('<Wires>',CurrentStr) >0 then  bWires := true;
    if pos('</Wires>',CurrentStr) >0 then begin  i := -2; bWires := false;  end;

    if bWires then //������������ ����������
    Begin
     if pos('<Wire>',CurrentStr)>0 then   // ������������ ���� �����
     begin
       Repeat
         CurrentStr := FileXML.Get(i);

         if pos('<LayerRef',CurrentStr) >0 then
         layerID := GetLyrId(XMLGetAttrValue(CurrentStr,'name'),Board.LayerStack);

         if pos('<NetRef',CurrentStr) >0 then
         begin
         NetName := XMLGetAttrValue(CurrentStr,'name');

         //*******���������� ����********//
         IteratorHandle := Board.BoardIterator_Create;
         IteratorHandle.AddFilter_ObjectSet(MkSet(eNetObject));
         IteratorHandle.AddFilter_LayerSet(AllLayers);
         IteratorHandle.AddFilter_Method(eProcessAll);
         Net := IteratorHandle.FirstPCBObject; //������ ����
         While (Net <> Nil) Do
         Begin
         if Net.Name = NetName then break;
         Net := IteratorHandle.NextPCBObject;
         End;
         Board.BoardIterator_Destroy(IteratorHandle);
         end;


         if pos('<Subwire',CurrentStr) >0 then
         width := StrToFloatDot(XMLGetAttrValue(CurrentStr,'width'));

         if pos('<Start',CurrentStr) >0 then
         Begin
           StartX := StrToFloatDot(XMLGetAttrValue(CurrentStr,'x'));
           StartY := StrToFloatDot(XMLGetAttrValue(CurrentStr,'y'));
         end;

         if pos('<End',CurrentStr) >0 then
         Begin
           EndX := StrToFloatDot(XMLGetAttrValue(CurrentStr,'x'));
           EndY := StrToFloatDot(XMLGetAttrValue(CurrentStr,'y'));
         end;

         if pos('<Center',CurrentStr) >0 then
         Begin
           CenterX := StrToFloatDot(XMLGetAttrValue(CurrentStr,'x'));
           CenterY := StrToFloatDot(XMLGetAttrValue(CurrentStr,'y'));
         end;

         if pos ('</TrackLine>',CurrentStr) >0 then
         begin
           Track := PCBServer.PCBObjectFactory(eTrackObject, eNoDimension, eCreate_Default);
           Track.Layer := LayerID;
           Track.Net := Net;
           Track.x1 := MMsToCoord(StartX);
           Track.y1 := MMsToCoord(StartY);
           Track.x2 := MMsToCoord(EndX);
           Track.y2 := MMsToCoord(EndY);
           Track.Width := MMsToCoord(Width);
           Board.AddPCBObject(Track);
           StartX := EndX;
           StartY := EndY;
         end;

         if pos('</TrackArc>',CurrentStr) >0 then
         begin
           Arc := PCBServer.PCBObjectFactory(eArcObject, eNoDimension, eCreate_Default);
           Arc.Layer := LayerID;
           Arc.Net := Net;
           Arc.LineWidth  := MMsToCoord(Width);
           Arc.XCenter := MMsToCoord(CenterX);
           Arc.YCenter := MMsToCoord(CenterY);
           r := abs(Sqrt((CenterX - StartX)*(CenterX - StartX) + (CenterY - StartY)*(CenterY - StartY))); // ������� ������
           // ������� ���������� �� ����� ������ �� ����� ������� ���� 0.
           d := abs(Sqrt((CenterX+r - StartX)*(CenterX+r - StartX) + (CenterY - StartY)*(CenterY - StartY)));
           angle := (d*d)/(2*r*r);
           if angle >2 then angle := 2;
           angle := RadToDeg(ArcCos(1-angle));
           if StartY < CenterY then angle := 360-angle;
           Arc.StartAngle := angle;

           // ������� ���������� �� ����� ����� �� ����� ������� ���� 0.
           d := abs(Sqrt((CenterX+r - EndX)*(CenterX+r - EndX) + (CenterY - EndY)*(CenterY - EndY)));

           angle := (d*d)/(2*r*r);
           if angle >2 then angle := 2;
           angle := RadToDeg(ArcCos(1-angle));
           if EndY < CenterY then angle := 360-angle;
           Arc.EndAngle := angle;

           Arc.Radius := MMsToCoord(r);
           //Arc.StartAngle :=
           Board.AddPCBObject(Arc);
           StartX := EndX;
           StartY := EndY;
         end;

         if pos('</TrackArcCW>',CurrentStr) >0 then
         begin
           Arc := PCBServer.PCBObjectFactory(eArcObject, eNoDimension, eCreate_Default);
           Arc.Layer := LayerID;
           Arc.Net := Net;
           Arc.LineWidth  := MMsToCoord(Width);
           Arc.XCenter := MMsToCoord(CenterX);
           Arc.YCenter := MMsToCoord(CenterY);
           r := abs(Sqrt((CenterX - StartX)*(CenterX - StartX) + (CenterY - StartY)*(CenterY - StartY))); // ������� ������
           // ������� ���������� �� ����� ������ �� ����� ������� ���� 0.
           d := abs(Sqrt((CenterX+r - StartX)*(CenterX+r - StartX) + (CenterY - StartY)*(CenterY - StartY)));
           angle := (d*d)/(2*r*r);
           if angle >2 then angle := 2;
           angle := RadToDeg(ArcCos(1-angle));
           if StartY < CenterY then angle := 360-angle;

           Arc.EndAngle := angle;

           // ������� ���������� �� ����� ����� �� ����� ������� ���� 0.
           d := abs(Sqrt((CenterX+r - EndX)*(CenterX+r - EndX) + (CenterY - EndY)*(CenterY - EndY)));
           angle := (d*d)/(2*r*r);
           if angle >2 then angle := 2;
           angle := RadToDeg(ArcCos(1-angle));
           if EndY < CenterY then angle := 360-angle;
           Arc.StartAngle := angle;

           Arc.Radius := MMsToCoord(r);
           //Arc.StartAngle :=
           Board.AddPCBObject(Arc);
           StartX := EndX;
           StartY := EndY;
         end;

         if pos ('</Wire>',CurrentStr) >0 then  break;
         inc(i);
       Until i = -1;
     end;
    end;

    inc(i);
  Until i = -1;
  except
    ShowMessage('������ ��� ������� ������ ������: �'+IntToStr(i));
  end;


end;

Procedure AddViainSignal(Board : IPCB_Board; FileXml : TStringList;);
var
Via       : IPCB_Via;
PadDiam   : Double;
IteratorHandle : IPCB_BoardIterator;
i           : integer;
ii          : integer;
iii         : integer;
StartInd    : integer;
StartStInd  : integer;
EndInd      : integer;
CurrentStr  : String;
CurrentStrSt: String;
bVias       : Boolean;
VStackName  : String;
NetName     : String;
Net         : IPCB_Net;
OrgX        : Double;
OrgY        : Double;
TSDiam      : Double;
BSDiam      : Double;
HoleDiam    : Double;
StartLayer  : TLayer;
EndLayer    : TLayer;
DiamLayers  : array [0..31] of Double;
test        : String;

begin
  Net := Nil;
  TSDiam := 0;
  BSDiam := 0;
  bVias := false;
  for i:=0 to FileXML.Count - 1 do
  if pos('<Connectivity', FileXML.Strings[i]) > 0 then begin StartInd := i; break; end;
  for i:=StartInd to FileXML.Count - 1 do
  if pos('</Connectivity>', FileXML.Strings[i]) > 0 then begin EndInd := i; break; end;
  i:=StartInd;
  try
  Repeat //�������� ������� ����� ������������
    CurrentStr := FileXML.Get(i);
    if pos('<Vias>',CurrentStr) >0 then  bVias := true;
    if pos('</Vias>',CurrentStr) >0 then begin  i := -2; bVias := false;  end;

    if bVias then //������������ �����������
    Begin
      if pos('<Via>',CurrentStr)>0 then   // ������������ ���� ����������
      begin
        Repeat
          CurrentStr := FileXML.Get(i);
          if pos('<ViastackRef',CurrentStr) >0 then
          begin
            VStackName := XMLGetAttrValue(CurrentStr,'name');
            for ii:=0 to FileXML.Count - 1 do
            if pos('<Viastack name="'+VStackName, FileXML.Strings[ii]) > 0 then begin StartStInd := ii; break; end;
              Repeat // ���������� ���� ����������� ���������
                CurrentStrSt := FileXML.Get(ii);
                if  pos('<LayerRange',CurrentStrSt) >0 then
                begin
                  inc(ii);
                  CurrentStrSt := FileXML.Get(ii);
                  if pos('<AllLayers/>',CurrentStrSt) >0 then
                  Begin
                     StartLayer := 1;
                     EndLayer := 32;
                  end;
                  if pos ('<LayerRef',CurrentStrSt) >0 then
                  begin
                     StartLayer := GetLyrId(XMLGetAttrValue(CurrentStrSt,'name'),Board.LayerStack);
                     inc(ii);
                     CurrentStrSt := FileXML.Get(ii);
                     EndLayer := GetLyrId(XMLGetAttrValue(CurrentStrSt,'name'),Board.LayerStack);
                  end;

                end;

                if pos('<Viastack', CurrentStrSt) > 0 then
                HoleDiam :=  StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'holeDiameter'));

                if pos('<PadCircle',CurrentStrSt) >0  then
                PadDiam :=  StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'diameter'));

                if pos ('<LayerTypeRef',CurrentStrSt) >0  then
                begin
                  if XMLGetAttrValue(CurrentStrSt,'type') =  'Signal' then
                  begin
                     for iii :=0 to 31 do
                     DiamLayers[iii] := PadDiam;
                  end;
                end;

                if pos ('<LayerRef',CurrentStrSt) >0 then
                begin

                  if XMLGetAttrValue(CurrentStrSt,'name') =  board.LayerName(37) then
                  TSDiam := PadDiam;
                  if XMLGetAttrValue(CurrentStrSt,'name') =  board.LayerName(38) then
                  BSDiam := PadDiam;

                  for iii :=0 to 31 do
                  Begin
                    if XMLGetAttrValue(CurrentStrSt,'name') =  board.LayerName(iii+1) then
                    DiamLayers[iii] := PadDiam;
                  end;

                end;
                if  pos('</Viastack>',CurrentStrSt) >0 then  break;
                inc(ii);
              Until ii = -1;
          end;

          if pos('<NetRef',CurrentStr) >0 then
          begin
          NetName := XMLGetAttrValue(CurrentStr,'name');

          //*******���������� ����********//
          IteratorHandle := Board.BoardIterator_Create;
          IteratorHandle.AddFilter_ObjectSet(MkSet(eNetObject));
          IteratorHandle.AddFilter_LayerSet(AllLayers);
          IteratorHandle.AddFilter_Method(eProcessAll);
          Net := IteratorHandle.FirstPCBObject; //������ ����
          While (Net <> Nil) Do
          Begin
          if Net.Name = NetName then break;
          Net := IteratorHandle.NextPCBObject;
          End;
          Board.BoardIterator_Destroy(IteratorHandle);
          end;

          if pos('<Org',CurrentStr) >0 then
          Begin
           OrgX := StrToFloatDot(XMLGetAttrValue(CurrentStr,'x'));
           OrgY := StrToFloatDot(XMLGetAttrValue(CurrentStr,'y'));
          end;

          if pos ('</Via>',CurrentStr) >0 then
          begin
           Via := PCBServer.PCBObjectFactory(eViaObject, eNoDimension, eCreate_Default);
           Via.Net := Net;
           For ii:= 1 to 32 do
           begin
           Via.SizeOnLayer[ii]:= MMsToCoord(DiamLayers[ii-1]);
           if ii = EndLayer then break;
           end;
           Via.HighLayer  := StartLayer;

           Via.LowLayer   := EndLayer;

           if TSDiam >0 then begin Via.SizeOnLayer[37] := MMsToCoord(TSDiam); Via.IsTenting_Top := false; end
           else begin Via.IsTenting_Top := true;  end;
           if BSDiam >0 then begin Via.SizeOnLayer[38] := MMsToCoord(TSDiam); Via.IsTenting_Bottom := false; end
           else begin Via.IsTenting_Bottom := true;  end;
           Via.HoleSize := MMsToCoord(HoleDiam);
           Via.x := MMsToCoord(OrgX);
           Via.y := MMsToCoord(OrgY);
           Board.AddPCBObject(Via);
           break;
          end;


          inc(i);
        Until i = -1;

      end; //����������� ��������� �����������

    end; // ����������� ��������� ������������
  inc(i);
  Until i = -1;  //����������� ������� ����� ������������
  except
    ShowMessage('������ ��� ������� ������ ������: �'+IntToStr(i));
  end;
end;

Procedure AddFreePadinSignal(Board : IPCB_Board; FileXml : TStringList;);
var
Pad            : IPCB_Pad;
IteratorHandle : IPCB_BoardIterator;
i,ii,iii       : integer;
StartInd       : integer;
CurrentStr     : String;
Side           : String;
Net            : IPCB_Net;
Angle          : Double;
Angles         : String;
NetName        : String;
OrgX           : Double;
OrgY           : Double;
PStackName     : String;
StartStInd     : String;
CurrentStrSt   : String;
PadType        : String;
Metallized     : String;
Padlayer       : String;
Width          : Double;
Height         : Double;
PadHole        : Double;
PadHoles       : String;
PadDiam        : Double;
layerID        : TLayer;
ShapeType      : TShape;

begin
  Net := Nil;
  for i:=0 to FileXML.Count - 1 do
  if pos('<FreePads>', FileXML.Strings[i]) > 0 then begin StartInd := i; break; end;
  i:=StartInd;

  Repeat //�������� ������� ���� FreePads
    CurrentStr := FileXML.Get(i);

    if pos('<FreePad ',CurrentStr)>0 then
    begin
      Side := XMLGetAttrValue(CurrentStr,'side');
      Angles := XMLGetAttrValue(CurrentStr,'angle');
      if Angles <>'' then Angle := StrToFloat(Angles);
      if Angles = '' then Angle := 0;
    end;

    if pos('<NetRef',CurrentStr)>0 then
    begin
      NetName := XMLGetAttrValue(CurrentStr,'name');

      //*******���������� ����********//
      IteratorHandle := Board.BoardIterator_Create;
      IteratorHandle.AddFilter_ObjectSet(MkSet(eNetObject));
      IteratorHandle.AddFilter_LayerSet(AllLayers);
      IteratorHandle.AddFilter_Method(eProcessAll);
      Net := IteratorHandle.FirstPCBObject; //������ ����
      While (Net <> Nil) Do
      Begin
          if Net.Name = NetName then break;
          Net := IteratorHandle.NextPCBObject;
      End;
      Board.BoardIterator_Destroy(IteratorHandle);
    end;

    if pos('<Org',CurrentStr) >0 then
      Begin
           OrgX := StrToFloatDot(XMLGetAttrValue(CurrentStr,'x'));
           OrgY := StrToFloatDot(XMLGetAttrValue(CurrentStr,'y'));
      end;

    if pos('<PadstackRef',CurrentStr) >0 then
          begin
            PStackName := XMLGetAttrValue(CurrentStr,'name');
            for ii:=0 to FileXML.Count - 1 do
            if pos('<Padstack name="'+PStackName, FileXML.Strings[ii]) > 0 then begin StartStInd := ii; break; end;

            PadType := '';
            Metallized := '';
            PadHole := -1;
            Padlayer := '';
            PadDiam := 0;
            Width := 0;
            Height := 0;
              Repeat // ���������� ����
                CurrentStrSt := FileXML.Get(ii);

                if pos('<Padstack', CurrentStrSt) > 0 then
                Begin
                  PadType :=  XMLGetAttrValue(CurrentStrSt,'type');
                  Metallized :=  XMLGetAttrValue(CurrentStrSt,'metallized');
                  PadHoles := XMLGetAttrValue(CurrentStrSt,'holeDiameter');
                  if PadHoles <> '' then PadHole := StrToFloatDot(PadHoleS);
                end;


                if pos('<PadCircle',CurrentStrSt) >0  then
                begin
                  ShapeType := eRounded;
                  PadDiam :=  StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'diameter'));
                  Width := PadDiam;
                  Height := PadDiam;
                end;

                if pos('<PadRect',CurrentStrSt) >0  then
                begin
                  ShapeType := eRectangular;
                  Width :=  StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'width'));
                  Height :=  StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'height'));
                end;

                if pos('<PadOval',CurrentStrSt) >0  then
                begin
                  ShapeType := eRounded;
                  PadDiam :=  StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'diameter'));
                end;

                if pos('<Stretch',CurrentStrSt) >0  then // ���� ���� �� ���������� ������ � ������
                begin
                  if StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'x')) = 0 then
                  begin
                    Width := PadDiam;
                    Height := (StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'x'))) +  Width;
                  end else
                  begin
                    Height := PadDiam;
                    Width := (StrToFloatDot(XMLGetAttrValue(CurrentStrSt,'y'))) +  Height;
                  end;
                end;

                if pos ('<LayerRef',CurrentStrSt) >0 then
                begin
                  if XMLGetAttrValue(CurrentStrSt,'type') =  'Signal' then
                  begin
                    Padlayer := XMLGetAttrValue(CurrentStrSt,'name');
                  end;
                end;

                if  pos('</Padstack>',CurrentStrSt) >0 then break;
                inc(ii);
              Until ii = -1;
          end;

    if pos('</FreePad>',CurrentStr) >0 then
    begin
      Pad := PCBServer.PCBObjectFactory(ePadObject, eNoDimension, eCreate_Default);
      Pad.Net := Net;
          if PadType   = 'SMD' then
          Begin // ����������������������� ��
            if side = 'Top' then begin
              Pad.Layer := eTopLayer;
              Pad.TopXSize := MMsToCoord(Width);
              Pad.TopYSize := MMsToCoord(Height);
              Pad.TopShape := ShapeType;
            end;
            if side = 'Bottom' then begin
              Pad.Layer := eBottomLayer;
              Pad.BotXSize := MMsToCoord(Width);
              Pad.BotYSize := MMsToCoord(Height);
              Pad.BotShape := ShapeType;
            end;
            Pad.HoleSize := 0;
            Pad.Rotation := MMsToCoord(angle);
            Pad.x := MMsToCoord(OrgX);
            Pad.y := MMsToCoord(OrgY);

          end
          else  // ������� ��
          begin
            Pad.Layer := eMultiLayer ;
            Pad.Rotation := MMsToCoord(angle);
            Pad.x := MMsToCoord(OrgX);
            Pad.y := MMsToCoord(OrgY);
            Pad.TopXSize := MMsToCoord(Width);
            Pad.TopYSize := MMsToCoord(Height);
            Pad.TopShape := ShapeType;
            Pad.BotXSize := MMsToCoord(Width);
            Pad.BotYSize := MMsToCoord(Height);
            Pad.BotShape := ShapeType;
            Pad.MidXSize := MMsToCoord(Width);
            Pad.MidYSize := MMsToCoord(Height);
            Pad.MidShape := ShapeType;

            Pad.HoleSize :=MMsToCoord(PadHole);
          end;

      Board.AddPCBObject(Pad);
    end;

    if pos('</FreePads>',CurrentStr) >0 then begin
    i := -2;
    end;
    inc(i);
  Until i = -1;
end;

Procedure MoveComponents(Board : IPCB_Board; FileXml : TStringList;);
var
 Component               : IPCB_Component;
 ComponentIteratorHandle : IPCB_BoardIterator;
 NameComp                : String;
 StartInd                : integer;
 i                       : integer;
 angle                   : double;
 side                    : string;
 currStr                 : string;
begin
     for i:=0 to FileXML.Count - 1 do
     if pos('<ComponentsOnBoard', FileXML.Strings[i]) > 0 then begin StartInd := i; break; end;

     ComponentIteratorHandle := Board.BoardIterator_Create;
     ComponentIteratorHandle.AddFilter_ObjectSet(MkSet(eComponentObject));
     ComponentIteratorHandle.AddFilter_LayerSet(AllLayers);
     ComponentIteratorHandle.AddFilter_Method(eProcessAll);
     Component := ComponentIteratorHandle.FirstPCBObject; // �������� ������ ���������

     While (Component <> Nil) Do
     Begin
       NameComp := Component.Name.Text;                        // ��� ����������
       For i:= StartInd to FileXML.Count - 1 do
       begin
         if pos('<CompInstance name="'+NameComp, FileXML.Strings[i]) > 0 then
         begin
           angle := XMLGetAttrValue(FileXML.Strings[i],'angle');
           if angle <> '' then
            Component.Rotation := StrToInt(angle);

           side := XMLGetAttrValue(FileXML.Strings[i],'side');
           if side = 'Top' then
           begin
             Component.Layer := 1;
           end  else
           begin
             Component.Layer := 32;
           end;
           i := i+3;
           currStr := FileXML.Strings[i];
           Component.x := MMsToCoord(StrToFloatDot(XMLGetAttrValue(FileXML.Strings[i],'x')));
           Component.y := MMsToCoord(StrToFloatDot(XMLGetAttrValue(FileXML.Strings[i],'y')));
         break;
         end;

       end;

       Component := ComponentIteratorHandle.NextPCBObject;
     end;
     Board.BoardIterator_Destroy(ComponentIteratorHandle);
end;

Procedure PolygonsRepour(Board);
var
poly           : IPCB_Polygon;
BoardIterator  : IPCB_BoardIterator;
begin
      //*******���������� ��������********//
     BoardIterator := Board.BoardIterator_Create;
     BoardIterator.AddFilter_LayerSet(MkSet(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                         16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32));
     BoardIterator.AddFilter_ObjectSet(MkSet(ePolyObject));
     BoardIterator.AddFilter_Method(eProcessAll);
     Poly := BoardIterator.FirstPCBObject; //������ �������

     While (Poly <> Nil) Do
     Begin
       if poly.Poured then
       Poly.Rebuild;

       Poly := BoardIterator.NextPCBObject;
     End;
     Board.BoardIterator_Destroy(BoardIterator);
end;

Procedure TopoRtoAD;
var
Board       : IPCB_Board;
FileXml     : TStringList; // ������� ���� fst � ������� xml <TopoR_PCB_File>
FileName    : String;


begin
  FileXml := TStringList.Create;

  Board := PCBServer.GetCurrentPCBBoard;
  If Board = nil then Begin ShowError('Open board!'); Exit; End; // ���� ����� ��� �� �������

  //*******�������� XML �����********//
  if tImport.Text = '' then begin
    FileName := LoadAFile();
  end else begin
    FileName := tImport.Text;
  end;

  if FileName <> '' then begin
    if FileExists(FileName) then begin
      FileXml.LoadFromFile((FileName));
    end else begin
      ShowMessage('FST ����: '+FileName+'- �����������!');
    end;
  end else begin
    ShowMessage('��������� ��� FST �����!');
  end;



  //*******������� ����������*******//
  if cbTrack.Checked then begin
  RemoveTrackinSignal(Board); RemoveTrackinSignal(Board); end;

  //*******������� �����������*******//
  if cbVia.Checked then  RemoveViainSignal(Board);

  //*******������� FreePad*******//
   if cbFreePad.Checked then RemoveFreePadinSignal(Board);

  //*******��������� ����������*******//
   if cbComponent.Checked then MoveComponents(Board,FileXml);

  //*******��������� ����������*******//
  if cbTrack.Checked then AddTrackinSignal(Board,FileXml);

  //*******��������� �����������*******//
   if cbVia.Checked then  AddViainSignal(Board,FileXml);

   //*******��������� FreePad*******//
   if cbFreePad.Checked then AddFreePadinSignal(Board,FileXml);

  //*******���������� ��� ��� ��������*******//
  PolygonsRepour(Board);
  Client.SendMessage('PCB:Zoom', 'Action=Redraw' , 255, Client.CurrentView);

  //*******������********//
  FileXml.Free;

end;

Procedure StartScript ();
var
  Board       : IPCB_Board;
  TopoRFile   :TStringList;

Begin

  TopoRFile := TStringList.Create;
  Board := PCBServer.GetCurrentPCBBoard;              // ��������� ������� �����
  If Board = nil then Begin ShowError('Open board!'); Exit; End; // ���� ����� ��� �� �������

  if FileExists(Board.FileName+'.scon') then begin
    TopoRFile.LoadFromFile(Board.FileName+'.scon');
  end else begin
    tExport.Text :=StringReplace(Board.FileName,'.PcbDoc','.fst',rfReplaceAll);
    tImport.Text :=StringReplace(Board.FileName,'.PcbDoc','.fst',rfReplaceAll);
    SaveConfig;
    TopoRFile.LoadFromFile(Board.FileName+'.scon');
  end;
  tTopor.Text := TopoRFile.Get(0);
  tProject.Text := TopoRFile.Get(1);
  tExport.Text :=  TopoRFile.Get(2);
  tImport.Text :=  TopoRFile.Get(3);
  Form1.Show;
  TopoRFile.Free;
End;

procedure TForm1.b_GOClick(Sender: TObject);
begin
 ADtoTopoR;
 SaveConfig;
end;

procedure TForm1.bTopoRClick(Sender: TObject);
begin
  tTopor.Text :=  LoadAFileEXE;
  SaveConfig;
end;

procedure TForm1.bProjectClick(Sender: TObject);
begin
  tProject.Text :=  LoadAFilePrj;
  SaveConfig;
end;

procedure TForm1.b_ImportClick(Sender: TObject);
begin
  TopoRtoAD;
end;

procedure TForm1.b_ExportFolderClick(Sender: TObject);
begin
  tExport.Text := LoadAFileFST;
  if pos('.fst',tExport.Text) = nil then tExport.Text := tExport.Text + '.fst';
  SaveConfig;
end;

procedure TForm1.b_ImportFolderClick(Sender: TObject);
begin
  tImport.Text := LoadAFileFST;
  if pos('.fst',tImport.Text) = nil then tImport.Text := tImport.Text + '.fst';
  SaveConfig;
end;

//ToDo
// �������� ���� No_Net �� ���� ��� �������� � �������� ��� ������� (� ������ ����� ��� ����� �� ��������)
//  �������� ���� ����
// ��������� ������������ ����������
// �������� ������� ������ �� ���� �����
// �������� Plane ����
// ���������� ������� ��������������
// ���������� ���� ����� � ����� ��� �� � ���� �� ����

//*****�������� ������****//
// �� �������� �� ����������� ������� ���������
// �� ������� �������� �����

//��� 1.1.4
// ���������� ��������� � ����������� ��



