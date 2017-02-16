<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="SUBJECTAREA">
<html lang="en">
	<head>
	<meta charset="utf-8"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
	<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
	<meta name="description" content=""></meta>
	<meta name="author" content=""></meta>
	<title><xsl:value-of select="SA_NAME"/> - SIW <xsl:value-of select="@dataTier"/> v<xsl:value-of select="@version"/></title>
	<script type="text/javascript" class="init">	

	$(document).ready(function() {
		$('#tbls-<xsl:value-of select="@dataTier"/>-<xsl:value-of select="translate(@version,'.','-')"/>-<xsl:value-of select="normalize-space(translate(SA_NAME,' ','_'))"/>').DataTable({
			"lengthMenu" : [ [ 20, 50, 75, 100, -1 ], [ 20, 50, 75, 100, "All" ] ],
			"pageLength" : 50
		});
	});

	</script>
	</head>
	<body>
	<div style="padding-left: .25cm; width: 99%">
		<h1 class="page-header"><xsl:value-of select="SA_NAME"/> - SIW <xsl:value-of select="@dataTier"/> v<xsl:value-of select="@version"/></h1>
		<p class="dtk-intro"><xsl:value-of select="SA_DESCRIPTION"/></p>
		<p class="dtk-intro">The table below contains the tables that make up the SIW <xsl:value-of select="@dataTier"/> v<xsl:value-of select="@version"/> <xsl:value-of select="SA_NAME"/> subject area.To find the object you&apos;re interested in, use the tree to the left...or use the quick links below.  </p>

		<table id="tbls-{@dataTier}-{translate(@version,'.','-')}-{normalize-space(translate(SA_NAME,' ','_'))}"
			class="table table-striped table-hover table-condensed table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Name</th>
					<th>Description</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Name</th>
					<th>Description</th>
				</tr>
			</tfoot>
			<tbody>
			<xsl:for-each select="SCHEMA">
				<xsl:for-each select="TABLES/TABLE">
				<tr>
					<!-- td class='text-right'><xsl:value-of select="position()"/></td -->
					<td><a href="javascript:moduleTree.openById('{../../../SA_NAME}/{normalize-space(../../SCHEMA_NAME)}/{normalize-space(NAME)}/');"><xsl:value-of select="normalize-space(../../SCHEMA_NAME)"/>.<xsl:value-of select="normalize-space(NAME)"/></a></td>
					<td><xsl:value-of select="normalize-space(COMMENTS)"/></td>
				</tr>
				</xsl:for-each>
			</xsl:for-each>	
			</tbody>
		</table>

	</div>
	</body>
</html>
	</xsl:template>
	
</xsl:stylesheet>
