<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="TABLE">
<html lang="en">
	<head>
	<meta charset="utf-8"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
	<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
	<meta name="description" content=""></meta>
	<meta name="author" content=""></meta>
	<title><xsl:value-of select="@dataTier"/> v<xsl:value-of select="@version"/>&#160;<xsl:value-of select="normalize-space(TYPE)"/>&#160;<xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/></title>
	<script type="text/javascript" class="init">	

	$(document).ready(function() {
		$('#defs-<xsl:value-of select="@dataTier"/>-<xsl:value-of select="translate(@version,'.','-')"/>-<xsl:value-of select="normalize-space(@SCHEMA)"/>-<xsl:value-of select="normalize-space(NAME)"/>').DataTable({
			"lengthMenu" : [ [ 10, 15, 20, 25, 40, 50, -1 ], [ 10, 15, 20, 25, 40, 50, "All" ] ],
			"pageLength" : 15
		});

		$('#schema-<xsl:value-of select="@dataTier"/>-<xsl:value-of select="translate(@version,'.','-')"/>-<xsl:value-of select="normalize-space(@SCHEMA)"/>-<xsl:value-of select="normalize-space(NAME)"/>').DataTable({
			"lengthMenu" : [ [ 10, 15, 20, 25, 40, 50, -1 ], [ 10, 15, 20, 25, 40, 50, "All" ] ],
			"pageLength" : 15
		});
	});

	</script>
	</head>
	<body>
	<div style="padding-left: .25cm; width: 98%">
		<a name="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-top"></a>
		<h2 class="page-heading">
			<xsl:choose>
				<xsl:when test="normalize-space(TYPE) = 'T' ">
					Table
				</xsl:when>
				<xsl:when test="TYPE = 'V' ">
					View
				</xsl:when>
				<xsl:when test="TYPE = 'X' ">
					Auxiliary table
				</xsl:when>
				<xsl:when test="TYPE = 'P' ">
					XML column table
				</xsl:when>
				<xsl:when test="TYPE = 'M' ">
					Materialized query table
				</xsl:when>
				<xsl:when test="TYPE = 'G' ">
					Global temporary table
				</xsl:when>	
				<xsl:when test="uniqueRule = 'C' ">
					Clone table
				</xsl:when>	
				<xsl:when test="uniqueRule = 'A' ">
					Alias
				</xsl:when>	
				<xsl:otherwise>
					Unknown Type (<xsl:value-of select="TYPE"/>) 
				</xsl:otherwise>	
			</xsl:choose>			
			&#160;<xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/></h2>
		<p>
			<b>In Subject Area: </b> <xsl:value-of select="normalize-space(@SA_NAME)"/>
		</p>
		<p><xsl:value-of select="COMMENTS"/></p>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<b>Table Attributes</b> 
				<a	href="javascript:toggleFolder('{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-attributes');">
					<span id="img_{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-attributes"
					class="glyphicon glyphicon-triangle-bottom"></span>
				</a>
			</div>
			<div class="panel-body" id="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-attributes" style="visibility: visible; display: block;">
				<table id="stats"
					class="table table-striped table-hover table-condensed table-bordered"
					cellspacing="0" width="100%">
					<!--caption>
						<b><i>Table Attributes</i></b>
					</caption-->
					<tbody>
						<tr>
							<td>
								<b>Cardinality</b><sup> <font size="-2"> <a	href="javascript:pop('Cardinality');">?</a>	</font>	</sup>
							</td>
							<td align="right"><xsl:value-of select='format-number(CARD,"###,###,###,##0")'/></td>
							<td>
								<b># Pages</b><sup> <font size="-2"> <a href="javascript:pop('NPages');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select="PAGES"/></td>
							<td><b>DB Name</b></td>
							<td><xsl:value-of select="DBNAME"/></td>
						</tr>
						<tr>
							<td>
								<b># Columns</b><sup> <font size="-2"> <a href="javascript:pop('NColumns');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select="COLCOUNT"/></td>
							<td>
								<b>Pct. Pages</b><sup> <font size="-2"> <a href="javascript:pop('PctPages');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select="PCTPAGE"/></td>
							<td><b>TS Name</b></td><td><xsl:value-of select="TSNAME"/></td>
						</tr>
						<tr>
							<td>
								<b># Key Columns</b><sup> <font size="-2"> <a href="javascript:pop('NKeyColumns');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select="KEYCOLUMNS"/></td>
							<td>
								<b># Parents</b><sup> <font size="-2"> <a href="javascript:pop('NParents');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select="PARENTS"/></td>
							<td>
								<b>Update Method</b><sup> <font size="-2"> <a href="javascript:pop('UpdateMethod');">?</a></font></sup>
							</td>
							<td><xsl:value-of select="UPDATEMETHOD"/>
							</td>>
						</tr>
						<tr>
							<td>
								<b>Record Length</b><sup> <font size="-2"> <a href="javascript:pop('RecordLength');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select='format-number(RECLENGTH,"###,###,##0")'/></td>
							<td>
								<b># Children</b><sup> <font size="-2"> <a href="javascript:pop('NChildren');">?</a></font></sup>
							</td>
							<td align="right"><xsl:value-of select="CHILDREN"/></td>
							<td>
								<b>Update Frequency</b><sup> <font size="-2"> <a href="javascript:pop('UpdateFrequency');">?</a></font></sup>
							</td>
							<td><xsl:value-of select="UPDATEFREQUENCY"/>
							</td>
						</tr>					
					</tbody>
				</table>
				<p>
					<b>Created: </b><xsl:value-of select="CREATEDTS"/> <br /> 
					<b>Last Altered: </b><xsl:value-of select="ALTEREDTS"/><br /> 
					<b>Last Statistics: </b><xsl:value-of select="STATSTS"/>
				</p>
			</div>
		</div>
		<p>
			<b>See:</b> <br />
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-schema"><b>Schema</b></a>
			&#160;&#160;&#160;<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-indices"><b>Indices</b></a>
			&#160;&#160;&#160;<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-relationships"><b>Relationships</b></a>
			&#160;&#160;&#160;<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-views"><b>Views</b>
			</a>
		</p>		
		
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<b>Columns</b> - <small><xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/> </small>
				<a href="javascript:toggleFolder('{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-columns');">
					<span id="img_{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-columns" class="glyphicon glyphicon-triangle-bottom"></span>
				</a>
			</div>
			<div class="panel-body" id="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-columns" style="visibility: visible; display: block;">
				<table id="defs-{@dataTier}-{translate(@version,'.','-')}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}" class="table table-striped table-hover table-condensed table-bordered"	cellspacing="0">
					<thead>
						<tr>
							<th class='text-right'>#</th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th class='text-right'>#</th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</tfoot>
					<tbody>
					<xsl:for-each select="COLUMNS/COLUMN">
						<tr>
							<td class='text-right'><xsl:value-of select="COLNO"/></td>
							<td><xsl:value-of select="NAME"/></td>
							<td><xsl:value-of select="COMMENTS | REMARKS"/></td>
						</tr>
					</xsl:for-each>	
					</tbody>	
				</table>
			</div>
		</div>	
		
		<a name="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-schema">
			<!-- -->
		</a>
		<p>
			<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-top">Top</a>
		</p>	
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<b>Schema</b> - <small><xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/> </small><a
					href="javascript:toggleFolder('{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-schema');">
					<span id="img_{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-schema"
					class="glyphicon glyphicon-triangle-bottom"></span>
				</a>
			</div>
			<div class="panel-body" id="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-schema"
				style="visibility: visible; display: block;">
				<table id="schema-{@dataTier}-{translate(@version,'.','-')}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}"
					class="table table-striped table-hover table-condensed table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class='text-right'>#</th>
							<th>Name</th>
							<th>Type <sup> <font size="-2"> <a href="javascript:pop('Datat Type');">?</a></font></sup></th>
							<th class='text-right'>Length <sup> <font size="-2"> <a href="javascript:pop('Length');">?</a></font></sup></th>
							<th class='text-right'>Scale <sup> <font size="-2"> <a href="javascript:pop('Scale');">?</a></font></sup></th>
							<th class='text-center'>Nulls <sup> <font size="-2"> <a href="javascript:pop('Nulls');">?</a></font></sup></th>
							<th class='text-right'>Key Seq <sup> <font size="-2"> <a href="javascript:pop('Key Seq');">?</a></font></sup></th>
							<th class='text-right'>Cardinality <sup> <font size="-2"> <a href="javascript:pop('Col Cardinality');">?</a></font></sup></th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th class='text-right'>#</th>
							<th>Name</th>
							<th>Type <sup> <font size="-2"> <a href="javascript:pop('Datat Type');">?</a></font></sup></th>
							<th class='text-right'>Length <sup> <font size="-2"> <a href="javascript:pop('Length');">?</a></font></sup></th>
							<th class='text-right'>Scale <sup> <font size="-2"> <a href="javascript:pop('Scale');">?</a></font></sup></th>
							<th class='text-center'>Nulls <sup> <font size="-2"> <a href="javascript:pop('Nulls');">?</a></font></sup></th>
							<th class='text-right'>Key Seq <sup> <font size="-2"> <a href="javascript:pop('Key Seq');">?</a></font></sup></th>
							<th class='text-right'>Cardinality <sup> <font size="-2"> <a href="javascript:pop('Col Cardinality');">?</a></font></sup></th>
						</tr>
					</tfoot>
					<tbody>
						<xsl:for-each select="COLUMNS/COLUMN">
						<tr>
							<td class='text-right'><xsl:value-of select="COLNO"/></td>
							<td><xsl:value-of select="NAME"/></td>
							<td><xsl:value-of select="TYPE"/></td>
							<td class='text-right'><xsl:value-of select="LENGTH"/></td>
							<td class='text-right'><xsl:value-of select="SCALE"/></td>
							<td class='text-center'><xsl:value-of select="NULLS"/></td>
							<td class='text-right'><xsl:value-of select="KEYSEQ"/></td>
							<td class='text-right'><xsl:value-of select='format-number(CARD,"###,###,###,##0")'/></td>
						</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>											
		</div>
	
		<a name="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-indices">
			<!-- -->
		</a>
		<p>
			<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-top">Top</a>
		</p>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<b>Indices</b> - <small><xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/>  </small><a
					href="javascript:toggleFolder('{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-indices');">
					<span id="img_{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-indices"
					class="glyphicon glyphicon-triangle-bottom"></span>
				</a>
			</div>
			<div class="panel-body" id="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-indices"
				style="visibility: visible; display: block;">
				<xsl:choose>
					<xsl:when test="count(INDICES/index)=0"> 
						<p><b>No indicies</b></p>
					</xsl:when>
					<xsl:otherwise>
						<table id="indices"
						class="table table-striped table-hover table-condensed table-bordered" 	cellspacing="0">
						
						<xsl:for-each select="INDICES/index">	
							<tr bgcolor="#CCCCFF" class="TableHeadingColor">
								<td colspan="4"><b><xsl:value-of select="position()"/>. <xsl:value-of select="name"/></b> - 
									<xsl:choose>
										<xsl:when test="uniqueRule = 'C' ">
											Unique to enforce the uniqueness of a UNIQUE constraint or hash key columns
										</xsl:when>
										<xsl:when test="uniqueRule = 'D' ">
											Duplicates Allowed
										</xsl:when>
										<xsl:when test="uniqueRule = 'U' ">
											Unique
										</xsl:when>
										<xsl:when test="uniqueRule = 'P' ">
											Primary key index (Unique)
										</xsl:when>
										<xsl:when test="uniqueRule = 'N' ">
											Unique where NOT NULL 
										</xsl:when>	
										<xsl:when test="uniqueRule = 'R' ">
											Unique to enforce the uniqueness of a non-primary parent key
										</xsl:when>	
										<xsl:when test="uniqueRule = 'G' ">
											Unique to enforce the uniqueness of values in a column defined as ROWID GENERATED BY DEFAULT
										</xsl:when>	
										<xsl:when test="uniqueRule = 'X' ">
											Unique to enforce the uniqueness of values in a column that is used to identify or find XML values associated with a specific row
										</xsl:when>	
										<xsl:otherwise>
											Unknown unique rule (<xsl:value-of select="uniqueRule"/>) 
										</xsl:otherwise>	
									</xsl:choose>								
								</td>
							</tr>
							<tr valign="Top" bgcolor="white" class="TableRowColor">
								<td >Clustering: <xsl:value-of select="clustering"/> <br />
								                Clustered: <xsl:value-of select="clustered"/> <br /> 
								                <b>Cluster Ratio: <xsl:value-of select="clusterRatio"/> 
								                	<sup> <font size="-2"> <a href="javascript:pop('Clustered');">?</a> </font></sup> 
								                </b>
								</td>
								<td>1st Key Cardinality: <xsl:value-of select="firstKeyCard"/> <br />
								Full Key Cardinality: <xsl:value-of select="fullKeyCard"/> <br />
								# of active leaf pages: <xsl:value-of select="nLeaf"/> <br />
								# levels in the index tree: <xsl:value-of select="nLevels"/> <br />
								</td>
								<td>Space: <xsl:value-of select="space"/> <br />
								Avg Key Len: <xsl:value-of select="avgKeyLen"/> <br />
								IO Factor: <xsl:value-of select="ioFactor"/> <br />
								Prefetch Factor: <xsl:value-of select="prefetchFactor"/> <br />
								</td>								
								<td >Created: <xsl:value-of select="createdTS"/> <br />
								                Last Statistics: <xsl:value-of select="statsTS"/></td>
							</tr>
							<tr bgcolor="#CCCCFF" class="TableSubHeadingColor">
								<td><b>Col Name</b></td>
								<td align="right"><b>Col #</b></td>
								<td align="right"><b>Col Seq</b></td>
								<td><b>Ordering</b></td>
							</tr>	
							<xsl:for-each select="columns/column">
								<tr valign="Top" bgcolor="white" class="TableRowColor">
									<td><xsl:value-of select="name"/></td>
									<td align="right"><xsl:value-of select="no"/></td>
									<td align="right"><xsl:value-of select="seq"/></td>
									<td>A</td>
								</tr>
							</xsl:for-each>						
						</xsl:for-each>
						
						</table>
					</xsl:otherwise>			
				</xsl:choose>
			</div>	
		</div>	
		
		<a name="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-relationships">
			<!-- -->
		</a>
		<p>
			<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-top">Top</a>
		</p>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<b>Relationships</b> - <small><xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/>  </small><a
					href="javascript:toggleFolder('{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-relationships');">
					<span id="img_{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-relationships"
					class="glyphicon glyphicon-triangle-bottom"></span>
				</a>
			</div>
			<div class="panel-body" id="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-relationships"
				style="visibility: visible; display: block;">
				<xsl:choose>
					<xsl:when test="count(RELATIONSHIPS/RELATIONSHIP)=0"> 
						<p><b>No relationships</b></p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="RELATIONSHIPS/RELATIONSHIP">	
							<p>
								<xsl:value-of select="RELNAME"></xsl:value-of> with <a href="javascript:moduleTree.showTable('{normalize-space(REFTBCREATOR)}/{normalize-space(REFTBNAME)}/');"><b><xsl:value-of select="normalize-space(REFTBCREATOR)"/>.<xsl:value-of select="normalize-space(REFTBNAME)"/></b></a>
								<br></br>Delete Rule: <xsl:value-of select="DELETERULE"/> 
								<br></br>Created: <xsl:value-of select="TIMESTAMP"/>								
							</p>
							<table class="table table-striped table-hover table-condensed table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th class='text-right'>#</th>
										<th>Column Name</th>
										<th class='text-right'>Column Sequence</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="COLUMNS/COLUMN">	
									<tr>
										<!--  td class='text-right'><xsl:value-of select="position()"/></td-->
										<td class='text-right'><xsl:value-of select="COLNO"/></td>
										<td><xsl:value-of select="COLNAME"/></td>
										<td class='text-right'><xsl:value-of select="COLSEQ"/></td>
									</tr>
									</xsl:for-each>	
								</tbody>
							</table>							
						</xsl:for-each>
					</xsl:otherwise>			
				</xsl:choose>
			</div>	
		</div>
		
		<a name="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-views">
			<!-- -->
		</a>
		<p>
			<a href="#{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-top">Top</a>
		</p>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<b>Views</b> - <small><xsl:value-of select="normalize-space(@SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/>  </small><a
					href="javascript:toggleFolder('{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-views');">
					<span id="img_{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-views"
					class="glyphicon glyphicon-triangle-bottom"></span>
				</a>
			</div>
			<div class="panel-body" id="{@dataTier}-{@version}-{normalize-space(@SCHEMA)}-{normalize-space(NAME)}-views"
				style="visibility: visible; display: block;">
				<xsl:choose>
					<xsl:when test="count(VIEWS/VIEW)=0"> 
						<p><b>No views</b></p>
					</xsl:when>
					<xsl:otherwise>
						<ol>
							<xsl:for-each select="VIEWS/VIEW">	
							<li><xsl:value-of select="normalize-space(SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/>
								<a href="javascript:processViewSql('{../../@dataTier}-{../../@version}-{normalize-space(SCHEMA)}-{normalize-space(NAME)}-viewsql', '{normalize-space(SCHEMA)}', '{normalize-space(NAME)}', '{../../@dataTier}');">
									<span id="img_{../../@dataTier}-{../../@version}-{normalize-space(SCHEMA)}-{normalize-space(NAME)}-viewsql" class="glyphicon glyphicon-triangle-right"></span>
								</a>
								<div id="{../../@dataTier}-{../../@version}-{normalize-space(SCHEMA)}-{normalize-space(NAME)}-viewsql" style="visibility: hidden; display: none;">
									<div id="div_{../../@dataTier}-{../../@version}-{normalize-space(SCHEMA)}-{normalize-space(NAME)}-viewsql"><img src="images/loader_sm.gif"/> - Retieving view for <xsl:value-of select="../../@dataTier"/>-<xsl:value-of select="../../@version"/> <xsl:value-of select="normalize-space(SCHEMA)"/>.<xsl:value-of select="normalize-space(NAME)"/>...</div>
								</div>
							</li>	
							</xsl:for-each>
						</ol>
					</xsl:otherwise>			
				</xsl:choose>
			</div>	
		</div>						
	
								
	</div>	
	</body>
</html>
	</xsl:template>
	
</xsl:stylesheet>
