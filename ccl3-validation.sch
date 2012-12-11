<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" queryBinding="xslt2">
   <sch:title>CCTS 3.0 Validation Rules</sch:title>
   <sch:p>Version: December 11, 2012</sch:p>
   <sch:p>Based on validation rules compiled by Chris et Mary Kay on December 7, 2012.</sch:p>
   <sch:p>Based on XML4CCTS ODP6 from March 7, 2011 at http://www1.unece.org/cefact/platform/download/attachments/45023344/Specification_XMLForCCTS_Version+1+0+ODP6_20110218.docx</sch:p>
   <sch:ns prefix="ccts" uri="urn:un:unece:uncefact:ccl:draft:xmlforccts:3"/>

   <sch:pattern>
      <sch:title>Dictionary Entry Name and Terms Coherence</sch:title>
      <sch:rule context="ccts:AggregateCoreComponent [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:ObjectClassTerm, '. Details')">(0009-0026) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="every $acc in preceding-sibling::ccts:AggregateCoreComponent satisfies $acc/ccts:DictionaryEntryName != ccts:DictionaryEntryName">(0002-000D-0011) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:BasicCoreComponent [string-length(ccts:DictionaryEntryName) gt 0] | ccts:AssociationCoreComponent [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:let name="typing" value="if (self::ccts:BasicCoreComponent) then ccts:RepresentationTerm else ccts:AssociatedObjectClassTerm"/>
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:ObjectClassTerm, '. ', ccts:PropertyTerm, '. ', $typing)">(0009-002C-002F-0030) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="ccts:ObjectClassTerm = parent::ccts:AggregateCoreComponent/ccts:ObjectClassTerm">Object Class Term shall be coherent</sch:assert>
         <sch:assert test="every $o in preceding-sibling::ccts:BasicCoreComponent | preceding-sibling::ccts:AssociationCoreComponent satisfies $o/ccts:DictionaryEntryName != ccts:DictionaryEntryName">(0002-000D-0027) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:AssociationCoreComponentProperty [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:PropertyTerm, '. ', ccts:AssociatedObjectClassTerm)">(0009-002E) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="every $asccp in preceding-sibling::ccts:AssociationCoreComponentProperty satisfies ($asccp/ccts:PropertyTerm != ccts:PropertyTerm) or ($asccp/ccts:AssociatedObjectClassTerm != ccts:AssociatedObjectClassTerm)">(0002-000D) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:BasicCoreComponentProperty [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:PropertyTerm, '. ', ccts:RepresentationTerm)">(0009-002E) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="every $bccp in preceding-sibling::ccts:BasicCoreComponentProperty satisfies ($bccp/ccts:PropertyTerm != ccts:PropertyTerm) or ($bccp/ccts:RepresentationTerm != ccts:RepresentationTerm)">(0002-000D) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:DataType/ccts:CoreDataType [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:DataTypeTerm, '. Type')">(0009) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="every $ct in preceding-sibling::ccts:CoreDataType[parent::DataType] satisfies $ct/ccts:DataTypeTerm != ccts:DataTypeTerm">(0002-000D) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:CoreDataTypeContentComponent [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:DataTypeTerm, '. ', ccts:PropertyTerm)">(0009) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="ccts:DataTypeTerm = parent::ccts:CoreDataType/ccts:DataTypeTerm">Data Type Term shall be coherent</sch:assert>
         <sch:assert test="every $ctc in preceding-sibling::ccts:CoreDataTypeContentComponent satisfies $ctc/ccts:PropertyTerm != ccts:PropertyTerm">(0002-000D) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:CoreDataTypeSupplementaryComponent [string-length(ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:DictionaryEntryName = concat (ccts:DataTypeTerm, '. ', ccts:PropertyTerm, '. ', ccts:RepresentationTerm)">(0009) Dictionary Entry Name components shall be separated by dots</sch:assert>
         <sch:assert test="ccts:DataTypeTerm = parent::ccts:CoreDataType/ccts:DataTypeTerm">Data Type Term shall be coherent</sch:assert>
         <sch:assert test="every $ctsc in preceding-sibling::ccts:CoreDataTypeSupplementaryComponent satisfies ($ctsc/ccts:PropertyTerm != ccts:PropertyTerm) or ($ctsc/ccts:RepresentationTerm = ccts:RepresentationTerm)">(0002-000D) Dictionary Entry Name shall be unique</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Dictionary Entry Name</sch:title>
      <sch:rule context="ccts:DictionaryEntryName">
         <sch:let name="words" value="tokenize (., '[\. ]+')"/>
         <sch:assert test="string-length (.) gt 0">Dictionary Entry Name shall not be empty</sch:assert>
         <sch:assert test="every $i in 1 to (count($words) - 1) satisfies $words[$i] != $words[$i + 1]">(0004) Dictionary Entry Name shall not include consecutive identical words or terms</sch:assert>
         <!-- FIXME: which character set (ASCII, Latin 1 or Unicode?), hyphen allowed, character set: ASCII, do we allow - as well? --> 
         <sch:assert test="matches (., '^[\p{L}\p{Zs}\.\-]*$')">(0006) Dictionary Entry Name shall only use alphabetic characters, the dot and space</sch:assert>
         <sch:assert test="every $word in $words satisfies matches ($word, '^\p{Lu}.*$')">(000B) Each word in a Dictionary Entry Name shall start with a capital letter.</sch:assert>
         <sch:assert test="not (matches (., '\.[\p{L}\-]'))">(000C) The dots in the Dictionary Entry Names shall be followed by a space</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Dictionary Entry Name and Definition</sch:title>
      <!-- I ignore the Details, Type or representation term from the definition to implement this rule --> 
      <sch:rule context="ccts:AggregateCoreComponent | ccts:BasicCoreComponent | ccts:AssociationCoreComponent | ccts:AssociationCoreComponentProperty | ccts:DataType/ccts:CoreDataType | ccts:CoreDataTypeContentComponent | ccts:CoreDataTypeSupplementaryComponent">
         <sch:let name="big-name" value="concat (ccts:ObjectClassTerm, ' ', ccts:PropertyTerm, ' ', ccts:AssociatedObjectClassTerm, ' ', ccts:AssociatedObjectClassTerm, ' ', ccts:DataTypeTerm)"/>
         <sch:let name="words" value="tokenize ($big-name, '[ ]+')"/>
         <sch:assert test="(every $word in $words satisfies matches(ccts:Definition, $word,'i')) or (string-length(ccts:DictionaryEntryName) eq 0)">(0003) Dictionary Entry Name shall be extracted from the object definition</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Uniqueness</sch:title>
      <!-- I choose the most efficient implementation (but also the one that is hardest to track), because I expect this will be a very few violations -->
      <sch:rule context="ccts:CoreComponentTechnicalSpecificationDefinition">
         <sch:let name="definitions" value="//ccts:Definition[string-length (.) gt 0]"/>
         <sch:assert test="count($definitions) = count (distinct-values($definitions))">(000E) There are <sch:value-of select="count($definitions) - count (distinct-values($definitions))"/> duplicate definitions (the Schematron has another, less efficient, rule that you can uncomment to help pinpoint this error)</sch:assert>
         <sch:let name="uids" value="//ccts:UniqueID"/>
         <sch:assert test="count ($uids) = count (distinct-values($uids))">(0023) There are <sch:value-of select="count ($uids) - count (distinct-values($uids))"/> duplicate object IDs</sch:assert>
         <sch:let name="versionids" value="//ccts:VersionID"/>
         <sch:assert test="count ($versionids) = count (distinct-values($versionids))">(0024) There are <sch:value-of select="count ($versionids) - count (distinct-values($versionids))"/> duplicate version IDs</sch:assert>
      </sch:rule>
      <!-- uncomment the following rule if you need to pinpoint the duplicate definition violation -->
      <!--
      <sch:rule context="ccts:Definition [string-length (.) gt 0]">
         <sch:assert test="every $definition in preceding::ccts:Definition satisfies $definition != .">(000E) Each object shall have its own unique definition</sch:assert>
      </sch:rule>
      -->
   </sch:pattern>

   <sch:pattern>
      <sch:title>Object Completeness</sch:title>
      <sch:rule context="ccts:AggregateCoreComponent | ccts:BasicCoreComponent | ccts:AssociationCoreComponent | ccts:AssociationCoreComponentProperty | ccts:BasicCoreComponentProperty | ccts:DataType/ccts:CoreDataType | ccts:CoreDataTypeContentComponent | ccts:CoreDataTypeSupplementaryComponent">
         <sch:assert test="((child::ccts:UniqueID) and (child::ccts:VersionID)) or (string-length(ccts:DictionaryEntryName) eq 0)">(0023-0024) Each object shall have unique ID and version ID</sch:assert>
         <sch:assert test="((child::ccts:DictionaryEntryName) and (child::ccts:Definition)) or (string-length(ccts:DictionaryEntryName) eq 0)">(0027) Each object shall have a common information class</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Definition Validation Rules</sch:title>
      <sch:rule context="ccts:Definition [string-length(.) gt 0]">
         <sch:let name="sentences" value="tokenize (., '\.')"/>
         <!-- http://strainindex.wordpress.com/2008/07/28/the-average-sentence-length/ -->
         <sch:assert test="every $sentence in $sentences satisfies count (tokenize ($sentence, '\p{Zs}')) lt 22" role="warning">(0010) Sentences in definition shall be short.</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Cardinality</sch:title>
      <sch:rule context="ccts:BasicCoreComponent | ccts:AssociationCoreComponent">
         <sch:assert test="(child::ccts:Cardinality/ccts:MinimumOccurenceValue and child::ccts:Cardinality/ccts:MaximumOccurenceValue) or (string-length(ccts:DictionaryEntryName) eq 0)">(0029) Object shall have a cardinality</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:Cardinality">
         <!-- FIXME: replace with the shorthand eq... -->
         <sch:let name="max" value="number (ccts:MaximumOccurenceValue)"/>
         <sch:assert test="number (ccts:MinimumOccurenceValue) >= 0">//------// (002A) Occurence minimum shall be zero or a positive integer</sch:assert>
         <sch:assert test="ccts:MaximumOccurenceValue = 'unbounded' or number (ccts:MaximumOccurenceValue) >= 0">//------// (002A) Occurence maximum shall be zero or a positive integer or 'unbounded'</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Sequency Key</sch:title>
      <sch:rule context="ccts:BasicCoreComponent | ccts:AssociationCoreComponent">
         <sch:assert test="(child::ccts:SequencingKeyOrdinal and (ccts:SequencingKeyOrdinal castable as xs:integer)) or not (string-length (ccts:DictionaryEntryName) gt 0)">(002B) CCs and AsCCs need a unique sequencing key</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:AggregateCoreComponent [string-length (ccts:DictionaryEntryName) gt 0]">
         <sch:let name="keys" value="ccts:BasicCoreComponent/ccts:SequencingKeyOrdinal | ccts:AssociationCoreComponent/ccts:SequencingKeyOrdinal"/>
         <sch:assert test="count ($keys) = count (distinct-values ($keys))">(002B) Sequencing key shall be unique in an ACC</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>AsCC Property</sch:title>
      <sch:rule context="ccts:AssociationCoreComponent">
         <sch:assert test="child::ccts:AssociationCoreComponentPropertyUID">(002D) An AsCC Property shall be defined for each AsCC</sch:assert>
         <sch:let name="uid" value="ccts:AssociationCoreComponentPropertyUID"/>
         <sch:let name="property" value="../../ccts:AssociationCoreComponentProperty [ccts:UniqueID = $uid]"/>
         <sch:assert test="count ($property) = 1">(002D) An AsCC Property shall be defined for each AsCC</sch:assert>
         <sch:assert test="$property/ccts:PropertyTerm = ccts:PropertyTerm" role="warning">AsCC Property Term shall be coherent with its property</sch:assert>
         <sch:assert test="$property/ccts:AssociatedObjectClassTerm = ccts:AssociatedObjectClassTerm" role="warning">AsCC Associated Object Class Term shall be coherent with its property</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>BCC Property</sch:title>
      <sch:rule context="ccts:BasicCoreComponent">
         <sch:assert test="child::ccts:BasicCoreComponentPropertyUID">(0031) A BCC Property shall be defined for each BCC</sch:assert>
         <sch:assert test="child::ccts:CoreDataTypeUID">(0032) A BCC Property shall only use an approved CDT</sch:assert>
         <sch:assert test="child::ccts:RepresentationTerm">(0033) A representation term shall be defined for each BCC</sch:assert>
         <sch:let name="puid" value="ccts:BasicCoreComponentPropertyUID"/>
         <sch:let name="property" value="../../ccts:BasicCoreComponentProperty [ccts:UniqueID = $puid]"/>
         <sch:assert test="count ($property) eq 1">(002D) A BCC Property shall be defined for each BCC</sch:assert>
         <sch:assert test="$property/ccts:PropertyTerm = ccts:PropertyTerm" role="warning">A BCC Property Term shall be coherent with its property</sch:assert>
         <sch:assert test="$property/ccts:RepresentationTerm = ccts:RepresentationTerm" role="warning">A BCC Representation Term shall be coherent with its property</sch:assert>
         <sch:let name="duid" value="ccts:CoreDataTypeUID"/>
         <sch:let name="dt" value="../../../ccts:DataType/ccts:CoreDataType [ccts:UniqueID = $duid]"/>
         <sch:assert test="count ($dt) eq 1">(0032) A BCC Property shall only use an approved CDT</sch:assert>
         <sch:assert test="$dt/ccts:DictionaryEntryName = ccts:CoreDataType" role="warning">A BCC Property Core Data Type shall be coherent with its datatype</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Not implemented yet</sch:title>
      <sch:rule context="ccts:CoreComponentTechnicalSpecificationDefinition" role="warning">
         <sch:report test="//ccts:UsageRule">Validation of Usage Rule is not implemented yet</sch:report>
         <sch:report test="//ccts:LocalizedMetadata">Validation of Localized Metadata is not implemented yet</sch:report>
         <sch:report test="/ccts:CoreComponentTechnicalSpecificationDefinition/ccts:CoreComponent/ccts:AggregateCoreComponent/ccts:AssociationCoreComponent [number (ccts:Cardinality/ccts:MinimumOccurenceValue) gt 0]">(0028) Loop detection on ASCC not properly implemented yet but infinte loop may occur</sch:report>
      </sch:rule>
   </sch:pattern>

   <!-- there's a more efficient version of rule 0002:
           count(//ccts:DictionaryEntryName) = count(distinct-values(//ccts:DictionaryEntryName))
        but it reports the violation but not where it occured so it's not very helpful
        the version I have used here compares item by item but limits the comparisons to children of the same parent
        (since there are other assertions to make sure that the parent names are properly reported in the DEN,
        and the parents themselves are guaranteed unique, it effectively guarantee unicity) -->
   <!-- we could assert many of these rules much more efficiently if they were rewritten
        with an understanding of the structure of the CCL -->

</sch:schema>