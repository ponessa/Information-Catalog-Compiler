<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > <!-- xmlns:fn="http://www.w3.org/2005/xpath-functions" -->
	<xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="DOCUMENT">
		<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />	
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	
<DOCUMENT  dataTier="{@dataTier}" version="{@version}">
	<index>
		<xsl:for-each select="index/item">
				<xsl:sort select="referenceName"/>
				<xsl:if test="referenceName[text() != '']">
	<item>
		<type><xsl:value-of select="type"/></type>
		<referenceName><xsl:value-of select="referenceName"/></referenceName>
		<referenceKey><xsl:value-of select="translate(substring(referenceName,1,1),$lowercase,$uppercase)"/></referenceKey>
		<!-- Note: Not available until XSLT 2.0: xsl:value-of select="fn:lower-case(referenceName)"/ -->
		<subjectArea><xsl:value-of select="subjectArea"/></subjectArea>
		<tbCreator><xsl:value-of select="tbCreator"/></tbCreator>
		<tbName><xsl:value-of select="tbName"/></tbName>
		<remarks><xsl:value-of select="remarks"/></remarks>
		<parentCreator><xsl:value-of select="parentCreator"/></parentCreator>
		<parentName><xsl:value-of select="parentName"/></parentName>	
	</item>	
				</xsl:if>
		</xsl:for-each>
	</index>
</DOCUMENT>
	</xsl:template>
</xsl:stylesheet>