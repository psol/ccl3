<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" queryBinding="xslt2">
   <sch:title>CCTS 3.0 Validation Rules</sch:title>
   <sch:p>Copyright 2012, Benoît Marchal http://marchal.com. This work is licensed under the Creative Commons BY-SA license 3.0.</sch:p>
   <sch:p>To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/</sch:p>
   <sch:p>Latest version of this file resides at: http://github.com/psol/ccl3</sch:p>
   <sch:p>Based on validation rules compiled by Chris Hassler et Mary Kay Blantz on December 7, 2012.</sch:p>
   <sch:p>Based on XML4CCTS ODP6 from March 7, 2011 at http://www1.unece.org/cefact/platform/download/attachments/45023344/Specification_XMLForCCTS_Version+1+0+ODP6_20110218.docx</sch:p>
   <sch:p>How to apply? Many options but the easiest is to get oXygen from http://www.oxygenxml.com then choose Document|Validation|Validate with...</sch:p>
   <sch:p>Version: April 16, 2013 (17:57)</sch:p>

   <sch:ns prefix="ccts" uri="urn:un:unece:uncefact:ccl:draft:xmlforccts:3"/>

   <sch:pattern abstract="true" id="den">
      <sch:title>Dictionary Entry Name</sch:title>
      <sch:p>Rules: S043-S002-S00D-S027-S004-S00B-S006-S00C-S034-S009-S043-S03B-S003-S03E, S05E-S062, S067, S06C, S070, S074, S077, S078, S0979</sch:p>

      <sch:rule context="$object [ccts:DictionaryEntryName/text()]">
         <sch:assert test="if (exists ($class)) then string-length ($class) gt 0 else true ()"><sch:name/> shall have a <sch:value-of select="name ($class)"/></sch:assert>

         <sch:let name="regex1" value="if (string-length ($context) eq 0 and string-length($propQualifier) eq 0 and string-length($typQualifier) eq 0) then '^[a-zA-Z \.\-]*$' else '^[a-zA-Z_ \.\-]*$'"/>
         <sch:assert test="matches (ccts:DictionaryEntryName, $regex1,'i')">Dictionary Entry Name shall only use English/ASCII alphabetic characters, the dot, space (and hyphen by exception)<sch:value-of select="ccts:DictionaryEntryName"/></sch:assert>
         <sch:report test="matches (ccts:DictionaryEntryName, '\-')" role="warning">Dictionary Entry Name shall limit the use of hyphen</sch:report>
         <!-- DEN can have 2, 3 or 4 components (including the context) -->
         <!-- this tests which components are needed and whether they are available -->
         <!-- context is handled differently because it is optional, so even when a context is given as a parameter
              it may be empty... in which you don't insert the separator
              fortunately string-length(), through the automatic casting, allows us to test for both cases -->
         <sch:let name="contunder" value="if (string-length ($context) eq 0) then '' else concat ($context, '_ ')"/>
                 
         <sch:let name="cldot" value="if (empty ($class))      then '' else concat (string-join(($clasQualifier, $class),  '_ '), '. ')"/>
         <sch:let name="propdot" value="if (empty ($property)) then '' else if (empty ($type)) then string-join(($propQualifier, $property),  '_ ') else concat (string-join(($propQualifier, $property),  '_ '), '. ')"/>
         <sch:let name="typdot" value="if (empty ($type))      then '' else string-join(($typQualifier, $type),  '_ ')"/>
         
         <sch:let name="target" value="concat ($cldot, $propdot, $typdot)"/>
         <!-- <sch:let name="target" value="concat ($contunder, $cldot, $propdot, $type)"/> -->
         
         <sch:assert test="ccts:DictionaryEntryName = $target">DEN shall be <sch:value-of select="$target"/> instead of <sch:value-of select="ccts:DictionaryEntryName"/>(<sch:value-of select="count($propQualifier)"/>)(<sch:value-of select="$propQualifier"/>)</sch:assert>

         <sch:assert test="every $o in $like satisfies not ($o/ccts:DictionaryEntryName) or ($o/ccts:DictionaryEntryName ne ccts:DictionaryEntryName)">Dictionary Entry Name shall be unique</sch:assert>
         <sch:let name="words" value="tokenize (ccts:DictionaryEntryName, '[\. ]+')"/>
         <sch:assert test="every $i in 1 to (count($words) - 1) satisfies $words[$i] != $words[$i + 1]">Dictionary Entry Name shall not include consecutive identical words or terms</sch:assert>

         <sch:assert test="every $word in $words satisfies matches ($word, '^\p{Lu}.*$')">Each word in a Dictionary Entry Name shall start with a capital letter.</sch:assert>

         <!-- mostly this should have been controlled by the above rules on DEN formation but you can never ignore the fact that, say, an object class would contain a dot -->
         <sch:assert test="not (matches (ccts:DictionaryEntryName, '\.[\p{L}\-_]'))" >The dots in the Dictionary Entry Names shall be followed by a space</sch:assert>

         <!--
         <sch:let name="big-name" value="if ($type instance of xs:string) then concat ($class, ' ', $property) else concat ($class, ' ', $property, ' ', $type)"/>
         <sch:let name="small-words" value="tokenize ($big-name, '[ ]+')"/>
         <sch:assert test="every $word in $small-words satisfies matches (ccts:Definition, $word,'i')">Dictionary Entry Name shall be extracted from the object definition</sch:assert>
         -->
      </sch:rule>

      <sch:rule context="$object">
         <!-- catch-all for validation when the DEN is missing -->
         <sch:assert test="ccts:DictionaryEntryName/text()">Dictionary Entry Name is required for <sch:name/></sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern is-a="den" id="acc-den">
      <sch:param name="object"   value="ccts:AggregateCoreComponent"/>
      <sch:param name="class"    value="ccts:ObjectClassTerm"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="()"/>
      <sch:param name="clasQualifier" value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="propQualifier" value="ccts:PropertyTermQualifier"/>
      <sch:param name="type"     value="'Details'"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:AggregateCoreComponent"/>
   </sch:pattern>
   
   <sch:pattern is-a="den" id="bcc-den">
      <sch:param name="object"   value="ccts:BasicCoreComponent"/>
      <sch:param name="class"    value="ccts:ObjectClassTerm"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="propQualifier" value="ccts:PropertyTermQualifier"/>
      <sch:param name="type"     value="ccts:RepresentationTerm"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:BasicCoreComponent | preceding-sibling::ccts:AssociationCoreComponent"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="ascc-den">
      <sch:param name="object"   value="ccts:AssociationCoreComponent"/>
      <sch:param name="class"    value="ccts:ObjectClassTerm"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="propQualifier" value="ccts:PropertyTermQualifier"/>
      <sch:param name="type"              value="ccts:AssociatedObjectClassTerm"/>
      <sch:param name="typQualifier"      value="ccts:AssociatedObjectClassTermQualifier"/>
      <sch:param name="like"     value="preceding-sibling::ccts:BasicCoreComponent | preceding-sibling::ccts:AssociationCoreComponent"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="bccp-den">
      <sch:param name="object"   value="ccts:BasicCoreComponentProperty"/>
      <sch:param name="class"    value="()"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="()"/>
      <sch:param name="propQualifier" value="()"/>
      <sch:param name="type"     value="ccts:RepresentationTerm"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:BasicCoreComponentProperty"/>
   </sch:pattern>
   
   <sch:pattern is-a="den" id="asccp-den">
      <sch:param name="object"   value="ccts:AssociationCoreComponentProperty"/>
      <sch:param name="class"    value="()"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="()"/>
      <sch:param name="propQualifier" value="()"/>
      <sch:param name="type"              value="ccts:AssociatedObjectClassTerm"/>
      <sch:param name="typQualifier"      value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:AssociationCoreComponentProperty"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="cdt-den">
      <sch:param name="object"   value="ccts:DataType/ccts:CoreDataType"/>
      <sch:param name="class"    value="ccts:DataTypeTerm"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="()"/>
      <sch:param name="clasQualifier" value="ccts:DataTypeTermQualifier"/>
      <sch:param name="propQualifier" value="()"/>
      <sch:param name="type"              value="'Type'"/>
      <sch:param name="typQualifier"      value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:CoreDataType[parent::DataType]"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="cdtc-den">
      <sch:param name="object"   value="ccts:CoreDataTypeContentComponent"/>
      <sch:param name="class"    value="ccts:DataTypeTerm"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="ccts:DataTypeTermQualifier"/>
      <sch:param name="propQualifier" value="()"/>
      <sch:param name="type"     value="()"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:CoreDataTypeContentComponent"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="cdts-den">
      <sch:param name="object"   value="ccts:CoreDataTypeSupplementaryComponent"/>
      <sch:param name="class"    value="ccts:DataTypeTerm"/>
      <sch:param name="context"  value="()"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="ccts:DataTypeTermQualifier"/>
      <sch:param name="propQualifier" value="()"/>
      <sch:param name="type"     value="ccts:RepresentationTerm"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:CoreDataTypeSupplementaryComponent"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="abie-den">
      <sch:param name="object"   value="ccts:AggregateBusinessInformationEntity"/>
      <sch:param name="class"    value="ccts:ObjectClassTerm"/>
      <sch:param name="context"  value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="property" value="()"/>
      <sch:param name="clasQualifier" value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="propQualifier" value="ccts:PropertyTermQualifier"/>
      <sch:param name="type"     value="'Details'"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:AggregateBusinessInformationEntity"/>
   </sch:pattern>

   <sch:pattern is-a="den" id="bbie-den">
      <sch:param name="object"   value="ccts:BasicBusinessInformationEntity"/>
      <sch:param name="class"    value="ccts:ObjectClassTerm"/>
      <sch:param name="context"  value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="propQualifier" value="ccts:PropertyTermQualifier"/>
      <sch:param name="type"     value="ccts:RepresentationTerm"/>
      <sch:param name="typQualifier"     value="()"/>
      <sch:param name="like"     value="preceding-sibling::ccts:BasicBusinessInformationEntity"/>
   </sch:pattern>
   
   <sch:pattern is-a="den" id="asbie-den">
      <sch:param name="object"   value="ccts:AssociationBusinessInformationEntity"/>
      <sch:param name="class"    value="ccts:ObjectClassTerm"/>
      <sch:param name="context"  value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="property" value="ccts:PropertyTerm"/>
      <sch:param name="clasQualifier" value="ccts:ObjectClassTermQualifier"/>
      <sch:param name="propQualifier" value="ccts:PropertyTermQualifier"/>
      <sch:param name="type"              value="ccts:AssociatedObjectClassTerm"/>
      <sch:param name="typQualifier"      value="ccts:AssociatedObjectClassTermQualifier"/>
      <sch:param name="like"     value="preceding-sibling::ccts:BasicBusinessInformationEntity | preceding-sibling::ccts:AssociationBusinessInformationEntity"/>
   </sch:pattern>

   <sch:pattern abstract="true" id="parent-child">
      <sch:title>Coherence of classes/types between parents and children</sch:title>
      <sch:p>Rules: S03B</sch:p>
      <sch:rule context="$object [ccts:DictionaryEntryName/text()]">
         <sch:assert test="$class = $parentclass"><sch:value-of select="name ($class)"/> shall be <sch:value-of select="$parentclass"/></sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern is-a="parent-child" id="bcc-pc">
      <sch:param name="object" value="ccts:BasicCoreComponent"/>
      <sch:param name="class" value="ccts:ObjectClassTerm"/>
      <sch:param name="parentclass" value="parent::ccts:AggregateCoreComponent/ccts:ObjectClassTerm"/>
   </sch:pattern>

   <sch:pattern is-a="parent-child" id="bbie-pc">
      <sch:param name="object" value="ccts:BasicBusinessInformationEntity"/>
      <sch:param name="class" value="ccts:ObjectClassTerm"/>
      <sch:param name="parentclass" value="parent::ccts:AggregateBusinessInformationEntity/ccts:ObjectClassTerm"/>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Classes and Terms Coherence</sch:title>
      <sch:rule context="ccts:BasicCoreComponent [ccts:DictionaryEntryName/text()] | ccts:AssociationCoreComponent [ccts:DictionaryEntryName/text()]">
         <sch:assert test="ccts:ObjectClassTerm = parent::ccts:AggregateCoreComponent/ccts:ObjectClassTerm">Object Class Term shall be <sch:value-of select="parent::ccts:AggregateCoreComponent/ccts:ObjectClassTerm"/></sch:assert>
      </sch:rule>
      <sch:rule context="ccts:CoreDataTypeContentComponent [ccts:DictionaryEntryName/text()] | ccts:CoreDataTypeSupplementaryComponent [ccts:DictionaryEntryName/text()]">
         <sch:assert test="ccts:DataTypeTerm = parent::ccts:CoreDataType/ccts:DataTypeTerm">Data Type Term shall be <sch:value-of select="parent::ccts:CoreDataType/ccts:DataTypeTerm"/></sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:title>Based on</sch:title>
      <sch:p>S05C, S05E, S062, S066, S06D-S06E</sch:p>
      <sch:let name="cc" value="/ccts:CoreComponentTechnicalSpecificationDefinition/ccts:CoreComponent"/>
      <sch:rule context="ccts:AggregateBusinessInformationEntity">
         <sch:let name="acc-uid" value="ccts:BasedOnAggregateCoreComponentUID"/>
         <sch:let name="basis-acc" value="$cc/ccts:AggregateCoreComponent[ccts:UniqueID = $acc-uid]"/>
         <sch:assert test="ccts:BasedOnAggregateCoreComponentUID and count ($basis-acc) eq 1">An ABIE shall be based on an ACC.</sch:assert>
         <sch:assert test="ccts:ObjectClassTerm = $basis-acc/ccts:ObjectClassTerm">The object class term should have been <sch:value-of select="$basis-acc/ccts:ObjectClassTerm"/>.</sch:assert>
         <!-- this is a very limited implementation of rule S05E, but see properties-based-on abstract pattern as well -->
         <!-- TODO -->
      </sch:rule>
      <sch:rule context="ccts:AggregateBusinessInformationEntity/ccts:BasicBusinessInformationEntity">
         <sch:let name="den" value="concat(ccts:ObjectClassTerm, '. ', ccts:PropertyTerm, '. ', ccts:RepresentationTerm)"/>
         <sch:assert test="$cc/ccts:AggregateCoreComponent/ccts:BasicCoreComponent[ccts:DictionaryEntryName = $den]">
            An ABIE shall be a restriction of its parent ACC or ABIE.
         </sch:assert>
         
 
      
      </sch:rule>
      <!-- FIXME: following is a quick cut/paste from above, deleted one rule... need to turn these 2 patterns in an abstract pattern and create test data for BBIE -->
      <sch:rule context="ccts:BasicBusinessInformationEntity">
         <sch:let name="bcc-den" value="ccts:DictionaryEntryName"/>
         <sch:let name="bcc-den2" value="concat(ccts:ObjectClassTerm, '. ', ccts:PropertyTerm, '. ', ccts:RepresentationTerm)"/>
         <sch:let name="bcc-uid" value="ccts:BasedOnBasicCoreComponentUID"/>
         <sch:let name="basis-bcc" value="$cc/ccts:AggregateCoreComponent/ccts:BasicCoreComponent[ccts:DictionaryEntryName = $bcc-den2]"/>
         <!--<sch:let name="basis-bcc" value="$cc/ccts:BasicCoreComponent[ccts:UniqueID = $bcc-uid]"/>-->
         <sch:assert test="count ($basis-bcc) eq 1">An BBIE shall be based on an BCC.</sch:assert>
         <!--<sch:assert test="ccts:BasedOnBasicCoreComponentUID and count ($basis-bcc) eq 1">An BBIE shall be based on an BCC.</sch:assert>-->
         <sch:assert test="ccts:ObjectClassTerm = $basis-bcc/ccts:ObjectClassTerm">The object class term should have been <sch:value-of select="$basis-bcc/ccts:ObjectClassTerm"/>.</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern abstract="true" id="properties-based-on">
      <sch:p>S05D, S065, S069, S06B, S06E, S072-S073</sch:p>
      <sch:rule context="$pproperty">
         <sch:let name="local-den" value="$concatden"/>
         <sch:let name="acc-uid" value="parent::ccts:AggregateBusinessInformationEntity/ccts:BasedOnAggregateCoreComponentUID"/>
         <sch:let name="basis-uid" value="$based-on-uid"/>
         
         <sch:let name="basis-property" value="/ccts:CoreComponentTechnicalSpecificationDefinition/ccts:CoreComponent/ccts:AggregateCoreComponent/$based-on-property[ccts:DictionaryEntryName = $local-den]"/>
         <sch:assert test="count ($basis-property) eq 1">The ABIE properties shall be based on the ACC properties.</sch:assert>
         
         <sch:let name="min-basis" value="$basis-property/ccts:Cardinality/ccts:MinimumOccurenceValue"/>
         <sch:let name="max-basis" value="$basis-property/ccts:Cardinality/ccts:MaximumOccurenceValue"/>
         <sch:assert test="number (ccts:Cardinality/ccts:MinimumOccurenceValue) ge number ($min-basis)">The BIE or AsBIE minimal cardinality shall never be an extension of the BCC or AsCC it is based on <sch:value-of select="count ($basis-property)"/>-<sch:value-of select="$min-basis"/>_<sch:value-of select="ccts:Cardinality/ccts:MinimumOccurenceValue"/></sch:assert>
         <sch:assert test="$max-basis = 'unbounded' or number (ccts:Cardinality/ccts:MaximumOccurenceValue) le number ($max-basis)">The BIE or AsBIE maximal cardinality shall never be an extension of the BCC or AsCC it is based on <sch:value-of select="count ($basis-property)"/>-<sch:value-of select="$max-basis"/>_<sch:value-of select="ccts:Cardinality/ccts:MaximumOccurenceValue"/></sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern is-a="properties-based-on" id="bbie-property">
      <sch:param name="pproperty"            value="ccts:BasicBusinessInformationEntity"/>
      <sch:param name="based-on-property"    value="ccts:BasicCoreComponent"/>
      <sch:param name="based-on-uid"         value="ccts:BasedOnBasicCoreComponentUID"/>
      <sch:param name="acc-property-uid"     value="ccts:BasicCoreComponentPropertyUID"/>
      <sch:param name="denwithqualifiers"    value="ccts:DictionaryEntryName"/>
      <sch:param name="concatden"            value="concat(ccts:ObjectClassTerm, '. ', ccts:PropertyTerm, '. ', ccts:RepresentationTerm)"/>
   </sch:pattern>

   <sch:pattern is-a="properties-based-on" id="asbie-property">
      <sch:param name="pproperty"            value="ccts:AssociationBusinessInformationEntity"/>
      <sch:param name="based-on-property"    value="ccts:AssociationCoreComponent"/>
      <sch:param name="based-on-uid"         value="ccts:BasedOnAssociatedCoreComponentUID"/>
      <sch:param name="acc-property-uid"     value="ccts:AssociationCoreComponentPropertyUID"/>
      <sch:param name="denwithqualifiers"    value="ccts:DictionaryEntryName"/>
      <sch:param name="concatden"            value="concat(ccts:ObjectClassTerm, '. ', ccts:PropertyTerm, '. ', ccts:AssociatedObjectClassTerm)"/>
   </sch:pattern>

   <sch:pattern abstract="true" id="definition-based-on">
      <sch:title>Definition based on</sch:title>
      <sch:p>S063, S075</sch:p>
      <!-- need separate patterns to based-on because a pattern only applies the first rule -->
      <sch:rule context="$xbie [count (ccts:ObjectClassTermQualifier) le 0 and count(ccts:PropertyTermQualifier) le 0]">
         <sch:let name="cc-den" value="$concatden"/>
         <sch:let name="cc-uid" value="ccts:BasedOnAggregateCoreComponentUID"/>
         <sch:let name="based-on-definition" value="/ccts:CoreComponentTechnicalSpecificationDefinition/ccts:CoreComponent/$xcc[ccts:DictionaryEntryName = $cc-den]/ccts:Definition"/>
         <!--<sch:let name="based-on-definition" value="/ccts:CoreComponentTechnicalSpecificationDefinition/ccts:CoreComponent/$xcc[ccts:UniqueID = $cc-uid]/ccts:Definition"/>-->
         <sch:assert test="(normalize-space (ccts:Definition) = normalize-space ($based-on-definition)) or (ccts:Cardinality/ccts:MinimumOccurenceValue != $based-on-definition/parent::*/ccts:Cardinality/ccts:MinimumOccurenceValue) or (ccts:Cardinality/ccts:MaximumOccurenceValue != $based-on-definition/parent::*/ccts:Cardinality/ccts:MaximumOccurenceValue)">A BBIE or AsBIE with an unqualified object class shall have the same definition as the BCC or AsCC it is based on ''<sch:value-of select="$xcc-uid"/>'' 
           <sch:value-of select="$cc-den"/>#
            -- <sch:value-of select="ccts:Definition"/> -- <sch:value-of select="$based-on-definition"/>.</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern is-a="definition-based-on" id="abie-definition">
      <sch:param name="xbie"           value="ccts:AggregateBusinessInformationEntity"/>
      <sch:param name="xcc"            value="ccts:AggregateCoreComponent"/>
      <sch:param name="based-on-uid"   value="ccts:BasedOnAggregateCoreComponentUID"/>
      <sch:param name="concatden"      value="concat(ccts:ObjectClassTerm, '. Details')"/>
   </sch:pattern>

   <sch:pattern is-a="definition-based-on" id="bbie-definition">
      <sch:param name="xbie"           value="ccts:BasicBusinessInformationEntity"/>
      <sch:param name="xcc"            value="ccts:AggregateCoreComponent/ccts:BasicCoreComponent"/>
      <sch:param name="based-on-uid"   value="ccts:BasedOnBasicCoreComponentUID"/>
      <sch:param name="concatden"      value="concat(ccts:ObjectClassTerm, '. ', ccts:PropertyTerm, '. ', ccts:RepresentationTerm)"/>
   </sch:pattern>

   <sch:pattern abstract="true" id="bie-properties">
      <sch:rule context="$xbie">
         <sch:let name="bie-uid" value="$uid"/>
         <sch:let name="bie-property" value="parent::ccts:AggregateBusinessInformationEntity/parent::ccts:Package/parent::ccts:BusinessInformationEntity/ccts:BusinessProperty/$xprop [ccts:UniqueID = $bie-uid]"/>
         <sch:assert test="count ($bie-property) eq 1">A BBIE or an AsBIE property shall be defined for each BBIE and AsBIE.</sch:assert>
      </sch:rule>
      <sch:rule context="$xprop">
         <sch:let name="bie-uid" value="ccts:UniqueID"/>
         <sch:let name="bie-property" value="parent::ccts:BusinessProperty/parent::ccts:BusinessInformationEntity/ccts:Package/ccts:AggregateBusinessInformationEntity/$xbie [$uid = $bie-uid]"/>
      </sch:rule>
   </sch:pattern>

   <sch:pattern is-a="bie-properties" id="asbie-properties">
      <sch:param name="xbie"           value="ccts:AssociationBusinessInformationEntity"/>
      <sch:param name="xprop"          value="ccts:AssociationBusinessInformationEntityProperty"/>
      <sch:param name="uid"            value="ccts:AssociationBusinessInformationEntityPropertyUID"/>
   </sch:pattern>
   
   <sch:pattern is-a="bie-properties" id="bbie-properties">
      <sch:param name="xbie"           value="ccts:BasicBusinessInformationEntity"/>
      <sch:param name="xprop"          value="ccts:BasicBusinessInformationEntityProperty"/>
      <sch:param name="uid"            value="ccts:BasicBusinessInformationEntityPropertyUID"/>
   </sch:pattern>

   <!-- we'll probably need to turn the following two into a pattern to support BIE and AsBIE at one point or another -->
   <sch:rule context="ccts:AssociationBusinessInformationEntity">
      <sch:let name="asbie-uid" value="ccts:AssociationBusinessInformationEntityPropertyUID"/>
      <sch:let name="asbie-property" value="parent::ccts:AggregateBusinessInformationEntity/parent::ccts:Package/parent::ccts:BusinessInformationEntity/ccts:BusinessProperty/ccts:AssociationBusinessInformationEntityProperty [ccts:UniqueID = $asbie-uid]"/>
      <sch:assert test="count ($asbie-property) eq 1">An AsBIE property shall be defined for each AsBIE.</sch:assert>
   </sch:rule>
   <sch:rule context="ccts:AssociationBusinessInformationEntityProperty">
      <sch:let name="asbie-uid" value="ccts:UniqueID"/>
      <sch:let name="asbie-property" value="parent::ccts:BusinessProperty/parent::ccts:BusinessInformationEntity/ccts:Package/ccts:AggregateBusinessInformationEntity/ccts:AssociationBusinessInformationEntity [ccts:AssociationBusinessInformationEntityPropertyUID = $asbie-uid]"/>
      <sch:assert test="count ($asbie-property) eq 1">An AsBIE property is defined but not used in an AsBIE.</sch:assert>
   </sch:rule>

   <sch:pattern>
      <sch:title>Uniqueness</sch:title>
      <!-- I choose the most efficient implementation (but also the one that is hardest to track), because I expect this will be very few violations -->
      <!-- BTW turn these into sch:report, make more sense for the error message -->
      <sch:rule context="ccts:CoreComponentTechnicalSpecificationDefinition">
         <!--
            this does not work, sadly
         <sch:let name="definitions" value="//ccts:Definition[string-length (.) gt 0]"/>
         <sch:assert test="count($definitions) = count (distinct-values($definitions))">(S00E) There are <sch:value-of select="count($definitions) - count (distinct-values($definitions))"/> duplicate definitions (the Schematron has another, less efficient, rule that you can uncomment to help pinpoint this error)</sch:assert>
         -->
         <sch:let name="uids" value="//ccts:UniqueID"/>
         <sch:assert test="count ($uids) = count (distinct-values($uids))">(S023) There are <sch:value-of select="count ($uids) - count (distinct-values($uids))"/> duplicate object IDs</sch:assert>
         <sch:let name="versionids" value="//ccts:VersionID"/>
         <sch:assert test="count ($versionids) = count (distinct-values($versionids))">(S024) There are <sch:value-of select="count ($versionids) - count (distinct-values($versionids))"/> duplicate version IDs</sch:assert>
         <sch:let name="dtts" value="ccts:DataType/ccts:DataTypeTerm"/>
         <sch:assert test="count ($dtts) = count (distinct-values($dtts))">(S039) There are <sch:value-of select="count ($dtts) - count (distinct-values($dtts))"/> duplicate Data Type Terms</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern abstract="true" id="unique-definition">
      <sch:rule context="$thing[$definition/string-length (.) gt 0]">
         <sch:assert test="every $t in preceding::$thing satisfies $t/$definition != ./$definition">(S00E) Each object shall have its own unique definition</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern is-a="unique-definition" id="acc-unique-definition">
      <sch:param name="thing"      value="ccts:AggregateCoreComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>

   <sch:pattern is-a="unique-definition" id="bcc-unique-definition">
      <sch:param name="thing"      value="ccts:BasicCoreComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="ascc-unique-definition">
      <sch:param name="thing"      value="ccts:AssociationCoreComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>

   <sch:pattern is-a="unique-definition" id="asccp-unique-definition">
      <sch:param name="thing"      value="ccts:AssociationCoreComponentProperty"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>

   <sch:pattern is-a="unique-definition" id="bccp-unique-definition">
      <sch:param name="thing"      value="ccts:BasicCoreComponentProperty"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="abie-unique-definition">
      <sch:param name="thing"      value="ccts:AggregateBusinessInformationEntity"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="bbie-unique-definition">
      <sch:param name="thing"      value="ccts:BasicBusinessInformationEntity"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="asbie-unique-definition">
      <sch:param name="thing"      value="ccts:AssociationBusinessInformationEntity"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="asbiep-unique-definition">
      <sch:param name="thing"      value="ccts:AssociationBusinessInformationEntityProperty"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="bbiep-unique-definition">
      <sch:param name="thing"      value="ccts:BasicBusinessInformationEntityProperty"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="cdt-unique-definition">
      <sch:param name="thing"      value="ccts:CoreDataType"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="cdtcc-unique-definition">
      <sch:param name="thing"      value="ccts:CoreDataTypeContentComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="cdtsc-unique-definition">
      <sch:param name="thing"      value="ccts:CoreDataTypeSupplementaryComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="bdt-unique-definition">
      <sch:param name="thing"      value="ccts:BusinessDataType"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="bdtcc-unique-definition">
      <sch:param name="thing"      value="ccts:BusinessDataTypeContentComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern is-a="unique-definition" id="bdtsc-unique-definition">
      <sch:param name="thing"      value="ccts:BusinessDataTypeSupplementaryComponent"/>
      <sch:param name="definition" value="ccts:Definition"/>
   </sch:pattern>
   
   <sch:pattern>
      <sch:title>Object Completeness</sch:title>
      <sch:p>S023-S024, S027, S064, S066, S06D</sch:p>
      <sch:rule context="ccts:AggregateCoreComponent | ccts:AssociationCoreComponentProperty | ccts:BasicCoreComponentProperty | ccts:DataType/ccts:CoreDataType">
         <sch:assert test="(ccts:UniqueID/text() and ccts:VersionID/text()) or (ccts:DictionaryEntryName eq '')">Each object shall have unique ID and version ID</sch:assert>
      </sch:rule>
      
      <sch:rule context="ccts:AggregateCoreComponent | ccts:AssociationCoreComponentProperty | ccts:BasicCoreComponentProperty | ccts:DataType/ccts:CoreDataType | ccts:CoreDataTypeContentComponent | ccts:CoreDataTypeSupplementaryComponent">
         <sch:assert test="((ccts:DictionaryEntryName ne '') and (ccts:Definition ne '')) or (ccts:DictionaryEntryName eq '')">Each object shall have a common information class</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:AggregateBusinessInformationEntity">
         <sch:assert test="count (ccts:BasicBusinessInformationEntity | ccts:AssociationBusinessInformationEntity) ge 1">An ABIE shall contain at least one property.</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Definition Validation Rules</sch:title>
      <sch:rule context="ccts:Definition">
         <sch:assert test="(string-length (normalize-space (.)) gt 0) or (string-length (../ccts:DictionaryEntryName) eq 0)">(S00E) Each object shall have a semantic definition</sch:assert>
         <sch:let name="sentences" value="tokenize (., '\.')"/>
         <sch:assert test="every $sentence in $sentences satisfies count (tokenize ($sentence, '\p{Zs}')) lt 30"
            see="http://strainindex.wordpress.com/2008/07/28/the-average-sentence-length/"
            role="warning">(S010) Sentences in definition shall be short.</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Cardinality</sch:title>
       <sch:rule context="ccts:BasicCoreComponent | ccts:AssociationCoreComponent | ccts:CoreDataTypeSupplementaryComponent">
         <sch:assert test="(child::ccts:Cardinality/ccts:MinimumOccurenceValue and child::ccts:Cardinality/ccts:MaximumOccurenceValue) or (string-length(ccts:DictionaryEntryName) eq 0)">(S029-S05B) Object shall have a cardinality</sch:assert>
       </sch:rule>
       <sch:rule context="ccts:Cardinality">
           <sch:let name="max" value="number (ccts:MaximumOccurenceValue)"/>
           <sch:assert test="number (ccts:MinimumOccurenceValue) ge 0">(002A) Occurence minimum shall be zero or a positive integer</sch:assert>
           <sch:assert test="ccts:MaximumOccurenceValue = 'unbounded' or number (ccts:MaximumOccurenceValue) >= 0">(002A) Occurence maximum shall be zero or a positive integer or 'unbounded'</sch:assert>
       </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Sequency Key</sch:title>
      <sch:rule context="ccts:BasicCoreComponent | ccts:AssociatpionCoreComponent">
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
         <sch:assert test="count ($property) eq 1">(002D) An AsCC Property shall be defined for each AsCC</sch:assert>
         <sch:assert test="$property/ccts:PropertyTerm eq ccts:PropertyTerm" role="warning">AsCC Property Term shall be coherent with its property</sch:assert>
         <sch:assert test="$property/ccts:AssociatedObjectClassTerm eq ccts:AssociatedObjectClassTerm" role="warning">AsCC Associated Object Class Term shall be coherent with its property</sch:assert>
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
         <sch:assert test="$property/ccts:PropertyTerm eq ccts:PropertyTerm" role="warning">A BCC Property Term shall be coherent with its property</sch:assert>
         <sch:assert test="$property/ccts:RepresentationTerm eq ccts:RepresentationTerm" role="warning">A BCC Representation Term shall be coherent with its property</sch:assert>
         <sch:let name="duid" value="ccts:CoreDataTypeUID"/>
         <sch:let name="dt" value="../../../ccts:DataType/ccts:CoreDataType [ccts:UniqueID = $duid]"/>
         <sch:assert test="count ($dt) eq 1">(0032) A BCC Property shall only use an approved CDT</sch:assert>
         <sch:assert test="ccts:CoreDataType eq $dt/ccts:DictionaryEntryName">(0034) A BCC Property Core Data Type shall be coherent with its datatype</sch:assert>
         <sch:assert test="ccts:RepresentationTerm eq $dt/ccts:DataTypeTerm">(0034) The representation term of a BCC shall be its core data type</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Core Data Type</sch:title>
      <sch:rule context="ccts:DataType/ccts:CoreDataType">
         <sch:assert test="count (child::ccts:CoreDataTypeContentComponent) eq 1">(003F) A data type shall have one and only one content component</sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:title>Core Data Type Content and Component</sch:title>
      <sch:rule context="ccts:CoreDataTypeContentComponent [string-length (ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="child::ccts:PropertyTerm and (ccts:PropertyTerm eq 'Content')">(0041-0042) The DT content component property term shall be 'Content'</sch:assert>
         <!-- FIXME need to check the content of the value domain -->
         <sch:assert test="child::ccts:CoreValueDomain">(0044) A CDT shall have one or more value domain</sch:assert>
         <sch:assert test="child::ccts:CoreValueDomain/ccts:DefaultIndicator and (every $indicator in ccts:CoreValueDomain/ccts:DefaultIndicator satisfies $indicator = 'true' or $indicator = 'false')">(0045) A value domain shall have valid default indicators</sch:assert>
         <sch:let name="default" value="count (ccts:CoreValueDomain [ccts:DefaultIndicator = 'true'])"/>
         <sch:assert test="($default eq 0) or ($default eq 1)">(0046) A domain value shall up to one default value</sch:assert>
      </sch:rule>
      <sch:rule context="ccts:CoreDataTypeSupplementaryComponent [string-length (ccts:DictionaryEntryName) gt 0]">
         <sch:assert test="ccts:PropertyTerm ne ''">(0041) A data type shall have a property term</sch:assert>
         <sch:assert test="ccts:RepresentationTerm ne ''">(0059) A representation term shall be defined for each CDT supplementary component.</sch:assert>
      </sch:rule>
   </sch:pattern>

   <sch:pattern>
      <sch:title></sch:title>
   </sch:pattern>

   <sch:pattern>
      <sch:title>Not implemented yet</sch:title>
      <sch:rule context="ccts:CoreComponentTechnicalSpecificationDefinition" role="warning">
         <sch:report test="//ccts:UsageRule">Validation of Usage Rule is not implemented yet, please contact Schematron developers</sch:report>
         <sch:report test="//ccts:LocalizedMetadata">Validation of Localized Metadata is not implemented yet, please contact Schematron developers</sch:report>
         <sch:report test="/ccts:CoreComponentTechnicalSpecificationDefinition/ccts:CoreComponent/ccts:AggregateCoreComponent/ccts:AssociationCoreComponent [number (ccts:Cardinality/ccts:MinimumOccurenceValue) gt 0]">(0028) Loop detection on ASCC not properly implemented yet but infinte loop may occur, please contact Schematron developers</sch:report>
         <sch:report test="(//ccts:UsageRuleID [string-length (.) gt 0]) or (//ccts:UsageRule)">(003C) Usage rule detection not implemented yet, please contact Schematron developers</sch:report>
         <sch:report test="//ccts:Primitive">(0047) Validation of primitives not implemented yet, please contact Schematron developers</sch:report>
         <sch:report test="//ccts:SchemeOrListUID | //CoreCodeListUID | //CodeIdentifierSchemeUID">(0053) Validation of list not implemented yet, please contact Schematron developers</sch:report>
      </sch:rule>
   </sch:pattern>

   <!-- there's a more efficient version of   rule S002:
           count(//ccts:DictionaryEntryName) = count(distinct-values(//ccts:DictionaryEntryName))
        but it reports the violation but not where it occured so it's not very helpful
        the version I have used here compares item by item but limits the comparisons to children of the same parent
        (since there are other assertions to make sure that the parent names are properly reported in the DEN,
        and the parents themselves are guaranteed unique, it effectively guarantee unicity) -->

    <sch:pattern>
        <sch:title>CDT supplementary component</sch:title>
        <sch:rule context="ccts:CoreDataTypeSupplementaryComponent">
            <!-- 
                Should it have an unique ID and version ID ? 
                If yes, the validation can be done like with   
                
                <sch:let name="duid" value="ccts:CoreDataTypeUID"/>
                <sch:let name="dt" value="../../../ccts:DataType/ccts:CoreDataType [ccts:UniqueID = $duid]"/>
                <sch:assert test="count ($dt) eq 1">(0032) A BCC Property shall only use an approved CDT</sch:assert>
                <sch:assert test="ccts:CoreDataType eq $dt/ccts:DictionaryEntryName">(0034) A BCC Property Core Data Type shall be coherent with its datatype</sch:assert>
         <sch:assert test="ccts:RepresentationTerm eq $dt/ccts:DataTypeTerm">(0034) The representation term of a BCC shall be its core data type</sch:assert>
         doit correspondre au parent TODO
            --> 
            <sch:let name="rt" value="ccts:RepresentationTerm"/> 
            <sch:assert test="../../ccts:CoreDataType[ccts:DataTypeTerm eq $rt]">(S05A) The name of the CDT supplementary component representation term shall be one of the approved representation terms in the UN/CEFACT Data Type Catalogue.</sch:assert>
        </sch:rule>
    </sch:pattern>
   
    <sch:pattern>
        <sch:title>CDT/BDT supplementary component Cardinality</sch:title>
        <sch:rule context="ccts:CoreDataTypeSupplementaryComponent | ccts:BusinessDataTypeSupplementaryComponent">
            <sch:assert test="child::ccts:Cardinality/ccts:MinimumOccurenceValue and child::ccts:Cardinality/ccts:MaximumOccurenceValue">(S05B) CDT/BDT shall have a cardinality</sch:assert>
            <sch:let name="min" value="ccts:Cardinality/ccts:MinimumOccurenceValue"/>
            <sch:let name="max" value="ccts:Cardinality/ccts:MaximumOccurenceValue"/>
            <sch:assert test="$min eq '0' or $min eq '1'">(S05C) A supplementary component cardinality shall be equal to [0..1] if the supplementary component is optional, or [1..1] if mandatory.</sch:assert>
            <sch:assert test="$max eq '1'">(S05C) A supplementary component cardinality shall be equal to [0..1] if the supplementary component is optional, or [1..1] if mandatory.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:title>ABIE</sch:title>
        <sch:rule context="ccts:AggregateBusinessInformationEntity">
            <sch:let name="accid" value="ccts:BasedOnAggregateCoreComponentUID"/>
            <sch:assert test="count(../../../ccts:CoreComponent/ccts:AggregateCoreComponent[ccts:UniqueID eq $accid]) gt 0">(003D) An ABIE shall be based on an ACC.</sch:assert>
            
            <sch:let name="oct" value="ccts:ObjectClassTerm"/>
            <sch:assert test="../../../ccts:CoreComponent/ccts:AggregateCoreComponent[ccts:UniqueID eq $accid]/ccts:ObjectClassTerm eq $oct">(003E) An ABIE object class term shall be identical to its basis ACC object class term.</sch:assert>
        </sch:rule>
    </sch:pattern>

</sch:schema>