$(document).keydown(function(e) {
    //e.ctrlKey, e.shiftKey, e.altKey
	var keyCode = {
		'b'   : 66,
		'c'   : 67,
		'd'   : 68,
		'e'   : 69,
		'f'   : 70,
		'g'   : 71,
		'h'   : 72,
		'i'   : 73,
		'j'   : 74,
		'k'   : 75,
		'l'   : 76,
		'm'   : 77,
		'n'   : 78,
		'o'   : 79,
		'p'   : 80,
		'q'   : 81,
		'r'   : 82,
		's'   : 83,
		't'   : 84,
		'u'   : 85,
		'v'   : 86,
		'w'   : 87,
		'x'   : 88,
		'y'   : 89,
		'z'   : 90,
		'n0'  : 48,
		'n1'  : 49,
		'n2'  : 50,
		'n3'  : 51,
		'n4'  : 52,
		'n5'  : 53,
		'n6'  : 54,
		'n7'  : 55,
		'n8'  : 56,
		'n9'  : 57,
		'f1'  : 112,
		'f2'  : 113,
		'f3'  : 114,
		'f4'  : 115,
		'f5'  : 116,
		'f6'  : 117,
		'f7'  : 118,
		'f8'  : 119,
		'f9'  : 120,
		'f10' : 121,
		'f11' : 122,
		'f12' : 123,
	} ;
	
	if(e.which == keyCode.x && e.altKey ) { //alt-x : close current dialog
		e.preventDefault();
    	closeTopDialog();
    }else if(e.which == keyCode.s && e.altKey ) { //alt-s : search subscriber
    	e.preventDefault();
		runClickEvent(function(){
			clickMenu_searchSubscriber(null);	
		}); 
    }else if(e.which == keyCode.c && e.altKey ) { //alt-c : regist customer
    	e.preventDefault();
    	runClickEvent(function(){
    		clickMenu_csCust001(null);	
		});
    }else if(e.which >= 112 && e.which <= 123) { //f1~f8 key
    	e.preventDefault(); 
    	var searchVal = "" ;
    	if(e.which == keyCode.f1) searchVal = "ADDR" ;
    	else if(e.which == keyCode.f2) searchVal = "BILL" ;
    	else if(e.which == keyCode.f3) searchVal = "BIZ" ;
    	else if(e.which == keyCode.f4) searchVal = "CUNM" ;
    	else if(e.which == keyCode.f5) searchVal = "CUST" ;
    	else if(e.which == keyCode.f6) searchVal = "DEV" ;
    	else if(e.which == keyCode.f7) searchVal = "ENTR" ;
    	else if(e.which == keyCode.f8) searchVal = "PROD" ;
    	else if(e.which == keyCode.f9) searchVal = "CUSTID" ;
    	else if(e.which == keyCode.f10) searchVal = "IMSI" ;
    	else if(e.which == keyCode.f11) searchVal = "HPNO" ;
    	var searchKey = $("#subscriptionCustomerSearchForm select[id=searchKey]");
		if($(searchKey)){
			$(searchKey).val(searchVal); 
		}
    }
    
    function runClickEvent(_callBack_){
    	var maxDialog = getTopDialog() ;
    	if(maxDialog == null){
    		if(typeof(_callBack_) == 'function'){
    			if(_callBack_ != null){
					setTimeout(_callBack_, 100);
				}    			
    		}	
    	}
    }
    
    function closeTopDialog(){
    	var maxDialog = getTopDialog() ;
    	if( maxDialog != null){
    		$(maxDialog).find('[role=button]').click();
    	}
    }
});

function getTopDialog(){
	var maxDialog = null;
	var maxZ = Math.max.apply(null,$.map($('.ui-dialog'), function(e,n){
        if($(e).css('position')=='absolute'){
        	maxDialog = $(e);
            return parseInt($(e).css('z-index'))||1 ;		            	
        }	
	}));
	return maxDialog;  
}