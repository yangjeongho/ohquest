/*var fixGridWidth = function (grid) {
    var gviewScrollWidth = grid[0].parentNode.parentNode.parentNode.scrollWidth;
    var mainWidth = jQuery('#main').width();
    var gridScrollWidth = grid[0].scrollWidth;
    var htable = jQuery('table.ui-jqgrid-htable', grid[0].parentNode.parentNode.parentNode);
    var scrollWidth = gridScrollWidth;
    if (htable.length > 0) {
        var hdivScrollWidth = htable[0].scrollWidth;
        if ((gridScrollWidth < hdivScrollWidth))
            scrollWidth = hdivScrollWidth; // max (gridScrollWidth, hdivScrollWidth)
    }
    if (gviewScrollWidth != scrollWidth || scrollWidth > mainWidth) {
        var newGridWidth = (scrollWidth <= mainWidth)? scrollWidth: mainWidth;  // min (scrollWidth, mainWidth)
        // if the grid has no data, gridScrollWidth can be less then hdiv[0].scrollWidth
        if (newGridWidth != gviewScrollWidth)
            grid.jqGrid("setGridWidth", newGridWidth);
    }
};

var fixGridHeight = function (grid) {
    var gviewNode = grid[0].parentNode.parentNode.parentNode;
    //var gview = grid.parent().parent().parent();
    //var bdiv = jQuery("#gview_" + grid[0].id + " .ui-jqgrid-bdiv");
    var bdiv = jQuery(".ui-jqgrid-bdiv", gviewNode);
    if (bdiv.length) {
        var delta = bdiv[0].scrollHeight - bdiv[0].clientHeight;
        var height = grid.height();
        if (delta !== 0 && height && (height-delta>0)) {
            grid.setGridHeight(height-delta);
        }
    }
};

var fixGridSize = function (grid) {
    this.fixGridWidth(grid);
    this.fixGridHeight(grid);
};*/

$.fn.isBound = function(type, fn) {
	
	console.log($().jquery);
	console.log(jQuery.fn.jquery);
	console.log($.ui.version);
	console.log(jQuery.ui.version);
	//jquery1.8//var data = jQuery._data(this[0], 'events')[type];
	var data = jQuery._data(this[0], 'events')[type];
    //var data = this.data('events')[type];
    console.log(data);

    if (data === undefined || data.length === 0) {
        return false;
    }

    return (-1 !== $.inArray(fn, data));
};

/*//Array Remove - By John Resig (MIT Licensed)
Array.prototype.remove = function(from, to) {
  var rest = this.slice((to || from) + 1 || this.length);
  this.length = from < 0 ? this.length + from : from;
  return this.push.apply(this, rest);
};

Array.remove = function(array, from, to) {
	  var rest = array.slice((to || from) + 1 || array.length);
	  array.length = from < 0 ? array.length + from : from;
	  return array.push.apply(array, rest);
};*/

//bsar만 적용된다.....
function imd_payment(){
	//이력조회 즉시납부
	// 환율 
	var excRate1 = parseFloat("1").toFixed(2);
	var excRate = parseFloat("1100").toFixed(2);
	$('#voucherInq').click(function(e){
		//console.log(typeof $('#vch1').val());
		e.preventDefault();
		
		if($('#vch1').val() != ""){
			if($('#vch1').val() == "10030"){
				
				$('#vch2').val("USD");
				$('#vch3').val("50");
				
			}
			else if($('#vch1').val() == "10031"){
				
				$('#vch2').val("MNT");
				$('#vch3').val("10000");
				
			}
			
			if($('#vch2').val()=="USD"){
				$('#pymCurUnit').val(1);
			}else if($('#vch2').val() == "MNT"){
				$('#pymCurUnit').val(2);
			}
			
		} else {
			alert("바우처번호를 입력하세요");
		}
		
		
	});

	//이력조회 즉시 수납
	$('#nowBill').click(function(e){
		e.preventDefault();
		
		//화폐단위
		var pymCurUnit =  $('#pymCurUnit');
		//청구계정 화폐단위
		var billCurUnit = $('#_billCurNm');
		//수납금액
		var pym1 = $('#pym1');
		//환산기준
		var pym2 = $('#pym2');
		//수납요청금액
		var pym3 = $('#pym3');
		//#bsArManageTabDiv-1
		$('#bsArManageTabDiv-1').append($('#bsarManageDialog').css('display','block'));
		
		$("#pymMthdCd").val("21");
		
		//환산기준 입력
		//화폐단위 초기화	
			if(billCurUnit.val() == "USD"){
				
				if(pymCurUnit.val() == 1){
					//USD->USD
					pym2.val(excRate1);
					
				} 
				else if(pymCurUnit.val() == 2){
					//USD->MNT
					pym2.val(excRate);
					
				} 
				//다른화폐도 추가....
			}
			else if( billCurUnit.val() == "MNT"){
				
				if(pymCurUnit.val() == 1){
					//MNT->USD 
					pym2.val(excRate);
					
				} 
				else if(pymCurUnit.val() == 2){
					//MNT->USD 
					pym2.val(excRate1);
					
				} 
				//다른화폐도 추가
			}
		
		//수납금액 변환시
		pym1.change(function(){
			if(pym1.val() != ""){
			
				var accRate = acc_rate(billCurUnit,pymCurUnit,pym1,pym2);
			//	console.log(accRate);
				pym3.val(accRate);
				
				if($("#pymMthdCd option:selected").val() == 32){
					$("#lyp2").val(accRate);
					balance_acc($('#lyp1'),$('#lyp2'),$('#lyp3'),pym1);
					var fpym1 = parseFloat(pym1.val()).toFixed(2);
					pym1.val(fpym1);
				}
				else if($("#pymMthdCd option:selected").val() == 34){
					$("#ppym2").val(accRate);
					balance_acc($('#ppym1'),$('#ppym2'),$('#ppym3'),pym1);
					var fpym1 = parseFloat(pym1.val()).toFixed(2);
					pym1.val(fpym1);
				}
			}
		});
		
		pym1.focusout(function(){
			if(pym1.val() != ""){
				var accRate = acc_rate(billCurUnit,pymCurUnit,pym1,pym2);
				pym3.val(accRate);
				if($("#pymMthdCd option:selected").val() == 32){
					$("#lyp2").val(accRate);
					balance_acc($('#lyp1'),$('#lyp2'),$('#lyp3'),pym1);
					var fpym1 = parseFloat(pym1.val()).toFixed(2);
					pym1.val(fpym1);
				}
				else if($("#pymMthdCd option:selected").val() == 34){
					$("#ppym2").val(accRate);
					balance_acc($('#ppym1'),$('#ppym2'),$('#ppym3'),pym1);
				}
				var fpym1 = parseFloat(pym1.val()).toFixed(2);
				pym1.val(fpym1);
			}
			
		});
		
		pym1.focus(function(){

			if(pym1.val() != ""){
				var accRate = acc_rate(billCurUnit,pymCurUnit,pym1,pym2);
				pym3.val(accRate);
				
				if($("#pymMthdCd option:selected").val() == 32){
					$("#lyp2").val(accRate);
					balance_acc($('#lyp1'),$('#lyp2'),$('#lyp3'),pym1);
				}
				else if($("#pymMthdCd option:selected").val() == 34){
					$("#ppym2").val(accRate);
					balance_acc($('#ppym1'),$('#ppym2'),$('#ppym3'),pym1);
				}
			}
			
		}); 
		
		
		
		//수납화폐단위 바뀔시
		pymCurUnit.change(function(e){
			var curSelect = parseInt(this.value);
			switch(curSelect){
				
				case 1:
						if(billCurUnit.val() == 'USD'){
							pym2.val(excRate1);
						}
						else if(billCurUnit.val() == 'MNT'){
							pym2.val(excRate);
						}
						pym1.focus();
						break;
					
				case 2:
						if(billCurUnit.val() == 'USD'){
							pym2.val(excRate);
						}
						else if(billCurUnit.val() == 'MNT'){
							pym2.val(excRate1);
						}
						pym1.focus();
						break;
			}
		});
					
	
		$('#pymMthdCd').change(function(e){
			pymMthdsel = parseInt(this.value);
			//현금이나 BankTransfert시 청구화폐단위와 수납화폐단위를 맞춘다.
			switch(pymMthdsel){
				//Bank Transfer
				case 11: 
						 pymElem_clear("pymTable");
						 pymElem_disable("pymTable",".pym");
						 excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						 pymElem_defence("pymTable");		 
						 break;
				//Barter
				case 12: 
						 pymElem_clear("pymTable");
						 var btr2 = $('#btr2'); 
						 var btr3 = $('#btr3'); 
						 
						 btr3.keyup(function(e){
							 
							 if (e.keyCode == 13 || e.keyCode == 9) {
								 
								 if(btr2.val() != "" && btr3.val() != ""){
										
										var btrAmt = parseInt(btr2.val()) * parseInt(btr3.val());
										pym1.val(btrAmt.toFixed(2));
										pym1.focus();
  								 }
							 }
						 });
						 
						btr2.focusout(function(e){

								if($(this).val() == "" || $(this).val() == undefined ){
									alert("값을 입력하시오");
									$(this).focus();
								}
								
								if(btr2.val() != "" && btr3.val() != ""){
									
									var btrAmt = parseInt(btr2.val()) * parseInt(btr3.val());
									pym1.val(btrAmt.toFixed(2));
									pym1.focus();
								}
						 });
						 btr3.focusout(function(e){
							 	//수량이 들어오나 안 들어오나..
								if( btr2.val() == "" ||  btr2.val() == undefined ){
									alert("값을 입력하시오");
									 btr2.focus();
								}
								else if($(this).val() == "" || $(this).val() == undefined ){
									alert("값을 입력하시오");
									$(this).focus();
								}
								
								
								if(btr2.val() != "" && btr3.val() != ""){
									
									var btrAmt = parseInt(btr2.val()) * parseInt(btr3.val());
									pym1.val(btrAmt.toFixed(2));
									pym1.focus();
								}
						 });
						 
						 $(".btr").removeAttr("disabled").removeClass("form_readonly").addClass("form_normal01");
						 $("#imdPym_barterCd").removeClass("form_select02").addClass("form_select01");
					  	 pymElem_disable("pymTable",".btr");
					  	 excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						 pymElem_defence("pymTable");
						 break;
				//현금
				case 21: 
						 pymElem_clear("pymTable");
						 pymElem_disable("pymTable",".pym");
						 excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
					 	 pymElem_defence("pymTable");
					 	 break;
				//신용카드즉납
				case 22: 
						 pymElem_clear("pymTable");
						 pymElem_disable("pymTable",".pym");
						 excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						 pymElem_defence("pymTable");	
						 break;
				//voucher
				case 31: 
						 pymElem_clear("pymTable");
						 $(".vch").removeAttr("disabled").removeClass("form_readonly").addClass("form_normal01");
						 $(".vch1").removeAttr("disabled").attr('readonly',true);
						 pymElem_disable("pymTable",".vch");
						 excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						 pymElem_defence("pymTable");
						 break;
				//loyalty point
				case 32: 
						pymElem_clear("pymTable");
					 	$(".lyp").removeAttr("disabled").attr("readonly",true);
					 	$('#lyp1').val(parseFloat("30000").toFixed(2));
					 	pymElem_disable("pymTable",".lyp");
					 	excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						pymElem_defence("pymTable");
						break;
				//보증금
				case 33:
						pymElem_clear("pymTable");
						$('#dps1').val(parseFloat("25000").toFixed(2));
						$('#dps2').val(parseFloat("10000").toFixed(2));

						var dps3value= parseFloat($('#dps1').val()) - parseInt($('#dps2').val());
						 $('#dps3').val(dps3value.toFixed(2));
						
						$(".dps").removeAttr("disabled").attr("readonly",true);
						pymElem_disable("pymTable",".dps");
						excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						pymElem_defence("pymTable");
						break;
				//선불 잔액
				case 34:
						pymElem_clear("pymTable");	
						$(".ppym").removeAttr("disabled").attr("readonly",true);
						$('#ppym1').val(parseFloat("50000").toFixed(2));
						pymElem_disable("pymTable",".ppym");
						excRate_inject(billCurUnit,pymCurUnit,"pymMthdCd",pym2,excRate1,excRate);
						pymElem_defence("pymTable");
						break;
				
				default: alert("common code not value");
			    
			}
			
			
			
		});
		
	});
	$('#bsArClose').click(function(e){
		e.preventDefault();
		$('#bsarManageDialog').css('display','none');
	});
	}
//이력조회 즉시납부 끝		

//청구화폐단위 //수납화폐단위   //수납금액   //환율
function acc_rate(billCurUnit,pymCurUnit,pymAmt,excRate){
	
	var accValue=parseFloat(0);

	if(billCurUnit != ""){
							
		if(billCurUnit.val() == "USD"){
			
			//USD-USD
			if(pymCurUnit.val() == 1){
				accValue = parseFloat(pymAmt.val()) * parseFloat(excRate.val());
			}
			//USD-MNT
			else if(pymCurUnit.val() == 2 ){
				
				accValue = parseFloat(pymAmt.val()) / parseFloat(excRate.val());
			}
			
		}
		if(billCurUnit.val() == "MNT"){
			
			//USD-USD
			if(pymCurUnit.val() == 1){
				accValue = parseFloat(pymAmt.val()) * parseFloat(excRate.val());
			}
			//MNT-USD
			else if(pymCurUnit.val() == 2 ){
				
				accValue = parseFloat(pymAmt.val()) * parseFloat(excRate.val());
			}
			
		}
		
	}
	return accValue.toFixed(2);
}

//$('#_billCurNm') $('#pymCurUnit')	pymMthdCd pym2$('#pym2')
//청구화폐단위Id, 수납화폐단위Id, 납부방법Id, 환산지수Id //1대1 //환율
//환율 끌고올 생각좀 해보자....
function excRate_inject(billCurUnit, pymCurUnit, pymMthdSel, excRateId, rate1, rate2){
		//var equalRate = parseFloat("1").toFixed(2);
		var equalRate = parseFloat(rate1).toFixed(2);
		var excRate = parseFloat(rate2).toFixed(2);
		var pymMthdId = pymMthdSel;
	    var pymMthdSel = $("#"+pymMthdId+" option:selected");
		
		if(pymMthdSel.val() == 11 
			|| pymMthdSel.val() == 21){
		
				if(billCurUnit.val()!=""){
		
						if(billCurUnit.val()=="USD"){
							 pymCurUnit.val("1");
							 excRateId.val(equalRate);
						}
						else if(billCurUnit.val()=="MNT"){
							 pymCurUnit.val("2");
							 excRateId.val(equalRate);
						}
				}
		
		}else {
		
				pymCurUnit.val("2");
				if(billCurUnit.val()!=""){
					
					if(billCurUnit.val()=="USD"){
					 
						 excRateId.val(excRate);
					}
					else if(billCurUnit.val()=="MNT"){
					 
						 excRateId.val(equalRate);
					}
				}
		
		}
} //excRate_inject
//수납관련
function pymElem_defence(pymTableId){
	$("#"+pymTableId+" .pym").removeAttr("disabled").removeClass("form_readonly").addClass("form_normal01");
	$("#"+pymTableId+" .pym1").removeAttr("disabled");
};

function pymElem_disable(pymTableId,clss){
	$("#"+pymTableId+" :input").not(clss).attr("disabled","disabled").removeClass("form_normal01").addClass("form_readonly");
	
}

function pymElem_clear(pymTableId){
	$("#"+pymTableId+" input[type=text]").val("");
}


/*
 * 분리자를 이용하여 날짜의 유효성 체크
 * 예) 2000.03.24 -> '.'을 이용하여 체크한다.
 *@param inputDate 체크할 날짜
 *@param point 년,월,일 분리자
 */
function dateCheck(inputDate, point){
    var dateElement = new Array(3);
    
    if(point != ""){
        dateElement = inputDate.split(point);
        if(inputDate.length != 10 || dateElement.length != 3){
            return false;
        }
    }else{
        dateElement[0] = inputDate.substring(0,4);
        dateElement[1] = inputDate.substring(4,6);
        dateElement[2] = inputDate.substring(6,9);
    }
    //년도 검사
    if( !( 1800 <= dateElement[0] && dateElement[0] <= 4000 ) ) {
        return false;
    }

    //달 검사
    if( !( 0 < dateElement[1] &&  dateElement[1] < 13  ) ) {
        return false;
    }

    // 해당 년도 월의 마지막 날
    var tempDate = new Date(dateElement[0], dateElement[1], 0);
    var endDay = tempDate.getDate();

    //일 검사
    if( !( 0 < dateElement[2] && dateElement[2] <= endDay ) ) {
         return false;
    }

    return true;
}

/*
 * 날짜 비교
 * 종료일이 시작일 보다 작을때 false를
 * 정상 기간일 경우 true를 리턴한다.
 * @param startDate 시작일
 * @param endDate 종료일
 * @param point 날짜 구분자
 */
 function dateCompare(startDate, endDate, point){
    //정상 날짜인지 체크한다.
    var startDateChk = dateCheck(startDate, point);
    if(!startDateChk){
        return false;
    }
    var endDateChk = dateCheck(endDate, point, "end");
    
    if(!endDateChk){
        return false;
    }

    //년 월일로 분리 한다.
    var start_Date = new Array(3);
    var end_Date = new Array(3);

    if(point != ""){
        start_Date = startDate.split(point);
        end_Date = endDate.split(point);
        if(start_Date.length != 3 && end_Date.length != 3){
            return false;
        }
    }else{
        start_Date[0] = startDate.substring(0,4);
        start_Date[1] = startDate.substring(4,6);
        start_Date[2] = startDate.substring(6,9);

        end_Date[0] = endDate.substring(0,4);
        end_Date[1] = endDate.substring(4,6);
        end_Date[2] = endDate.substring(6,9);
    }

    //Date 객체를 생성한다.
    var sDate = new Date(start_Date[0], start_Date[1], start_Date[2]);
    var eDate = new Date(end_Date[0], end_Date[1], end_Date[2]);

    if(sDate > eDate){
        return false;
    }

    return true;
}

