UN/CEFACT CCL3.0
================

Validation rules for UN/CEFACT CCL 3.0
 
* src directory contains the validation rules in Schematron
* uncefact contains the XSD of XML4CCTS
* testdata contains a more or less current version of CCL3 for testing as well as a stylesheet to generate it
  (warning the testdata library may have been modified for testing purposes: adding or removing errors
  do not rely on it for anything but testing the Schematron itself)

'''Warning''' the Schematron imports XSL functions so you must set allow-foreign to true
when generating the XSLT stylesheets.