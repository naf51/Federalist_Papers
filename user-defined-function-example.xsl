<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
  xmlns="http://www.w3.org/1999/xhtml" xmlns:djb="http://www.obdurodon.org" version="3.0">
  <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
    indent="yes"/>
  <xsl:function name="djb:upper-case-initial" as="xs:string">
    <xsl:param name="input" as="xs:string"/>
    <xsl:value-of select="upper-case(substring($input, 1, 1)), substring($input, 2)" separator=""/>
  </xsl:function>
  <xsl:function name="djb:camel-to-phrase" as="xs:string">
    <xsl:param name="input" as="xs:string"/>
    <xsl:variable name="result" as="xs:string+">
      <xsl:analyze-string select="$input" regex="[A-Z]">
        <xsl:matching-substring>
          <xsl:value-of select="' ' || ."/>
        </xsl:matching-substring>
        <xsl:non-matching-substring>
          <xsl:value-of select="."/>
        </xsl:non-matching-substring>
      </xsl:analyze-string>
    </xsl:variable>
    <xsl:value-of select="djb:upper-case-initial(string-join($result))"/>
  </xsl:function>
  <xsl:template match="/">
    <html>
      <head>
        <title>Elitism and popularism</title>
      </head>
      <body>
        <h1>Elitism and popularism</h1>
        <ul>
          <xsl:for-each-group select="//*[@type]" group-by="@type">
            <xsl:sort/>
            <li>
              <b>
                <xsl:value-of select="current-grouping-key()"/>
              </b>
              <ul>
                <xsl:for-each-group select="current-group()" group-by="name()">
                  <xsl:sort/>
                  <li>
                    <xsl:value-of select="djb:camel-to-phrase(current-grouping-key())"/>
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                  </li>
                </xsl:for-each-group>
              </ul>
            </li>
          </xsl:for-each-group>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
