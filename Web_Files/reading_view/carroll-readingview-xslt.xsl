<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Federalist Papers</title>
                <link rel="stylesheet" type="text/css" href="Federalist-readerview.css"/>
            </head>
            <body>
                <h1>
                    Title: <xsl:apply-templates select="//title"/>
                </h1>
                <h2>
                    Subtitle: <xsl:apply-templates select="//subtitle"/>
                </h2>
                <h3>
                    Source: <xsl:apply-templates select="//source"/>
                </h3>
                <h4>
                    Author: <xsl:apply-templates select="//author"/>
                </h4>
                <xsl:apply-templates select="//body"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="quote
        | taxation
        | executive
        | federalism
        | judicial
        | military
        | trade
        | foreignPolicy
        | significantPhrase
        | legislature
        | historicalComparison
        | parenthesis
        | liberty
        | closing
        | address">
        <span class="{name()}" about="{@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>