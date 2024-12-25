<?xml version="1.0" encoding="UTF-8"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            xmlns:tns="http://siebel.com/CustomUI"
            xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
            targetNamespace="http://siebel.com/CustomUI"
            elementFormDefault="qualified">
 
    <!-- Root SOAP Envelope -->
<xsd:element name="Envelope" type="tns:Envelope"/>
 
    <!-- Envelope with namespaces -->
<xsd:complexType name="Envelope">
<xsd:sequence>
<xsd:element name="Header" type="tns:Header" minOccurs="0"/>
<xsd:element name="Body" type="tns:Body"/>
</xsd:sequence>
</xsd:complexType>
 
    <!-- Header with namespace -->
<xsd:complexType name="Header">
<xsd:sequence>
<xsd:element name="SessionToken" type="xsd:string" minOccurs="0"/>
<xsd:element name="Security" type="tns:Security" minOccurs="0"/>
</xsd:sequence>
</xsd:complexType>
 
    <!-- Security Definition -->
<xsd:complexType name="Security">
<xsd:sequence>
<xsd:element name="UsernameToken" type="xsd:string" minOccurs="1"/>
<xsd:element name="PasswordText" type="xsd:string" minOccurs="1"/>
</xsd:sequence>
</xsd:complexType>
 
    <!-- Body with namespace -->
<xsd:complexType name="Body">
<xsd:sequence>
<xsd:element name="OrderDetailsRequest" type="tns:OrderDetailsRequest"/>
</xsd:sequence>
</xsd:complexType>
 
    <!-- OrderDetailsRequest with namespace -->
<xsd:complexType name="OrderDetailsRequest">
<xsd:sequence>
<xsd:element name="OrderNumber" type="xsd:string" minOccurs="1"/>
<xsd:element name="CustomerName" type="xsd:string" minOccurs="0"/>
<xsd:element name="CustomerID" type="xsd:string" minOccurs="0"/>
<xsd:element name="RequestedDate" type="xsd:date" minOccurs="0"/>
</xsd:sequence>
</xsd:complexType>
 
</xsd:schema>