<%
// --------------------------------------------------------------------------------------------------------------------
// Define Variables
// --------------------------------------------------------------------------------------------------------------------

  o_Query    = fw_Query
	o_Query    = UrlDecode(o_Query)
	
	o_Play     = ParseCircuit( "play", o_Query )
	o_Stream   = "X7NbCdGNY3M" 'ParseCircuit( "stream", o_Query )
	
// --------------------------------------------------------------------------------------------------------------------
// Build Player
// --------------------------------------------------------------------------------------------------------------------
  
	Sub LoadFilm( o_Play, o_Stream, Image, Location, FilmInfo, Navigation, autoplay, fullscreen, abouttext, ShowInfo )
	
	If o_Play = 1 Then
	  WriteFlash = "<div class='filmholder'>" & _
		             "<object>" & _
		             "<param name='movie' value='http://www.youtube.com/v/" & o_stream & "?version=3&autoplay=1&rel=0'>" & _
								 "<param name='allowFullScreen' value='false'>" & _
								 "<param name='showmenu' value='false'>" & _
								 "<param name='allowScriptAccess' value='always'>" & _
								 "<embed src='http://www.youtube.com/v/" & o_stream & "?version=3&autoplay=1&rel=0' type='application/x-shockwave-flash' showmenu='false' allowfullscreen='" & fullscreen & "' allowScriptAccess='always' width='590' height='381'>" & _
								 "</object>" & _
								 "<div class='tablerow' style='width:590px; margin-top:0px; margin-left:auto; margin-right:auto;'>"
								 
								 If ShowInfo = 1 Then
								 
								 WriteFlash = WriteFlash & "<span class='tablecell'><div class='filminfolink'><a href='" & FilmInfo & "' target='_blank'></a></div></span>" & _
								                           "<span class='tablecell'><div class='" & abouttext & "'></div></span>"
								 
								 Else
								 
								 WriteFlash = WriteFlash & "<span class='tablecell'><div class='" & abouttext & "_long'></div></span>"
								 
								 End If
								 
								WriteFlash = WriteFlash & "</div>" & _
								                          "</div>"
								 
								 Response.Write WriteFlash
	Else
	  WriteFlash  = "<div class=''><a href='" & Location & "?play:1;stream:" & o_Stream & "'><img src='/application/library/media/" & Image & "' width='590' height='270' border='0'/></a></div>"
		             Response.Write WriteFlash
	End If
	
	End Sub
	
// --------------------------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------------------------------------------------------	
%>