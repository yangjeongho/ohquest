var loadingInited = false ;
var loadingStopped= false ;

function loadingInit(loadingObj){
	loadingStopped= false ;
	if(!loadingInited){
		$('body').ajaxStart(function() {
			//alert('ajaxStart');
			loadingInited = true ;
	    }).ajaxError(function(d) {
	    	//alert('ajaxError');
	    	$('body').find('[id=__loading]').fadeOut('fast').remove();
	    	$('.blockUI').fadeOut('fast').remove();
	    	loadingStopped = true ;
	    }).ajaxStop(function(e) {
	    	//alert('ajaxStop');
	    	$('body').find('[id=__loading]').fadeOut('fast').remove();
	    	$('.blockUI').fadeOut('fast').remove();
	    	loadingStopped = true ;
	    });
		//loadingInited = true ;
	}
}	
(function($){
    $.fn.loading= function(){
    	
    	var $_this = jQuery(this);    	
    	loadingInited = false ; 
    	loadingInit($_this);
    	
    	var loading_offset = $_this.offset() ;
    	var loading_position = "right";
    	var opt = '';
    	
    	var argSize = arguments.length ;
    	if(argSize == 1){
    		opt = arguments[0];
    		if(opt.position != null){
    			loading_position = opt.position;  
    		}
    	}
    	
		//대기시간이 0.5초이상일때만 조회중 메시지 표시
    	setTimeout(function(){
    		if(!loadingStopped){ 
    			var loadingDiv = "<div id='__loading' style='display:;'><img id='__loading_img' src='"+baseUrl+"resources/javascript/common/ajax-loader.gif'/></div>";
    	    	var findLoadingDiv = $('body').find("[id=__loading]"); 
    	    	if($(findLoadingDiv).length == 0){
    	    		$('body').find("[id=__loading]").remove();
    	    	}
    	    	$('body').append(loadingDiv);
    	    	
    	    	
    	    	var loadTop = 0;
    	    	var left = 0;
    	    	var loadingImageWidth = 31 ;
    	    	var loadingImageHeight = 31 ;
    	    	
    	    	//alert(loading_position +",  "+ $_this.height() +",  "+  loadingImageHeight);
    	    	if($_this.height() > loadingImageHeight) {
    	    		loadTop = loading_offset.top  + ($_this.height() - loadingImageHeight) / 2 ;
    	    	}
    	    	else {
    	    		loadTop = loading_offset.top  - (loadingImageHeight - $_this.height()) / 2  ;
    	    	} 
    	    	    	    	  
    	    	if(loading_position == 'right'){
    	    		left = loading_offset.left + $_this.width() + 5 ;
    	    	}
    	    	else if(loading_position == 'left'){
    	    		left = loading_offset.left - loadingImageWidth - 5 ;
    	    	}
    	    	else if(loading_position == 'center'){
    	    		left = loading_offset.left + ($_this.width() / 2 - loadingImageWidth/2);  
    	    	}
    	    	else {
    	    		left = loading_offset.left - loadingImageWidth - 5 ;
    	    	}
    	    	
    	    	$('#__loading').css({position:'absolute', 'z-index': maxZindex(), top: loadTop +'px', left : left +'px'}).show();
    		}
    	}, 500);
	    	
    };
    
    $.fn.loadingDialog = function(){
    	var $_this = jQuery(this);
    	loadingInit(null);
    	var blockWidth = $(window).width();
		var blockHeight = $(window).height();
    	
		var messageStr = "Working... <br>Wait a minute 왜, please!"; //default
    	var argSize = arguments.length ; 
    	if(argSize == 1){
    		messageStr = arguments[0];
    	}
    	var message = "<div style='border:1px blue solid; width: "+blockWidth+"px; height:"+blockHeight+"px ; display:table-cell; vertical-align:middle; text-align:center; font-size:25px; color:red;'>"+"왜 안돼"+"</div>" ;
    	    	
		alert('win width='+$(window).width() +', win height=' + $(window).height() +', doc width=' + $(document).width() +', doc height=' + $(document).height());
		var _top  = 0;//($(window).height() - blockHeight)/2 ; 
		var _left = 0;// ($(window).width() - blockWidth) /2 ;
    	
    	
    	//대기시간이 0.5초이상일때만 조회중 메시지 표시
		loadingStopped = false;
    	setTimeout(function(){
    		if(!loadingStopped){
    			$.blockUI({
                    message: message,
                    //fadeIn: 700,
                    //fadeOut: 700,
                    //timeout: 20000,
                    showOverlay: true, 
                    centerX: true,
                    centerY: true,
                    css: {
	            		 width: blockWidth,
	                     height: blockHeight , 
	                     top: 0,
	                     left: 0,
	                     'vertical-align': 'middle',
	                     //right: '10px',
	                     //border: '1px',
	                     //padding: '100px', 
	                     mousePause: 'false', 
	                     'z-index': maxZindex(), 
	                     backgroundColor:'#3399ff', //'#FF0000',
	                     '-webkit-border-radius': '10px',
	                     '-moz-border-radius': '10px',
	                     opacity: 0.4,
	                     color: '#ff0000' 
                    }
                });
    		}
    	}, 500);    	
    };
    $.fn.hideLoading = function(){
    	$('body').find('[id=__loading]').remove();
    	loadingStopped= true;
    	setTimeout(function(){$('.blockUI').fadeOut().remove();}, 100);    	
    };
    
    function maxZindex(){
    	var maxZ = Math.max.apply(null,$.map($('body > *'), function(e,n){
    		if($(e).css('position')=='absolute')
    			return parseInt($(e).css('z-index'))||1 ;
         	})
    	);
    	return maxZ +2 ;
    }
})(jQuery);
