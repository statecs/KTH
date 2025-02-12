<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:ext="http://exslt.org/common"
xmlns:str-split2li-func="f:str-split2li-func"
exclude-result-prefixes="xsl ext str-split2li-func"
>

   <xsl:import href="str-foldl.xsl"/>

   <str-split2li-func:str-split2li-func/>

    <xsl:template name="str-split-to-li">
      <xsl:param name="pStr"/>
      <xsl:param name="pDelimiters"/>
      
      <xsl:variable name="vsplit2liFun"
                    select="document('')/*/str-split2li-func:*[1]"/>
                    
      <xsl:variable name="vrtfParams">
       <delimiters><xsl:value-of select="$pDelimiters"/></delimiters>
      </xsl:variable>

      <xsl:variable name="vResult">
	      <xsl:call-template name="str-foldl">
	        <xsl:with-param name="pFunc" select="$vsplit2liFun"/>
	        <xsl:with-param name="pStr" select="$pStr"/>
	        <xsl:with-param name="pA0" select="ext:node-set($vrtfParams)"/>
	      </xsl:call-template>
      </xsl:variable>
      
      <xsl:copy-of select="ext:node-set($vResult)/li"/>

    </xsl:template>

    <xsl:template match="str-split2li-func:*">
      <xsl:param name="arg1" select="/.."/>
      <xsl:param name="arg2"/>
         
      <xsl:copy-of select="$arg1/*[1]"/>
      <xsl:copy-of select="$arg1/li[position() != last()]"/>
      
      <xsl:choose>
        <xsl:when test="contains($arg1/*[1], $arg2)">
          <xsl:if test="string($arg1/li[last()])">
             <xsl:copy-of select="$arg1/li[last()]"/>
          </xsl:if>
          <li/>
        </xsl:when>
        <xsl:otherwise>
          <li><xsl:value-of select="concat($arg1/li[last()], $arg2)"/></li>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

</xsl:stylesheet>