<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
   xmlns:fn="http://marchal.com/2013/ccl3"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:ccts="urn:un:unece:uncefact:ccl:draft:xmlforccts:3"
   exclude-result-prefixes="xs">

   <!-- Copyright 2013, Benoît Marchal (http://marchal.com) and Nicolas Duperret. This work is licensed under the Creative Commons BY-SA license 3.0. -->
   <!-- To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/                                                          -->
   <!--Latest version of this file resides at: http://github.com/psol/ccl3                                                                            -->

   <xsl:function name="fn:qualify-term" as="xs:string">
      <xsl:param name="qualifier"/>
      <xsl:param name="term"/>
      <xsl:choose>
         <xsl:when test="empty($term)">     <xsl:value-of select="''"/></xsl:when>
         <xsl:when test="empty($qualifier)"><xsl:value-of select="$term"/></xsl:when>
         <xsl:otherwise>                    <xsl:value-of select="string-join(($qualifier, $term), '_ ')"/></xsl:otherwise>
      </xsl:choose>
   </xsl:function>

   <xsl:function name="fn:format-den" as="xs:string">
      <xsl:param name="instance" as="element()"/>
      <xsl:variable name="format" as="xs:string">
         <xsl:apply-templates select="$instance" mode="format-den"/>
      </xsl:variable>
      <xsl:choose>
         <!-- make a true empty string if it returns just spaces and dots -->
         <xsl:when test="matches($format, '^[\p{Z}\.]*$')"><xsl:text/></xsl:when>
         <xsl:otherwise><xsl:value-of select="$format"/></xsl:otherwise>
      </xsl:choose>
   </xsl:function>

   <xsl:template match="ccts:AggregateCoreComponent" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:ObjectClassTermQualifier, ccts:ObjectClassTerm), ccts:PropertyTermQualifier, 'Details')" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:BasicCoreComponent" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:ObjectClassTermQualifier, ccts:ObjectClassTerm), fn:qualify-term(ccts:PropertyTermQualifier, ccts:PropertyTerm), ccts:RepresentationTerm)" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:AssociationCoreComponent" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:ObjectClassTermQualifier, ccts:ObjectClassTerm), fn:qualify-term(ccts:PropertyTermQualifier, ccts:PropertyTerm), fn:qualify-term(ccts:AssociatedObjectClassTermQualifier, ccts:AssociatedObjectClassTerm))" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:BasicCoreComponentProperty" mode="format-den" as="xs:string">
      <xsl:value-of select="(ccts:BasicCoreComponentProperty, ccts:PropertyTerm, ccts:RepresentationTerm)" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:AssociationCoreComponentProperty" mode="format-den" as="xs:string">
      <xsl:value-of select="(ccts:PropertyTerm, ccts:AssociatedObjectClassTerm)" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:DataType/ccts:CoreDataType" mode="format-den" as="xs:string">
      <xsl:value-of select="(ccts:DataTypeTerm, ccts:DataTypeTermQualifier, 'Type')" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:CoreDataTypeContentComponent" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:DataTypeTermQualifier, ccts:DataTypeTerm), ccts:PropertyTerm)" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:CoreDataTypeSupplementaryComponent" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:DataTypeTermQualifier, ccts:DataTypeTerm), ccts:PropertyTerm, ccts:RepresentationTerm)" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:AggregateBusinessInformationEntity" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:ObjectClassTermQualifier, ccts:ObjectClassTerm), ccts:PropertyTermQualifier, 'Details')" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:BasicBusinessInformationEntity" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:ObjectClassTermQualifier, ccts:ObjectClassTerm), fn:qualify-term(ccts:PropertyTermQualifier, ccts:PropertyTerm), ccts:RepresentationTerm)" separator=". "/>
   </xsl:template>

   <xsl:template match="ccts:AssociationBusinessInformationEntity" mode="format-den" as="xs:string">
      <xsl:value-of select="(fn:qualify-term(ccts:ObjectClassTermQualifier, ccts:ObjectClassTerm), fn:qualify-term(ccts:PropertyTermQualifier, ccts:PropertyTerm), fn:qualify-term(ccts:AssociatedObjectClassTermQualifier, ccts:AssociatedObjectClassTerm))" separator=". "/>
   </xsl:template>
</xsl:stylesheet>