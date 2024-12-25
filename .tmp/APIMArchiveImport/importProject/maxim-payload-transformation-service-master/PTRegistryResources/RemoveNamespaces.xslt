<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">

    <!-- Template to remove the soapenv:Envelope and soapenv:Body, keep inner content -->
    <xsl:template match="soapenv:Envelope">
        <xsl:apply-templates select="soapenv:Body/node()"/>
    </xsl:template>

    <!-- Template to remove the soapenv:Body but keep its content -->
    <xsl:template match="soapenv:Body">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <!-- Template to remove all namespaces, keep original element names -->
    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*"/>
        </xsl:element>
    </xsl:template>

    <!-- Template to copy attributes without namespaces -->
    <xsl:template match="@*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <!-- Template to copy text nodes as they are -->
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>