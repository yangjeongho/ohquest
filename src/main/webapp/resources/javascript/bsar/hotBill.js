
function hotBillCalculate(hotBillReqData, callback){
		
	var ret_hotBillJson = {};
	$.ajax({
		type : "POST",  
		url: baseUrl + "bsar/bs/hotBillCalculate",
		contentType: "application/json",
		dataType : 'json',
		data: JSON.stringify(hotBillReqData),
		async:false,
		success : function(data) {
							
			if(data.resultCode == "SUCCESS") {
				
				ret_hotBillJson = data.object;
				callback(ret_hotBillJson);
				//MessageBox.dialog(JSON.stringify(ret_hotBillJson));
			} else {
				MessageBox.dialog(JSON.stringify(data.message));
			}
			
		},
		error:function(data){
			//MessageBox.dialog("err.500");
			MessageBox.dialog(data.statusText);
		}
	});

	
	return ret_hotBillJson;
}
