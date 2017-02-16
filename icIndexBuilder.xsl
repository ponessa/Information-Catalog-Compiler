<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="index">
<html lang="en">
	<head>
	<meta charset="utf-8"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
	<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
	<meta name="description" content=""></meta>
	<meta name="author" content=""></meta>
	<title>Index - <xsl:value-of select="@char"/> - SIW <xsl:value-of select="@dataTier"/> v<xsl:value-of select="@version"/></title>
	</head>
	<body>
	<div style="padding-left: .25cm; width: 99%">
		<p>
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/a-index', 'Index')">A</a>&#160;&#160;&#160; 
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/b-index', 'Index')">B</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/c-index', 'Index')">C</a>&#160;&#160;&#160; 
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/d-index', 'Index')">D</a>&#160;&#160;&#160; 
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/e-index', 'Index')">E</a>&#160;&#160;&#160; 
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/f-index', 'Index')">F</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/g-index', 'Index')">G</a>&#160;&#160;&#160; 
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/h-index', 'Index')">H</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/i-index', 'Index')">I</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/j-index', 'Index')">J</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/k-index', 'Index')">K</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/l-index', 'Index')">L</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/m-index', 'Index')">M</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/n-index', 'Index')">N</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/o-index', 'Index')">O</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/p-index', 'Index')">P</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/q-index', 'Index')">Q</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/r-index', 'Index')">R</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/s-index', 'Index')">S</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/t-index', 'Index')">T</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/u-index', 'Index')">U</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/v-index', 'Index')">V</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/w-index', 'Index')">W</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/x-index', 'Index')">X</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/y-index', 'Index')">Y</a>&#160;&#160;&#160;
			<a href="#" onclick="moduleTree.showIndexPane('index', '{../@dataTier}/{../@version}/index/z-index', 'Index')">Z</a>		
		</p>
		<hr/>
		<h1 class="page-header"><xsl:value-of select="@char"/></h1>
		<dl>
			<xsl:for-each select="item">
				<xsl:choose>
					<xsl:when test="type='Subject Area'">
						<dt>
							<a href="#" onclick="moduleTree.openById('{subjectArea}/')"><xsl:value-of select="referenceName"/></a> - (<xsl:value-of select="type"/>)
						</dt>
					</xsl:when>
					<xsl:when test="type='Table'">
						<dt>
							<a href="#" onclick="moduleTree.showTable('{subjectArea}/{tbCreator}/{tbName}/')"><xsl:value-of select="referenceName"/></a> - (<xsl:value-of select="type"/> - <xsl:value-of select="tbCreator"/>.<xsl:value-of select="tbName"/>)
						</dt>				
					</xsl:when>
					<xsl:when test="type='Column'">
						<dt>
							<a href="#" onclick="moduleTree.showTable('{subjectArea}/{tbCreator}/{tbName}/')"><xsl:value-of select="referenceName"/></a> - (<xsl:value-of select="type"/> in table <xsl:value-of select="tbCreator"/>.<xsl:value-of select="tbName"/>)
						</dt>
					</xsl:when>
					<xsl:when test="type='Index'">
						<dt>
							<a href="#" onclick="moduleTree.showTable('{subjectArea}/{tbCreator}/{tbName}/')"><xsl:value-of select="referenceName"/></a> - (<xsl:value-of select="type"/> on table <xsl:value-of select="tbCreator"/>.<xsl:value-of select="tbName"/>)
						</dt>
					</xsl:when>
					<xsl:when test="type='Relationship'">
						<dt>
							<a href="#" onclick="moduleTree.showTable('{subjectArea}/{tbCreator}/{tbName}/')"><xsl:value-of select="referenceName"/></a> - (<xsl:value-of select="type"/> on table <xsl:value-of select="tbCreator"/>.<xsl:value-of select="tbName"/>
							with <a href="#" onclick="moduleTree.showTable('{subjectArea}/{parentCreator}/{parentName}/')"><xsl:value-of select="parentCreator"/>.<xsl:value-of select="parentName"/></a>)
						</dt>
					</xsl:when>
					<xsl:when test="type='View'">
						<dt>
							<a href="#" onclick="moduleTree.showTable('{subjectArea}/{parentCreator}/{parentName}/')"><xsl:value-of select="referenceName"/></a> - (<xsl:value-of select="type"/> - <xsl:value-of select="tbCreator"/>.<xsl:value-of select="tbName"/>
							on table <a href="#" onclick="moduleTree.showTable('{subjectArea}/{parentCreator}/{parentName}/')"><xsl:value-of select="parentCreator"/>.<xsl:value-of select="parentName"/></a>)
						</dt>
					</xsl:when>
				</xsl:choose>
				<dd><xsl:value-of select="remarks"/></dd>
			</xsl:for-each>	
		</dl>
	</div>
	</body>
</html>
	</xsl:template>
	
</xsl:stylesheet>
