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
<div class='' style='padding:10px; text-align:left; margin-bottom:solid 1px #ffffff'><br/><br/>Please contact us at <b>gmdtafilms@aol.com</b></div>

<div class='contact_box'>

  <span class='contact_inner'>
	
	<% If ShowError = 1 or SendSuccess = 1 Then %>
	
  <div class='tablerow' style='margin-bottom:10px;'>
	  <span class='tablecell'><% If SendSuccess = 1 Then %><span class='contactsuccess' id='contactsuccess'>Your message was sent successfully</span><% End If %><% If ShowError = 1 Then %><span class='contacterror' id='contactfail'><%=ErrorMessage%></span><% End If %></span>
	</div>
	
	<% End If %>
	
	
	<div class='tablerow' style='margin-bottom:2px;'>
	<span class='tablecell' style='width:140px; margin-right:5px; height:15px;'></span>
	</div>
	
  <!-- contact form (start) -->
	
	<div class='tablerow' style='margin-bottom:10px;'>
	<span class='tablecell' style='width:140px; margin-right:5px;'><span class='tablelabel'><b>Your Name:</b></span></span>
	<span class='tablecell'><input type='text' name='name' id='frmname' value='<%=Session("frm_name")%>' class='contact_input' autocomplete='off' onfocus="HideAlerts();"/></span>
	</div>
	
	<div class='tablerow' style='margin-bottom:10px;'>
	<span class='tablecell' style='width:140px; margin-right:5px;'><span class='tablelabel'><b>Your Company:</b></span></span>
	<span class='tablecell'><input type='text' name='company' id='frmcompany' value='<%=Session("frm_company")%>' class='contact_input' autocomplete='off' onfocus="HideAlerts();"/></span>
	</div>
	
	<div class='tablerow' style='margin-bottom:10px;'>
	<span class='tablecell' style='width:140px; margin-right:5px;'><span class='tablelabel'><b>Your Email Address:</b></span></span>
	<span class='tablecell'><input type='text' name='email' id='frmemail' value='<%=Session("frm_email")%>' class='contact_input' autocomplete='off' onfocus="HideAlerts();"/></span>
	</div>
	
	<div class='tablerow' style='margin-bottom:10px;'>
	<span class='tablecell' style='width:140px; margin-right:5px;'><span class='tablelabel'><b>Your Message:</b></span></span>
	<span class='tablecell'><textarea name='message' cols='35' rows='6' wrap='VIRTUAL' id='message' class='contact_input' autocomplete='off' onfocus="HideAlerts();"><%=Session("frm_message")%></textarea></span>
	</div>
	
	<div class='tablerow' style='margin-bottom:10px;'>
	<span class='tablecell' style='width:140px; margin-right:5px;'><span style='color:#fff;'>-</span><span class='tablelabel' id='securitylabel'><b>Security Challenge:</b></span></span>
	<span class='tablecell'>
	
	<!-- security challenge (start) -->
	<div class='captchabox' id='captchabox'>
	
	
	<span class='captchadescription'><b>Type the words you see in the box below into the red box, in order and separated by a space</b></span>
	
	  <div class='tablerow'>
	  <span class='tablecell'><span class='loadcaptcha' id='captchaloader'>Loading Challenge...</span></span>
		<span class='tablecell'><span id='captchacode' style='display:none;'>x</span></span>
		<span class='tablecell'><input type='text' id='captchainput' name='captcha' class='redbox' value='' style='display:none;' autocomplete='off' onfocus="HideAlerts();"/></span>
	  </div>
		
		<div class='tablerow'>
		<span class='tablecell' style='width:340px; margin-top:10px;'>
		<span class='greenbutton' id='sendbutton' style='float:right; display:none;'><a href='javascript:void(0);' onclick="sendmail();">Send Message</a></span>
		<span class='case' id='reloadchallenge' style='float:left; margin-left:3px; display:none;'><a href='javascript:void(0);' onclick="ReloadChallenge();">Reload Challenge</a></span>
		</span>
		</div>
	</div>
	
		<div class='tablerow' id='sendingmessage' style='display:none;'>
		<span class='tablecell'><span class='sendingmail'>Please Wait...</span></span>
		</div>
	
<script type='text/javascript' language='javascript'>
new Tip('reloadchallenge', 'If you cannot read the words in the security challenge box, <br/>Click "Reload Challenge" to generate a new set of words.', {
title: '',
border: 3,
borderColor: '#000000',
style: 'protogrey',
hook: {target:'bottomMiddle', tip: 'bottomMiddle', mouse: true },
offset: { x:0, y:70}
});

</script>
	
	<!-- security challenge (end)   -->
	
	</span>
	</div>
	
  <!-- contact form (end)   -->
	
	<div class='tablerow' style='margin-bottom:2px;'>
	<span class='tablecell' style='width:140px; margin-right:5px; height:15px;'></span>
	</div>
  </span>

</div>

</form>