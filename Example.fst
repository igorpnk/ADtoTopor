<?xml version="1.0" encoding="UTF-8"?>

<!--**********************************************************************-->
<!--   File    :D:\work\AD to Topor Script - Video\Script_Project\PCB1.PcbDoc -->
<!--   Format  : TopoR PCB file                                           -->
<!--   Version : 1.1.4                                                    -->
<!--   Program : Altium Designer Script by Wolfit                         -->
<!--   Date    : 18.03.2017                                               -->
<!--   Time    : 16:24:45                                                 -->
<!--**********************************************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.1.4</Version>
		<Program>Altium Designer Script by Wolfit</Program>
		<Date>18.03.2017 16:24:45</Date>
		<OriginalFormat>Altium Designer API</OriginalFormat>
		<OriginalFile>D:\work\AD to Topor Script - Video\Script_Project\PCB1.PcbDoc</OriginalFile>
		<Units dist="mm" time="ps"/>
	</Header>
	<Layers version="1.1">
		<StackUpLayers>
			<Layer name="Mechanical 15" type="Mechanical" thickness="0,000"/>
			<Layer name="Mechanical 13" type="Mechanical" thickness="0,000"/>
			<Layer name="Top Paste" type="Paste" thickness="0.000"/>
			<Layer name="Top Overlay" type="Silk" thickness="0.000"/>
			<Layer name="Top Solder" type="Mask" thickness="0.010"/>
			<Layer name="Top Layer" type="Signal" thickness="0.036"/>
			<Layer name="Dielectric 1" type="Dielectric" thickness="0.254"/>
			<Layer name="Signal Layer 2" type="Signal" thickness="0.036"/>
			<Layer name="Dielectric 3" type="Dielectric" thickness="0.127"/>
			<Layer name="Signal Layer 1" type="Signal" thickness="0.036"/>
			<Layer name="Dielectric 4" type="Dielectric" thickness="0.254"/>
			<Layer name="Signal Layer 3" type="Signal" thickness="0.036"/>
			<Layer name="Dielectric 5" type="Dielectric" thickness="0.127"/>
			<Layer name="Signal Layer 4" type="Signal" thickness="0.036"/>
			<Layer name="Dielectric 2" type="Dielectric" thickness="0.254"/>
			<Layer name="Bottom Layer" type="Signal" thickness="0.036"/>
			<Layer name="Bottom Solder" type="Mask" thickness="0.010"/>
			<Layer name="Bottom Overlay" type="Silk" thickness="0.000"/>
			<Layer name="Bottom Paste" type="Paste" thickness="0.000"/>
			<Layer name="Mechanical 14" type="Mechanical" thickness="0,000"/>
			<Layer name="Mechanical 16" type="Mechanical" thickness="0,000"/>
		</StackUpLayers>
		<UnStackLayers>
			<Layer name="Mechanical 1" type="Doc"/>
			<Layer name="Mechanical 4" type="Doc"/>
			<Layer name="Keep-Out Layer" type="Doc"/>
		</UnStackLayers>
	</Layers>
	<TextStyles version="1.0">
		<TextStyle name="(Default)" fontName="QUALITY" height="2.5"/>
		<TextStyle name="Arial200" fontName="Arial" height="2"/>
		<TextStyle name="Arial100" fontName="Arial" height="1"/>
		<TextStyle name="Arial152,4" fontName="Arial" height="1,524"/>
		<TextStyle name="Arial115" fontName="Arial" height="1,15"/>
	</TextStyles>
	<LocalLibrary version="1.1">
		<Padstacks>
			<Padstack name="r35_170" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="0,35" height="1,7">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r35_170r100" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="0,35">
						<LayerRef type="Signal" name="Top Layer"/>
						<Stretch x="0.000" y="1,35"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="r35_170c50" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="0,35" height="1,7" handling="Chamfer" handlingValue="0,0875">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r35_170r50" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="0,35" height="1,7" handling="Rounding" handlingValue="0,0875">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s150_150h90" holeDiameter="0,9" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1,5">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="c150_150r90" holeDiameter="0,9" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="1,5">
						<LayerTypeRef type="Signal"/>
						<Stretch x="0" y="0.000"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="s150_150h90r50" holeDiameter="0,9" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1,5" handling="Rounding" handlingValue="0,375">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s150_150h90c50" holeDiameter="0,9" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1,5" handling="Chamfer" handlingValue="0,375">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="c140_140r90" holeDiameter="0,85" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="1,4">
						<LayerTypeRef type="Signal"/>
						<Stretch x="0" y="0.000"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="r90_70" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="0,9" height="0,7">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r170_110" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,7" height="1,1">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s152,4_100h90r33" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1" handling="Rounding" handlingValue="0,25">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s152,4_100h90c50" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1" handling="Chamfer" handlingValue="0,25">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s152,4_100h90" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="c152,4_100r90" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="1">
						<LayerTypeRef type="Signal"/>
						<Stretch x="0,524" y="0.000"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="s152,4_152,4h90r50" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1,524" handling="Rounding" handlingValue="0,381">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s152,4_152,4h90c50" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1,524" handling="Chamfer" handlingValue="0,381">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="s152,4_152,4h90" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1,524">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="c152,4_152,4r90" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="1,524">
						<LayerTypeRef type="Signal"/>
						<Stretch x="0" y="0.000"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="r150_100r33" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1" handling="Rounding" handlingValue="0,25">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r152,4_100c50" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1" handling="Chamfer" handlingValue="0,25">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r150_150r50" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1,5" handling="Rounding" handlingValue="0,375">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r152,4_152,4c50" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1,524" handling="Chamfer" handlingValue="0,381">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r150_150" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1,5">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r152,4_100" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,524" height="1">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="r152,4_100r100" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="1">
						<LayerRef type="Signal" name="Top Layer"/>
						<Stretch x="0,524" y="0.000"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
			<Padstack name="r152,4_152,4r100" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadOval diameter="1,524">
						<LayerRef type="Signal" name="Top Layer"/>
						<Stretch x="0" y="0.000"/>
						<Shift x="0.000" y="0.000"/>
					</PadOval>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="Via0" holeDiameter="0,7112">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,27">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1,4732">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="1,4732">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via1" holeDiameter="0,7112">
				<LayerRange>
					<LayerRef type="Signal" name="Top Layer"/>
					<LayerRef type="Signal" name="Signal Layer 1"/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadCircle>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</PadCircle>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Signal Layer 1"/>
					</PadCircle>
					<PadCircle diameter="1,4732">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="0">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via2" holeDiameter="0,7112">
				<LayerRange>
					<LayerRef type="Signal" name="Signal Layer 1"/>
					<LayerRef type="Signal" name="Bottom Layer"/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Signal Layer 1"/>
					</PadCircle>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Signal Layer 3"/>
					</PadCircle>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Signal Layer 4"/>
					</PadCircle>
					<PadCircle diameter="1,27">
						<LayerRef type="Signal" name="Bottom Layer"/>
					</PadCircle>
					<PadCircle diameter="0">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="1,4732">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via3" holeDiameter="0,8">
				<LayerRange>
					<LayerRef type="Signal" name="Signal Layer 1"/>
					<LayerRef type="Signal" name="Bottom Layer"/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Signal Layer 1"/>
					</PadCircle>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Signal Layer 3"/>
					</PadCircle>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Signal Layer 4"/>
					</PadCircle>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Bottom Layer"/>
					</PadCircle>
					<PadCircle diameter="0">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="1,3032">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via4" holeDiameter="0,7">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,4">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 1"/>
					</PadCircle>
					<PadCircle diameter="1,5">
						<LayerRef type="Signal" name="Signal Layer 3"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 4"/>
					</PadCircle>
					<PadCircle diameter="1,4">
						<LayerRef type="Signal" name="Bottom Layer"/>
					</PadCircle>
					<PadCircle diameter="1,6032">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="1,6032">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via5" holeDiameter="0,7">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,3">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 1"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 3"/>
					</PadCircle>
					<PadCircle diameter="1">
						<LayerRef type="Signal" name="Signal Layer 4"/>
					</PadCircle>
					<PadCircle diameter="1,3">
						<LayerRef type="Signal" name="Bottom Layer"/>
					</PadCircle>
					<PadCircle diameter="1,5032">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="1,5032">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via6" holeDiameter="0,6">
				<LayerRange>
					<AllLayers/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,2">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
					<PadCircle diameter="1,4032">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="1,4032">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
			<Viastack name="Via7" holeDiameter="0,8">
				<LayerRange>
					<LayerRef type="Signal" name="Top Layer"/>
					<LayerRef type="Signal" name="Signal Layer 1"/>
				</LayerRange>
				<ViaPads>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Top Layer"/>
					</PadCircle>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</PadCircle>
					<PadCircle diameter="1,1">
						<LayerRef type="Signal" name="Signal Layer 1"/>
					</PadCircle>
					<PadCircle diameter="1,3032">
						<LayerRef type="Mask" name="Top Solder"/>
					</PadCircle>
					<PadCircle diameter="0">
						<LayerRef type="Mask" name="Bottom Solder"/>
					</PadCircle>
				</ViaPads>
			</Viastack>
		</Viastacks>
		<Footprints>
			<Footprint name="SOT403-1_N$DD8$COOVBGLM">
				<Pads>
					<Pad padNum="1" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="2" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="3" name="1" angle="-90" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="4" name="2" angle="-90" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="5" name="3" angle="-90" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="6" name="4" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="7" name="5" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="8" name="6" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="9" name="7" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="10" name="8" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="11" name="16" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="12" name="15" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="13" name="14" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="14" name="13" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="15" name="12" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="16" name="11" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="17" name="10" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="18" name="9" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="-1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="-2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="-3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="0,5"/>
							<Dot x="0" y="-0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="2,85" y="-3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="0,6" y="-1,55"/>
							<Start x="0,3" y="-1,55"/>
							<End x="0,45" y="-1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="1,35" y="-1,65"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="1,77794" y="-0,50804"/>
							<Dot x="-1,77806" y="-0,50804"/>
							<Dot x="-1,77806" y="2,66696"/>
							<Dot x="1,77794" y="2,66696"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="0,508" y="-2,54001"/>
							<Dot x="-0,889" y="-2,54001"/>
							<Dot x="-0,889" y="-2,032"/>
							<Dot x="-0,79021" y="-1,397"/>
							<Dot x="0,40923" y="-1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP7$EBLXAKRY">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90"/>
						<Org x="-1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="0" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="-3,67" y="-0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="-1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="-2,54" y="1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD7$SNVODRKS">
				<Pads>
					<Pad padNum="1" name="1" angle="90" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="3" name="3" angle="90" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="4" name="4" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="5" name="5" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="6" name="6" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="9" name="16" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="10" name="15" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="11" name="14" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="12" name="13" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="13" name="12" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="14" name="11" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="15" name="10" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="16" name="9" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="17" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pad>
					<Pad padNum="18" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="-1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="-2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="-2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="-2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="-3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="-2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="-0,5"/>
							<Dot x="0" y="0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="-2,85" y="3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="-0,6" y="1,55"/>
							<Start x="-0,3" y="1,55"/>
							<End x="-0,45" y="1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="-1,35" y="1,65"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-1,778" y="-2,667"/>
							<Dot x="1,778" y="-2,667"/>
							<Dot x="1,778" y="0,508"/>
							<Dot x="-1,778" y="0,508"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-0,508" y="2,54001"/>
							<Dot x="0,889" y="2,54001"/>
							<Dot x="0,889" y="2,032"/>
							<Dot x="0,79021" y="1,397"/>
							<Dot x="-0,40923" y="1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP6$PXSEUODM">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90r50"/>
						<Org x="1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="-1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="180" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="3,67" y="0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP5$LTLFBXLB">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90r50"/>
						<Org x="1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="-1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="180" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="3,67" y="0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="-2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="-1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP4$IYGRWNNW">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90c50"/>
						<Org x="-1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="0" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="-3,67" y="-0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="-1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="-2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP3$TNMNBCGG">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90c50"/>
						<Org x="-1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="0" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="-3,67" y="-0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD6$MXMKQUFN">
				<Pads>
					<Pad padNum="1" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="2" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="3" name="1" angle="-90" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="4" name="2" angle="-90" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="5" name="3" angle="-90" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="6" name="4" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="7" name="5" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="8" name="6" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="9" name="7" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="10" name="8" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="11" name="16" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="12" name="15" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="13" name="14" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="14" name="13" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="15" name="12" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="16" name="11" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="17" name="10" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="18" name="9" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="-1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="-2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="-3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="0,5"/>
							<Dot x="0" y="-0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="2,85" y="-3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="0,6" y="-1,55"/>
							<Start x="0,3" y="-1,55"/>
							<End x="0,45" y="-1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="1,35" y="-1,65"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="1,77795" y="-0,50805"/>
							<Dot x="-1,77805" y="-0,50805"/>
							<Dot x="-1,77805" y="2,66696"/>
							<Dot x="1,77795" y="2,66696"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="0,508" y="-2,54001"/>
							<Dot x="-0,889" y="-2,54001"/>
							<Dot x="-0,889" y="-2,032"/>
							<Dot x="-0,79021" y="-1,397"/>
							<Dot x="0,40923" y="-1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD5$EYCGKMJC">
				<Pads>
					<Pad padNum="1" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="2" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="3" name="1" angle="270" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="4" name="2" angle="270" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="5" name="3" angle="270" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="6" name="4" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="7" name="5" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="8" name="6" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="9" name="7" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="10" name="8" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="11" name="16" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="12" name="15" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="13" name="14" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="14" name="13" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="15" name="12" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="16" name="11" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="17" name="10" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="18" name="9" angle="270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="-1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="-2,55"/>
							<Dot x="-1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="2,55"/>
							<Dot x="-1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="-2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="-2,55"/>
							<Dot x="-2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="2,55"/>
							<Dot x="-2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="-3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="-2,8"/>
							<Dot x="-3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="2,8"/>
							<Dot x="-3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0,5" y="0"/>
							<Dot x="-0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="0,5"/>
							<Dot x="0" y="-0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="2,85" y="-3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="0,6" y="-1,55"/>
							<Start x="0,3" y="-1,55"/>
							<End x="0,45" y="-1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="1,35" y="-1,65"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="1,77793" y="-0,50803"/>
							<Dot x="-1,77807" y="-0,50803"/>
							<Dot x="-1,77807" y="2,66697"/>
							<Dot x="1,77793" y="2,66697"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="0,508" y="-2,54001"/>
							<Dot x="-0,889" y="-2,54001"/>
							<Dot x="-0,889" y="-2,032"/>
							<Dot x="-0,79021" y="-1,397"/>
							<Dot x="0,40923" y="-1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD1$OUKDCFYR">
				<Pads>
					<Pad padNum="1" name="1" angle="90" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="3" name="3" angle="90" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="4" name="4" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="5" name="5" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="6" name="6" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="9" name="16" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="10" name="15" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="11" name="14" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="12" name="13" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="13" name="12" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="14" name="11" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="15" name="10" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="16" name="9" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="17" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pad>
					<Pad padNum="18" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="-1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="-2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="-2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="-2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="-3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="-2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="-0,5"/>
							<Dot x="0" y="0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="-2,85" y="3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="-0,6" y="1,55"/>
							<Start x="-0,3" y="1,55"/>
							<End x="-0,45" y="1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="-1,35" y="1,65"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-1,778" y="-2,667"/>
							<Dot x="1,778" y="-2,667"/>
							<Dot x="1,778" y="0,508"/>
							<Dot x="-1,778" y="0,508"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Bottom Layer"/>
						<Polygon>
							<Dot x="-0,508" y="2,54001"/>
							<Dot x="0,889" y="2,54001"/>
							<Dot x="0,889" y="2,032"/>
							<Dot x="0,79021" y="1,397"/>
							<Dot x="-0,40923" y="1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP2$QDCDDMQD">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90"/>
						<Org x="1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="-1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="-180" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="3,67" y="0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="-2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="-1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP1$LOJXFODW">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150_150h90"/>
						<Org x="-1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pad>
				</Pads>
				<Texts>
					<Text text="+" align="LB" angle="0" mirror="off">
						<LayerRef type="Silk" name="Top Overlay"/>
						<TextStyleRef name="Arial115"/>
						<Org x="-3,67" y="-0,577"/>
					</Text>
				</Texts>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-1,27"/>
							<Dot x="2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="-2,54" y="-1,27"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="1,27"/>
							<Dot x="2,54" y="1,27"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD2$VKXEVAJW">
				<Pads>
					<Pad padNum="1" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="2" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pad>
					<Pad padNum="3" name="1" angle="-90" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="4" name="2" angle="-90" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="5" name="3" angle="-90" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="6" name="4" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="7" name="5" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="8" name="6" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="9" name="7" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="10" name="8" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="11" name="16" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="12" name="15" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="13" name="14" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="14" name="13" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="15" name="12" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="16" name="11" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="17" name="10" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="18" name="9" angle="-90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="-1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="-2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="-3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="0,5"/>
							<Dot x="0" y="-0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="2,85" y="-3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="0,6" y="-1,55"/>
							<Start x="0,3" y="-1,55"/>
							<End x="0,45" y="-1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="1,35" y="-1,65"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="1,77801" y="-0,508"/>
							<Dot x="-1,77799" y="-0,508"/>
							<Dot x="-1,77799" y="2,667"/>
							<Dot x="1,77801" y="2,667"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Bottom Layer"/>
						<Polygon>
							<Dot x="0,508" y="-2,54001"/>
							<Dot x="-0,889" y="-2,54001"/>
							<Dot x="-0,889" y="-2,032"/>
							<Dot x="-0,79021" y="-1,397"/>
							<Dot x="0,40923" y="-1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD3$VJUYHDIU">
				<Pads>
					<Pad padNum="1" name="1" angle="-270" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
					<Pad padNum="2" name="2" angle="-270" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="3" name="3" angle="-270" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="4" name="4" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="5" name="5" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="6" name="6" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="7" name="7" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="8" name="8" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="9" name="16" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="10" name="15" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="11" name="14" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="12" name="13" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="13" name="12" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="14" name="11" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="15" name="10" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="16" name="9" angle="-270" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="17" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pad>
					<Pad padNum="18" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,54999"/>
							<Dot x="-1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="-2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,54999"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="-2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="-2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="-3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="-2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="1E-5"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="-0,5"/>
							<Dot x="0" y="0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="-2,85" y="3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="-0,6" y="1,55"/>
							<Start x="-0,3" y="1,55"/>
							<End x="-0,45" y="1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="-1,35" y="1,65001"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-1,77799" y="-2,66702"/>
							<Dot x="1,77801" y="-2,66702"/>
							<Dot x="1,77801" y="0,50798"/>
							<Dot x="-1,77799" y="0,50798"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-0,508" y="2,54001"/>
							<Dot x="0,889" y="2,54001"/>
							<Dot x="0,889" y="2,032"/>
							<Dot x="0,79021" y="1,397"/>
							<Dot x="-0,40923" y="1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="SOT403-1_N$DD4$JEGJSBLX">
				<Pads>
					<Pad padNum="1" name="1" angle="90" flipped="off">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90" flipped="off">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pad>
					<Pad padNum="3" name="3" angle="90" flipped="off">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pad>
					<Pad padNum="4" name="4" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pad>
					<Pad padNum="5" name="5" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="6" name="6" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="7" name="7" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="8" name="8" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="9" name="16" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pad>
					<Pad padNum="10" name="15" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pad>
					<Pad padNum="11" name="14" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pad>
					<Pad padNum="12" name="13" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pad>
					<Pad padNum="13" name="12" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pad>
					<Pad padNum="14" name="11" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pad>
					<Pad padNum="15" name="10" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pad>
					<Pad padNum="16" name="9" angle="90" flipped="off">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pad>
					<Pad padNum="17" name="17" angle="0" flipped="on">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pad>
					<Pad padNum="18" name="18" angle="0" flipped="on">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="-1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="1,6" y="2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="2,55"/>
							<Dot x="1,6" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-1,6" y="-2,55"/>
							<Dot x="1,6" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="-2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="2,25" y="2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="2,55"/>
							<Dot x="2,25" y="2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-2,25" y="-2,55"/>
							<Dot x="2,25" y="-2,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="-3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="3,95" y="2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="2,8"/>
							<Dot x="3,95" y="2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-3,95" y="-2,8"/>
							<Dot x="3,95" y="-2,8"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="0,5"/>
							<Dot x="0" y="-0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,25">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Circle diameter="0,25">
							<Center x="-2,85" y="3"/>
						</Circle>
					</Detail>
					<Detail lineWidth="0,6">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Arc>
							<Center x="-0,6" y="1,55"/>
							<Start x="-0,3" y="1,55"/>
							<End x="-0,45" y="1,80981"/>
						</Arc>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Circle diameter="1">
							<Center x="-1,35" y="1,65001"/>
						</Circle>
					</Detail>
				</Details>
				<KeepoutsTrace>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-1,778" y="-2,66698"/>
							<Dot x="1,778" y="-2,66698"/>
							<Dot x="1,778" y="0,50802"/>
							<Dot x="-1,778" y="0,50802"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-0,508" y="2,54001"/>
							<Dot x="0,889" y="2,54001"/>
							<Dot x="0,889" y="2,032"/>
							<Dot x="0,79021" y="1,397"/>
							<Dot x="-0,40923" y="1,39699"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="AXIAL-0.3">
				<Pads>
					<Pad padNum="1" name="2" angle="0" flipped="off">
						<PadstackRef name="c140_140r90"/>
						<Org x="3,81" y="0"/>
					</Pad>
					<Pad padNum="2" name="1" angle="0" flipped="off">
						<PadstackRef name="c140_140r90"/>
						<Org x="-3,81" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="0"/>
							<Dot x="2,54" y="0,762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="0,762"/>
							<Dot x="2,54" y="0,762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-0,762"/>
							<Dot x="-2,54" y="0,762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,54" y="-0,762"/>
							<Dot x="2,54" y="-0,762"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="-0,762"/>
							<Dot x="2,54" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-2,7686" y="0"/>
							<Dot x="-2,54" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="2,54" y="0"/>
							<Dot x="2,7686" y="0"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="AXIAL-0.4">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="c140_140r90"/>
						<Org x="-5,08" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c140_140r90"/>
						<Org x="5,08" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-3,048" y="-1,016"/>
							<Dot x="-3,048" y="1,016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-3,048" y="1,016"/>
							<Dot x="3,048" y="1,016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="3,048" y="-1,016"/>
							<Dot x="3,048" y="1,016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-3,048" y="-1,016"/>
							<Dot x="3,048" y="-1,016"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-4,064" y="0"/>
							<Dot x="-3,048" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="3,048" y="0"/>
							<Dot x="4,064" y="0"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="J1-0603">
				<Pads>
					<Pad padNum="1" name="1" angle="90" flipped="off">
						<PadstackRef name="r90_70"/>
						<Org x="-0,75" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="90" flipped="off">
						<PadstackRef name="r90_70"/>
						<Org x="0,75" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-0,2" y="0,35"/>
							<Dot x="0,2" y="0,35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-0,2" y="-0,35"/>
							<Dot x="0,2" y="-0,35"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-0,85" y="-0,475"/>
							<Dot x="-0,85" y="0,475"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="0,85" y="-0,475"/>
							<Dot x="0,85" y="0,475"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-0,85" y="0,475"/>
							<Dot x="0,85" y="0,475"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-0,85" y="-0,475"/>
							<Dot x="0,85" y="-0,475"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-1,2" y="-0,55"/>
							<Dot x="-1,2" y="0,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="1,2" y="-0,55"/>
							<Dot x="1,2" y="0,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-1,2" y="0,55"/>
							<Dot x="1,2" y="0,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-1,2" y="-0,55"/>
							<Dot x="1,2" y="-0,55"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,475" y="0"/>
							<Dot x="0,475" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="-0,475"/>
							<Dot x="0" y="0,475"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="C1206">
				<Pads>
					<Pad padNum="1" name="2" angle="90" flipped="off">
						<PadstackRef name="r170_110"/>
						<Org x="1,35" y="0"/>
					</Pad>
					<Pad padNum="2" name="1" angle="90" flipped="off">
						<PadstackRef name="r170_110"/>
						<Org x="-1,35" y="0"/>
					</Pad>
				</Pads>
				<Details>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-0,4" y="-0,75"/>
							<Dot x="0,4" y="-0,75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,2">
						<LayerRef type="Silk" name="Top Overlay"/>
						<Line>
							<Dot x="-0,4" y="0,75"/>
							<Dot x="0,4" y="0,75"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-1,7" y="-0,9"/>
							<Dot x="1,7" y="-0,9"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-1,7" y="0,9"/>
							<Dot x="1,7" y="0,9"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="1,7" y="-0,9"/>
							<Dot x="1,7" y="0,9"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 13"/>
						<Line>
							<Dot x="-1,7" y="-0,9"/>
							<Dot x="-1,7" y="0,9"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="0" y="-0,5"/>
							<Dot x="0" y="0,5"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-0,5" y="0"/>
							<Dot x="0,5" y="0"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-2" y="-0,95"/>
							<Dot x="2" y="-0,95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-2" y="0,95"/>
							<Dot x="2" y="0,95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="2" y="-0,95"/>
							<Dot x="2" y="0,95"/>
						</Line>
					</Detail>
					<Detail lineWidth="0,1">
						<LayerRef type="Mechanical" name="Mechanical 15"/>
						<Line>
							<Dot x="-2" y="-0,95"/>
							<Dot x="-2" y="0,95"/>
						</Line>
					</Detail>
				</Details>
				<KeepoutsTrace>
				</KeepoutsTrace>
			</Footprint>
		</Footprints>
		<Components>
			<Component name="DD8">
				<Pins>
					<Pin pinNum="1" name="17"/>
					<Pin pinNum="2" name="18"/>
					<Pin pinNum="3" name="1"/>
					<Pin pinNum="4" name="2"/>
					<Pin pinNum="5" name="3"/>
					<Pin pinNum="6" name="4"/>
					<Pin pinNum="7" name="5"/>
					<Pin pinNum="8" name="6"/>
					<Pin pinNum="9" name="7"/>
					<Pin pinNum="10" name="8"/>
					<Pin pinNum="11" name="16"/>
					<Pin pinNum="12" name="15"/>
					<Pin pinNum="13" name="14"/>
					<Pin pinNum="14" name="13"/>
					<Pin pinNum="15" name="12"/>
					<Pin pinNum="16" name="11"/>
					<Pin pinNum="17" name="10"/>
					<Pin pinNum="18" name="9"/>
				</Pins>
			</Component>
			<Component name="XP7">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="DD7">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
					<Pin pinNum="3" name="3"/>
					<Pin pinNum="4" name="4"/>
					<Pin pinNum="5" name="5"/>
					<Pin pinNum="6" name="6"/>
					<Pin pinNum="7" name="7"/>
					<Pin pinNum="8" name="8"/>
					<Pin pinNum="9" name="16"/>
					<Pin pinNum="10" name="15"/>
					<Pin pinNum="11" name="14"/>
					<Pin pinNum="12" name="13"/>
					<Pin pinNum="13" name="12"/>
					<Pin pinNum="14" name="11"/>
					<Pin pinNum="15" name="10"/>
					<Pin pinNum="16" name="9"/>
					<Pin pinNum="17" name="17"/>
					<Pin pinNum="18" name="18"/>
				</Pins>
			</Component>
			<Component name="XP6">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="XP5">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="XP4">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="XP3">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="DD6">
				<Pins>
					<Pin pinNum="1" name="17"/>
					<Pin pinNum="2" name="18"/>
					<Pin pinNum="3" name="1"/>
					<Pin pinNum="4" name="2"/>
					<Pin pinNum="5" name="3"/>
					<Pin pinNum="6" name="4"/>
					<Pin pinNum="7" name="5"/>
					<Pin pinNum="8" name="6"/>
					<Pin pinNum="9" name="7"/>
					<Pin pinNum="10" name="8"/>
					<Pin pinNum="11" name="16"/>
					<Pin pinNum="12" name="15"/>
					<Pin pinNum="13" name="14"/>
					<Pin pinNum="14" name="13"/>
					<Pin pinNum="15" name="12"/>
					<Pin pinNum="16" name="11"/>
					<Pin pinNum="17" name="10"/>
					<Pin pinNum="18" name="9"/>
				</Pins>
			</Component>
			<Component name="DD5">
				<Pins>
					<Pin pinNum="1" name="17"/>
					<Pin pinNum="2" name="18"/>
					<Pin pinNum="3" name="1"/>
					<Pin pinNum="4" name="2"/>
					<Pin pinNum="5" name="3"/>
					<Pin pinNum="6" name="4"/>
					<Pin pinNum="7" name="5"/>
					<Pin pinNum="8" name="6"/>
					<Pin pinNum="9" name="7"/>
					<Pin pinNum="10" name="8"/>
					<Pin pinNum="11" name="16"/>
					<Pin pinNum="12" name="15"/>
					<Pin pinNum="13" name="14"/>
					<Pin pinNum="14" name="13"/>
					<Pin pinNum="15" name="12"/>
					<Pin pinNum="16" name="11"/>
					<Pin pinNum="17" name="10"/>
					<Pin pinNum="18" name="9"/>
				</Pins>
			</Component>
			<Component name="DD1">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
					<Pin pinNum="3" name="3"/>
					<Pin pinNum="4" name="4"/>
					<Pin pinNum="5" name="5"/>
					<Pin pinNum="6" name="6"/>
					<Pin pinNum="7" name="7"/>
					<Pin pinNum="8" name="8"/>
					<Pin pinNum="9" name="16"/>
					<Pin pinNum="10" name="15"/>
					<Pin pinNum="11" name="14"/>
					<Pin pinNum="12" name="13"/>
					<Pin pinNum="13" name="12"/>
					<Pin pinNum="14" name="11"/>
					<Pin pinNum="15" name="10"/>
					<Pin pinNum="16" name="9"/>
					<Pin pinNum="17" name="17"/>
					<Pin pinNum="18" name="18"/>
				</Pins>
			</Component>
			<Component name="XP2">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="XP1">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="DD2">
				<Pins>
					<Pin pinNum="1" name="17"/>
					<Pin pinNum="2" name="18"/>
					<Pin pinNum="3" name="1"/>
					<Pin pinNum="4" name="2"/>
					<Pin pinNum="5" name="3"/>
					<Pin pinNum="6" name="4"/>
					<Pin pinNum="7" name="5"/>
					<Pin pinNum="8" name="6"/>
					<Pin pinNum="9" name="7"/>
					<Pin pinNum="10" name="8"/>
					<Pin pinNum="11" name="16"/>
					<Pin pinNum="12" name="15"/>
					<Pin pinNum="13" name="14"/>
					<Pin pinNum="14" name="13"/>
					<Pin pinNum="15" name="12"/>
					<Pin pinNum="16" name="11"/>
					<Pin pinNum="17" name="10"/>
					<Pin pinNum="18" name="9"/>
				</Pins>
			</Component>
			<Component name="DD3">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
					<Pin pinNum="3" name="3"/>
					<Pin pinNum="4" name="4"/>
					<Pin pinNum="5" name="5"/>
					<Pin pinNum="6" name="6"/>
					<Pin pinNum="7" name="7"/>
					<Pin pinNum="8" name="8"/>
					<Pin pinNum="9" name="16"/>
					<Pin pinNum="10" name="15"/>
					<Pin pinNum="11" name="14"/>
					<Pin pinNum="12" name="13"/>
					<Pin pinNum="13" name="12"/>
					<Pin pinNum="14" name="11"/>
					<Pin pinNum="15" name="10"/>
					<Pin pinNum="16" name="9"/>
					<Pin pinNum="17" name="17"/>
					<Pin pinNum="18" name="18"/>
				</Pins>
			</Component>
			<Component name="DD4">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
					<Pin pinNum="3" name="3"/>
					<Pin pinNum="4" name="4"/>
					<Pin pinNum="5" name="5"/>
					<Pin pinNum="6" name="6"/>
					<Pin pinNum="7" name="7"/>
					<Pin pinNum="8" name="8"/>
					<Pin pinNum="9" name="16"/>
					<Pin pinNum="10" name="15"/>
					<Pin pinNum="11" name="14"/>
					<Pin pinNum="12" name="13"/>
					<Pin pinNum="13" name="12"/>
					<Pin pinNum="14" name="11"/>
					<Pin pinNum="15" name="10"/>
					<Pin pinNum="16" name="9"/>
					<Pin pinNum="17" name="17"/>
					<Pin pinNum="18" name="18"/>
				</Pins>
			</Component>
			<Component name="R1">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="R3">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="R2">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="R4">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="R5">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="R6">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="R7">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="R8">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="R9">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="R10">
				<Pins>
					<Pin pinNum="1" name="1"/>
					<Pin pinNum="2" name="2"/>
				</Pins>
			</Component>
			<Component name="C1">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="C2">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="C3">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
			<Component name="C4">
				<Pins>
					<Pin pinNum="1" name="2"/>
					<Pin pinNum="2" name="1"/>
				</Pins>
			</Component>
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="DD8"/>
				<FootprintRef name="SOT403-1_N$DD8$COOVBGLM"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="XP7"/>
				<FootprintRef name="BAT-2$XP7$EBLXAKRY"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="DD7"/>
				<FootprintRef name="SOT403-1_N$DD7$SNVODRKS"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="XP6"/>
				<FootprintRef name="BAT-2$XP6$PXSEUODM"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="XP5"/>
				<FootprintRef name="BAT-2$XP5$LTLFBXLB"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="XP4"/>
				<FootprintRef name="BAT-2$XP4$IYGRWNNW"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="XP3"/>
				<FootprintRef name="BAT-2$XP3$TNMNBCGG"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="DD6"/>
				<FootprintRef name="SOT403-1_N$DD6$MXMKQUFN"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="DD5"/>
				<FootprintRef name="SOT403-1_N$DD5$EYCGKMJC"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="DD1"/>
				<FootprintRef name="SOT403-1_N$DD1$OUKDCFYR"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="XP2"/>
				<FootprintRef name="BAT-2$XP2$QDCDDMQD"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="XP1"/>
				<FootprintRef name="BAT-2$XP1$LOJXFODW"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="DD2"/>
				<FootprintRef name="SOT403-1_N$DD2$VKXEVAJW"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="DD3"/>
				<FootprintRef name="SOT403-1_N$DD3$VJUYHDIU"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="DD4"/>
				<FootprintRef name="SOT403-1_N$DD4$JEGJSBLX"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
				<Pinpack pinNum="3" padNum="3"/>
				<Pinpack pinNum="4" padNum="4"/>
				<Pinpack pinNum="5" padNum="5"/>
				<Pinpack pinNum="6" padNum="6"/>
				<Pinpack pinNum="7" padNum="7"/>
				<Pinpack pinNum="8" padNum="8"/>
				<Pinpack pinNum="9" padNum="9"/>
				<Pinpack pinNum="10" padNum="10"/>
				<Pinpack pinNum="11" padNum="11"/>
				<Pinpack pinNum="12" padNum="12"/>
				<Pinpack pinNum="13" padNum="13"/>
				<Pinpack pinNum="14" padNum="14"/>
				<Pinpack pinNum="15" padNum="15"/>
				<Pinpack pinNum="16" padNum="16"/>
				<Pinpack pinNum="17" padNum="17"/>
				<Pinpack pinNum="18" padNum="18"/>
			</Package>
			<Package>
				<ComponentRef name="R1"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R3"/>
				<FootprintRef name="AXIAL-0.4"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R2"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R4"/>
				<FootprintRef name="AXIAL-0.4"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R5"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R6"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R7"/>
				<FootprintRef name="J1-0603"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R8"/>
				<FootprintRef name="J1-0603"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R9"/>
				<FootprintRef name="J1-0603"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="R10"/>
				<FootprintRef name="J1-0603"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C1"/>
				<FootprintRef name="C1206"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C2"/>
				<FootprintRef name="C1206"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C3"/>
				<FootprintRef name="C1206"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
			<Package>
				<ComponentRef name="C4"/>
				<FootprintRef name="C1206"/>
				<Pinpack pinNum="1" padNum="1"/>
				<Pinpack pinNum="2" padNum="2"/>
			</Package>
		</Packages>
	</LocalLibrary>
	<Constructive version="1.0">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="5,25" y="79,49999"/>
						<Dot x="146,97575" y="79,50002"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="129,13003" y="88,56764"/>
						<Start x="146,97575" y="79,50002"/>
						<End x="129,13002" y="108,58492"/>
					</Arc>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="129,13002" y="108,58492"/>
						<Dot x="129,13003" y="108,58493"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="129,13003" y="108,58493"/>
						<Dot x="4,08498" y="108,58498"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="4,08483" y="108,00015"/>
						<Start x="4,08498" y="108,58498"/>
						<End x="3,5" y="107,99999"/>
					</Arc>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="3,5" y="107,99999"/>
						<Dot x="3,5" y="108"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="3,5" y="108"/>
						<Dot x="3,49999" y="81,25001"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="5,25" y="81,25001"/>
						<Start x="3,49999" y="81,25001"/>
						<End x="5,25" y="79,49999"/>
					</Arc>
				</Shape>
			</Contour>
		</BoardOutline>
		<MechLayerObjects>
			<Detail lineWidth="0,1">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="5,25" y="79,49999"/>
					<Dot x="146,97575" y="79,50002"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,1">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="4,08498" y="108,58498"/>
					<Dot x="129,13003" y="108,58493"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,1">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="3,49999" y="81,25001"/>
					<Dot x="3,5" y="108"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Line>
					<Dot x="90,88" y="94,025"/>
					<Dot x="90,88" y="97,454"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,1">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Arc>
					<Center x="129,13003" y="88,56764"/>
					<Start x="146,97575" y="79,50002"/>
					<End x="129,13002" y="108,58492"/>
				</Arc>
			</Detail>
			<Detail lineWidth="0,1">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Arc>
					<Center x="4,08483" y="108,00015"/>
					<Start x="4,08498" y="108,58498"/>
					<End x="3,5" y="107,99999"/>
				</Arc>
			</Detail>
			<Detail lineWidth="0,1">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Arc>
					<Center x="5,25" y="81,25001"/>
					<Start x="3,49999" y="81,25001"/>
					<End x="5,25" y="79,49999"/>
				</Arc>
			</Detail>
			<Detail lineWidth="0,2">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Arc>
					<Center x="97,7677" y="104,82838"/>
					<Start x="97,51516" y="106,32153"/>
					<End x="98,87" y="103,79"/>
				</Arc>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="88,75" y="103,75"/>
					<Dot x="88,75" y="106,75"/>
					<Dot x="93,75" y="106,75"/>
					<Dot x="93,75" y="103,75"/>
				</Polygon>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="94,43138" y="99,68138"/>
					<Dot x="94,75" y="100"/>
					<Dot x="94,75" y="101"/>
					<Dot x="97,25" y="101"/>
					<Dot x="97,75" y="100,5"/>
					<Dot x="97,75" y="99,5"/>
					<Dot x="97,25" y="99,5"/>
					<Dot x="96,25" y="98,5"/>
					<Dot x="94,6949" y="98,81102"/>
					<Dot x="94,44941" y="98,93487"/>
					<Dot x="94,30246" y="99,16727"/>
					<Dot x="94,29582" y="99,44215"/>
					<Dot x="94,43138" y="99,68138"/>
				</Polygon>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="97,75" y="100,5"/>
					<Dot x="97,75" y="99,5"/>
					<Dot x="97,25" y="99,5"/>
					<Dot x="96,25" y="98,5"/>
					<Dot x="94,6949" y="98,81102"/>
					<Dot x="94,62625" y="98,82475"/>
					<Dot x="94,50125" y="98,88782"/>
					<Dot x="94,39758" y="98,98193"/>
					<Dot x="94,32275" y="99,10027"/>
					<Dot x="94,28217" y="99,23427"/>
					<Dot x="94,27879" y="99,37425"/>
					<Dot x="94,31285" y="99,51006"/>
					<Dot x="94,38188" y="99,63187"/>
					<Dot x="94,43138" y="99,68138"/>
					<Dot x="94,43138" y="99,68138"/>
					<Dot x="94,75" y="100"/>
					<Dot x="94,75" y="101"/>
					<Dot x="97,25" y="101"/>
				</Polygon>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="91,91411" y="100,00206"/>
					<Dot x="92,00961" y="100,09755"/>
					<Dot x="92,00961" y="101,09755"/>
					<Dot x="91,50961" y="101,59755"/>
					<Dot x="91,0096" y="101,09755"/>
					<Dot x="91" y="101"/>
					<Dot x="90,92535" y="100,81976"/>
					<Dot x="90,7874" y="100,68181"/>
					<Dot x="90,60715" y="100,60715"/>
					<Dot x="90,50961" y="100,59755"/>
					<Dot x="90,50961" y="100,59755"/>
					<Dot x="90,00961" y="100,09755"/>
					<Dot x="90,9669" y="99,77845"/>
					<Dot x="91,08921" y="99,73768"/>
					<Dot x="91,34679" y="99,72609"/>
					<Dot x="91,59774" y="99,78534"/>
					<Dot x="91,82295" y="99,91089"/>
					<Dot x="91,91411" y="100,00206"/>
				</Polygon>
			</Detail>
		</MechLayerObjects>
		<Keepouts>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="38,75" y="107,25"/>
					<Dot x="40,35278" y="107,53261"/>
					<Dot x="40,77451" y="105,14086"/>
					<Dot x="39,17173" y="104,85825"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="38,21739" y="107,35278"/>
					<Dot x="38,5" y="105,75"/>
					<Dot x="36,10824" y="105,32827"/>
					<Dot x="35,82563" y="106,93105"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="39" y="94,25"/>
					<Dot x="40,60278" y="94,53261"/>
					<Dot x="41,02451" y="92,14085"/>
					<Dot x="39,42173" y="91,85824"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="38,46739" y="94,35278"/>
					<Dot x="38,75" y="92,75"/>
					<Dot x="36,35825" y="92,32827"/>
					<Dot x="36,07564" y="93,93105"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="39,25" y="100,75"/>
					<Dot x="40,85278" y="101,03261"/>
					<Dot x="41,27451" y="98,64085"/>
					<Dot x="39,67173" y="98,35824"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="38,71739" y="100,85278"/>
					<Dot x="39,00001" y="99,25"/>
					<Dot x="36,60825" y="98,82827"/>
					<Dot x="36,32564" y="100,43105"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="42,5" y="106,25"/>
					<Dot x="43" y="106,75"/>
					<Dot x="44" y="106,75"/>
					<Dot x="44,25" y="106,5"/>
					<Dot x="44,25" y="104,75"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="42,75" y="93,25"/>
					<Dot x="43,25" y="93,75"/>
					<Dot x="44,25" y="93,75"/>
					<Dot x="44,5" y="93,5"/>
					<Dot x="44,5" y="91,75"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="43" y="99,75"/>
					<Dot x="43,5" y="100,25"/>
					<Dot x="44,5" y="100,25"/>
					<Dot x="44,75" y="100"/>
					<Dot x="44,75" y="98,25"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Line>
					<Dot x="41,5" y="102,75"/>
					<Dot x="41,5" y="106,75"/>
				</Line>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</Trace>
				</Role>
				<Line>
					<Dot x="42" y="96,25"/>
					<Dot x="42" y="100,25"/>
				</Line>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Line>
					<Dot x="41,75" y="89,75"/>
					<Dot x="41,75" y="93,75"/>
				</Line>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Arc>
					<Center x="37,75" y="103,5"/>
					<Start x="37" y="103"/>
					<End x="38,55623" y="103,09689"/>
				</Arc>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Circle diameter="1,58114">
					<Center x="43,75" y="102,75"/>
				</Circle>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</Trace>
				</Role>
				<Arc>
					<Center x="38,25" y="97"/>
					<Start x="37,5" y="96,5"/>
					<End x="39,05623" y="96,59689"/>
				</Arc>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Signal Layer 2"/>
					</Trace>
				</Role>
				<Circle diameter="1,58114">
					<Center x="44,25" y="96,25"/>
				</Circle>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Arc>
					<Center x="38" y="90,5"/>
					<Start x="37,25" y="90"/>
					<End x="38,80623" y="90,09688"/>
				</Arc>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Circle diameter="1,58114">
					<Center x="44" y="89,75"/>
				</Circle>
			</Keepout>
		</Keepouts>
		<Texts>
			<Text text="Трассировка" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="105" y="109,75"/>
			</Text>
			<Text text="Механические слои" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="86,75" y="110"/>
			</Text>
			<Text text="Полигоны" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="68" y="110"/>
			</Text>
			<Text text="Add in FST 1.1.4" align="LB" angle="90" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="62,75" y="82,75"/>
			</Text>
			<Text text="FST 1.1.3" align="LB" angle="90" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="58,5" y="85,5"/>
			</Text>
			<Text text="FreePad" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="56,5" y="109,75"/>
			</Text>
			<Text text="SL1-Bottom" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="49,49" y="104,07"/>
			</Text>
			<Text text="FullStack" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="49,5" y="96,75"/>
			</Text>
			<Text text="Top-middle-Bot" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="49,5" y="99,5"/>
			</Text>
			<Text text="Simple" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="49,5" y="101,75"/>
			</Text>
			<Text text="Top - SL1" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial100"/>
				<Org x="49,5" y="106"/>
			</Text>
			<Text text="Переходы" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="46,35" y="109,95"/>
			</Text>
			<Text text="Запреты" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="36,75" y="110,25"/>
			</Text>
			<Text text="Компоненты" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial200"/>
				<Org x="19" y="110,5"/>
			</Text>
			<Text text="123321" align="LB" angle="0" mirror="off">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<TextStyleRef name="Arial152,4"/>
				<Org x="94" y="95,25"/>
			</Text>
		</Texts>
	</Constructive>
	<ComponentsOnBoard version="1.1">
		<Components>
			<CompInstance name="DD8" side="Bottom" angle="110" fixed="off">
				<ComponentRef name="DD8"/>
				<FootprintRef name="SOT403-1_N$DD8$COOVBGLM"/>
				<Org x="109,25" y="86"/>
				<Pins>
					<Pin padNum="1" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="2" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="3" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="4" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="5" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="6" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="7" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="8" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="9" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="10" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="11" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="12" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="13" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="14" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="15" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="16" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="17" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="18" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP7" side="Top" angle="180" fixed="off">
				<ComponentRef name="XP7"/>
				<FootprintRef name="BAT-2$XP7$EBLXAKRY"/>
				<Org x="109" y="94,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD7" side="Top" angle="0" fixed="off">
				<ComponentRef name="DD7"/>
				<FootprintRef name="SOT403-1_N$DD7$SNVODRKS"/>
				<Org x="108,75" y="102,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="3" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="4" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="5" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="6" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="7" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="8" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="9" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="10" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="11" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="12" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="13" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="14" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="15" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="16" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="17" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pin>
					<Pin padNum="18" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP6" side="Bottom" angle="110" fixed="off">
				<ComponentRef name="XP6"/>
				<FootprintRef name="BAT-2$XP6$PXSEUODM"/>
				<Org x="26,25" y="84,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90r50"/>
						<Org x="1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP5" side="Bottom" angle="20" fixed="off">
				<ComponentRef name="XP5"/>
				<FootprintRef name="BAT-2$XP5$LTLFBXLB"/>
				<Org x="27,25" y="92,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90r50"/>
						<Org x="1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP4" side="Top" angle="290" fixed="off">
				<ComponentRef name="XP4"/>
				<FootprintRef name="BAT-2$XP4$IYGRWNNW"/>
				<Org x="31" y="86,25"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90c50"/>
						<Org x="-1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP3" side="Top" angle="20" fixed="off">
				<ComponentRef name="XP3"/>
				<FootprintRef name="BAT-2$XP3$TNMNBCGG"/>
				<Org x="27,25" y="98,75"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90c50"/>
						<Org x="-1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD6" side="Bottom" angle="110" fixed="off">
				<ComponentRef name="DD6"/>
				<FootprintRef name="SOT403-1_N$DD6$MXMKQUFN"/>
				<Org x="18,5" y="88,25"/>
				<Pins>
					<Pin padNum="1" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="2" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="3" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="4" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="5" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="6" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="7" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="8" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="9" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="10" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="11" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="12" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="13" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="14" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="15" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="16" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="17" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="18" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD5" side="Bottom" angle="20" fixed="off">
				<ComponentRef name="DD5"/>
				<FootprintRef name="SOT403-1_N$DD5$EYCGKMJC"/>
				<Org x="18,25" y="97,5"/>
				<Pins>
					<Pin padNum="1" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="2" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="3" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="4" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="5" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="6" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="7" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="8" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="9" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="10" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="11" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="12" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="13" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="14" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="15" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="16" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="17" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="18" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD1" side="Top" angle="0" fixed="off">
				<ComponentRef name="DD1"/>
				<FootprintRef name="SOT403-1_N$DD1$OUKDCFYR"/>
				<Org x="8,5" y="105"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="3" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="4" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="5" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="6" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="7" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="8" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="9" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="10" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="11" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="12" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="13" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="14" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="15" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="16" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="17" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pin>
					<Pin padNum="18" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP2" side="Bottom" angle="270" fixed="off">
				<ComponentRef name="XP2"/>
				<FootprintRef name="BAT-2$XP2$QDCDDMQD"/>
				<Org x="31,75" y="104,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90"/>
						<Org x="1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP1" side="Top" angle="90" fixed="off">
				<ComponentRef name="XP1"/>
				<FootprintRef name="BAT-2$XP1$LOJXFODW"/>
				<Org x="27" y="104,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150_150h90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150_150r90"/>
						<Org x="1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD2" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="DD2"/>
				<FootprintRef name="SOT403-1_N$DD2$VKXEVAJW"/>
				<Org x="18" y="104,75"/>
				<Pins>
					<Pin padNum="1" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="2" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="-1,397" y="-1,651"/>
					</Pin>
					<Pin padNum="3" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="4" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="5" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="6" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="7" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="8" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="9" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="10" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="11" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="12" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="13" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="14" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="15" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="16" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="17" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="18" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD3" side="Top" angle="290" fixed="off">
				<ComponentRef name="DD3"/>
				<FootprintRef name="SOT403-1_N$DD3$VJUYHDIU"/>
				<Org x="9" y="88"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="3" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="4" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="5" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="6" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="7" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="8" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="9" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="10" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="11" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="12" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="13" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="14" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="15" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="16" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="17" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pin>
					<Pin padNum="18" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="DD4" side="Top" angle="20" fixed="off">
				<ComponentRef name="DD4"/>
				<FootprintRef name="SOT403-1_N$DD4$JEGJSBLX"/>
				<Org x="8,75" y="97,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r35_170"/>
						<Org x="-2,85" y="2,275"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r35_170c50"/>
						<Org x="-2,85" y="1,625"/>
					</Pin>
					<Pin padNum="3" name="3">
						<PadstackRef name="r35_170r50"/>
						<Org x="-2,85" y="0,975"/>
					</Pin>
					<Pin padNum="4" name="4">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="0,325"/>
					</Pin>
					<Pin padNum="5" name="5">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="6" name="6">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="7" name="7">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="8" name="8">
						<PadstackRef name="r35_170r100"/>
						<Org x="-2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="9" name="16">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="2,275"/>
					</Pin>
					<Pin padNum="10" name="15">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="1,625"/>
					</Pin>
					<Pin padNum="11" name="14">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,975"/>
					</Pin>
					<Pin padNum="12" name="13">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="0,325"/>
					</Pin>
					<Pin padNum="13" name="12">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,325"/>
					</Pin>
					<Pin padNum="14" name="11">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-0,975"/>
					</Pin>
					<Pin padNum="15" name="10">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-1,625"/>
					</Pin>
					<Pin padNum="16" name="9">
						<PadstackRef name="r35_170r100"/>
						<Org x="2,85" y="-2,275"/>
					</Pin>
					<Pin padNum="17" name="17">
						<PadstackRef name="r35_170"/>
						<Org x="-1,397" y="1,651"/>
					</Pin>
					<Pin padNum="18" name="18">
						<PadstackRef name="r35_170r100"/>
						<Org x="1,397" y="1,651"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R1" side="Top" angle="0" fixed="off">
				<ComponentRef name="R1"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Org x="124,475" y="105,25"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="c140_140r90"/>
						<Org x="3,81" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="c140_140r90"/>
						<Org x="-3,81" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R3" side="Top" angle="0" fixed="off">
				<ComponentRef name="R3"/>
				<FootprintRef name="AXIAL-0.4"/>
				<Org x="124,975" y="98,5"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="c140_140r90"/>
						<Org x="-5,08" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c140_140r90"/>
						<Org x="5,08" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R2" side="Top" angle="0" fixed="off">
				<ComponentRef name="R2"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Org x="124,675" y="102,075"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="c140_140r90"/>
						<Org x="3,81" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="c140_140r90"/>
						<Org x="-3,81" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R4" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="R4"/>
				<FootprintRef name="AXIAL-0.4"/>
				<Org x="137,55" y="98,45"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="c140_140r90"/>
						<Org x="5,08" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c140_140r90"/>
						<Org x="-5,08" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R5" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="R5"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Org x="134,075" y="105,175"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="c140_140r90"/>
						<Org x="-3,81" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="c140_140r90"/>
						<Org x="3,81" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R6" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="R6"/>
				<FootprintRef name="AXIAL-0.3"/>
				<Org x="134,325" y="102,175"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="c140_140r90"/>
						<Org x="-3,81" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="c140_140r90"/>
						<Org x="3,81" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R7" side="Top" angle="0" fixed="off">
				<ComponentRef name="R7"/>
				<FootprintRef name="J1-0603"/>
				<Org x="121,125" y="95,05"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r90_70"/>
						<Org x="-0,75" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r90_70"/>
						<Org x="0,75" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R8" side="Top" angle="0" fixed="off">
				<ComponentRef name="R8"/>
				<FootprintRef name="J1-0603"/>
				<Org x="121" y="92,75"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r90_70"/>
						<Org x="-0,75" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r90_70"/>
						<Org x="0,75" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R9" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="R9"/>
				<FootprintRef name="J1-0603"/>
				<Org x="128,475" y="94,95"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r90_70"/>
						<Org x="0,75" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r90_70"/>
						<Org x="-0,75" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="R10" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="R10"/>
				<FootprintRef name="J1-0603"/>
				<Org x="128,525" y="92,6"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="r90_70"/>
						<Org x="0,75" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="r90_70"/>
						<Org x="-0,75" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="C1" side="Top" angle="0" fixed="off">
				<ComponentRef name="C1"/>
				<FootprintRef name="C1206"/>
				<Org x="133,05" y="94,375"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="r170_110"/>
						<Org x="1,35" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="r170_110"/>
						<Org x="-1,35" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="C2" side="Top" angle="0" fixed="off">
				<ComponentRef name="C2"/>
				<FootprintRef name="C1206"/>
				<Org x="138,65" y="94,275"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="r170_110"/>
						<Org x="1,35" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="r170_110"/>
						<Org x="-1,35" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="C3" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="C3"/>
				<FootprintRef name="C1206"/>
				<Org x="132,85" y="91"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="r170_110"/>
						<Org x="-1,35" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="r170_110"/>
						<Org x="1,35" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="C4" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="C4"/>
				<FootprintRef name="C1206"/>
				<Org x="138,975" y="90,975"/>
				<Pins>
					<Pin padNum="1" name="2">
						<PadstackRef name="r170_110"/>
						<Org x="-1,35" y="0"/>
					</Pin>
					<Pin padNum="2" name="1">
						<PadstackRef name="r170_110"/>
						<Org x="1,35" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
		</Components>
		<FreePads>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="s152,4_100h90r33"/>
				<Org x="62,5" y="100,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="s152,4_100h90c50"/>
				<Org x="62,5" y="104,5"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="s152,4_100h90"/>
				<Org x="58,25" y="100,75"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="c152,4_100r90"/>
				<Org x="58,25" y="104,75"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="s152,4_152,4h90r50"/>
				<Org x="62,5" y="102,5"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="s152,4_152,4h90c50"/>
				<Org x="62,5" y="106,5"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="s152,4_152,4h90"/>
				<Org x="58,25" y="103"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="c152,4_152,4r90"/>
				<Org x="58,25" y="106,5"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r150_100r33"/>
				<Org x="62,5" y="91,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r152,4_100c50"/>
				<Org x="62,5" y="95,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r150_150r50"/>
				<Org x="62,5" y="93,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r152,4_152,4c50"/>
				<Org x="62,5" y="97,5"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r150_150"/>
				<Org x="58,25" y="93,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r152,4_100"/>
				<Org x="58,25" y="91,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r152,4_100r100"/>
				<Org x="58,25" y="95,25"/>
			</FreePad>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="r152,4_152,4r100"/>
				<Org x="58,25" y="97,25"/>
			</FreePad>
		</FreePads>
	</ComponentsOnBoard>
	<NetList version="1.0">
		<Net name="No_Net">
		</Net>
		<Net name="Diff_N">
			<PinRef compName="DD8" pinName="15"/>
			<PinRef compName="DD7" pinName="16"/>
		</Net>
		<Net name="Diff_P">
			<PinRef compName="DD8" pinName="1"/>
			<PinRef compName="DD7" pinName="1"/>
		</Net>
		<Net name="321">
			<PinRef compName="DD8" pinName="16"/>
			<PinRef compName="DD7" pinName="13"/>
			<PinRef compName="XP7" pinName="1"/>
		</Net>
		<Net name="123">
			<PinRef compName="DD8" pinName="11"/>
			<PinRef compName="DD7" pinName="4"/>
			<PinRef compName="XP7" pinName="2"/>
		</Net>
	</NetList>
	<Groups version="1.1">
		<LayerGroups>
			<LayerGroup name="All Layers">
				<LayerRef type="Signal" name="Top Layer"/>
				<LayerRef type="Signal" name="Signal Layer 2"/>
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<LayerRef type="Signal" name="Signal Layer 3"/>
				<LayerRef type="Signal" name="Signal Layer 4"/>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<LayerRef type="Doc" name="Mechanical 1"/>
				<LayerRef type="Doc" name="Mechanical 4"/>
				<LayerRef type="Mechanical" name="Mechanical 13"/>
				<LayerRef type="Mechanical" name="Mechanical 14"/>
				<LayerRef type="Mechanical" name="Mechanical 15"/>
				<LayerRef type="Mechanical" name="Mechanical 16"/>
			</LayerGroup>
			<LayerGroup name="Signal Layers">
				<LayerRef type="Signal" name="Top Layer"/>
				<LayerRef type="Signal" name="Signal Layer 2"/>
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<LayerRef type="Signal" name="Signal Layer 3"/>
				<LayerRef type="Signal" name="Signal Layer 4"/>
				<LayerRef type="Signal" name="Bottom Layer"/>
			</LayerGroup>
			<LayerGroup name="NonSignal Layers">
				<LayerRef type="Doc" name="Multi-Layer"/>
				<LayerRef type="Paste" name="Top Paste"/>
				<LayerRef type="Silk" name="Top Overlay"/>
				<LayerRef type="Mask" name="Top Solder"/>
				<LayerRef type="Mask" name="Bottom Solder"/>
				<LayerRef type="Silk" name="Bottom Overlay"/>
				<LayerRef type="Paste" name="Bottom Paste"/>
				<LayerRef type="Doc" name="Drill Guide"/>
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<LayerRef type="Doc" name="Drill Drawing"/>
			</LayerGroup>
			<LayerGroup name="Mechanical Layers">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<LayerRef type="Doc" name="Mechanical 4"/>
				<LayerRef type="Mechanical" name="Mechanical 13"/>
				<LayerRef type="Mechanical" name="Mechanical 14"/>
				<LayerRef type="Mechanical" name="Mechanical 15"/>
				<LayerRef type="Mechanical" name="Mechanical 16"/>
			</LayerGroup>
	</LayerGroups>
		<NetGroups>
			<NetGroup name="All Nets">
				<NetRef name="Diff_N"/>
				<NetRef name="Diff_P"/>
				<NetRef name="321"/>
				<NetRef name="123"/>
			</NetGroup>
		</NetGroups>
		<CompGroups>
			<CompGroup name="Outside Board Components">
			</CompGroup>
			<CompGroup name="Inside Board Components">
				<CompInstanceRef name="DD8"/>
				<CompInstanceRef name="XP7"/>
				<CompInstanceRef name="DD7"/>
				<CompInstanceRef name="XP6"/>
				<CompInstanceRef name="XP5"/>
				<CompInstanceRef name="XP4"/>
				<CompInstanceRef name="XP3"/>
				<CompInstanceRef name="DD6"/>
				<CompInstanceRef name="DD5"/>
				<CompInstanceRef name="DD1"/>
				<CompInstanceRef name="XP2"/>
				<CompInstanceRef name="XP1"/>
				<CompInstanceRef name="DD2"/>
				<CompInstanceRef name="DD3"/>
				<CompInstanceRef name="DD4"/>
				<CompInstanceRef name="R1"/>
				<CompInstanceRef name="R3"/>
				<CompInstanceRef name="R2"/>
				<CompInstanceRef name="R4"/>
				<CompInstanceRef name="R5"/>
				<CompInstanceRef name="R6"/>
				<CompInstanceRef name="R7"/>
				<CompInstanceRef name="R8"/>
				<CompInstanceRef name="R9"/>
				<CompInstanceRef name="R10"/>
				<CompInstanceRef name="C1"/>
				<CompInstanceRef name="C2"/>
				<CompInstanceRef name="C3"/>
				<CompInstanceRef name="C4"/>
			</CompGroup>
			<CompGroup name="Bottom Side Components">
				<CompInstanceRef name="DD8"/>
				<CompInstanceRef name="XP6"/>
				<CompInstanceRef name="XP5"/>
				<CompInstanceRef name="DD6"/>
				<CompInstanceRef name="DD5"/>
				<CompInstanceRef name="XP2"/>
				<CompInstanceRef name="DD2"/>
				<CompInstanceRef name="R4"/>
				<CompInstanceRef name="R5"/>
				<CompInstanceRef name="R6"/>
				<CompInstanceRef name="R9"/>
				<CompInstanceRef name="R10"/>
				<CompInstanceRef name="C3"/>
				<CompInstanceRef name="C4"/>
			</CompGroup>
			<CompGroup name="Top Side Components">
				<CompInstanceRef name="XP7"/>
				<CompInstanceRef name="DD7"/>
				<CompInstanceRef name="XP4"/>
				<CompInstanceRef name="XP3"/>
				<CompInstanceRef name="DD1"/>
				<CompInstanceRef name="XP1"/>
				<CompInstanceRef name="DD3"/>
				<CompInstanceRef name="DD4"/>
				<CompInstanceRef name="R1"/>
				<CompInstanceRef name="R3"/>
				<CompInstanceRef name="R2"/>
				<CompInstanceRef name="R7"/>
				<CompInstanceRef name="R8"/>
				<CompInstanceRef name="C1"/>
				<CompInstanceRef name="C2"/>
			</CompGroup>
			<CompGroup name="All Components">
				<CompInstanceRef name="DD8"/>
				<CompInstanceRef name="XP7"/>
				<CompInstanceRef name="DD7"/>
				<CompInstanceRef name="XP6"/>
				<CompInstanceRef name="XP5"/>
				<CompInstanceRef name="XP4"/>
				<CompInstanceRef name="XP3"/>
				<CompInstanceRef name="DD6"/>
				<CompInstanceRef name="DD5"/>
				<CompInstanceRef name="DD1"/>
				<CompInstanceRef name="XP2"/>
				<CompInstanceRef name="XP1"/>
				<CompInstanceRef name="DD2"/>
				<CompInstanceRef name="DD3"/>
				<CompInstanceRef name="DD4"/>
				<CompInstanceRef name="R1"/>
				<CompInstanceRef name="R3"/>
				<CompInstanceRef name="R2"/>
				<CompInstanceRef name="R4"/>
				<CompInstanceRef name="R5"/>
				<CompInstanceRef name="R6"/>
				<CompInstanceRef name="R7"/>
				<CompInstanceRef name="R8"/>
				<CompInstanceRef name="R9"/>
				<CompInstanceRef name="R10"/>
				<CompInstanceRef name="C1"/>
				<CompInstanceRef name="C2"/>
				<CompInstanceRef name="C3"/>
				<CompInstanceRef name="C4"/>
			</CompGroup>
		</CompGroups>
	</Groups>
	<HiSpeedRules version="2.1">
		<RulesImpedances>
			<ImpedanceDiff name="DiffPairsRouting" Z0="100">
				<LayerRule width="0,3" gap="0,3">
					<LayerRef type="Signal" name="Top Layer"/>
				</LayerRule>
				<LayerRule width="0,3" gap="0,3">
					<LayerRef type="Signal" name="Signal Layer 2"/>
				</LayerRule>
				<LayerRule width="0,3" gap="0,3">
					<LayerRef type="Signal" name="Signal Layer 1"/>
				</LayerRule>
				<LayerRule width="0,3" gap="0,3">
					<LayerRef type="Signal" name="Signal Layer 3"/>
				</LayerRule>
				<LayerRule width="0,3" gap="0,3">
					<LayerRef type="Signal" name="Signal Layer 4"/>
				</LayerRule>
				<LayerRule width="0,3" gap="0,3">
					<LayerRef type="Signal" name="Bottom Layer"/>
				</LayerRule>
			</ImpedanceDiff>
		</RulesImpedances>
	</HiSpeedRules>
	<Rules version="1.2">
		<RulesWidthOfWires>
			<WidthOfWires enabled="on" widthMin="0,254" widthNom="0,254">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
			</WidthOfWires>
		</RulesWidthOfWires>
		<RulesClearancesNetToNet>
			<ClearanceNetToNet enabled="on" clrnMin="0,2" clrnNom="0,6">
				<AllLayers/>
				<ObjectsAffected>
					<AllNets/>
					<AllNets/>
				</ObjectsAffected>
			</ClearanceNetToNet>
		</RulesClearancesNetToNet>
		<RulesClearancesCompToComp>
			<ClearanceCompToComp enabled="on" clrn="0,254">
				<ObjectsAffected>
					<AllComps/>
					<AllComps/>
				</ObjectsAffected>
			</ClearanceCompToComp>
		</RulesClearancesCompToComp>
		<RulesViastacksOfNets>
			<ViastacksOfNets enabled="on">
				<ObjectsAffected>
					<AllNets/>
				</ObjectsAffected>
				<Viastacks>
					<AllViastacks/>
				</Viastacks>
			</ViastacksOfNets>
		</RulesViastacksOfNets>
		<NetProperties>
			<NetProperty route="on">
				<NetRef name="Diff_N"/>
			</NetProperty>
			<NetProperty route="on">
				<NetRef name="Diff_P"/>
			</NetProperty>
			<NetProperty route="on">
				<NetRef name="321"/>
			</NetProperty>
			<NetProperty route="on">
				<NetRef name="123"/>
			</NetProperty>
		</NetProperties>
	</Rules>
	<Connectivity version="1.2">
		<Vias>
			<Via>
				<ViastackRef name="Via0"/>
				<NetRef name="Diff_N"/>
				<Org x="114,50559" y="92,75453"/>
			</Via>
			<Via>
				<ViastackRef name="Via0"/>
				<NetRef name="Diff_P"/>
				<Org x="116,06016" y="91,88984"/>
			</Via>
			<Via>
				<ViastackRef name="Via0"/>
				<NetRef name="321"/>
				<Org x="112,25" y="90,25"/>
			</Via>
			<Via>
				<ViastackRef name="Via1"/>
				<NetRef name="123"/>
				<Org x="104,5" y="92"/>
			</Via>
			<Via>
				<ViastackRef name="Via2"/>
				<NetRef name="123"/>
				<Org x="106,75" y="91"/>
			</Via>
			<Via>
				<ViastackRef name="Via3"/>
				<NetRef name="No_Net"/>
				<Org x="48" y="104,25"/>
			</Via>
			<Via>
				<ViastackRef name="Via4"/>
				<NetRef name="No_Net"/>
				<Org x="48" y="97,25"/>
			</Via>
			<Via>
				<ViastackRef name="Via5"/>
				<NetRef name="No_Net"/>
				<Org x="48" y="99,75"/>
			</Via>
			<Via>
				<ViastackRef name="Via6"/>
				<NetRef name="No_Net"/>
				<Org x="48" y="102"/>
			</Via>
			<Via>
				<ViastackRef name="Via7"/>
				<NetRef name="No_Net"/>
				<Org x="48,01" y="106,18"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="115" y="93,05"/>
					<TrackLine>
						<End x="115" y="105,125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="113,05" y="107,075"/>
					<TrackLine>
						<End x="115" y="105,125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="109,15" y="107,075"/>
					<TrackLine>
						<End x="113,05" y="107,075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="114,70453" y="92,75453"/>
					<TrackLine>
						<End x="115" y="93,05"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="114,50559" y="92,75453"/>
					<TrackLine>
						<End x="114,70453" y="92,75453"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="115,6" y="92,35"/>
					<TrackLine>
						<End x="116,06016" y="91,88984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="115,6" y="92,35"/>
					<TrackLine>
						<End x="115,6" y="105,37353"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="113,29853" y="107,675"/>
					<TrackLine>
						<End x="115,6" y="105,37353"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="108,90148" y="107,675"/>
					<TrackLine>
						<End x="113,29853" y="107,675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="108,45" y="107,22353"/>
					<TrackLine>
						<End x="108,90148" y="107,675"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="108,45" y="106,3"/>
					<TrackLine>
						<End x="108,45" y="107,22353"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="109,05" y="106,975"/>
					<TrackLine>
						<End x="109,15" y="107,075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="109,05" y="106,3"/>
					<TrackLine>
						<End x="109,05" y="106,975"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="109,05" y="106,3"/>
					<TrackLine>
						<End x="110,425" y="104,925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="110,425" y="104,925"/>
					<TrackLine>
						<End x="111,45" y="104,925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="111,45" y="104,925"/>
					<TrackLine>
						<End x="111,6" y="104,775"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="107,07501" y="104,925"/>
					<TrackLine>
						<End x="108,45" y="106,3"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="106,05" y="104,925"/>
					<TrackLine>
						<End x="107,07501" y="104,925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="105,9" y="104,775"/>
					<TrackLine>
						<End x="106,05" y="104,925"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="113,5" y="102,5"/>
					<TrackLine>
						<End x="114" y="102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="111,6" y="102,825"/>
					<TrackLine>
						<End x="112,71538" y="102,825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="110,27" y="94,5"/>
					<TrackLine>
						<End x="114" y="98,23"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="114" y="98,23"/>
					<TrackLine>
						<End x="114" y="102"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="117,5" y="81,25"/>
					<TrackLine>
						<End x="117,5" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="101,25" y="81,25"/>
					<TrackLine>
						<End x="101,25" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="87,5" y="81,25"/>
					<TrackLine>
						<End x="87,5" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="65" y="81,25"/>
					<TrackLine>
						<End x="65" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="56,25" y="81,25"/>
					<TrackLine>
						<End x="56,25" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="46,25" y="81,25"/>
					<TrackLine>
						<End x="46,25" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="35" y="81,25"/>
					<TrackLine>
						<End x="35" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<Subwire width="0,254">
					<Start x="23,75" y="81,25"/>
					<TrackLine>
						<End x="23,75" y="107,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="96,55"/>
					<TrackLine>
						<End x="104,075" y="96,6262"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="102,00877" y="96,931"/>
					<TrackLine>
						<End x="103,7702" y="96,931"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="101,70397" y="97,2358"/>
					<TrackLine>
						<End x="101,70397" y="97,3882"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="102,00877" y="97,693"/>
					<TrackLine>
						<End x="104,075" y="97,693"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="97,693"/>
					<TrackLine>
						<End x="106,31021" y="97,693"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="106,61501" y="97,9978"/>
					<TrackLine>
						<End x="106,61501" y="98,1502"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,3798" y="98,455"/>
					<TrackLine>
						<End x="106,31021" y="98,455"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="98,7598"/>
					<TrackLine>
						<End x="104,075" y="98,95"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="98,95"/>
					<TrackLine>
						<End x="104,075" y="102,825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="102,825"/>
					<TrackLine>
						<End x="105,9" y="102,825"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="96,27604"/>
					<TrackLine>
						<End x="104,075" y="96,55"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,5" y="92"/>
					<TrackLine>
						<End x="105,2417" y="94,73194"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,5" y="95,25"/>
					<TrackLine>
						<End x="104,50605" y="95,24395"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="106,3021" y="94,5"/>
					<TrackLine>
						<End x="107,73" y="94,5"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Signal Layer 2"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="110,27" y="94,5"/>
					<TrackLine>
						<End x="112,25" y="90,25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="109,25" y="91,175"/>
					<TrackLine>
						<End x="109,65583" y="89,69071"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="110,82953" y="92,75453"/>
					<TrackLine>
						<End x="114,50559" y="92,75453"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="112,52699" y="84,09997"/>
					<TrackLine>
						<End x="114,025" y="84,7"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="Diff_P"/>
				<Subwire width="0,3">
					<Start x="114,025" y="84,7"/>
					<TrackLine>
						<End x="116,06016" y="91,88984"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="110,41305" y="89,45622"/>
					<TrackLine>
						<End x="112,25" y="90,25"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="106,75" y="90"/>
					<TrackLine>
						<End x="106,75" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="106,75" y="90"/>
					<TrackLine>
						<End x="107,35904" y="88,34465"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,5" y="92"/>
					<TrackLine>
						<End x="106,75" y="91"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="113,5" y="102,5"/>
					<TrackArc>
						<Center x="112,71538" y="101,71538"/>
						<End x="112,71538" y="102,825"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="96,6262"/>
					<TrackArc>
						<Center x="103,7702" y="96,6262"/>
						<End x="103,7702" y="96,931"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="101,70397" y="97,2358"/>
					<TrackArc>
						<Center x="102,00877" y="97,2358"/>
						<End x="102,00877" y="96,931"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="102,00877" y="97,693"/>
					<TrackArc>
						<Center x="102,00877" y="97,3882"/>
						<End x="101,70397" y="97,3882"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="106,31021" y="97,693"/>
					<TrackArc>
						<Center x="106,31021" y="97,9978"/>
						<End x="106,61501" y="97,9978"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="106,61501" y="98,1502"/>
					<TrackArc>
						<Center x="106,31021" y="98,1502"/>
						<End x="106,31021" y="98,455"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="98,7598"/>
					<TrackArc>
						<Center x="104,3798" y="98,7598"/>
						<End x="104,3798" y="98,455"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,075" y="96,27604"/>
					<TrackArc>
						<Center x="105,52603" y="96,27604"/>
						<End x="104,5" y="95,25"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="105,2417" y="94,73194"/>
					<TrackArc>
						<Center x="106,3021" y="97,04"/>
						<End x="106,3021" y="94,5"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="104,50605" y="95,24395"/>
					<TrackArc>
						<Center x="106,3021" y="97,04"/>
						<End x="105,2417" y="94,73194"/>
					</TrackArc>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="Diff_N"/>
				<Subwire width="0,3">
					<Start x="110,82953" y="92,75453"/>
					<TrackArc>
						<Center x="110,82953" y="91,175"/>
						<End x="109,25" y="91,175"/>
					</TrackArc>
				</Subwire>
			</Wire>
		</Wires>
		<Coppers>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" fillType="Solid">
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="78,8311" y="107,28293"/>
						<Dot x="86,62482" y="107,7026"/>
						<Dot x="86,62482" y="97,28665"/>
						<Dot x="77,91584" y="97,22117"/>
						<Dot x="77,81864" y="97,24051"/>
						<Dot x="77,73623" y="97,29557"/>
						<Dot x="77,68117" y="97,37797"/>
						<Dot x="77,66184" y="97,47517"/>
						<Dot x="77,66184" y="97,47517"/>
						<Dot x="78,26217" y="106,72026"/>
						<Dot x="78,31523" y="106,93125"/>
						<Dot x="78,43975" y="107,10966"/>
						<Dot x="78,61953" y="107,23221"/>
						<Dot x="78,8311" y="107,28293"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" fillType="Solid">
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="68,8691" y="107,43522"/>
						<Dot x="76,66282" y="107,85489"/>
						<Dot x="76,66282" y="97,43894"/>
						<Dot x="67,95384" y="97,37346"/>
						<Dot x="67,85664" y="97,39279"/>
						<Dot x="67,77423" y="97,44785"/>
						<Dot x="67,71917" y="97,53026"/>
						<Dot x="67,69984" y="97,62746"/>
						<Dot x="67,69984" y="97,62746"/>
						<Dot x="68,30017" y="106,87254"/>
						<Dot x="68,35323" y="107,08354"/>
						<Dot x="68,47775" y="107,26194"/>
						<Dot x="68,65753" y="107,38449"/>
						<Dot x="68,8691" y="107,43522"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" fillType="Solid">
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="77,45331" y="93,65029"/>
						<Dot x="78,70331" y="94,90029"/>
						<Dot x="84,95331" y="94,90029"/>
						<Dot x="86,20331" y="93,65029"/>
						<Dot x="86,20331" y="91,65029"/>
						<Dot x="84,95331" y="90,40029"/>
						<Dot x="83,45331" y="90,40029"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" fillType="Solid">
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="123"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="67,70331" y="94,90029"/>
						<Dot x="68,95331" y="96,15029"/>
						<Dot x="75,20331" y="96,15029"/>
						<Dot x="76,45331" y="94,90029"/>
						<Dot x="76,45331" y="92,90029"/>
						<Dot x="75,20331" y="91,65029"/>
						<Dot x="73,70331" y="91,65029"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" fillType="Solid">
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="77,5" y="87,5"/>
						<Dot x="78,5" y="88,5"/>
						<Dot x="82" y="88,5"/>
						<Dot x="83" y="87,5"/>
						<Dot x="84,75" y="87,5"/>
						<Dot x="85,25" y="87"/>
						<Dot x="85,25" y="85"/>
						<Dot x="84" y="83,75"/>
						<Dot x="81,5" y="83,75"/>
						<Dot x="81" y="84,25"/>
						<Dot x="78,5" y="84,25"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" fillType="Solid">
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="68" y="88"/>
						<Dot x="69" y="89"/>
						<Dot x="72,5" y="89"/>
						<Dot x="73,5" y="88"/>
						<Dot x="75,25" y="88"/>
						<Dot x="75,75" y="87,5"/>
						<Dot x="75,75" y="85,5"/>
						<Dot x="74,5" y="84,25"/>
						<Dot x="72" y="84,25"/>
						<Dot x="71,5" y="84,75"/>
						<Dot x="69" y="84,75"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0.1" lineClr="0.1" minSquare="0.01" fillType="Solid">
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0.2" backoff="0.2"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="76,66282" y="107,76257"/>
						<Dot x="76,66282" y="97,43894"/>
						<Dot x="67,95384" y="97,37346"/>
						<Dot x="67,90331" y="97,37346"/>
						<Dot x="67,80996" y="97,41213"/>
						<Dot x="67,73851" y="97,48358"/>
						<Dot x="67,69984" y="97,57693"/>
						<Dot x="67,69984" y="97,62746"/>
						<Dot x="68,30017" y="106,87254"/>
						<Dot x="68,30733" y="106,98291"/>
						<Dot x="68,39912" y="107,18417"/>
						<Dot x="68,55639" y="107,33972"/>
						<Dot x="68,75866" y="107,42927"/>
						<Dot x="68,8691" y="107,43522"/>
						<Dot x="76,57063" y="107,84992"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0.1" lineClr="0.1" minSquare="0.01" fillType="Solid">
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0.2" backoff="0.2"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="73,5" y="88"/>
						<Dot x="75,25" y="88"/>
						<Dot x="75,75" y="87,5"/>
						<Dot x="75,75" y="85,5"/>
						<Dot x="74,5" y="84,25"/>
						<Dot x="72" y="84,25"/>
						<Dot x="71,5" y="84,75"/>
						<Dot x="69" y="84,75"/>
						<Dot x="68" y="88"/>
						<Dot x="69" y="89"/>
						<Dot x="72,5" y="89"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
			<Copper connectPad="Thermal" lineWidth="0.1" lineClr="0.1" minSquare="0.01" fillType="Solid">
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="No_Net"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0.2" backoff="0.2"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="76,45331" y="94,90029"/>
						<Dot x="76,45331" y="92,90029"/>
						<Dot x="75,20331" y="91,65029"/>
						<Dot x="73,70331" y="91,65029"/>
						<Dot x="67,79669" y="94,84971"/>
						<Dot x="67,7784" y="94,97539"/>
						<Dot x="68,95331" y="96,15029"/>
						<Dot x="75,20331" y="96,15029"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
		</Coppers>
	</Connectivity>
	<DisplayControl version="1.3">
		<Units preference="Metric"/>
		<Colors hilightRate="42" darkRate="0"
		background="#030b10" board="#d4d4d4" netLines="#af7d3a"
		keepoutPlaceBoth="#f79646" keepoutWireAll="#ff0000" keepoutPlaceTop="#259500" keepoutPlaceBot="#00aaaa"
		compsBound="#ffffff" compsName="#ffffff" pinsName="#bad3ef" pinsNet="#bad3ef"
		clrThroughPads="#c0c0c0" clrThroughVias="#949494" clrBurriedVias="#949494" clrBlindVias="#949494" clrFixedVias="#7070b8"
		drcViolation="#ffffff" narrow="#ff00ff" trimmed="#038bef"/>
		<Show
		showBoardOutline="on"
		showWires="on"
		showCoppers="on"
		showTexts="on"
		throughVia="on" burriedVia="on" blindVia="on" fixedVia="on"
		showVias="on"
		showTopMechDetails="on" showBotMechDetails="on"
		showSignalLayers="on" showTopMechLayers="on" showBotMechLayers="on" showDocLayers="on"
		showTopMechDetails="on" showBotMechDetails="on"
		showMetalPads="on" showTopMechPads="on" showBotMechPads="on"
		showNetLines="on" showMountingHoles="on"
		showComponents="on" showCompTop="on" showCompBot="on" showCompsDes="on" showPinsName="on" showPinsNet="on"
		showLabelRefDes="on" showLabelPartName="on" showLabelOther="on"
		showViolations="on" showTrimmed="on" showDRCViolations="on"
		showKeepouts="on" showRouteKeepouts="on"
		showSerpentArea="on"/>
		<Grid gridColor="#f2f2f2" gridKind="Dots">
			<GridSpace x="5000" y="5000"/>
		</Grid>
		<LayersVisualOptions>
			<LayerOptions>
				<LayerRef name="Top Paste"/>
				<Colors details="#808080" pads="#5A5A5A" fix="#404040"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Top Overlay"/>
				<Colors details="#FFFF00" pads="#B3B300" fix="#808000"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Top Solder"/>
				<Colors details="#800080" pads="#5A005A" fix="#400040"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Top Layer"/>
				<Colors details="#FF0000" pads="#B30000" fix="#800000"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Dielectric 1"/>
				<Colors details="#000000" pads="#000000" fix="#000000"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Signal Layer 2"/>
				<Colors details="#70DBFA" pads="#4F9AAF" fix="#386E7D"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Dielectric 3"/>
				<Colors details="#000000" pads="#000000" fix="#000000"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Signal Layer 1"/>
				<Colors details="#BC8E00" pads="#846400" fix="#5E4700"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Dielectric 4"/>
				<Colors details="#000000" pads="#000000" fix="#000000"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Signal Layer 3"/>
				<Colors details="#00CC66" pads="#008F48" fix="#006633"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Dielectric 5"/>
				<Colors details="#000000" pads="#000000" fix="#000000"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Signal Layer 4"/>
				<Colors details="#9966FF" pads="#6C48B3" fix="#4D3380"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Dielectric 2"/>
				<Colors details="#000000" pads="#000000" fix="#000000"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Bottom Layer"/>
				<Colors details="#0000FF" pads="#0000B3" fix="#000080"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Bottom Solder"/>
				<Colors details="#FF00FF" pads="#B300B3" fix="#800080"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Bottom Overlay"/>
				<Colors details="#808000" pads="#5A5A00" fix="#404000"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Bottom Paste"/>
				<Colors details="#800000" pads="#5A0000" fix="#400000"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 1"/>
				<Colors details="#FF00FF" pads="#B300B3" fix="#800080"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 4"/>
				<Colors details="#808000" pads="#5A5A00" fix="#404000"/>
				<Show  details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 13"/>
				<Colors details="#FF00FF" pads="#B300B3" fix="#800080"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 14"/>
				<Colors details="#800080" pads="#5A005A" fix="#400040"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 15"/>
				<Colors details="#008000" pads="#005A00" fix="#004000"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Mechanical 16"/>
				<Colors details="#DA2467" pads="#991A49" fix="#6D1234"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
			<LayerOptions>
				<LayerRef name="Keep-Out Layer"/>
				<Colors details="#FF00FF" pads="#FF00FF" fix="#FF00FF"/>
				<Show visible="on" details="on" pads="on"/>
			</LayerOptions>
		</LayersVisualOptions>
		<ColorNets enabled="on" colorizeWire="on" colorizePad="on" colorizeCopper="on" colorizeVia="on" colorizeNetline="on"/>
	</DisplayControl>
</TopoR_PCB_File>
