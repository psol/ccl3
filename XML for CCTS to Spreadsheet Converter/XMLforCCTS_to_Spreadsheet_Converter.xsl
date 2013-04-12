<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:xfc="urn:un:unece:uncefact:ccl:draft:xmlforccts:3">

<!--
Copyright 2013, Cloud Data Technologies Limited http://www.clouddatatech.com.
This work is licensed under the Creative Commons BY-SA license 3.0.
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/
Latest version of this file resides at: http://github.com/psol/ccl3/
-->

<xsl:output method="xml" version="1.0" indent="yes"/>

<xsl:template match="/">
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
	 xmlns:o="urn:schemas-microsoft-com:office:office"
	 xmlns:x="urn:schemas-microsoft-com:office:excel"
	 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
	 xmlns:html="http://www.w3.org/TR/REC-html40">
	 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>Unknown</Author>
		<LastAuthor>Unknown</LastAuthor>
		<LastPrinted>2013-01-01T00:00:00Z</LastPrinted>
		<Created>2013-01-01T00:00:00Z</Created>
		<LastSaved>2013-01-01T00:00:00Z</LastSaved>
		<Company>Unknown</Company>
		<Version>12.00</Version>
	 </DocumentProperties>
	 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowHeight>18000</WindowHeight>
		<WindowWidth>28000</WindowWidth>
		<WindowTopX>-15</WindowTopX>
		<WindowTopY>-15</WindowTopY>
		<TabRatio>458</TabRatio>
		<ProtectStructure>False</ProtectStructure>
		<ProtectWindows>False</ProtectWindows>
	 </ExcelWorkbook>
	 <Styles>
	  <Style ss:ID="Default">
	   <Alignment ss:Vertical="Bottom"/>
	   <Borders/>
	   <Font ss:FontName="Arial"/>
	   <Interior/>
	   <NumberFormat/>
	   <Protection/>
	  </Style>
	  <Style ss:ID="Heading">
	   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Color="#FFFFFF"  ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Color="#FFFFFF"  ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Color="#FFFFFF"  ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Color="#FFFFFF"  ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#FFFFFF" ss:Bold="1"/>
	   <Interior ss:Color="#000000" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="AllBorders">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="BCC">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="BCCProperty">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="ASCCProperty">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="BBIEProperty">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="ASBIEProperty">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="UsageRule">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="NotUsed">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#969696" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="ASCC">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#99CCFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="ACC">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000" ss:Bold="1"/>
	   <Interior ss:Color="#00CCFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="ABIE">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000" ss:Bold="1"/>
	   <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="BBIE">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="Mandatory">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#FF0000" ss:Bold="1"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="ASBIE">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#000000"/>
	   <Interior ss:Color="#66CC00" ss:Pattern="Solid"/>
	  </Style>
	  <Style ss:ID="Definition">
	   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
	   <Borders>
		<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
		<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
	   </Borders>
	   <Font ss:FontName="Arial" x:Family="Swiss"/>
	   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
	  </Style>
	 </Styles>
	 <Worksheet ss:Name="CC">
	  <Table>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
		<Row ss:Height="40">
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Unique ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Version ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Type</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Dictionary Entry Name</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Definition</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Working comments and instructions</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Publication comments</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Object Class Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Representation Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">BCC Property ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Core Value Domain ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Associated Object Class</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">ASCC Property ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Term(s)</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Usage Rule(s)</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Sequence Number</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Occurrence Min</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Occurrence Max</Data></Cell>
		</Row>
		<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:CoreComponent/xfc:AggregateCoreComponent"/>
	  </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
		<Layout x:Orientation="Landscape"/>
		<Header x:Margin="0.51181102362204722"/>
		<Footer x:Margin="0.51181102362204722"/>
		<PageMargins x:Bottom="0.98425196850393704" x:Left="0.78740157480314965"
		 x:Right="0.78740157480314965" x:Top="0.98425196850393704"/>
	   </PageSetup>
	   <FitToPage/>
	   <Print>
		<ValidPrinterInfo/>
		<PaperSizeIndex>9</PaperSizeIndex>
		<Scale>44</Scale>
		<HorizontalResolution>1200</HorizontalResolution>
		<VerticalResolution>1200</VerticalResolution>
	   </Print>
	   <Zoom>100</Zoom>
	   <Selected/>
	   <DoNotDisplayGridlines/>
	   <FreezePanes/>
	   <FrozenNoSplit/>
	   <SplitHorizontal>1</SplitHorizontal>
	   <TopRowBottomPane>1</TopRowBottomPane>
	   <ActivePane>2</ActivePane>
	   <Panes>
		<Pane>
		 <Number>3</Number>
		</Pane>
		<Pane>
		 <Number>2</Number>
		 <ActiveRow>0</ActiveRow>
		</Pane>
	   </Panes>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>
	 </Worksheet>
	 <Worksheet ss:Name="BCC Properties">
	  <Table>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
		<Row ss:Height="40">
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Unique ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Version ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Dictionary Entry Name</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Definition</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Working comments and instructions</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Publication comments</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Representation Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Term(s)</Data></Cell>
		</Row>
		<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:CoreComponent/xfc:BasicCoreComponentProperty"/>
	  </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
		<Layout x:Orientation="Landscape"/>
		<Header x:Margin="0.51181102362204722"/>
		<Footer x:Margin="0.51181102362204722"/>
		<PageMargins x:Bottom="0.98425196850393704" x:Left="0.78740157480314965"
		 x:Right="0.78740157480314965" x:Top="0.98425196850393704"/>
	   </PageSetup>
	   <FitToPage/>
	   <Print>
		<ValidPrinterInfo/>
		<PaperSizeIndex>9</PaperSizeIndex>
		<Scale>44</Scale>
		<HorizontalResolution>1200</HorizontalResolution>
		<VerticalResolution>1200</VerticalResolution>
	   </Print>
	   <Zoom>100</Zoom>
	   <Selected/>
	   <DoNotDisplayGridlines/>
	   <FreezePanes/>
	   <FrozenNoSplit/>
	   <SplitHorizontal>1</SplitHorizontal>
	   <TopRowBottomPane>1</TopRowBottomPane>
	   <ActivePane>2</ActivePane>
	   <Panes>
		<Pane>
		 <Number>3</Number>
		</Pane>
		<Pane>
		 <Number>2</Number>
		 <ActiveRow>0</ActiveRow>
		</Pane>
	   </Panes>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>
	 </Worksheet>
	 <Worksheet ss:Name="ASCC Properties">
	  <Table>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
		<Row ss:Height="40">
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Unique ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Version ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Dictionary Entry Name</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Definition</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Working comments and instructions</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Publication comments</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Associated Object Class Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Term(s)</Data></Cell>
		</Row>
		<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:CoreComponent/xfc:AssociationCoreComponentProperty"/>
	  </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
		<Layout x:Orientation="Landscape"/>
		<Header x:Margin="0.51181102362204722"/>
		<Footer x:Margin="0.51181102362204722"/>
		<PageMargins x:Bottom="0.98425196850393704" x:Left="0.78740157480314965"
		 x:Right="0.78740157480314965" x:Top="0.98425196850393704"/>
	   </PageSetup>
	   <FitToPage/>
	   <Print>
		<ValidPrinterInfo/>
		<PaperSizeIndex>9</PaperSizeIndex>
		<Scale>44</Scale>
		<HorizontalResolution>1200</HorizontalResolution>
		<VerticalResolution>1200</VerticalResolution>
	   </Print>
	   <Zoom>100</Zoom>
	   <Selected/>
	   <DoNotDisplayGridlines/>
	   <FreezePanes/>
	   <FrozenNoSplit/>
	   <SplitHorizontal>1</SplitHorizontal>
	   <TopRowBottomPane>1</TopRowBottomPane>
	   <ActivePane>2</ActivePane>
	   <Panes>
		<Pane>
		 <Number>3</Number>
		</Pane>
		<Pane>
		 <Number>2</Number>
		 <ActiveRow>0</ActiveRow>
		</Pane>
	   </Panes>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>
	 </Worksheet>
	 <Worksheet ss:Name="BIE">
	  <Table>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="60"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
		<Row ss:Height="40">
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Unique ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Version ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Type</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Dictionary Entry Name</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Definition</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Working comments and instructions</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Publication comments</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Object Class Term Qualifiers</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Object Class Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term Qualifiers</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Representation Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">BBIE Property ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Value Domain ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Associated Object Class Term Qualifiers</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Associated Object Class</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">ASBIE Property ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Term(s)</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Usage Rule(s)</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Sequence Number</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Occurrence Min</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Occurrence Max</Data></Cell>
		</Row>
		<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:BusinessInformationEntity/xfc:Package/xfc:AggregateBusinessInformationEntity"/>
	  </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
		<Layout x:Orientation="Landscape"/>
		<Header x:Margin="0.51181102362204722"/>
		<Footer x:Margin="0.51181102362204722"/>
		<PageMargins x:Bottom="0.98425196850393704" x:Left="0.78740157480314965"
		 x:Right="0.78740157480314965" x:Top="0.98425196850393704"/>
	   </PageSetup>
	   <FitToPage/>
	   <Print>
		<ValidPrinterInfo/>
		<PaperSizeIndex>9</PaperSizeIndex>
		<Scale>44</Scale>
		<HorizontalResolution>1200</HorizontalResolution>
		<VerticalResolution>1200</VerticalResolution>
	   </Print>
	   <Zoom>100</Zoom>
	   <Selected/>
	   <DoNotDisplayGridlines/>
	   <FreezePanes/>
	   <FrozenNoSplit/>
	   <SplitHorizontal>1</SplitHorizontal>
	   <TopRowBottomPane>1</TopRowBottomPane>
	   <ActivePane>2</ActivePane>
	   <Panes>
		<Pane>
		 <Number>3</Number>
		</Pane>
		<Pane>
		 <Number>2</Number>
		 <ActiveRow>0</ActiveRow>
		</Pane>
	   </Panes>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>
	 </Worksheet>
	 <Worksheet ss:Name="BBIE Properties">
	  <Table>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
		<Row ss:Height="40">
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Unique ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Version ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Dictionary Entry Name</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Definition</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Working comments and instructions</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Publication comments</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term Qualifiers</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Representation Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Term(s)</Data></Cell>
		</Row>
		<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:BusinessInformationEntity/xfc:BusinessProperty/xfc:BasicBusinessInformationEntityProperty"/>
	  </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
		<Layout x:Orientation="Landscape"/>
		<Header x:Margin="0.51181102362204722"/>
		<Footer x:Margin="0.51181102362204722"/>
		<PageMargins x:Bottom="0.98425196850393704" x:Left="0.78740157480314965"
		 x:Right="0.78740157480314965" x:Top="0.98425196850393704"/>
	   </PageSetup>
	   <FitToPage/>
	   <Print>
		<ValidPrinterInfo/>
		<PaperSizeIndex>9</PaperSizeIndex>
		<Scale>44</Scale>
		<HorizontalResolution>1200</HorizontalResolution>
		<VerticalResolution>1200</VerticalResolution>
	   </Print>
	   <Zoom>100</Zoom>
	   <Selected/>
	   <DoNotDisplayGridlines/>
	   <FreezePanes/>
	   <FrozenNoSplit/>
	   <SplitHorizontal>1</SplitHorizontal>
	   <TopRowBottomPane>1</TopRowBottomPane>
	   <ActivePane>2</ActivePane>
	   <Panes>
		<Pane>
		 <Number>3</Number>
		</Pane>
		<Pane>
		 <Number>2</Number>
		 <ActiveRow>0</ActiveRow>
		</Pane>
	   </Panes>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>
	 </Worksheet>
	 <Worksheet ss:Name="ASBIE Properties">
	  <Table>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="300"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="90"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="150"/>
	   <Column ss:StyleID="Default" ss:AutoFitWidth="0" ss:Width="210"/>
		<Row ss:Height="40">
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Unique ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Version ID</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Dictionary Entry Name</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Definition</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Working comments and instructions</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Publication comments</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term Qualifiers</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Property Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Associated Object Class Term Qualifiers</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Associated Object Class Term</Data></Cell>
			<Cell ss:StyleID="Heading"><Data ss:Type="String">Business Term(s)</Data></Cell>
		</Row>
		<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:BusinessInformationEntity/xfc:BusinessProperty/xfc:AssociationBusinessInformationEntityProperty"/>
	  </Table>
	  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
	   <PageSetup>
		<Layout x:Orientation="Landscape"/>
		<Header x:Margin="0.51181102362204722"/>
		<Footer x:Margin="0.51181102362204722"/>
		<PageMargins x:Bottom="0.98425196850393704" x:Left="0.78740157480314965"
		 x:Right="0.78740157480314965" x:Top="0.98425196850393704"/>
	   </PageSetup>
	   <FitToPage/>
	   <Print>
		<ValidPrinterInfo/>
		<PaperSizeIndex>9</PaperSizeIndex>
		<Scale>44</Scale>
		<HorizontalResolution>1200</HorizontalResolution>
		<VerticalResolution>1200</VerticalResolution>
	   </Print>
	   <Zoom>100</Zoom>
	   <Selected/>
	   <DoNotDisplayGridlines/>
	   <FreezePanes/>
	   <FrozenNoSplit/>
	   <SplitHorizontal>1</SplitHorizontal>
	   <TopRowBottomPane>1</TopRowBottomPane>
	   <ActivePane>2</ActivePane>
	   <Panes>
		<Pane>
		 <Number>3</Number>
		</Pane>
		<Pane>
		 <Number>2</Number>
		 <ActiveRow>0</ActiveRow>
		</Pane>
	   </Panes>
	   <ProtectObjects>False</ProtectObjects>
	   <ProtectScenarios>False</ProtectScenarios>
	  </WorksheetOptions>
	 </Worksheet>
	<Worksheet ss:Name="UsageRules">
			<Table>
				<Column ss:Width="210"/>
				<Column ss:Width="350"/>
				<Column ss:Width="90"/>
				<Column ss:Width="90"/>
				<Column ss:Width="210"/>
				<Column ss:Width="210"/>
				<Row>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Unique ID</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Constraint</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Constraint Type Code</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Condition Type (pre, post, or invariant)</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Name</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Business Terms</Data>
					</Cell>
				</Row>
				<Row ss:Height="51">
					<Cell ss:StyleID="Heading"/>
					<Cell ss:StyleID="Heading"/>
					<Cell ss:StyleID="Heading"><Data ss:Type="String">UNS, OCL, SBVR, XSRE, ECL, CHIP, CAT, BON, NCL, PERL, SCR</Data></Cell>
					<Cell ss:StyleID="Heading"><Data ss:Type="String">PRE, POST, INV</Data></Cell>
					<Cell ss:StyleID="Heading"/>
					<Cell ss:StyleID="Heading"/>
				</Row>
				<xsl:apply-templates select="/xfc:CoreComponentTechnicalSpecificationDefinition/xfc:UsageRule"/>
			</Table>
			<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
				<PageSetup>
					<Header x:Margin="0.3"/>
					<Footer x:Margin="0.3"/>
					<PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
				</PageSetup>
				<FreezePanes/>
			   <FrozenNoSplit/>
			   <SplitHorizontal>2</SplitHorizontal>
			   <TopRowBottomPane>2</TopRowBottomPane>
			   <ActivePane>2</ActivePane>
			   <Panes>
				<Pane>
				 <Number>3</Number>
				</Pane>
				<Pane>
				 <Number>2</Number>
				 <ActiveRow>0</ActiveRow>
				</Pane>
			   </Panes>
				<ProtectObjects>False</ProtectObjects>
				<ProtectScenarios>False</ProtectScenarios>
			</WorksheetOptions>
		</Worksheet>
	<Worksheet ss:Name="ConstraintTypeCode">
		<Table>
			<Column ss:Index="2" ss:AutoFitWidth="0" ss:Width="155.25"/>
			<Column ss:AutoFitWidth="0" ss:Width="292.5"/>
			<Row>
				<Cell ss:StyleID="Heading">
					<Data ss:Type="String">Code</Data>
				</Cell>
				<Cell ss:StyleID="Heading">
					<Data ss:Type="String">Name</Data>
				</Cell>
				<Cell ss:StyleID="Heading">
					<Data ss:Type="String">Description</Data>
				</Cell>
			</Row>
			<Row ss:Height="38.25">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">UNS</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Unstructured</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">An unstructured constraint is expressed in plain text without any formalism other than the grammar of the language in which it is expressed</Data>
				</Cell>
			</Row>
			<Row ss:Height="38.25">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">OCL</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">OCL</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">The Object Constraint Language is a declarative language for describing rules that apply to Unified Modeling Language (UML) models</Data>
				</Cell>
			</Row>
			<Row ss:Height="51">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">SBVR</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Semantics of Business Vocabulary and Business Rules</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">The Semantics of Business Vocabulary and Business Rules (SBVR) is a formal and detailed natural language declarative description of a complex entity that is an integral part of the OMG Model Driven Architecture (MDA)</Data>
				</Cell>
			</Row>
			<Row ss:Height="38.25">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">XSRE</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">XML Schema Regular Expression</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">XML Schema Regular Expression is used to formally define the pattern facet in a W3C XML Schema Definition Language Schema</Data>
				</Cell>
			</Row>
			<Row ss:Height="25.5">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">ECL</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Eclipse</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">The Eclipse language is a constraint logic programming system that implements an open source programming language</Data>
				</Cell>
			</Row>
			<Row ss:Height="25.5">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">CHIP</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Constraint Handling in Prolog</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">The Constraint Handling in Prolog (CHIP) language is used to tell an object what to do</Data>
				</Cell>
			</Row>
			<Row ss:Height="38.25">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">CAT</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Catalysis</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">Catalysis is an approach for the systematic business-driven development of component-based systems based on the Unified Modeling Language</Data>
				</Cell>
			</Row>
			<Row ss:Height="25.5">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">BON</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Business Object Notation</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">Business Object Notation is a method and graphical notation for high-level object oriented analysis and design</Data>
				</Cell>
			</Row>
			<Row ss:Height="25.5">
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">NCL</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Natural Constraint Language</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">The Natural Constraint Language is a description language with mathematical logic as syntax</Data>
				</Cell>
			</Row>
			<Row>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">PERL</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Perl</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">Scripting program language</Data>
				</Cell>
			</Row>
			<Row>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">SCR</Data>
				</Cell>
				<Cell ss:StyleID="AllBorders">
					<Data ss:Type="String">Schematron</Data>
				</Cell>
				<Cell ss:StyleID="Definition">
					<Data ss:Type="String">XML Schematron</Data>
				</Cell>
			</Row>
		</Table>
		<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
			<PageSetup>
				<Header x:Margin="0.3"/>
				<Footer x:Margin="0.3"/>
				<PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
			</PageSetup>
			<Print>
				<ValidPrinterInfo/>
				<PaperSizeIndex>9</PaperSizeIndex>
				<HorizontalResolution>600</HorizontalResolution>
				<VerticalResolution>600</VerticalResolution>
			</Print>
			<FreezePanes/>
			   <FrozenNoSplit/>
			   <SplitHorizontal>1</SplitHorizontal>
			   <TopRowBottomPane>1</TopRowBottomPane>
			   <ActivePane>2</ActivePane>
			   <Panes>
				<Pane>
				 <Number>3</Number>
				</Pane>
				<Pane>
				 <Number>2</Number>
				 <ActiveRow>0</ActiveRow>
				</Pane>
			   </Panes>
			<ProtectObjects>False</ProtectObjects>
			<ProtectScenarios>False</ProtectScenarios>
		</WorksheetOptions>
	</Worksheet>
	<Worksheet ss:Name="ConditionTypeCode">
			<Table>
				<Column ss:Index="2" ss:AutoFitWidth="0" ss:Width="71.25"/>
				<Column ss:AutoFitWidth="0" ss:Width="301.5"/>
				<Row>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Code</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Name</Data>
					</Cell>
					<Cell ss:StyleID="Heading">
						<Data ss:Type="String">Description</Data>
					</Cell>
				</Row>
				<Row ss:Height="25.5">
					<Cell ss:StyleID="AllBorders">
						<Data ss:Type="String">PRE</Data>
					</Cell>
					<Cell ss:StyleID="AllBorders">
						<Data ss:Type="String">Precondition</Data>
					</Cell>
					<Cell ss:StyleID="Definition">
						<Data ss:Type="String">A precondition to an operation is a restriction that must be true at the moment that the operation is going to be executed</Data>
					</Cell>
				</Row>
				<Row ss:Height="25.5">
					<Cell ss:StyleID="AllBorders">
						<Data ss:Type="String">POST</Data>
					</Cell>
					<Cell ss:StyleID="AllBorders">
						<Data ss:Type="String">Postcondition</Data>
					</Cell>
					<Cell ss:StyleID="Definition">
						<Data ss:Type="String">A postcondition to an operation is a restriction that must be true at the moment that the operation has just ended its execution</Data>
					</Cell>
				</Row>
				<Row ss:Height="51">
					<Cell ss:StyleID="AllBorders">
						<Data ss:Type="String">INV</Data>
					</Cell>
					<Cell ss:StyleID="AllBorders">
						<Data ss:Type="String">Invariant</Data>
					</Cell>
					<Cell ss:StyleID="Definition">
						<Data ss:Type="String">An invariant is a constraint that states a condition that must always be met by all instances of the class, type, or interface. An invariant is described using an expression that evaluates to true if the invariant is met. Invariants must be true all the time. </Data>
					</Cell>
				</Row>
			</Table>
			<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
				<PageSetup>
					<Header x:Margin="0.3"/>
					<Footer x:Margin="0.3"/>
					<PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
				</PageSetup>
				<FreezePanes/>
			   <FrozenNoSplit/>
			   <SplitHorizontal>1</SplitHorizontal>
			   <TopRowBottomPane>1</TopRowBottomPane>
			   <ActivePane>2</ActivePane>
			   <Panes>
				<Pane>
				 <Number>3</Number>
				</Pane>
				<Pane>
				 <Number>2</Number>
				 <ActiveRow>0</ActiveRow>
				</Pane>
			   </Panes>
				<ProtectObjects>False</ProtectObjects>
				<ProtectScenarios>False</ProtectScenarios>
			</WorksheetOptions>
		</Worksheet>
	</Workbook>

</xsl:template>

<xsl:template match="xfc:AggregateCoreComponent">
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="usageRuleIDs">
		<xsl:for-each select="xfc:UsageRuleID">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="xfc:VersionID"/></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String">ACC</Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="xfc:ObjectClassTerm"/></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
    <Cell ss:StyleID="ACC"><Data ss:Type="String"><xsl:value-of select="substring($usageRuleIDs,1,string-length($usageRuleIDs)-2)"/></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
   </Row>
   <xsl:apply-templates/>
</xsl:template>

<xsl:template match="xfc:BasicCoreComponent">
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="usageRuleIDs">
		<xsl:for-each select="xfc:UsageRuleID">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String">BCC</Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:ObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:RepresentationTerm"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:BasicCoreComponentPropertyUID"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:CoreValueDomainUID"/></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="substring($usageRuleIDs,1,string-length($usageRuleIDs)-2)"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:SequencingKeyOrdinal"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MinimumOccurenceValue"/></Data></Cell>
		<Cell ss:StyleID="BCC"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MaximumOccurenceValue"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:BasicCoreComponentProperty">
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:VersionID"/></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:RepresentationTerm"/></Data></Cell>
		<Cell ss:StyleID="BCCProperty"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:AssociationCoreComponent">
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="usageRuleIDs">
		<xsl:for-each select="xfc:UsageRuleID">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String">ASCC</Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:ObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:AssociatedObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:AssociationCoreComponentPropertyUID"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="substring($usageRuleIDs,1,string-length($usageRuleIDs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:SequencingKeyOrdinal"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MinimumOccurenceValue"/></Data></Cell>
		<Cell ss:StyleID="ASCC"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MaximumOccurenceValue"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:AssociationCoreComponentProperty">
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:VersionID"/></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="xfc:AssociatedObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="ASCCProperty"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:AggregateBusinessInformationEntity">
	<xsl:variable name="octqs">
		<xsl:for-each select="xfc:ObjectClassTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="usageRuleIDs">
		<xsl:for-each select="xfc:UsageRuleID">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="xfc:VersionID"/></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String">ABIE</Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="substring($octqs,1,string-length($octqs)-2)"/></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="xfc:ObjectClassTerm"/></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
    <Cell ss:StyleID="ABIE"><Data ss:Type="String"><xsl:value-of select="substring($usageRuleIDs,1,string-length($usageRuleIDs)-2)"/></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
   </Row>
   <xsl:apply-templates/>
</xsl:template>

<xsl:template match="xfc:BasicBusinessInformationEntity">
	<xsl:variable name="octqs">
		<xsl:for-each select="xfc:ObjectClassTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="ptqs">
		<xsl:for-each select="xfc:PropertyTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="usageRuleIDs">
		<xsl:for-each select="xfc:UsageRuleID">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String">BBIE</Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="substring($octqs,1,string-length($octqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:ObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="substring($ptqs,1,string-length($ptqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:RepresentationTerm"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:BasicBusinessInformationEntityPropertyUID"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:BusinessValueDomainUID"/></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="substring($usageRuleIDs,1,string-length($usageRuleIDs)-2)"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:SequencingKeyOrdinal"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MinimumOccurenceValue"/></Data></Cell>
		<Cell ss:StyleID="BBIE"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MaximumOccurenceValue"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:AssociationBusinessInformationEntity">
	<xsl:variable name="octqs">
		<xsl:for-each select="xfc:ObjectClassTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="ptqs">
		<xsl:for-each select="xfc:PropertyTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="aoctqs">
		<xsl:for-each select="xfc:AssociatedObjectClassTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="usageRuleIDs">
		<xsl:for-each select="xfc:UsageRuleID">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String">ASBIE</Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="substring($octqs,1,string-length($octqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:ObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="substring($ptqs,1,string-length($ptqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="NotUsed"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="substring($aoctqs,1,string-length($aoctqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:AssociatedObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:AssociationBusinessInformationEntityPropertyUID"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="substring($usageRuleIDs,1,string-length($usageRuleIDs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:SequencingKeyOrdinal"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MinimumOccurenceValue"/></Data></Cell>
		<Cell ss:StyleID="ASBIE"><Data ss:Type="String"><xsl:value-of select="xfc:Cardinality/xfc:MaximumOccurenceValue"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:BasicBusinessInformationEntityProperty">
	<xsl:variable name="ptqs">
		<xsl:for-each select="xfc:PropertyTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:VersionID"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="substring($ptqs,1,string-length($ptqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:RepresentationTerm"/></Data></Cell>
		<Cell ss:StyleID="BBIEProperty"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:AssociationBusinessInformationEntityProperty">
	<xsl:variable name="ptqs">
		<xsl:for-each select="xfc:PropertyTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="aoctqs">
		<xsl:for-each select="xfc:AssociatedObjectClassTermQualifier">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:VersionID"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:DictionaryEntryName"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:Definition"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="substring($ptqs,1,string-length($ptqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:PropertyTerm"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="substring($aoctqs,1,string-length($aoctqs)-2)"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="xfc:AssociatedObjectClassTerm"/></Data></Cell>
		<Cell ss:StyleID="ASBIEProperty"><Data ss:Type="String"><xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/></Data></Cell>
   </Row>
</xsl:template>

<xsl:template match="xfc:UsageRule">
	<xsl:variable name="businessTerms">
		<xsl:for-each select="xfc:IdentificationMetadata/xfc:BusinessTerm">
			<xsl:value-of select="concat(.,', ')"/>
		</xsl:for-each>
	</xsl:variable>
	<Row ss:Height="38.25">
		<Cell ss:StyleID="UsageRule"><Data ss:Type="String"><xsl:value-of select="xfc:UniqueID"/></Data></Cell>
		<Cell ss:StyleID="UsageRule"><Data ss:Type="String"><xsl:value-of select="xfc:Constraint"/></Data></Cell>
		<Cell ss:StyleID="UsageRule"><Data ss:Type="String"><xsl:value-of select="xfc:ConstraintType"/></Data></Cell>
		<Cell ss:StyleID="UsageRule"><Data ss:Type="String"><xsl:value-of select="xfc:ConditionType"/></Data></Cell>
		<Cell ss:StyleID="UsageRule"><Data ss:Type="String"><xsl:value-of select="xfc:IdentificationMetadata/xfc:Name"/></Data></Cell>
		<Cell ss:StyleID="UsageRule"><Data ss:Type="String">
			<xsl:value-of select="substring($businessTerms,1,string-length($businessTerms)-2)"/>
		</Data></Cell>
   </Row>
</xsl:template>

</xsl:stylesheet>