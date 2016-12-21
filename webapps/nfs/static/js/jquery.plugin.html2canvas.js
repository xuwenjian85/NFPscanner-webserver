/**
  @license html2canvas v0.34 <http://html2canvas.hertzen.com>
  Copyright (c) 2011 Niklas von Hertzen. All rights reserved.
  http://www.twitter.com/niklasvh

  Released under MIT License
 */
/*
 * jQuery helper plugin for examples and tests
 */
(function( $ ){
    $.fn.html2canvas = function(options) {
        if (options && options.profile && window.console && window.console.profile) {
            console.profile();
        }
        var date = new Date(),
        html2obj,
        $message = null,
        timeoutTimer = false,
        timer = date.getTime();
        options = options || {};

        options.onrendered = options.onrendered || function( canvas ) {
            var $canvas = $(canvas),
            finishTime = new Date();

            if (options && options.profile && window.console && window.console.profileEnd) {
                console.profileEnd();
            }
            $canvas.attr({id:"ca"});
            
            $canvas.css({

            }).appendTo("#canvas");
            $canvas.siblings().toggle();
             var url=$canvas.toDataURL();
                 $(".div1").after("<img alt='' id='imgcanvas' src="+url+" width='10%'>");

           
            throwMessage('Screenshot created in '+ ((finishTime.getTime()-timer)) + " ms<br />",4000);

            // test if canvas is read-able
            try {
                $canvas.toDataURL();
                 
            } catch(e) {
                if ($canvas.nodeName.toLowerCase() === "canvas") {
                    // TODO, maybe add a bit less offensive way to present this, but still something that can easily be noticed
                    alert("Canvas is tainted, unable to read data");
                }
            }
        };

        html2obj = html2canvas(this, options);

        function throwMessage(msg,duration){
            window.clearTimeout(timeoutTimer);
            timeoutTimer = window.setTimeout(function(){
                $message.fadeOut(function(){
                    $message.remove();
                    $message = null;
                });
            },duration || 2000);
            if ($message)
                $message.remove();
            $message = $('<div />').html(msg).css({
                margin:0,
                padding:10,
                background: "#000",
                opacity:0.7,
                position:"fixed",
                top:10,
                right:10,
                fontFamily: 'Tahoma',
                color:'#fff',
                fontSize:12,
                borderRadius:12,
                width:'auto',
                height:'auto',
                textAlign:'center',
                textDecoration:'none',
                display:'none'
            }).appendTo(document.body).fadeIn();
            html2obj.log(msg);
        }
    };
})( jQuery );
