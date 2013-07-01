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

   <xsl:include href="den.xsl"/>

   <xsl:function name="fn:first-difference" as="xs:integer">
      <xsl:param name="first" as="xs:string"/>
      <xsl:param name="second" as="xs:string"/>
      <xsl:value-of select="fn:first-difference-helper(string-to-codepoints($first), string-to-codepoints($second), 1)"/>
   </xsl:function>

   <xsl:function name="fn:first-difference-helper" as="xs:integer">
      <xsl:param name="first"  as="xs:integer*"/>
      <xsl:param name="second" as="xs:integer*"/>
      <xsl:param name="pos"    as="xs:integer"/>
      <xsl:value-of select="if ($first[1] eq $second[1]) then fn:first-difference-helper(subsequence($first, 2), subsequence($second, 2), $pos + 1) else $pos"/>
   </xsl:function>
</xsl:stylesheet>