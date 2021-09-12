
/*function Shape() {
	    this.name = "Generic";
	    this.draw = function() {
	        return "Drawing " + this.name + " Shape";
	    };
	}

	function welcomeMessage()
	{
	    var shape1 = new Shape();
	    //alert(shape1.draw());
	    alert(shape1.hasOwnProperty("name"));  //this is returning false
	    alert(shape1.draw());
	} 
	welcomeMessage();*/

var BS_CODE = {};

 BS_CODE.select_box = function (){
	var argSize = arguments.length ;
	var jsonParam = {};
	if(argSize != 2){
		alert("파라미터가 부족합니다.");
		return false;
	}
	var retCodeList = [];
	jsonParam = {bsArGrpCd : arguments[0], language : arguments[1] };
	
//	bsArGrpCd = arguments[0];
//	language = arguments[1];
	var retListBox = "";
	var bsCodeList = {};
	$.ajax({
		type : "POST",  
		async: false,
		url: baseUrl + "bsar/getBsArCodeList",
		//contentType: "application/json",
		data: jsonParam,
		dataType:"json",
		success : function(data) {
			
			$.each(data || [], function(key, value){
			    $.each(value, function(key, value){
			        retListBox += "<option value='"+value.cmmnCd+"'>"+value.cmmnCdnm+"</option>" ; 
			    });
			});
			
		},
		error:function(data){
			alert("call fail! ");
		}
	});
	//console.log(retListBox);
	return retListBox;
};



String.prototype.bsLowerCase = function() {
	 return this.charAt(0).toLowerCase() + this.substring(1);
}