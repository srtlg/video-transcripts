<xsl:stylesheet version="1.0"
                xmlns:ttp="http://www.w3.org/ns/ttml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:for-each select="/ttp:tt/ttp:body/ttp:div/ttp:p">
      <xsl:value-of select="@begin"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
