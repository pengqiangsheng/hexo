$(window).load(function(){
	var domain = window.location.host;
	var mycoding = document.getElementById('mycoding');
	if ( domain.indexOf("coco") != -1 ) {
		mycoding.style.display='';
	}else {
		mycoding.style.display='none';
	}
})
