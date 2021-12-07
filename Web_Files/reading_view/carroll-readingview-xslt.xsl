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
                <xsl:apply-templates select="//federalist_papers"/>
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
    <xsl:template match="head/title">
        <h1><span class="title"><xsl:apply-templates/></span></h1>
    </xsl:template>
    <xsl:template match="head/subtitle">
        <h2><span class="subtitle"><xsl:apply-templates/></span></h2>
    </xsl:template>
    <xsl:template match="head/source">
        <h3><span classe="source"><xsl:apply-templates/></span></h3>
    </xsl:template>
    <xsl:template match="head/author">
        <h3><span class="author"><xsl:apply-templates/></span></h3>
    </xsl:template>
    <xsl:template match="head/date">
        <h3><span class="date"><xsl:apply-templates/></span></h3>
    </xsl:template>
    <xsl:template match="p">
        <span class="p"><xsl:apply-templates/></span>
        <br/>
        <xsl:text>&#xa;</xsl:text>
        <br/>
    </xsl:template>
</xsl:stylesheet>