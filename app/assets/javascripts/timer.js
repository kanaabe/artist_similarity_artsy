$(document).ready(function(){
	if (window.location.pathname == '/game') {
		var totalMilliseconds = 0;
		var seconds = document.getElementById("seconds");
		var milliseconds = document.getElementById("milliseconds");
    setInterval(setTime, 100);
  }

  function setTime(){
  	totalMilliseconds++;
    seconds.innerHTML = (totalMilliseconds/10).toFixed(1);
    //milliseconds.innerHTML = totalMilliseconds;
  }
	
});