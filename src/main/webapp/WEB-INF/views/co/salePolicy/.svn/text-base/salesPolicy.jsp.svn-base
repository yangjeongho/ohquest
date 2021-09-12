<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	
	drawPolicyBenefitDcTableGrid();
	drawPolicyBenefitProductTableGrid();
	drawPolicyCouponTableGrid();
	drawPolicyLocationTableGrid();
	drawPolicyDecieTableGrid();
	drawPolicyProductTableGrid();
	drawPolicyTableGrid();
	
	$("#policyForm #plcy000Close").click(function(e) {
		e.preventDefault();
		Dialog.close('#${param.dialogName}');
	});
	
	$("#policyForm #plcy000Confirm").click(function(e) {
		e.preventDefault();
		if(eval("window.${param.callBack}") != null){
			var funcName = eval("${param.callBack}");
			funcName(gf_getMultiSelectedGridData("#policyForm #policyTable"));
		}
		Dialog.close('#${param.dialogName}');
	});
	
});

function drawPolicyTableGrid(){
	mydata = [
	          {aa:'10 Month, VIP',bb:'2012-10-01',cc:'2012-12-31'},
	          {aa:'11 Month, New Scriber',bb:'2012-11-01',cc:'2012-12-31'},
	          {aa:'12 Month, X-Mas Event',bb:'2012-12-01',cc:'2012-12-31'},
	          {aa:'Use Agreement 2 year',bb:'2012-01-01',cc:'2012-12-31'}
	          ];
	
	
	jQuery('#policyForm #policyTable').jqGrid({
		datatype:"local",
		width:1000,
		height:120,
		colNames:[
		          '<s:message code="cos.label.000207"/>',//'Policy Name',
		          '<s:message code="cos.cosPol003.cosPol003SearchResult.lable.Start_Date"/>',//'Start Date',
		          '<s:message code="cos.cosPol003.cosPol003SearchResult.lable.End_Date"/>',//'End Date'
		          ],
		colModel:[
		          {name:'aa' ,index:'aa', width:100},
		          {name:'bb' ,index:'bb', width:100},
		          {name:'cc' ,index:'cc', width:100}
		          ],
		multiselect:true,
		sortable: false,
		shrinkToFit : true
	});
	
	for(var i=0;i<=mydata.length;i++)
		jQuery("#policyForm #policyTable").jqGrid('addRowData',i+1,mydata[i]);
}


function drawPolicyProductTableGrid(){
	mydata1 = [
	          {aa:'PREMIUM'},
	          {aa:'Dream life'},
	          {aa:'12 Month'}
	          ];
	
	
	jQuery('#policyForm #policyProductTable').jqGrid({
		datatype:"local",
		width:235,
		height:120,
		colNames:[
		          '<s:message code="bs.label.000146"/>',//'Product'
		          ],
		colModel:[
		          {name:'aa' ,index:'aa', width:100}
		          ],
		multiselect:false,
		sortable: false,
		shrinkToFit : true
	});
	
	for(var i=0;i<=mydata1.length;i++)
		jQuery("#policyForm #policyProductTable").jqGrid('addRowData',i+1,mydata1[i]);
		
}

function drawPolicyDecieTableGrid(){
	mydata2 = [
	          {aa:'galaxy S3'},
	          {aa:'iphone 4S'}
	          ];
	
	
	jQuery('#policyForm #policyDeciceTable').jqGrid({
		datatype:"local",
		width:235,
		height:120,
		colNames:[
		          '<s:message code="cs.caption.entr.0003"/>',//'Device'
		          ],
		colModel:[
		          {name:'aa' ,index:'aa', width:100}
		          ],
		multiselect:false,
		sortable: false,
		shrinkToFit : true
	});
	
	for(var i=0;i<=mydata2.length;i++)
		jQuery("#policyForm #policyDeciceTable").jqGrid('addRowData',i+1,mydata2[i]);
		
}

function drawPolicyLocationTableGrid(){
	mydata3 = [
	           {aa:'Agency1'},
	           {aa:'Agency2'}
	           ];
	
	
	 jQuery('#policyForm #policyLocationTable').jqGrid({
	 	datatype:"local",
	 	width:235,
	 	height:120,
	 	colNames:[
	 			  '<s:message code="cs.label.policy.000038"/>',//Agency
	 	          ],
	 	colModel:[
	 	          {name:'aa' ,index:'aa', width:100}
	 	          ],
	 	multiselect:false,
	 	sortable: false,
	 	shrinkToFit : true
	 });
	
	 for(var i=0;i<=mydata3.length;i++)
	 	jQuery("#policyForm #policyLocationTable").jqGrid('addRowData',i+1,mydata3[i]);
}

function drawPolicyCouponTableGrid(){
	 mydata4 = [
	            {aa:'New Coupon'},
	            {aa:'sale Coupon'}
	            ];
	
	
	  jQuery('#policyForm #policycouponTable').jqGrid({
	  	datatype:"local",
	  	width:235,
	  	height:120,
	  	colNames:[
	  			  '<s:message code="cs.label.policy.000041"/>',//'Coupon'
	  	          ],
	  	colModel:[
	  	          {name:'aa' ,index:'aa', width:100}
	  	          ],
	  	multiselect:false,
	  	sortable: false,
	  	shrinkToFit : true
	  });
	  //for(var i=0;i<=mydata4.length;i++)
	  //	jQuery("#policyForm #policycouponTable").jqGrid('addRowData',i+1,mydata4[i]);
	  
}

function drawPolicyBenefitProductTableGrid(){
	  mydata5 = [
	            {aa:'Data Free 10M'},
	            {aa:'SMS Free 100'}
	            ];
	
	
	  jQuery('#policyForm #policyBenefitProductTable').jqGrid({
	  	datatype:"local",
	  	width:235,
	  	height:330,
	  	colNames:[
	  			 '<s:message code="cs.caption.entr.0008"/>',//'Vas'
	  	          ],
	  	colModel:[
	  	          {name:'aa' ,index:'aa', width:100}
	  	          ],
	  	multiselect:false,
	  	sortable: false,
	  	shrinkToFit : true
	  });
	
	  for(var i=0;i<=mydata5.length;i++)
	   	jQuery("#policyForm #policyBenefitProductTable").jqGrid('addRowData',i+1,mydata5[i]);
}

function drawPolicyBenefitDcTableGrid(){
	mydata6 = [
	           {aa:'Monthly Fee 50%'}
	           ];
	
	
	jQuery('#policyForm #policyBenefitDcTable').jqGrid({
	 	datatype:"local",
	 	width:235,
	 	height:330,
	 	colNames:[
	 	  		  '<s:message code="ccs.csCccs000.counselMemoList.lable.Discount"/>',//'Discount'
	 	          ],
	 	colModel:[
	 	          {name:'aa' ,index:'aa', width:100}
	 	          ],
	 	multiselect:false,
	 	sortable: false,
	 	shrinkToFit : true
	});
}
    for(var i=0;i<=mydata6.length;i++)
    	jQuery("#policyForm #policyBenefitDcTable").jqGrid('addRowData',i+1,mydata6[i]);

</script>

<div id="wrap_1000">
	<form id="policyForm">
		<div class="mt_10">
			<div class="title">
				<!-- 타이틀 //-->
				<h1><s:message code="cs.label.policy.000042"/></h1>
			</div>
			<table id="policyTable"></table>
		</div>
	<div class="contents_box">
			<table width="1000px" cellpadding="0" cellspacing="0" border="0" >
				<tr>
					<td width="500px">
						<!-- 타이틀 영역  //-->
						<div class="title">
							<!-- 타이틀 //-->
							<h1><s:message code="cos.label.Condition"/></h1>
							<!--// 타이틀 -->
						</div>
						<table width="480px" cellpadding="0" cellspacing="0" border="1" class="table_view01">
							<tr>
								<th><s:message code="cos.label.000207"/></th>
								<td><input id="policyName" name="policyName" type="text" class="form_disable" value="10 Month, VIP"/></td>
							</tr>
							<tr>
								<th><s:message code="cos.label.000177"/></th>
								<td><input id="policyStartDay" name="policyStartDay" type="text" class="form_disable" value="2012-10-01"/> - 
								    <input id="policyEndDay" name="policyEndDay" type="text" class="form_disable" value="2012-12-31"/>
							</tr>
							<tr>
								<th><s:message code="cs.label.policy.000045"/></th>
								<td><input id="policyStartDay" name="policyStartDay" type="text" class="form_normal01" value="2012-10-21"/> - 
								    <input id="policyEndDay" name="policyEndDay" type="text" class="form_normal01" value="2014-10-20"/>
							</tr>
						</table>
						<br/>
						<table width="480px" cellpadding="0" cellspacing="0" border="0" >
							<tr>
								<td><table id="policyProductTable"></table></td>
								<td><table id="policyDeciceTable"></table></td>
							</tr>
							<tr>
								<td><table id="policycouponTable"></table></td>
								<td><table id="policyLocationTable"></table></td>
							</tr>
						</table>
					</td>
					<td>
						<!-- 타이틀 영역  //-->
						<div class="title">
							<!-- 타이틀 //-->
							<h1><s:message code="cs.label.policy.000014"/></h1>
							<!--// 타이틀 -->
						</div>
						<table width="480px" cellpadding="0" cellspacing="0" border="0" >
							<tr>
								<td><table id="policyBenefitProductTable"></table></td>
								<td><table id="policyBenefitDcTable"></table></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	  </div>
		<div class="contents_box mt_5 both">
				<!-- 버튼 //-->
				<div class="f_right">
					<span class="btns7 save"><input id="plcy000Confirm" type="submit" value= '<s:message code="cmn.btn.confirm"/>' /></span>
					<span class="btns7 save"><input id="plcy000Close" 	type="submit" value= '<s:message code="cmn.btn.close"/>' /></span>
				</div>
				<!--// 버튼 -->
		</div>
	  </form>
</div>
