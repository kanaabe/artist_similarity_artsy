$(document).ready(function(){

	var timer;
	if (window.location.pathname == '/game') {
		var totalMilliseconds = 0;
		var seconds = document.getElementById("seconds");
		var milliseconds = document.getElementById("milliseconds");
    var timer = setInterval(setTime, 100);
  }

  function setTime(){
  	totalMilliseconds++;
    seconds.innerHTML = (totalMilliseconds/10).toFixed(1);
    
    // CODE TO STOP THE TIMER
    // if($('iframe').attr('end-url') == ""){
    // 	clearTimeout(timer);
    // }
    
  }
	
});