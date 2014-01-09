<?xml version="1.0" encoding="ISO-8859-1"?>  

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:html="http://www.w3.org/TR/REC-html40" 
        xmlns:xq="http://metalab.unc.edu/xq/"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns:exist="http://exist.sourceforge.net/NS/exist"
        version="1.0">

<xsl:output method="html"/>  

<!--path for images-->
<xsl:variable name="imgserver">/static/images/luther_jpgs/</xsl:variable>

<xsl:template match="/"> 
  <xsl:element name="div">
    <xsl:attribute name="class">content</xsl:attribute>
    <xsl:apply-templates/> 
  </xsl:element>
</xsl:template>

<xsl:template match="tei:pb">
  <xsl:element name="div">
    <xsl:attribute name="class">page</xsl:attribute>
    <xsl:element name="img">
      <xsl:attribute name="src">
	<xsl:value-of select="$imgserver"/><xsl:value-of select="@facs"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:element>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tei:teiHeader"/>

<!-- print out the content-->
<xsl:template match="TEI//tei:div">
<!-- get everything under this node -->
  <xsl:apply-templates/> 
</xsl:template>

<!-- display the title -->
<xsl:template match="tei:div/tei:head">
  <xsl:element name="h2">
   <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<!-- add links -->
<xsl:template match="tei:ref">
  <xsl:element name="a">
    <xsl:attribute name="href">
      <xsl:value-of select="@target"/>
    </xsl:attribute>
    <xsl:attribute name="target">_blank</xsl:attribute>
    <xsl:apply-templates/>
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

<xsl:template match="tei:bibl/tei:title">
  <xsl:element name="b">
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>  



<xsl:template match="tei:quote">
  <xsl:element name="blockquote">
    <xsl:apply-templates /> 
  </xsl:element>
</xsl:template>

<xsl:template match="tei:list">
  <xsl:element name="ul">
   <xsl:apply-templates/>
  </xsl:element>
</xsl:template>


<!-- convert rend tags to their html equivalents 
    so far, converts: center, italic, smallcaps, bold   -->
<xsl:template match="//*[@rend]">
  <xsl:choose>
    <xsl:when test="@rend='center'">
      <xsl:element name="center">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:when>
    <xsl:when test="@rend='italic'">
      <xsl:element name="i">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:when>
    <xsl:when test="@rend='bold'">
      <xsl:element name="b">
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:when>
    <xsl:when test="@rend='smallcaps'">
      <xsl:element name="span">
        <xsl:attribute name="class">smallcaps</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="tei:lb">
  <xsl:element name="br" />
</xsl:template>


<!--<xsl:template match="tei:pb">-->
  <!--<hr class="pb"/>-->
    <!--<p class="pagebreak">-->
      <!--Page <xsl:value-of select="@n"/>-->
<!--</p>-->
<!--</xsl:template>-->


<!-- generate next & previous links (if present) -->
<!-- note: all div2s, with id, head, and bibl are retrieved in a <siblings> node -->
<xsl:template name="next-prev">

<xsl:element name="table">
  <xsl:attribute name="width">100%</xsl:attribute>

<!-- display articles relative to position of current article -->
<xsl:element name="tr">
<xsl:if test="//prev/@xml:id">
<xsl:element name="th">
    <xsl:text>Previous: </xsl:text>
</xsl:element>
<xsl:element name="td">
 <xsl:element name="a">
   <xsl:attribute name="href">article.php?id=<xsl:value-of
                select="//prev/@xml:id"/></xsl:attribute>
   <xsl:apply-templates select="//prev/tei:head"/>
 </xsl:element><!-- end td -->
<xsl:element name="td"><xsl:apply-templates select="//prev/@type"></xsl:apply-templates></xsl:element><!-- end td -->
<xsl:element name="td"><xsl:apply-templates
select="//prev/tei:docDate"/></xsl:element>
</xsl:element><!-- end td -->
</xsl:if>
</xsl:element><!-- end  prev row --> 

<xsl:element name="tr">
<xsl:if test="//next/@xml:id">
<xsl:element name="th">
    <xsl:text>Next: </xsl:text>
</xsl:element>
<xsl:element name="td">
 <xsl:element name="a">
   <xsl:attribute name="href">article.php?id=<xsl:value-of
                select="//next/@xml:id"/></xsl:attribute>
   <xsl:apply-templates select="//next/tei:head"/>
 </xsl:element><!-- end td -->
<xsl:element name="td"><xsl:apply-templates select="//next/@type"></xsl:apply-templates></xsl:element><!-- end td -->
<xsl:element name="td"><xsl:apply-templates
select="//next/tei:docDate"/></xsl:element>
</xsl:element><!-- end td -->
</xsl:if>
</xsl:element><!-- end  next row --> 


</xsl:element> <!-- table -->
</xsl:template>




</xsl:stylesheet>