<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    
    
    <xsl:template match="/">
        <svg height="1000" width="2000">
            
            <line x1="100" y1="800" x2="1500" y2="800" stroke="black" stroke-width="2"></line>
            <line x1="100" y1="800" x2="100" y2="300" stroke="black" stroke-width="2"></line>
            <line x1="100" y1="750" x2="1500" y2="750" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="700" x2="1500" y2="700" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="650" x2="1500" y2="650" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="600" x2="1500" y2="600" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="550" x2="1500" y2="550" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="500" x2="1500" y2="500" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="450" x2="1500" y2="450" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="400" x2="1500" y2="400" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="350" x2="1500" y2="350" stroke="gray" stroke-width="1"></line>
            <line x1="100" y1="300" x2="1500" y2="300" stroke="gray" stroke-width="1"></line>
            <text x="65" y="800" fill="gray">0%</text>
            <text x="65" y="750" fill="gray">10%</text>
            <text x="65" y="700" fill="gray">20%</text>
            <text x="65" y="650" fill="gray">30%</text>
            <text x="65" y="600" fill="gray">40%</text>
            <text x="65" y="550" fill="gray">50%</text>
            <text x="65" y="500" fill="gray">60%</text>
            <text x="65" y="450" fill="gray">70%</text>
            <text x="65" y="400" fill="gray">80%</text>
            <text x="65" y="350" fill="gray">90%</text>
            <text x="65" y="300" fill="gray">100%</text>
            
            <text x="600" y="250" fill="black">Topic 1: Populism</text>
            <text x="600" y="850" fill="black">Federalist Paper</text>
            <text x="30" y="500" fill="black" writing-mode="tb">Topic Relevance</text>
            
            
            
            
            <xsl:for-each select="//line">
                <xsl:variable name="percent" as="xs:double" select="data[3] * 100"></xsl:variable>
                <xsl:variable name="height" as="xs:double" select="$percent * 5"></xsl:variable>
                <xsl:variable name="placement" as="xs:double" select="160 + (data[1] * 50)"></xsl:variable>
                <xsl:variable name="y-placement" as="xs:double" select="800 - $height"></xsl:variable>
                <rect width="40" height="{$height}" fill="blue" stroke="black" stroke-width="1" x="{$placement}" y="{$y-placement}"></rect>
                <text x="{$placement}" y="820" fill="blue"><xsl:value-of select="data[2]"></xsl:value-of></text>
                
            </xsl:for-each>
            
            
            
            
            
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>