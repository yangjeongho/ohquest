
var Dialog = {};
var dialogTitleAppId = "";
Dialog.open = function(dialogOpt){
	var favoriteBtns = null ;
	var sourceDivId = dialogOpt.div.replace("#","");
	
	//alert(sourceDivId +":"+ typeof(dialogOpt.url) +":"+ dialogOpt.url);
	
	if(typeof(dialogOpt.url) == "string"){
		if($('body').find("[id="+sourceDivId+"]").length>0){
			$('body').find("[id="+sourceDivId+"]").remove(); 	
		}
		$('body').append($("<div id="+sourceDivId+"></div>"));
		$("#"+sourceDivId).append("<div id='"+sourceDivId+"_source'></div>");  
		 
		if(sourceDivId == 'dialogContent'){
			dialogOpt.title = "<span class='btns3_16 save'><input type='button' alt='Add My Memu' value='+' id='addFavoriteMenuBtn' onClick='javascript:addFavorite(\""+dialogTitleAppId+"\" );' /></span>" + dialogOpt.title ; 
			dialogTitleAppId = "" ;			
		} 
		//$("#"+sourceDivId).loadingDialog();
		
		if(dialogOpt.method != null && dialogOpt.method == 'post'){ 
			$.ajax({
				type : "POST",  
				async : true, 
				url : dialogOpt.url,
				contentType: "application/json",
				data : dialogOpt.data,
				dataType : 'html',
				success : function(data) {
					$("#"+sourceDivId).find("[id="+sourceDivId+"_source]").empty().append(data);
					//$("#"+sourceDivId).hideLoading();
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){
					//$("#"+sourceDivId).hideLoading();
				} 
			});
		}else{
			$.ajax({
				type : "GET",  
				async : true ,
				url : dialogOpt.url,
				dataType : 'html',
				success : function(data) {
					$("#"+sourceDivId).find("[id="+sourceDivId+"_source]").empty().append(data); 
					//$("#"+sourceDivId).hideLoading();
				},	error:function(data){
					//서버 비정상 동작시 구현
					MessageBox.dialog("err.500");
				}, complete:function(jqXHR, textStatus){ 
					//$("#"+sourceDivId).hideLoading();
				} 
			}); 			
		}
		
		/*$("#"+sourceDivId).find("[id="+sourceDivId+"_source]").load(dialogOpt.url, function(e){
			$("#"+sourceDivId).hideLoading(); 
		});*/ 
		$("#"+sourceDivId).bind("dialogclose", function(){
			emptyDialogContent(sourceDivId);
		});
		
	}else{		
		//$("#"+sourceDivId).hideLoading();
	} 
	$("#"+sourceDivId).dialog({
		autoOpen: false,
		width: dialogOpt.width,
		height:dialogOpt.height,
		modal : dialogOpt.modal,
		title : dialogOpt.title, 		  
		resizable : false,  
		closeOnEscape : false 
	}); 
	$("#"+sourceDivId).dialog('open');
	if(dialogOpt.close == false ){
		$(".ui-dialog-titlebar-close").hide();
	}
};

Dialog.close = function(dialogOpt){
	var sourceDivId = dialogOpt.replace("#","");
	if($('body').find("[id="+sourceDivId+"]").length>0){
		emptyDialogContent(sourceDivId); 	
		$("#"+sourceDivId).dialog('close');
	} 
};
function emptyDialogContent(sourceDivId){
	$('body').find("[id="+sourceDivId+"]").empty().remove(); 	
}

function addFavorite(menuId){
	alert('menuId='+menuId);
}