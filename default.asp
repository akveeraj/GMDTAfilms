<!--#include virtual="/includes.pl"-->  

<%
// ---------------------------------------------------------------------------------------------------------------------------------------------
// ' Toggle Output
// ---------------------------------------------------------------------------------------------------------------------------------------------
  
	o_Query  = fw_Query
	o_Query  = UrlDecode( o_Query )
	o_Nav    = ParseCircuit( "nav", o_Query )
	
  If fw_OutPut = 0 or fw_OutPut = "" Then

// ---------------------------------------------------------------------------------------------------------------------------------------------
%>

<!DOCTYPE html>
<html>
<head>
<title>GMDTA Films - Great Minds Don't Think Alike</title>

<meta http-equiv='Content-Type' content='text/html;charset-UTF-8'/>
<meta name='Robots'      content='noimageindex, nomediaindex'/>
<meta name='Description' content=''/>
<meta name='Keywords'    content=''/>
<meta name='Server'      content='192.168.0.22'/>
<meta name='Generator'   content=''/>


<link href='/application/library/stylesheets/styles.css'    rel='stylesheet' type='text/css'/>

<script src="/application/library/javascript/prototype.js" type="text/javascript"></script>
<script src="/application/library/javascript/scriptaculous.js" type="text/javascript"></script>
<script src="/application/library/javascript/prototip.js" type="text/javascript"></script>
<script src="/application/library/javascript/functions.js" type="text/javascript"></script>


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55362275-3', 'auto');
  ga('send', 'pageview');

</script>

</head>
<body>

<script type='text/javascript' language='javascript'>
  document.observe("dom:loaded", function(){
	PreLoadTemplate();
	});
</script>

<!--#include virtual="/application/content/template/tpl_header.pl"-->

<div class='mainbody'>
  
	<!--#include virtual="/application/content/template/tpl_toplink.pl"-->
	
	<% If fw_File = "" OR fw_File = "index" Then %><div class='siteheader_long'><img src='/application/library/media/welcometext.jpg'/></div><% Else %><% End If %>
	
	
	<div class='tablerow' style='margin-left:2px;'>
		<% If o_Nav = "" Then %><div class='tablecell' style='width:160px;'><!--#include virtual="/application/content/dsp_leftcontent.pl"--></div><% End If %>
	  <div class='tablecell' style='width:610px;'>
		<% Call LoadCircuit ( fw_Circuit )%>
		<span class='footspace'></span>
		</div>
	</div>
	
	<!--#include virtual="/application/content/template/tpl_bottomlinks.pl"-->

</div>

<!--#include virtual="/application/content/template/tpl_footer.pl"-->









</body>
</html>

<%
// ---------------------------------------------------------------------------------------------------------------------------------------------

  Else
	  Call LoadCircuit( fw_Circuit )
	End If 
	
// ---------------------------------------------------------------------------------------------------------------------------------------------
%>


