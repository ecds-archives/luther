<?xml version="1.0" encoding="ISO-8859-1"?>  

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:html="http://www.w3.org/TR/REC-html40" 
        xmlns:xq="http://metalab.unc.edu/xq/"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns:exist="http://exist.sourceforge.net/NS/exist"
        version="1.0">

<xsl:output method="html"/>

<!--path for images-->
<xsl:variable name="imgserver">/static/images/pages/</xsl:variable>

<xsl:template match="/"> 
  <xsl:element name="div">
    <xsl:attribute name="class">text</xsl:attribute>
    <xsl:apply-templates/> 
  </xsl:element>
</xsl:template>

<xsl:template match="tei:pb">
  <xsl:element name="div">
    <xsl:attribute name="class">page_img</xsl:attribute>
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@facs"/></xsl:attribute>
    <xsl:element name="img">
      <xsl:attribute name="src">
	<xsl:value-of select="$imgserver"/><xsl:value-of select="@facs"/>
      </xsl:attribute>
      <xsl:attribute name="alt">
	<xsl:text>page image : </xsl:text><xsl:value-of select="@n"/>
      </xsl:attribute>
      <xsl:attribute name="class">resize</xsl:attribute>
    </xsl:element>
    </xsl:element>
    </xsl:element>
  <xsl:element name="hr">
    <xsl:attribute name="class">pagebreak</xsl:attribute>
  </xsl:element>   
  <xsl:element name="a">
    <xsl:attribute name="name"><xsl:value-of select="@facs"/></xsl:attribute>
  </xsl:element> 
 <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tei:teiHeader"/>

<!-- title page -->
<xsl:template match="tei:div[@type='title_page']">
  <xsl:element name="div">
    <xsl:attribute name="class">title</xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="tei:imprint">
  <xsl:element name="p">
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="tei:div/tei:head">
  <xsl:element name="p">
   <xsl:attribute name="class">title</xsl:attribute>
   <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="tei:p">
  <xsl:element name="p">
    <xsl:apply-templates /> 
  </xsl:element>
</xsl:template>

<xsl:template match="tei:p/tei:title">
  <xsl:element name="i">
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>  

<xsl:template match="tei:quote">
  <xsl:element name="blockquote">
    <xsl:apply-templates /> 
  </xsl:element>
</xsl:template>

<xsl:template match="tei:lb">
  <xsl:element name="br" />
</xsl:template>

</xsl:stylesheet>