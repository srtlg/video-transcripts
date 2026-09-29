<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.w3.org/ns/ttml"
                exclude-result-prefixes="t">

  <xsl:output method="html"
              encoding="UTF-8"
              doctype-system="about:legacy-compat"/>

  <xsl:param name="VideoID" select="'_REPLACEME_'"/>

  <xsl:template match="/">

    <xsl:variable name="VideoURL" 
     select="concat('https://www.youtube-nocookie.com/embed/', $VideoID, '?enablejsapi=1&amp;origin=http%3A%2F%2Flocalhost%3A8000')"/>

    <html>
      <meta charset="UTF-8"/>
      <body>
<iframe
  name="youtube-player"
  width="640"
  height="360"
  src="{concat($VideoURL, '&amp;start=0')}"
  title="YouTube video player"
  allow="autoplay; encrypted-media"
  referrerpolicy="strict-origin-when-cross-origin"
  allowfullscreen="allowfullscreen">
</iframe>
        <xsl:for-each select="/t:tt/t:body/t:div/t:p">
          <xsl:variable name="BeginSeconds"
            select="
              number(substring(@begin, 1, 2)) * 3600
              + number(substring(@begin, 4, 2)) * 60
              + number(substring(@begin, 7))
            "/>
          <xsl:variable name="EndSeconds"
            select="
              number(substring(@end, 1, 2)) * 3600
              + number(substring(@end, 4, 2)) * 60
              + number(substring(@end, 7))
            "/>

          <xsl:variable name="URL" 
			select="concat($VideoURL,
				'&amp;autoplay=1&amp;start=', floor($BeginSeconds),
				'&amp;end=', ceiling($EndSeconds))"/>

          <p>
            <a target="youtube-player" href="{$URL}">
            <xsl:value-of select="."/>
            </a>
          </p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
