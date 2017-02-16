<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > <!-- xmlns:fn="http://www.w3.org/2005/xpath-functions" -->
	<xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="DOCUMENT">	
		<DOCUMENT  dataTier="{@dataTier}" version="{@version}">		
			<xsl:apply-templates></xsl:apply-templates>		
		</DOCUMENT>
	</xsl:template>

	<xsl:key name="indexChar" match="item" use="referenceKey" />
	
	<xsl:template match="index">	
		<!-- xsl:message terminate="no">In item template</xsl:message -->	
		<xsl:for-each select="item[count(. | key('indexChar', referenceKey)[1]) = 1]">
			<index char='{referenceKey}'>
			<xsl:for-each select="key('indexChar', referenceKey)">
				<item>
					<type><xsl:value-of select="type"/></type>
					<referenceName><xsl:value-of select="referenceName"/></referenceName>
					<subjectArea><xsl:value-of select="subjectArea"/></subjectArea>
					<tbCreator><xsl:value-of select="tbCreator"/></tbCreator>
					<tbName><xsl:value-of select="tbName"/></tbName>
					<remarks><xsl:value-of select="remarks"/></remarks>
					<parentCreator><xsl:value-of select="parentCreator"/></parentCreator>
					<parentName><xsl:value-of select="parentName"/></parentName>	
				</item>	
			</xsl:for-each>
			</index>
		</xsl:for-each>	
	</xsl:template>	
	
</xsl:stylesheet>