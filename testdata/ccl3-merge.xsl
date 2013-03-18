<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ccts="urn:un:unece:uncefact:ccl:draft:xmlforccts:3"
                xmlns:f="http://marchal.com/2013/xsl/functions"
                xmlns:lst="http://marchal.com/2013/file/list"
                xmlns="urn:un:unece:uncefact:ccl:draft:xmlforccts:3"
                exclude-result-prefixes="lst f ccts"
                version="2.0">

   <!-- this stylesheet merges the CCTS CC and CCTS BIE exported from Kevin's CCM Online to create a complete library
        see http://ccm.clouddatatechnologies.com/ for the CCL 3.0 exports
        How to apply? Many options but the easiest is to get oXygen from http://www.oxygenxml.com, create a file
        "files.xml" that specifies in which file is each part of the CCL and then just run the stylesheet             -->

   <!-- Version: March 18, 2013 -->

   <xsl:output method="xml" indent="yes"/>

   <xsl:template match="lst:CoreComponentLibraryFileList">
      <xsl:comment>Generated on <xsl:value-of select="current-dateTime()"/> by ccl3-merge.xsl</xsl:comment><xsl:text>&#xa;</xsl:text>
      <CoreComponentTechnicalSpecificationDefinition>
         <xsl:if test="lst:Output/lst:SchemaLocation">
            <xsl:attribute name="xsi:schemaLocation" select="concat('urn:un:unece:uncefact:ccl:draft:xmlforccts:3 ',lst:Output/lst:SchemaLocation)"/>
         </xsl:if>
         <xsl:apply-templates select="lst:Input/lst:CoreComponentFile"/>
         <xsl:apply-templates select="lst:Input/lst:BusinessInformationEntityFile"/>
         <xsl:apply-templates select="lst:Input/lst:DataTypeFile"/>
      </CoreComponentTechnicalSpecificationDefinition>
   </xsl:template>

   <xsl:template match="lst:CoreComponentFile">
      <xsl:text>&#xa;</xsl:text><xsl:comment>Core Component loaded from: <xsl:value-of select="f:extract-filename(.)"/></xsl:comment><xsl:text>&#xa;</xsl:text>
      <xsl:apply-templates select="f:open-cctsd(.)/ccts:CoreComponent" mode="identity"/>
   </xsl:template>

   <xsl:template match="lst:BusinessInformationEntityFile">
      <xsl:text>&#xa;</xsl:text><xsl:comment>Business Information Entry loaded from: <xsl:value-of select="f:extract-filename(.)"/></xsl:comment><xsl:text>&#xa;</xsl:text>
      <xsl:apply-templates select="f:open-cctsd(.)/ccts:BusinessInformationEntity" mode="identity"/>
   </xsl:template>

   <xsl:template match="lst:DataTypeFile">
      <xsl:text>&#xa;</xsl:text><xsl:comment>Data Type loaded from: <xsl:value-of select="f:extract-filename(.)"/></xsl:comment><xsl:text>&#xa;</xsl:text>
      <xsl:apply-templates select="f:open-cctsd(.)/ccts:DataType" mode="identity"/>
   </xsl:template>

   <!-- identity template -->
   <xsl:template match="@*|node()" mode="identity">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" mode="identity"/>
      </xsl:copy>
   </xsl:template>

   <xsl:function name="f:open-cctsd" as="element ()">
      <xsl:param name="filename"/>
      <xsl:variable name="base-folder" select="$filename/../lst:BaseFolder"/>
      <xsl:variable name="base" select="if (ends-with($base-folder,'/')) then $base-folder else concat($base-folder,'/')"/>
      <xsl:variable name="doc" select="concat($base,$filename)"/>
      <xsl:if test="not(doc-available($doc))"><xsl:message>File <xsl:value-of select="$doc"/> cannot be read (check that there's not a problem with the schema)</xsl:message></xsl:if>
      <xsl:sequence select="if (doc-available($doc)) then doc($doc)/ccts:CoreComponentTechnicalSpecificationDefinition else $filename"/>
   </xsl:function>

   <xsl:function name="f:extract-filename">
      <xsl:param name="path"/>
      <xsl:variable name="tokens" select="tokenize($path,'/')"/>
      <xsl:value-of select="$tokens[position() = last()]"></xsl:value-of>
   </xsl:function>

</xsl:stylesheet>