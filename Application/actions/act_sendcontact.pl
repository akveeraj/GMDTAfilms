<!--#include virtual="/includes.pl"-->

<%
// ----------------------------------------------------------------------------------------------
// ' Define Variables
// ----------------------------------------------------------------------------------------------

  o_Query                = Request.Form
	o_Query                = UrlDecode( o_Query )
	o_Query                = Replace( o_Query, "&", ";" )
	o_Query                = Replace( o_Query, "=", ":" )
	o_Query                = Replace( o_Query, ";", vbcrlf )
	
	o_Name                 = ParseCircuit( "name", o_Query )
	o_Company              = ParseCircuit( "company", o_Query )
	o_Email                = ParseCircuit( "email", o_Query )
	o_Message              = ParseCircuit( "message", o_Query )
	o_Captcha              = ParseCircuit( "captcha", o_Query )
	o_Captcha              = UCASE( o_Captcha )
	o_StoredCaptcha        = Session("fb_captcha")
	
	Session("frm_name")    = o_Name
	Session("frm_company") = o_Company
	Session("frm_email")   = o_Email
	Session("frm_message") = o_Message
	
	DateTimeStamp          = Year(Now) & "-" & Month(Now) & "-" & Day(NOw) & " " & Time
	MessageId              = Sha1( Timer() & Rnd() )
	Subject                = "You have received a message from your website"
	Subject                = FixSingleQuotes( Subject )
	ReturnPath             = "/contact/doc/?errorcode:"
	EmailRecipient         = "gmdtaproductions@aol.com"
	EmailFrom              = "mailsender@gmdtafilms.co.uk"
	EmailName              = "GMDTA FILMS POSTMASTER"
	
// ----------------------------------------------------------------------------------------------
// ' Check Captcha Code
// ----------------------------------------------------------------------------------------------

  Public Function CaptchaPassed()
	
	  If o_Captcha <> o_StoredCaptcha Then
		  CaptchaPassed = 0
		Else
		  CaptchaPassed = 1
		End If
	
	End Function
	
// ----------------------------------------------------------------------------------------------
// ' Generate Error Messages
// ----------------------------------------------------------------------------------------------
	
 Sub GenMailError(o_SelectedComponent)
 
 Response.Write "<link href='/fusebox/ErrorTemplates/style.css' rel='stylesheet' type='text/css'/>" & _
		            "<div id='errorbox'><span class='bigerror'><b>Transport Error while attempting to sending message... </b></span><span class='smallerror'>" & Err.Number & " " & Err.Description & " Component: " & o_SelectedComponent& " ~ " & Email_Server & "<br/>" & _
		            "Please try again later" & _
								"<br/><br/>" & _
								"<b>Configuration:</b><br/>" & _
								"Mail Server : " & o_MailServer & "<br/>" & _
								"Port : " & o_MailPort & "<br/>" & _
								"Username : " & o_TruncUsername & "<br/>" & _
								"Password : " & o_TruncPassword & "<br/>" & _
								"Recipient: " & o_TruncRCPT & "<br/>" & _
								"</span>" & _
								" <span class='smallabout'>Fusebox " & fb_Version & " on " & Request.ServerVariables("server_name") & " port: " & Request.ServerVariables("SERVER_PORT") & "</span>" & _
								"</div>"
 End Sub
	
// ----------------------------------------------------------------------------------------------
// ' MailServer Variables
// ----------------------------------------------------------------------------------------------

  MessageBody = "You have received a message from " & o_Name & vbcrlf & vbcrlf & _
	              "Company: " & o_Company & vbcrlf & _
								"EmailAddress: " & o_Email & vbcrlf & _
								"Message: " & vbcrlf & vbcrlf & _
								o_Message & vbcrlf & vbcrlf
                
								MessageBody = FixSingleQuotes( MessageBody )
								
// ----------------------------------------------------------------------------------------------
// ' Validate Form
// ----------------------------------------------------------------------------------------------
  
	If o_Name = "" Then
	  Proceed = 0
		Response.Redirect ReturnPath & "1"
	ElseIf o_Company = "" Then
	  Proceed = 0
		Response.Redirect ReturnPath & "2"
	ElseIf o_Email = "" Then
	  Proceed = 0
		Response.Redirect ReturnPath & "3"
	ElseIf Instr( o_Email, "." ) = 0 Then
	  Proceed = 0
		Response.Redirect ReturnPath & "3"
	ElseIf Instr( o_Email, "@" ) = 0 Then
	  Proceed = 0
		Response.Redirect ReturnPath & "3"
	ElseIf o_Message = "" Then
	  Proceed = 0
		Response.Redirect ReturnPath & "4"
	ElseIf CaptchaPassed = 0 Then
	  Proceed = 0
		Response.Redirect ReturnPath & "5"
	Else
	  Proceed = 1
	End If

// ----------------------------------------------------------------------------------------------
// ' Send Mail Using CDO.Mailer Component
// ----------------------------------------------------------------------------------------------

  If Proceed = 1 AND MxComponent = 1 Then

// ----------------------------------------------------------------------------------------------

  Schema = "http://schemas.microsoft.com/cdo/configuration"
	
	On Error Resume Next
	
	Set MailObject = CreateObject("CDO.Message")
	  MailObject.Configuration.Fields.Item( Schema	& "/sendusing" )              = 2
		MailObject.Configuration.Fields.Item( Schema	& "/smtpserver")              = o_MailServer
		MailObject.Configuration.Fields.Item( Schema	& "/smtpserverport")          = o_MailPort
		MailObject.Configuration.Fields.Item( Schema	& "/smtpusessl")              = o_UseSMTPSSL
		MailObject.Configuration.Fields.Item( Schema	& "/smtpconnectiontimeout")   = o_ConnTimeOut
		MailObject.Configuration.Fields.Item( Schema	& "/smtpauthenticate")        = o_SMTPAuth
		
		If o_SMTPAuth = 1 Then
		MailObject.Configuration.Fields.Item( Schema	& "/sendusername")            = o_MailAuth
		MailObject.Configuration.Fields.Item( Schema	& "/sendpassword")            = o_MailPass
		End If
		
		MessageBody  = MessageBody & _
		              " ------------------------------------------------------------------------------- "  & chr(13) & _
									" You can reply directly to " & o_Email & " by clicking the reply button          "  & chr(13) & _
									" on your email client.  xx                                                         "  & chr(13) & _
									" ------------------------------------------------------------------------------- "  & chr(13) & _
									" MessageId: CDO~" & MessageId                                                   & chr(13) & _
									" ------------------------------------------------------------------------------- "  & chr(13)
	  
		MailObject.Configuration.Fields.Update
		MailObject.To        = EmailRecipient
		MailObject.Subject   = o_MailSubject
		MailObject.From      = o_MailAuth
		MailObject.TextBody  = MessageBody
		MailObject.ReplyTo   = o_Email
		
		On Error Resume Next
		MailObject.Send
		
		If Err.Number = 0 Then
		  Session("frm_name")     = ""
			Session("frm_company")  = ""
			Session("frm_email")    = ""
			Session("frm_message")  = ""
			Set MailObject = Nothing
			Response.Redirect "/contact/doc/?sent:1;component:" & o_Component
		Else
		  Call GenMailError()
		End If
		
// ----------------------------------------------------------------------------------------------

	End If
	
// ----------------------------------------------------------------------------------------------
// ' Send Mail Using Persits.MailSender ( NOT SUPPORTED BY BASIC ACCOUNTS )
// ----------------------------------------------------------------------------------------------

  If Proceed = 1 AND MxComponent = 2 Then
	
// ----------------------------------------------------------------------------------------------

  On Error Resume Next
	
	Set MailObject = CreateObject("Persits.MailSender")
	
	MessageBody = MessageBody & _
		            " ------------------------------------------------------------------------------- "  & chr(13) & _
								" You can reply directly to " & o_Email & " by clicking the reply button          "  & chr(13) & _
								" on your email client.                                                           "  & chr(13) & _
								" ------------------------------------------------------------------------------- "  & chr(13) & _
								" MessageId: Pers~" & MessageId                                                  & chr(13) & _
								" ------------------------------------------------------------------------------- "  & chr(13)
								
	Call PersitsMailer( MessageBody, Subject, EmailRecipient, o_Email, MxUsername, EmailName, True, False, False )
	
	If Err.Number = 0 Then
		Session("frm_name")     = ""
	  Session("frm_company")  = ""
	  Session("frm_email")    = ""
	  Session("frm_message")  = ""
  End If
	
  Response.Redirect "/contact/doc/?sent:1;component:" & MxComponent
	
// ----------------------------------------------------------------------------------------------
  
	Else
	  Response.Write "Component not set, See Email Configuration"
  End If 
	
// ----------------------------------------------------------------------------------------------
%>