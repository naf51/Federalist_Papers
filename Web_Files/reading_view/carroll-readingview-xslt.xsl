<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="title" select="//title"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Federalist Papers</title>
                <link rel="stylesheet" type="text/css" href="Federalist-readerview.css"/>
            </head>
            <body>
                <h1>The Federalist Papers</h1>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//head" mode="toc"/>
                </ul>
                <hr/>
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
    <xsl:template match="head" mode="toc">
        <li>
            <a href="#{generate-id()}">
                <xsl:apply-templates select="title" mode="toc"/>
                <xsl:text> (</xsl:text>
                <xsl:apply-templates select="subtitle" mode="toc"/>
                <xsl:text>)</xsl:text>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="head">
        <h1><span class="title" id="{generate-id()}"><xsl:apply-templates select="title"/></span></h1>
        <h2><span class="subtitle"><xsl:apply-templates select="subtitle"/></span></h2>
        <h3><span class="source"><xsl:apply-templates select="source"/></span></h3>
        <h3><span class="author"><xsl:apply-templates select="author"/></span></h3>
        <h3><span class="date"><xsl:apply-templates select="date"/></span></h3>
    </xsl:template>
    <xsl:template match="p">
        <span class="p"><xsl:apply-templates/></span>
        <br/>
        <xsl:text>&#xa;</xsl:text>
        <br/>
    </xsl:template>
</xsl:stylesheet>