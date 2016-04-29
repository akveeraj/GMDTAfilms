<!--#include virtual="/includes.pl"-->
<!--#include virtual="/application/actions/act_loadvideo.pl"-->

<%
// --------------------------------------------------------------------------------------------------------------------
// Define Variables
// --------------------------------------------------------------------------------------------------------------------

  Image       = "tbn_play.png"
	Location    = "/index/doc/"
	FilmInfo    = "/thebluenetwork/doc/?nav:0"
	Autoplay    = 1
	Fullscreen  = true
	AboutText   = "about-tbn"
	'o_Stream    = "X7NbCdGNY3M"
	o_Stream    = "6jJdAMFgS6I"
	Navigation  = 0
	ShowInfo    = 1

// --------------------------------------------------------------------------------------------------------------------
%>

<style>
  .writerquote {
	  display:block;
		padding:10px;
		font-size:12pt;
		color:#999999;
		text-align:left;
		font-weight:bold;
		padding-left:0px;
		cursor:default;
		margin-bottom:15px;
	}
	
	.writerquote span.sub {
	  display:block;
		text-align:right;
		font-size:9pt;
		font-weight:bold;
		padding:10px;
	}
</style>



<% Call LoadFilm( o_Play, o_Stream, Image, Location, FilmInfo, Navigation, autoplay, fullscreen, abouttext, ShowInfo ) %>

<div class='filmspacer' style='margin-bottom:5px;'></div>


<div class='welcometext'>
<div class='filmspacer'></div>

<!-- place welcome blurb in this section, note, add a <br/> if you want to create a new line, add another if you want 2 new lines -->


<span style='font-size:14pt;'><b>WELCOME TO GMDTA FILMS</b></span><br/><br/>  
We are currently working on several features of varying genres and budgets
 all intended for worldwide theatrical release using a mixture of both
 internationally known and brand new talent. We have our own highly experienced
 crew though are always keen to get involved in co-productions, wherever possible.<br/><br/>
 
On our screen above, we are currently showing a 15 minute teaser depicting
 a few possible scenes from one of our projects titled 'The Blue Network',
 a suspense thriller, which was shot on hi-definition and offers a glimpse
 of what's to come. This film may actually be made in 2017 as a UK/Canadian
 Co-pro, subject to further discussions and to be announced.<br/><br/>
 
Film festivals such as Cannes, Berlinale and the American film market (AFM), have always proved very successful as we met many new writers, filmmakers
 and Co-Producers to work with in creating our pictures and have Barnes Roffe of London, 
 who specialise in the film investment, as our dedicated film Accountants.<br/><br/>
 
As well as this, we have a Director called John Stephenson (winner of a BAFTA and the O.B.E.) interested in Directing at least two of our films 
 he has read the scripts for.<br/><br/>
	
We are always very keen to work with new investors or people with knowledge 
 of the filmmaking process from all backgrounds and with any reasonable 
 size of investment to put into any of our films and, perhaps, after consulting 
 a specialist film accountant who can offer independent advice as to the 
 various tax breaks which are also available to UK film investors, which 
 is of course in addition to any return the finished feature film may bring 
 from worldwide sales.<br/><br/> 


We are planning to commence production of two supernatural thrillers from 2016 onwards.
<br/><br/> 




<!-- welcome blurb (end) -->




<div class='filmspacer'></div>

</div>
