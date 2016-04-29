<!--#include virtual="/includes.pl"-->

<%
// ---------------------------------------------------------------------------------------------------------------------------
// Define Variables
// ---------------------------------------------------------------------------------------------------------------------------

  o_Query = fw_Query
	
	o_ErrorCode = ParseCircuit( "errorcode", o_Query )
	o_Sent      = ParseCircuit( "sent", o_Query )
	o_Element   = ParseCircuit( "element", o_Query )

// ---------------------------------------------------------------------------------------------------------------------------
// Generate Error Messages
// ---------------------------------------------------------------------------------------------------------------------------

  Select Case( o_ErrorCode )
	  
		Case(1)
 	    ShowError    = 1
			ErrorMessage = "Error:&nbsp;&nbsp;Please enter your Name" 
		
		Case(2)
		  ShowError    = 1
			ErrorMessage = "Error:&nbsp;&nbsp;Please enter your Company Name"
	  
		Case(3)
      ShowError    = 1
		  ErrorMessage = "Error:&nbsp;&nbsp;Please enter a VALID Email Address"
	  
		Case(4)
		  ShowError    = 1
			ErrorMessage = "Error:&nbsp;&nbsp;The Message field cannot be left blank"
	  
		Case(5)
		  ShowError    = 1
	    ErrorMessage = "Error:&nbsp;&nbsp;The Security Challenge you entered is not valid"
	  
		Case Else
		  ShowError    = 0
			ErrorMessage = 0
			
	End Select

// ---------------------------------------------------------------------------------------------------------------------------
// Generate Message Sent 
// ---------------------------------------------------------------------------------------------------------------------------
  
	Select Case( o_Sent )
	
	  Case(1)
	    SendSuccess = 1
	
	  Case Else
	    SendSuccess = 0
	
	End Select
	
// ---------------------------------------------------------------------------------------------------------------------------
// Animate Form Elements
// ---------------------------------------------------------------------------------------------------------------------------

  Select Case( o_Element )
	  Case(1)
		  AnimateElement = 1
			FormElement    = "frmname"
		Case(2)
		  AnimateElement = 1
			FormElement    = "frmcompany"
		Case(3)
		  AnimateElement = 1
			FormElement    = "frmemail"
		Case(4)
		  AnimateElement = 1
			FormElement    = "message"
		Case Else
		  AnimateElement = 1
			FormElement    = ""
	End Select

// ---------------------------------------------------------------------------------------------------------------------------
%>


<script type='text/javascript' language='javascript'>

document.observe("dom:loaded", function() {
  setTimeout("genCode();",1000);
});

<% If AnimateElement = 1 Then %>
document.observe("dom:loaded", function() {
//Effect.Highlight(<%=FormElement%>);
});
<% End If %>
</script>

<form name='form1' id='form1' method='post' action='/sendcontact/actions/?output:1'>
<div class='siteheader' style='margin-bottom:5px;'><img src='/application/library/media/ContactText.jpg'/></div>
<div class='' style='padding:10px; text-align:left; margin-bottom:solid 1px #ffffff'>


<br/>


<!-- start edit -->

<span style='font-size:14pt;'>Email: <b>gmdtafilms@aol.com</b></span>

<!-- end edit -->


</div>
