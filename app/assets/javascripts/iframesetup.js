$(document).ready(function(){

	$(window).load(function () {
    setIframeHeight(document.getElementById('game-pages'));
	});

    function setIframeHeight(iframe) {
      if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
      }
    };

    var changeSrcLink = document.getElementsByClassName("src-change-link");
    
    var changeSrc = function(e) {
      e.preventDefault();
      top.document.getElementById('game-pages').src = this.href;
      //top.document.getElementById('currentid').innerHTML = document.getElementById('currentid-child').innerHTML;
    };

    for(var i=0;i<changeSrcLink.length;i++){
      changeSrcLink[i].addEventListener('click', changeSrc, false);
    }

    if (window.location.pathname == '/show') {
        top.document.getElementById('currentid').innerHTML = document.getElementById('currentid-child').innerHTML;
        setIframeHeight(top.document.getElementById('game-pages'));
    }

});