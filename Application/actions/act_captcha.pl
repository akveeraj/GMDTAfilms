<!--#include virtual="/includes.pl"-->
<!--#include virtual="/application/actions/act_dictionary.pl"-->

<%
// ----------------------------------------------------------------------------------------------
// ' Define Variables
// ----------------------------------------------------------------------------------------------

  o_CodeLength = 5

// ----------------------------------------------------------------------------------------------
// ' Randomize Captcha Background
// ----------------------------------------------------------------------------------------------

  CaptchaString = "captchatext, captchatext2, captchatext3, captchatext4, captchatext5"
	CaptchaArray  = Split( CaptchaString, ", " )
	Randomize()
	CaptchaStyle  = CaptchaArray(Int( Rnd() * UBound( CaptchaArray )))
	
// ----------------------------------------------------------------------------------------------
// ' Generate Captcha Code
// ----------------------------------------------------------------------------------------------

  Sub CreateCaptcha( RandomWord1, RandomWord2 )
	
	  o_Captcha =  "<div class='" & CaptchaStyle & "'><span class='captcha1'>" & RandomWord1 & "</span>" & "<span class='captcha2'>" & RandomWord2 & "</span></div>"
		Session("fb_captcha") = UCASE(RandomWord1 & " " & RandomWord2)
		Response.Write o_Captcha
	
	End Sub
	
// ----------------------------------------------------------------------------------------------
%>

<% Call CreateCaptcha( RandomWord1, RandomWord2 ) %>
