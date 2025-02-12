<?php
//put XML content in a string

$xmlstr=ob_get_contents();

ob_end_clean();

/*   // Check if there was an error
if (!is_null(error_get_last()))
{
  // There was an error, print it and exit
  echo utf8_decode($xmlstr);
  exit;
}*/


// Load the XML string into a DOMDocument
$xml = new DOMDocument;
$xml->loadXML("$xmlstr");
// Make a DOMDocument for the XSL stylesheet
$xsl = new DOMDocument;


// See which user agent is connecting
$UA = getenv('HTTP_USER_AGENT');
if (ereg("Symbian", $UA) | ereg("Opera", $UA) | ereg("Motorola", $UA) | ereg("Nokia", $UA) | ereg("Siemens", $UA) | ereg("Samsung", $UA) | ereg("Ericsson", $UA) | ereg("LG", $UA) | ereg("NEC", $UA) |ereg("SEC", $UA) |ereg("MIDP", $UA) | ereg("Windows CE", $UA)) 
  {
    // if a mobile phone, use a wml stylesheet and set appropriate MIME type
    header("Content-type:text/vnd.wap.wml");
    $xsl->load('index.xsl');
  } 
  else if (strstr($_SERVER['HTTP_USER_AGENT'],'iPod') || strstr($_SERVER['HTTP_USER_AGENT'],'iPhone')) 
  {
    header("Content-type:text/html");
    $xsl->load('index-mobile.xsl');
  }

  else 
  {
    // if not a mobile phone, use a html stylesheet
    header("Content-type:text/html");
    $xsl->load('index.xsl');
//    header("Content-type:text/vnd.wap.wml");
//    $xsl->load('index-wml.xsl');
  }

// Make the transformation and print the result
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules
echo $proc->transformToXML($xml);

?>

