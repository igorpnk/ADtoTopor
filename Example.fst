<?xml version="1.0" encoding="UTF-8"?>

<!--**********************************************************************-->
<!--   File    :C:\AD to Topor Script - Video\Script_Project\PCB1.PcbDoc -->
<!--   Format  : TopoR PCB file                                           -->
<!--   Version : 1.1.3                                                    -->
<!--   Program : Altium Designer Script by Wolfit                         -->
<!--   Date    : 10.03.2017                                               -->
<!--   Time    : 13:19:04                                                 -->
<!--**********************************************************************-->

<TopoR_PCB_File>
	<Header>
		<Format>TopoR PCB file</Format>
		<Version>1.1.3</Version>
		<Program>Altium Designer Script by Wolfit</Program>
		<Date>10.03.2017 13:19:04</Date>
		<OriginalFormat>Altium Designer API</OriginalFormat>
		<OriginalFile>C:\AD to Topor Script - Video\Script_Project\PCB1.PcbDoc</OriginalFile>
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
			<Layer name="Keep-Out Layer" type="Doc"/>
		</UnStackLayers>
	</Layers>
	<TextStyles version="1.0">
		<TextStyle name="(Default)" fontName="QUALITY" height="2.5"/>
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
			<Padstack name="r35_170c50" type="SMD" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="0,35" height="1,7">
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
			<Padstack name="c150r90" holeDiameter="0,9" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadCircle diameter="1,5">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</Pads>
			</Padstack>
			<Padstack name="s150h90" holeDiameter="0,9" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadRect width="1,5" height="1,5">
						<LayerTypeRef type="Signal"/>
					</PadRect>
				</Pads>
			</Padstack>
			<Padstack name="c152,4r90" holeDiameter="0,762" type="Through" metallized="on">
				<Thermal/>
				<Pads>
					<PadCircle diameter="1,524">
						<LayerTypeRef type="Signal"/>
					</PadCircle>
				</Pads>
			</Padstack>
		</Padstacks>
		<Viastacks>
			<Viastack name="Via0" holeDiameter="0,7112">
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
			<Viastack name="Via1" holeDiameter="0,7112">
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
			<Viastack name="Via2" holeDiameter="0,7112">
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
		</Viastacks>
		<Footprints>
			<Footprint name="SOT403-1_N$DD5$XOBGHFOH">
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
							<Dot x="-1,77799" y="-2,667"/>
							<Dot x="-1,77799" y="2,54"/>
							<Dot x="1,77801" y="2,54"/>
							<Dot x="1,77801" y="-2,667"/>
						</Polygon>
					</Keepout>
					<Keepout>
						<LayerRef type="Signal" name="Top Layer"/>
						<Polygon>
							<Dot x="-1,016" y="3,937"/>
							<Dot x="0,508" y="3,937"/>
							<Dot x="0,508" y="3,556"/>
							<Dot x="0,508" y="2,921"/>
							<Dot x="0" y="2,794"/>
							<Dot x="-0,381" y="2,794"/>
						</Polygon>
					</Keepout>
				</KeepoutsTrace>
			</Footprint>
			<Footprint name="BAT-2$XP2$QDCDDMQD">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="on">
						<PadstackRef name="c150r90"/>
						<Org x="1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="on">
						<PadstackRef name="c150r90"/>
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
			<Footprint name="BAT-2$XP1$LOJXFODW">
				<Pads>
					<Pad padNum="1" name="1" angle="0" flipped="off">
						<PadstackRef name="s150h90"/>
						<Org x="-1,27" y="0"/>
					</Pad>
					<Pad padNum="2" name="2" angle="0" flipped="off">
						<PadstackRef name="c150r90"/>
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
		</Footprints>
		<Components>
			<Component name="DD5">
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
		</Components>
		<Packages>
			<Package>
				<ComponentRef name="DD5"/>
				<FootprintRef name="SOT403-1_N$DD5$XOBGHFOH"/>
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
		</Packages>
	</LocalLibrary>
	<Constructive version="1.0">
		<BoardOutline>
			<Contour>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="71,70999" y="97,78999"/>
						<Dot x="87,79" y="97,79"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="87,79" y="98,26499"/>
						<Start x="87,79" y="97,79"/>
						<End x="88,26499" y="98,265"/>
					</Arc>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="88,26499" y="98,265"/>
						<Dot x="88,265" y="98,265"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="88,265" y="98,265"/>
						<Dot x="88,265" y="108,235"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="87,91501" y="108,235"/>
						<Start x="88,265" y="108,235"/>
						<End x="87,915" y="108,58499"/>
					</Arc>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="87,915" y="108,58499"/>
						<Dot x="87,915" y="108,585"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="87,915" y="108,585"/>
						<Dot x="72,08499" y="108,58499"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="72,08498" y="107,62001"/>
						<Start x="72,08499" y="108,58499"/>
						<End x="71,12" y="107,61999"/>
					</Arc>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="71,12" y="107,61999"/>
						<Dot x="71,12" y="107,62"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Line>
						<Dot x="71,12" y="107,62"/>
						<Dot x="71,12" y="98,38"/>
					</Line>
				</Shape>
				<Shape lineWidth="0.001">
					<Arc>
						<Center x="71,71" y="98,37999"/>
						<Start x="71,12" y="98,38"/>
						<End x="71,70999" y="97,79"/>
					</Arc>
				</Shape>
			</Contour>
		</BoardOutline>
		<MechLayerObjects>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="88,265" y="97,79"/>
					<Dot x="88,265" y="108,585"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="72,03862" y="108,585"/>
					<Dot x="88,265" y="108,585"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="71,12" y="97,79"/>
					<Dot x="71,12" y="107,66638"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Line>
					<Dot x="71,12" y="97,79"/>
					<Dot x="88,265" y="97,79"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Line>
					<Dot x="87,63" y="104,775"/>
					<Dot x="87,63" y="108,204"/>
				</Line>
			</Detail>
			<Detail lineWidth="0,254">
				<LayerRef type="Doc" name="Keep-Out Layer"/>
				<Arc>
					<Center x="72,03862" y="107,66638"/>
					<Start x="72,03862" y="108,585"/>
					<End x="71,12" y="107,66638"/>
				</Arc>
			</Detail>
			<Detail lineWidth="0,2">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Arc>
					<Center x="74,82582" y="105,26087"/>
					<Start x="73,76516" y="106,32153"/>
					<End x="75,12" y="103,79"/>
				</Arc>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="80" y="98"/>
					<Dot x="80" y="101"/>
					<Dot x="85" y="101"/>
					<Dot x="85" y="98"/>
				</Polygon>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="79,4854" y="106,23457"/>
					<Dot x="79,80402" y="106,5532"/>
					<Dot x="79,80402" y="107,5532"/>
					<Dot x="82,30402" y="107,5532"/>
					<Dot x="82,80402" y="107,05319"/>
					<Dot x="82,80402" y="106,05319"/>
					<Dot x="82,30402" y="106,05319"/>
					<Dot x="81,30402" y="105,0532"/>
					<Dot x="79,74892" y="105,36422"/>
					<Dot x="79,50343" y="105,48807"/>
					<Dot x="79,35648" y="105,72047"/>
					<Dot x="79,34984" y="105,99535"/>
					<Dot x="79,4854" y="106,23457"/>
				</Polygon>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="82,80402" y="107,05319"/>
					<Dot x="82,80402" y="106,05319"/>
					<Dot x="82,30402" y="106,05319"/>
					<Dot x="81,30402" y="105,0532"/>
					<Dot x="79,74892" y="105,36421"/>
					<Dot x="79,68027" y="105,37795"/>
					<Dot x="79,55526" y="105,44101"/>
					<Dot x="79,45159" y="105,53512"/>
					<Dot x="79,37676" y="105,65346"/>
					<Dot x="79,33619" y="105,78747"/>
					<Dot x="79,33281" y="105,92744"/>
					<Dot x="79,36686" y="106,06325"/>
					<Dot x="79,43589" y="106,18507"/>
					<Dot x="79,4854" y="106,23457"/>
					<Dot x="79,4854" y="106,23457"/>
					<Dot x="79,80402" y="106,5532"/>
					<Dot x="79,80402" y="107,5532"/>
					<Dot x="82,30402" y="107,5532"/>
				</Polygon>
			</Detail>
			<Detail lineWidth="0.001">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<Polygon>
					<Dot x="78,7745" y="102,44451"/>
					<Dot x="78,87" y="102,54"/>
					<Dot x="78,87" y="103,54"/>
					<Dot x="78,37" y="104,04"/>
					<Dot x="77,86999" y="103,54"/>
					<Dot x="77,86039" y="103,44245"/>
					<Dot x="77,78573" y="103,26221"/>
					<Dot x="77,64778" y="103,12426"/>
					<Dot x="77,46754" y="103,0496"/>
					<Dot x="77,37" y="103,04"/>
					<Dot x="77,37" y="103,04"/>
					<Dot x="76,87" y="102,54"/>
					<Dot x="77,82729" y="102,2209"/>
					<Dot x="77,9496" y="102,18013"/>
					<Dot x="78,20718" y="102,16854"/>
					<Dot x="78,45813" y="102,22778"/>
					<Dot x="78,68334" y="102,35334"/>
					<Dot x="78,7745" y="102,4445"/>
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
					<Dot x="74,14239" y="107,97778"/>
					<Dot x="74,425" y="106,375"/>
					<Dot x="72,03325" y="105,95327"/>
					<Dot x="71,75064" y="107,55605"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="80,31279" y="100,78755"/>
					<Dot x="79,08643" y="101,00379"/>
					<Dot x="79,42365" y="102,91624"/>
					<Dot x="80,65" y="102,7"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="71,4" y="99,4"/>
					<Dot x="71,9" y="99,9"/>
					<Dot x="72,9" y="99,9"/>
					<Dot x="73,15" y="99,65"/>
					<Dot x="73,15" y="97,9"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Bottom Layer"/>
					</Trace>
				</Role>
				<Polygon>
					<Dot x="81,575" y="105"/>
					<Dot x="81,075" y="105,49999"/>
					<Dot x="80,075" y="105,49999"/>
					<Dot x="79,825" y="105,25"/>
					<Dot x="79,825" y="103,5"/>
				</Polygon>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Line>
					<Dot x="71,75" y="100,95"/>
					<Dot x="71,75" y="104,95"/>
				</Line>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Arc>
					<Center x="79,85" y="99,3"/>
					<Start x="79,1" y="98,8"/>
					<End x="80,65623" y="98,89689"/>
				</Arc>
			</Keepout>
			<Keepout>
				<Role>
					<Trace>
						<LayerRef type="Signal" name="Top Layer"/>
					</Trace>
				</Role>
				<Circle diameter="1,58114">
					<Center x="77,85" y="99"/>
				</Circle>
			</Keepout>
		</Keepouts>
		<Texts>
			<Text text="123" align="LB" angle="0" mirror="off">
				<LayerRef type="Signal" name="Top Layer"/>
				<TextStyleRef name="Arial152,4"/>
				<Org x="74,168" y="98,298"/>
			</Text>
			<Text text="123321" align="LB" angle="0" mirror="off">
				<LayerRef type="Doc" name="Mechanical 1"/>
				<TextStyleRef name="Arial152,4"/>
				<Org x="73,12" y="98,79"/>
			</Text>
		</Texts>
	</Constructive>
	<ComponentsOnBoard version="1.1">
		<Components>
			<CompInstance name="DD5" side="Top" angle="0" fixed="off">
				<ComponentRef name="DD5"/>
				<FootprintRef name="SOT403-1_N$DD5$XOBGHFOH"/>
				<Org x="76" y="102,4"/>
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
				</Pins>
			</CompInstance>
			<CompInstance name="XP2" side="Bottom" angle="180" fixed="off">
				<ComponentRef name="XP2"/>
				<FootprintRef name="BAT-2$XP2$QDCDDMQD"/>
				<Org x="84,201" y="106,553"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="c150r90"/>
						<Org x="1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150r90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
			<CompInstance name="XP1" side="Top" angle="90" fixed="off">
				<ComponentRef name="XP1"/>
				<FootprintRef name="BAT-2$XP1$LOJXFODW"/>
				<Org x="85,217" y="101,727"/>
				<Pins>
					<Pin padNum="1" name="1">
						<PadstackRef name="s150h90"/>
						<Org x="-1,27" y="0"/>
					</Pin>
					<Pin padNum="2" name="2">
						<PadstackRef name="c150r90"/>
						<Org x="1,27" y="0"/>
					</Pin>
				</Pins>
			</CompInstance>
		</Components>
		<FreePads>
			<FreePad side="Top" angle="0" fixed="off">
				<PadstackRef name="c152,4r90"/>
				<NetRef name="321"/>
				<Org x="77,175" y="106,775"/>
			</FreePad>
		</FreePads>
	</ComponentsOnBoard>
	<NetList version="1.0">
		<Net name="321">
			<PinRef compName="DD5" pinName="12"/>
			<PinRef compName="XP1" pinName="2"/>
		</Net>
		<Net name="123">
			<PinRef compName="DD5" pinName="9"/>
			<PinRef compName="XP1" pinName="1"/>
			<PinRef compName="XP2" pinName="2"/>
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
				<LayerRef type="Mechanical" name="Mechanical 13"/>
				<LayerRef type="Mechanical" name="Mechanical 14"/>
				<LayerRef type="Mechanical" name="Mechanical 15"/>
				<LayerRef type="Mechanical" name="Mechanical 16"/>
			</LayerGroup>
	</LayerGroups>
		<NetGroups>
			<NetGroup name="All Nets">
				<NetRef name="321"/>
				<NetRef name="123"/>
			</NetGroup>
		</NetGroups>
		<CompGroups>
			<CompGroup name="Outside Board Components">
			</CompGroup>
			<CompGroup name="Inside Board Components">
				<CompInstanceRef name="DD5"/>
				<CompInstanceRef name="XP2"/>
				<CompInstanceRef name="XP1"/>
			</CompGroup>
			<CompGroup name="Bottom Side Components">
				<CompInstanceRef name="XP2"/>
			</CompGroup>
			<CompGroup name="Top Side Components">
				<CompInstanceRef name="DD5"/>
				<CompInstanceRef name="XP1"/>
			</CompGroup>
			<CompGroup name="All Components">
				<CompInstanceRef name="DD5"/>
				<CompInstanceRef name="XP2"/>
				<CompInstanceRef name="XP1"/>
			</CompGroup>
		</CompGroups>
	</Groups>
	<HiSpeedRules version="2.1">
		<RulesImpedances>
			<ImpedanceDiff name="DiffPairsRouting" Z0="100">
				<LayerRule width="0,381" gap="0,254">
					<LayerRef type="Signal" name="Top Layer"/>
				</LayerRule>
				<LayerRule width="0,381" gap="0,254">
					<LayerRef type="Signal" name="Signal Layer 2"/>
				</LayerRule>
				<LayerRule width="0,381" gap="0,254">
					<LayerRef type="Signal" name="Signal Layer 1"/>
				</LayerRule>
				<LayerRule width="0,381" gap="0,254">
					<LayerRef type="Signal" name="Signal Layer 3"/>
				</LayerRule>
				<LayerRule width="0,381" gap="0,254">
					<LayerRef type="Signal" name="Signal Layer 4"/>
				</LayerRule>
				<LayerRule width="0,381" gap="0,254">
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
			<ClearanceNetToNet enabled="on" clrnMin="0,254" clrnNom="0,762">
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
				<NetRef name="123"/>
				<Org x="80,01" y="106,68"/>
			</Via>
			<Via>
				<ViastackRef name="Via1"/>
				<NetRef name="123"/>
				<Org x="81,915" y="100,341"/>
			</Via>
			<Via>
				<ViastackRef name="Via1"/>
				<NetRef name="123"/>
				<Org x="83,508" y="100,341"/>
			</Via>
			<Via>
				<ViastackRef name="Via2"/>
				<NetRef name="123"/>
				<Org x="81,915" y="103,505"/>
			</Via>
		</Vias>
		<Wires>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="83,508" y="100,341"/>
					<TrackLine>
						<End x="84,467" y="100,341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="84,467" y="100,341"/>
					<TrackLine>
						<End x="84,594" y="100,341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="84,594" y="100,341"/>
					<TrackLine>
						<End x="85,217" y="100,457"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="81,915" y="100,341"/>
					<TrackLine>
						<End x="83,508" y="100,341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="78,85" y="100,125"/>
					<TrackLine>
						<End x="79,525" y="100,125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="79,525" y="100,125"/>
					<TrackLine>
						<End x="79,7942" y="100,125"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="79,7942" y="100,125"/>
					<TrackLine>
						<End x="81,915" y="100,341"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="82,4894" y="101,981"/>
					<TrackLine>
						<End x="85,217" y="102,997"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="81,3406" y="101,981"/>
					<TrackLine>
						<End x="82,4894" y="101,981"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="79,7942" y="102,075"/>
					<TrackLine>
						<End x="81,3406" y="101,981"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Top Layer"/>
				<NetRef name="321"/>
				<Subwire width="0,254">
					<Start x="78,85" y="102,075"/>
					<TrackLine>
						<End x="79,7942" y="102,075"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="80,01" y="106,68"/>
					<TrackLine>
						<End x="81,915" y="103,505"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="80,01" y="106,68"/>
					<TrackLine>
						<End x="81,915" y="103,505"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Signal Layer 2"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="81,915" y="100,341"/>
					<TrackLine>
						<End x="81,915" y="103,505"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="82,804" y="106,68"/>
					<TrackLine>
						<End x="82,931" y="106,553"/>
					</TrackLine>
				</Subwire>
			</Wire>
			<Wire>
				<LayerRef type="Signal" name="Bottom Layer"/>
				<NetRef name="123"/>
				<Subwire width="0,254">
					<Start x="81,915" y="103,505"/>
					<TrackLine>
						<End x="82,931" y="106,553"/>
					</TrackLine>
				</Subwire>
			</Wire>
		</Wires>
		<Coppers>
			<Copper connectPad="Thermal" lineWidth="0,2032" lineClr="0,508" minSquare="0,0127" state="Poured" fillType="Solid">
				<LayerRef type="Signal" name="Signal Layer 1"/>
				<NetRef name="321"/>
				<ThermalPad>
					<Thermal spokeNum="4" spokeWidth="0,254" backoff="0,254"/>
				</ThermalPad>
				<ThermalVia/>
				<Shape>
					<Polygon>
						<Dot x="72,28926" y="107,72476"/>
						<Dot x="88,265" y="108,585"/>
						<Dot x="88,265" y="97,79"/>
						<Dot x="71,374" y="97,663"/>
						<Dot x="71,2768" y="97,68233"/>
						<Dot x="71,19439" y="97,73739"/>
						<Dot x="71,13933" y="97,8198"/>
						<Dot x="71,12" y="97,917"/>
						<Dot x="71,12" y="97,917"/>
						<Dot x="71,72033" y="107,16208"/>
						<Dot x="71,77339" y="107,37308"/>
						<Dot x="71,89792" y="107,55148"/>
						<Dot x="72,07769" y="107,67404"/>
						<Dot x="72,28926" y="107,72476"/>
					</Polygon>
				</Shape>
				<Voids/>
				<Islands/>
			</Copper>
		</Coppers>
	</Connectivity>
	<DisplayControl version="1.3">
		<Units preference="Metric"/>
	</DisplayControl>
</TopoR_PCB_File>