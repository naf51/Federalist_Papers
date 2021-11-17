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
<!-- 2021-11-14 esr

Good work on this initial reading view!

Here are some suggestions to improve:

At the moment, everything is outputted as a wall of text. 
We want to preserve the paragraph strucutre of the original document, 
which means we need to create a template to handle and create paragraphs.
You can see one way to do this in the answer key to XSLT #3.

Consider your header hierarchy a bit more closely.
You can decide for yourself but it may be that the author and source or the source and subtitle are on the same levels in the hierarchy.

Moving forward, I would suggest looking into a way to create a table of contents and performing batch transformation.
-->