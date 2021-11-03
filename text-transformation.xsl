<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="text" omit-xml-declaration="no" 
        include-content-type="no" indent="no"/>
    <xsl:template match="/">
        <xsl:apply-templates select="//body"/>
    </xsl:template>
</xsl:stylesheet>