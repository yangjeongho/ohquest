<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="<s:url value="/resources/lib/jquery/plugins/jqueryForm/jquery.form.js"/>"></script>
<script type="text/javascript">
	//기능설명

	$(function(e) {

		//초기화시키는 부분
		$("#smsCodeMainDiv #searchDivSmsCode #mode").val("I");
		//그리드가 생성되고 난 후 리드온리를 거짓으로 입력받을수있도록 하고 리드온리폼을 제거하고 노몰폼을 집어넣는다.
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").attr("readonly", false);
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").removeClass("form_readonly");
		$("#smsCodeMainDiv #searchDivSmsCode  #smsCodeInputForm #evntCd").addClass("form_normal01");

		firstSmsCodeLoad(); //리스트나열 함수 호출

		//reset버튼 누를 때 공백으로 초기화
		$("#smsCodeForm #smsCodeResetBtn").click(
				function(e) {
					e.preventDefault();
					$("#smsCodeInputForm #evntCd").val("");
					$("#smsCodeInputForm #evntCd").attr("readonly", false);
					$("#smsCodeInputForm #evntCd").removeClass("form_readonly").addClass("form_normal01");

					$("#smsCodeInputForm #smsSendPhr").val("");
					$("#smsCodeInputForm #evntNm").val("");
					$("#mode").val("I");//인서트 모드로 바꿔 줌
				});

		//delete 버튼을 누를때 데이터 지움
		$("#smsCodeForm #smsCodeDeleteBtn").click(function(e) {
			process("/co/smsCode/deleteSmsCode", "#smsCodeInputForm");
			$("#smsCodeSearchForm #evntCd").val("");
			firstSmsCodeLoad();
		});

		//close 버튼을 누를 때
		$("#smsCodeForm #smsCodeCloseBtn").click(function(e) {
			e.preventDefault();
			Dialog.close('#${param.dialogName}');
		});

		//검색버튼을 누를 때
		$("#smsCodeSearchForm #smsCodeSearchBtn").click(function(e) {
			e.preventDefault();
			gf_clearGridList(smsPhrByEvntTable); 
			//테이블초기화(2): jQuery("#jqgrid").jqGrid('clearGridData'); 

			firstSmsCodeLoad();
		});

		//저장 기능
		$("#smsCodeForm #smsCodeSaveBtn").click(function(e) {
			e.preventDefault();
			var vEvntCd = $("#smsCodeInputForm #evntCd").val();

			//공백이 입력되었을 때 알림창
			if (vEvntCd == "") {
				MessageBox.dialog('<s:message code="smsCode.msg.000001"/>');
				$("#smsCodeInputForm #evntCd").focus(); //focus(): 요소가 포커스를 받으면 발생
				return;
			}

			if ($("#mode").val() == 'I') {
				idCheck(vEvntCd);
				

			} else if ($("#mode").val() == 'U') {
				process("/co/smsCode/updateSmsCode", "#smsCodeInputForm");
			}
		});

		/*
		process함수
			기능 :
			insert 
			update :업데이트하면 모두 나열이 아닌 선택한 것만 나열
			delete
		*/
		function process(vUrl, vForm) {
			divMask("#smsCodeMainDiv", "process() ..Waiting...");
			$.ajax({
				type : "POST",//포스트방식으로 
				async : true,//비동기방식인지 동기식인지
				url : baseUrl + vUrl,
				data : $("#smsCodeMainDiv #searchDivSmsCode " + vForm).serialize(),//serialize(): Encode a set of form elements as a string for submission.
				dataType : "json",
				success : function(data) {
					
					gf_console.log(vUrl + " success...");
					if ($("#mode").val() == 'U') {//Update시에는 수정한 것만 나오도록 form의 evntCd그대로 둠
					
					} else { //검색할조건을 기화 시켜줘서 모두 나오도록
						$("#smsCodeSearchForm #evntCd").val("");
					}
					firstSmsCodeLoad();
					$("#smsCodeForm #smsCodeResetBtn").click(); //InputForm이 공백으로 만들어지도록
				},
				error : function(data) {
					gf_console.log("process() error..." + JSON.stringify(data));
					//JSON.parse() : JSON형식의 문자열을 자바스크립트 객체로 만든다.
					//JSON.stringify() : 자바스크립트 객체를 JSON형식의 문자열로 만든다.
					MessageBox.dialog('<s:message code="smsCode.msg.000002"/>');
				},
				complete : function(jqXHR, textStatus) {
					MessageBox.dialog('<s:message code="cmn.msg.saved" />'
);
					gf_console.log("process() completed .......");
					divUnmask("#smsCodeMainDiv");
				}
			});
		}
		/*
		중복체크
		EVNT_CD가 중복되는게 없을때만 INSERT 
		*/
		function idCheck(evntCd){	//매개변수를 똑같이 해줘야함
			divMask("#smsCodeMainDiv #searchDivSmsCode");
			$.ajax({
				type : "GET",
				async : true,
				url : baseUrl + "/co/smsCode/idCheckSmsCode?evntCd="+evntCd, //겟방식
				dataType : "json",
				success : function(data) {
					gf_console.log("IdCheck() Success..........");
					//alert(data+" : 0이면 등록 가능 1이면 중복"); //중복되는지 
					if (data == 0) {
						process("/co/smsCode/insertSmsCode", "#smsCodeInputForm");
					} else {
						MessageBox.dialog("err.000001");
					}
				},
				error : function(data) {
					gf_console.log("error..." + JSON.stringify(data));
					MessageBox.dialog("err.000001");
				},
				complete : function(jqXHR, textStatus) {
					gf_console.log("IdCheck() completed..........");
					divUnmask("#smsCodeMainDiv #searchDivSmsCode");
				}
			});	
		}
		 
		/*
		기능 : select / open할때 리스트 로드
		searchSmsCodeForm을 받아와서 검색어가 있으면 검색, 없으면 로드
		*/ 
		function firstSmsCodeLoad() {
			gf_clearGridList(smsPhrByEvntTable); // 테이블 그리드 클리어
			divMask("#smsCodeMainDiv #searchDivSmsCode", "Grid Loading..."); //불러오는 중에 화면을 파랗게 하는 것
			$.ajax({
						type : "POST",
						async : true,
						url : baseUrl + "/co/smsCode/searchSmsCode",
						data : $("#smsCodeSearchForm").serialize(),
						dataType : "json",
						success : function(data) {
							MessageBox.dialog("테스트 성공"); 
							if (data.list.length <= 0) {
								MessageBox.dialog("err.nodata"); //조회 할 데이터 없음
							} else {
								gf_addMultiGridList("#smsCodeMainDiv #searchDivSmsCode #smsPhrByEvntTable",data.list);
							}
						},
						error : function(data) {
							MessageBox.dialog("테스트 실패");
							
							//JSON.parse() : JSON형식의 문자열을 자바스크립트 객체로 만든다.
							//JSON.stringify() : 자바스크립트 객체를 JSON형식의 문자열로 만든다.
							MessageBox.dialog("firstSmsCodeLoad() Error..");
						},
						complete : function(jqXHR, textStatus) {
							divUnmask("#smsCodeMainDiv #searchDivSmsCode");
							$("#smsCodeMainDiv #searchDivSmsCode #mode").val("I"); //입력 모드로 초기화 시켜줌
							gf_console.log("firstSmsCodeLoad() Completed..........");
						}
					});
		}
		$("#smsPhrByEvntTable").css("cursor","pointer");
		//그리드 테이블설정
		$("#smsPhrByEvntTable").jqGrid(
				{
							datatype : "local",	height : 340,	width : 770,	
							colNames : [ //이름과 모델 갯수가 맞아야한다.
							             '<s:message code="co.smscode.smscode.label.00002" />', 
							             '<s:message code="co.smscode.smscode.label.00007" />', 	//Language
							             '<s:message code="co.smscode.smscode.label.00005" />', 	//SMS Send Phr
							             '<s:message code="co.smscode.smscode.label.00008" />',		//Event NM
							             '<s:message code="co.smscode.smscode.label.00009" />', 	//Sys Creation Date
							             '<s:message code="co.smscode.smscode.label.000010" />', 	//Update Date
							             '<s:message code="co.smscode.smscode.label.000011" />', 	//Operator ID
							             ],
							colModel : [ 
							       	  	{name : 'evntCd',			index : 'evntCd',			width : "80",		sorttype : "string",	align : 'center'},
								       	{name : 'Language',			index : 'Language',			width : "50",		sorttype : "string",	align : 'center'},
										{name : 'smsSendPhr',		index : 'smsSendPhr',		width : "140",		sorttype : "string",	align : 'center'},
										{name : 'evntNm',			index : 'evntNm',			width : "120",		sorttype : "string",	align : 'center',	formatter : barPlus},
										{name : 'sysCreationDate',	index : 'sysCreationDate',	width : "100",		sorttype : "string",	align : 'center',	formatter : barPlus}, 
										{name : 'sysUpdateDate',	index : 'sysUpdateDate',	width : "100",		sorttype : "string",	align : 'center'}, 
										{name : 'operatorId',		index : 'operatorId',		width : "100",		sorttype : "string",	align : 'center'},
							],
	
							viewrecords : true,
							shrinkToFit : false,
							multiselect : false,
							rownumbers : true,

							//그리드 선택해서 아래로 값이 입력되면 업데이트모드로 바뀜
							onSelectRow : function(id) {
								var rowData = $('#smsPhrByEvntTable')
										.getRowData(id);

								$("#mode").val("U");

								$("#smsCodeInputForm #evntCd").val(rowData.evntCd);
								$("#smsCodeInputForm #evntCd").attr("readonly",true);
								$("#smsCodeInputForm #evntCd").removeClass("form_normal01").addClass("form_readonly");
								$("#smsCodeInputForm #smsSendPhr").val(rowData.smsSendPhr);
								$("#smsCodeInputForm #evntNm").val(rowData.evntNm);
							}
				});
	});
</script>

<div id="smsCodeMainDiv" class="warp">
	<div id="searchDivSmsCode" class="contents_box">
		<form id="smsCodeSearchForm">
			<div class="search_box_01">
				<div class="f_left">
					<p>
						<s:message code="co.smscode.smscode.label.00002"/><input type="text" id="evntCd" name="evntCd"
							class="form_normal01" style="width: 200px;" value="" />
					</p>
				</div>
				<div class="f_right">
					<img src="<s:url value="/resources/images/common/line_01.gif"/>" />
					<span class="btns9 save"><input type="button"	value='<s:message code="cmn.btn.search"/>' id="smsCodeSearchBtn" /></span>
				</div>
			</div>
		</form>
		<div class="title">
			<h1><s:message code="co.smscode.smscode.label.00003"/></h1>
		</div>

		<table id="smsPhrByEvntTable"></table>

		<div class="title">
			<h1><s:message code="co.smscode.smscode.label.00004"/></h1>
		</div>
		<input type="hidden" class="form_normal01" id="mode" name="mode"style="width: 100%;" value="">
		<form id="smsCodeInputForm">
			<table width="100%" border="1" class="table_view01">
				<tr>
					<th width="20%"><s:message code="co.smscode.smscode.label.00002"/></th>
					<td><input type="text" class="form_normal01" name="evntCd"	id="evntCd" style="width: 100%;" /></td>
				</tr>
				<tr>
					<th width="20%"><s:message code="co.smscode.smscode.label.00005"/></th>
					<td><input type="text" class="form_normal01" name="smsSendPhr"	id="smsSendPhr" value="" style="width: 100%" /></td>
				</tr>
				<tr>
					<th width="20%"><s:message code="co.smscode.smscode.label.00006"/></th>
					<td><input type="text" class="form_normal01" name="evntNm"	id="evntNm" value="" style="width: 100%" /></td>
				</tr>
			</table>
		</form>

	</div>

	<div id="buttonDivSmsCode" class="contents_box">
		<form id="smsCodeForm">
			<div class="contents_box mt_5">
				<div class="f_left">
					<span class="btns7 save"> <input type="button"	value='<s:message code="cmn.btn.reset"/>' id="smsCodeResetBtn" />
					</span>
				</div>
				<div class="f_right">
					<span class="btns7 save"> <input type="button"	value='<s:message code="cmn.btn.delete"/>' id="smsCodeDeleteBtn" />
					</span> <span class="btns7 save"> <input type="button"
						value='<s:message code="cmn.btn.save"/>' id="smsCodeSaveBtn" />
					</span> <span class="btns7 save"> <input type="button"	value='<s:message code="cmn.btn.close"/>' id="smsCodeCloseBtn" />
					</span>
				</div>
			</div>
		</form>
	</div>
</div>
