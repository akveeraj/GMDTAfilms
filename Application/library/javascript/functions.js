function genCode(){

  var url    = "/captcha/actions/?output:1;captchalength:5;cache:" + new Date().getTime();
	var target = "captchacode";
	var pars   = "";
	new Ajax.Updater(target, url, {method: 'post', parameters: pars, onComplete:ShowHideCaptchaElements});
}

function ShowHideCaptchaElements(){
document.getElementById('captchacode').style.display = "block";
document.getElementById('captchaloader').style.display = "none";
document.getElementById('captchainput').style.display = "block";
document.getElementById('reloadchallenge').style.display = "block";
document.getElementById('sendbutton').style.display = "block";
}

function ReloadChallenge(){
  var url    = "/captcha/actions/?output:1;captchalength:5;cache:" + new Date().getTime();
	var target = "captchacode";
	var pars   = "";
	document.getElementById('captchacode').style.display="none";
	document.getElementById('captchaloader').style.display = "block";
	document.getElementById('captchainput').style.display = "none";
	document.getElementById('reloadchallenge').style.display = "none";
  document.getElementById('reloadchallenge').style.display = "none";
	document.getElementById('captchainput').value = "";
	document.getElementById('sendbutton').style.display = "none";
  setTimeout("genCode();",1000);
}

function HideAlerts(){

if (document.getElementById('contactsuccess') == null){
}else{
ContactSuccess = document.getElementById('contactsuccess');
Effect.Fade(ContactSuccess);
}

if (document.getElementById('contactfail') == null){
}else{
ContactFail = document.getElementById('contactfail');
Effect.Fade(ContactFail);
}
}

function sendmail(){
  var SecurityLabel  = document.getElementById('securitylabel');
	var CaptchaBox     = document.getElementById('captchabox');
	var SendMail       = document.getElementById('sendingmessage');
	var FrmName        = document.getElementById('frmname');
	var FrmCompany     = document.getElementById('frmcompany');
	var FrmEmail       = document.getElementById('frmemail');
	var FrmMessage     = document.getElementById('message');
	
	SecurityLabel.style.display = "none";
	CaptchaBox.style.display   = "none";
	SendMail.style.display = "block";
	
	FrmName.className     = "contact_input_off";
	FrmName.readOnly      = true;
	FrmCompany.className  = "contact_input_off";
	FrmCompany.readOnly   = true;
	FrmEmail.className    = "contact_input_off";
	FrmEmail.readOnly     = true;
	FrmMessage.className  = "contact_input_off";
	FrmMessage.readOnly   = true;
	
	setTimeout("document.form1.submit();",3000);
}

function PreLoadTemplate(){

  var ImageLoc    = '/application/library/media/';
  var ImageCount  = 0;
  var preloadImages = new Array();

  function preload(ImageFile){
  ImageCount++;
	preloadImages[ImageCount] = new Image();
	preloadImages[ImageCount].src = ImageFile;
	}
	
	window.onload = function() {
	preload(ImageLoc & 'LoadAjax.gif');
	preload(ImageLoc & 'captchabg1.png');
	preload(ImageLoc & 'captchabg2.png');
	preload(ImageLoc & 'captchabg3.png');
	preload(ImageLoc & 'captchabg4.png');
	preload(ImageLoc & 'captchabg5.png');
	preload(ImageLoc & 'viewtrailer_on.png');
	} 
}

function LoadGallery(){
  var preloader  = document.getElementById('preloader');
	var ImageLoc   = '/application/library/media/gallery/roundedpics/';
	var ImageCount = 0;
	var preloadImages = new Array();
	
	function preload(ImageFile){
	ImageCount++;
	preloadImages[ImageCount] = new Image();
	preloadImages[ImageCount].src = ImageFile;
	}
	window.onload = function() {
	preload(ImageLoc & 'photo1.png');
	preload(ImageLoc & 'photo2.png');
	preload(ImageLoc & 'photo3.png');
	preload(ImageLoc & 'photo4.png');
	preload(ImageLoc & 'photo5.png');
	preload(ImageLoc & 'photo6.png');
	preload(ImageLoc & 'photo7.png');
	preload(ImageLoc & 'photo8.png');
	preload(ImageLoc & 'photo9.png');
	preload(ImageLoc & 'photo10.png');
	preload(ImageLoc & 'photo11.png');
	preload(ImageLoc & 'photo12.png');
	preload(ImageLoc & 'photo13.png');
	preload(ImageLoc & 'photo14.png');
	preload(ImageLoc & 'photo15.png');
	preload(ImageLoc & 'photo16.png');
	preload(ImageLoc & 'photo17.png');
	preloader.style.display = "none";
	}
}