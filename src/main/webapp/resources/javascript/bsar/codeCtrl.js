
  
//ZoBsbl001wInqKd 제어 
function searchDivInit(selId, srchTxtId) {
		
		var selectVal = $('#'+ selId +' :selected').val();
		
		if(selectVal == 1) 
			$('#'+srchTxtId).attr('name','prodNo');
		else if(selectVal == 2)
			$('#'+srchTxtId).attr('name','entrNo');
		else if(selectVal == 3)
			$('#'+srchTxtId).attr('name','custNo');
		else if(selectVal == 4)
			$('#'+srchTxtId).attr('name','rlusrCustNo');
		else if(selectVal == 5)
			$('#'+srchTxtId).attr('name','custrnmNo');
		else if(selectVal == 6)
			$('#'+srchTxtId).attr('name','bsRegNo');
		else if(selectVal == 7)
			$('#'+srchTxtId).attr('name','billAcntNo');
		else if(selectVal == 8)
			$('#'+srchTxtId).attr('name','address');

		$('#'+srchTxtId).val('');
		
}

//ZoBsbl001wInqKd 이벤트
function searchChange(selId, srchTxtId) {
		
	   $('#'+selId).change(function(){
			searchDivInit(selId, srchTxtId);
		    $('#'+srchTxtId).val('');
		});
}

function PymMthdCdNmSet(selId, srchTxtId){
	
	var selectVal = $('#'+ selId +' :selected').val();
	
	if(selectVal == 11){
		
		$('#'+srchTxtId).attr('name','bankTrns');
	} 
	else if(selectVal == 12 ){
		
		$('#'+srchTxtId).attr('name','barter');
	}
	else if(selectVal == 21 ){
		
		$('#'+srchTxtId).attr('name','cash');
	}
	else if(selectVal == 22 ){
		
		$('#'+srchTxtId).attr('name','cardImdPym');
	}
	else if(selectVal == 31 ){
		
		$('#'+srchTxtId).attr('name','voucher');
	}
	else if(selectVal == 32 ){
		
		$('#'+srchTxtId).attr('name','loyaltyP');
	}
	else if(selectVal == 33 ){
		
		$('#'+srchTxtId).attr('name','deposit');
	}
	else if(selectVal == 34 ){
		
		$('#'+srchTxtId).attr('name','prePymBal');
	}
}

function PymMthdCdChg(selId, srchTxtId){

	 $('#'+selId).change(function(){
		 	PymMthdCdNmSet(selId, srchTxtId);
		    $('#'+srchTxtId).val('');
		});
		
}
