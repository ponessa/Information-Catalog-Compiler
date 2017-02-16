<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
<xsl:template match="document">
<html lang="en">
	<head>
		<meta charset="utf-8"></meta>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
		<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
		<meta name="description" content=""></meta>
		<meta name="author" content=""></meta>
		<title><xsl:value-of select="@dataTier"/> v<xsl:value-of select="@version"/>&#160;PDA View to Table Map</title>
		<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/dojo/1.9.1/dojo/resources/dojo.css"></link>	
		<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/dojo/1.9.1/dijit/themes/claro/claro.css"></link>	
		<link rel="stylesheet" href="//bms3.sby.ibm.com/siwIc/css/jsdoc_original.css"></link>	
		<link rel="stylesheet" href="//bms3.sby.ibm.com/siwIc/css/site_original.css"></link>	
		<link rel="stylesheet" href="//bms3.sby.ibm.com/siwIc/css/icc.css"></link>	
		
		<meta charset="utf-8"></meta>
		<meta name="viewport" content="width=device-width, initial-scale=1"></meta>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></link>	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	

		<!-- Start bootstrap datatable -->	
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css"></link>	

		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"></script>
		
		<script language="javascript" src="//bms3.sby.ibm.com/dp.SyntaxHighlighter/js/shCore.js"></script>
		<script language="javascript" src="//bms3.sby.ibm.com/dp.SyntaxHighlighter/js/shBrushSql.js"></script>

		<link type="text/css" rel="stylesheet" href="//bms3.sby.ibm.com/dp.SyntaxHighlighter/css/SyntaxHighlighter.css"></link>	
		<link rel="stylesheet" href="//bms3.sby.ibm.com/siwIc/scripts/syntaxhighlighter/css/shCore.css"></link>	
		<link rel="stylesheet" href="//bms3.sby.ibm.com/siwIc/scripts/syntaxhighlighter/css/shThemeDefault.css"></link>			
		<script type="text/javascript" class="init">	
<xsl:text disable-output-escaping="yes">
		$(document).ready(function() {
			$('#defs-views').DataTable({
				"lengthMenu" : [ [ 10, 15, 20, 25, 40, 50, -1 ], [ 10, 15, 20, 25, 40, 50, "All" ] ],
				"pageLength" : 15
			});
		});
		
		function createCORSRequest(method, url){
			var xhr = new XMLHttpRequest();
			if ("withCredentials" in xhr){
				xhr.open(method, url, true);
			} else if (typeof XDomainRequest != "undefined"){
				xhr = new XDomainRequest();
				xhr.open(method, url);
			} else {
				xhr = null;
			}
			return xhr;
		}	
		
		function toggleFolder(folderID) {
			var folder = document.getElementById(folderID);
			var img = document.getElementById('img_'+folderID);
			if (folder != null) {
				if ( folder.style.visibility == 'hidden' ) {
					folder.style.visibility = 'visible';
					folder.style.display = 'block';
					img.className = "glyphicon glyphicon-triangle-bottom";
				} else {
					folder.style.visibility = 'hidden';
					folder.style.display = 'none';
					img.className = "glyphicon glyphicon-triangle-right";
				}
			}
		}		
			
		function processViewSql(/*String*/targetId, /*String*/viewCreator, /*String*/viewNm, /*String*/dataTier) {
			var serviceNm = "getViewSql";
			if (dataTier=="ODS-ADL") serviceNm = "getPdaViewSql";
			var targetDivision = document.getElementById("div_"+targetId); /* retrieve the target division HTML element */
			var daasUrl = "https://bms3.sby.ibm.com/bms/iw/rest/?id="+serviceNm+"&amp;s=DaaS&amp;f=fixed&amp;mime=text/html&amp;creator="+viewCreator+"&amp;name="+viewNm;
			var load = false;
			toggleFolder(targetId);
			var img = document.getElementById("img_"+targetId); /* retrieve the open/close image */
			if (img.loaded===undefined || img.loaded=="false") {
					load = true;
					img.loaded="true";
			}
			else return;	
			
			/* set up and call the RESTful service - accounting for the fact the call is across domains */
			var request = createCORSRequest('get', daasUrl);
			if (request) {
				/* Define function to handle the RESTful servie's results */
				request.onload = function(){
					var targetDivision = document.getElementById("div_"+targetId); /* retrieve the target division HTML element */
					if (request.readyState == 4) { //request finished and response is ready
						if (request.status == 200) { //OK		
							var requestFormat = createCORSRequest('post', "https://bms3.sby.ibm.com/bms/iw/rest/");
							requestFormat.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
							requestFormat.onload = function(){
								var targetDivision = document.getElementById("div_"+targetId); /* retrieve the target division HTML element */
								if (requestFormat.readyState==4 &amp;&amp; requestFormat.status == 200) {
									targetDivision.innerHTML = '&lt;pre name="code_'+targetId + '" class="sql"&gt;'+requestFormat.responseText+'&lt;/pre&gt;';
									dp.SyntaxHighlighter.ClipboardSwf = '//bms3.sby.ibm.com/dp.SyntaxHighlighter/js/clipboard.swf';
									dp.SyntaxHighlighter.HighlightAll('code_'+targetId);
								}
								else targetDivision.innerHTML = "&lt;p&gt;&lt;img src='images/sad-face.png' alt='sad face'&gt;&amp;nbsp;&amp;nbsp;Service failed for view. Request ready state="+request.status+".&lt;/img&gt;&lt;/p&gt;";
							};
							requestFormat.send("s=FormatSql&amp;sql="+request.responseText);								
						}
						else targetDivision.innerHTML = "&lt;p&gt;&lt;img src='images/sad-face.png' alt='sad face'&gt;&amp;nbsp;&amp;nbsp;Service failed for view. Request ready state="+request.status+".&lt;/img&gt;&lt;/p&gt;";
					}
					else {
						targetDivision.innerHTML = "&lt;p&gt;&lt;img src='images/sad-face.png' alt='sad face'&gt;&amp;nbsp;&amp;nbsp;Service failed for view. Request ready state="+request.status+".&lt;/img&gt;&lt;/p&gt;";
					}
				};
				request.send();
			}	
			else {
				targetDivision.innerHTML = "&lt;p&gt;&lt;img src='images/sad-face.png' alt='sad face'&gt;&amp;nbsp;&amp;nbsp;Service failed for view. ;&lt;/p&gt;";
			}				
		}	
</xsl:text>	
		</script>
	</head>
	<body>
		<table id="def-views" class="table table-striped table-hover table-condensed table-bordered" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th class="text-right">#</th>
					<th>View Name</th>
					<th class="text-right">Table #</th>
					<th>Base table(s)</th>
				</tr>
			</thead>
			<tbody>
			<xsl:for-each select="view">
				<xsl:variable name="viewNum" select="position()"></xsl:variable>
				<xsl:choose>
					<xsl:when test="@tableCnt=0">
						<tr>
							<td><xsl:value-of select="$viewNum"></xsl:value-of></td>
							<td><xsl:value-of select="schema"></xsl:value-of>.<xsl:value-of select="name"></xsl:value-of>
								<br/>
								<a href="javascript:processViewSql('{../@dataTier}-{../@version}-{@schema}-{@name}-viewsql', '{@schema}', '{@name}', '{../@dataTier}');">
									<span id="img_{../@dataTier}-{../@version}-{@schema}-{@name}-viewsql" class="glyphicon glyphicon-triangle-right"></span>
								</a>
								<div id="{../@dataTier}-{../@version}-{@schema}-{@name}-viewsql" style="visibility: hidden; display: none;">
									<div id="div_{../@dataTier}-{../@version}-{@schema}-{@name}-viewsql">
										<img src="images/loader_sm.gif"></img> - Retrieving view for <xsl:value-of select="../@dataTier"/> v<xsl:value-of select="../@version"/> <xsl:value-of select="@schema"/>.<xsl:value-of select="@name"/>...
									</div>
								</div>
							</td>
							<td>0</td>
							<td>Unknown</td>
						</tr>
					</xsl:when>
					<!-- xsl:when test="@tableCnt=1">
					</xsl:when -->
					<xsl:otherwise>
						<xsl:for-each select="table">
							<tr>
							<xsl:if test="position()=1">
								<td rowspan="{../@tableCnt}"><xsl:value-of select="$viewNum"></xsl:value-of></td>
								<td rowspan="{../@tableCnt}"><xsl:value-of select="../@schema"></xsl:value-of>.<xsl:value-of select="../@name"></xsl:value-of>
								<br/>
								<a href="javascript:processViewSql('{../../@dataTier}-{../../@version}-{../@schema}-{../@name}-viewsql', '{../@schema}', '{../@name}', '{../../@dataTier}');">
									<span id="img_{../../@dataTier}-{../../@version}-{../@schema}-{../@name}-viewsql" class="glyphicon glyphicon-triangle-right"></span>
								</a>
								<div id="{../../@dataTier}-{../../@version}-{../@schema}-{../@name}-viewsql" style="visibility: hidden; display: none;">
									<div id="div_{../../@dataTier}-{../../@version}-{../@schema}-{../@name}-viewsql">
										<img src="images/loader_sm.gif"></img> - Retrieving view for <xsl:value-of select="../../@dataTier"/> v<xsl:value-of select="../../@version"/> <xsl:value-of select="../@schema"/>.<xsl:value-of select="../@name"/>...
									</div>
								</div>
								</td>
							</xsl:if>
							<td><xsl:value-of select="@cnt"/></td>
							<td>
								<a target="_blank" href="https://bms3.sby.ibm.com/siwIc/?qs={../../@dataTier}/{../../@version}/{@schema}/{@name}"><xsl:value-of select="@schema"/>.<xsl:value-of select="@name"/></a>
							</td>
							</tr>
						</xsl:for-each>

					</xsl:otherwise>
				</xsl:choose>	
			</xsl:for-each>
			</tbody>
		</table>	
	</body>
</html>
</xsl:template>

</xsl:stylesheet>