<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:api="http://api.ws.east.telstra.com.au">

    <!-- Template to match the root and wrap in a SOAP envelope -->
    <xsl:template match="/">
        <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                          xmlns:api="http://api.ws.east.telstra.com.au">
            <soapenv:Header/>
            <soapenv:Body>
                <!-- Apply templates to copy the body content, adding the api prefix -->
                <xsl:apply-templates select="node()"/>
            </soapenv:Body>
        </soapenv:Envelope>
    </xsl:template>

    <!-- Template to handle elements and apply api namespace prefix -->
    <xsl:template match="node()">
        <!-- For elements, apply the api namespace prefix -->
        <xsl:choose>
            <xsl:when test="self::element()">
                <xsl:element name="api:{local-name()}">
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:element>
            </xsl:when>
            <!-- For other nodes like text, copy them as is -->
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>