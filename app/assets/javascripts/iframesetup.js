$(document).ready(function(){

	$(window).load(function () {
    setIframeHeight(document.getElementById('game-pages'));
	});

	function setIframeHeight(iframe) {
    if (iframe) {
    	//debugger;
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
    }
	};

});