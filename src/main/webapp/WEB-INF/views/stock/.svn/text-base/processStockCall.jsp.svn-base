<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">

	//기능설명
	$(function(e) {
		
		reCallProcessStockOk();

		function reCallProcessStockOk() {
		 	$.ajax({
						type : "GET",
						async : true,
						url : baseUrl + "stock/mystock/processStock.do",
						data : 'html',
						dataType : "json",
						success : function(data) {
							
							return 1;
						},
						error : function(data) {
						},
						complete : function(jqXHR, textStatus) {
						}
					}); 
		}
	});
	
</script>		
<div id="openStock"  class="grid">
     <%--  <span class="btns3 save"><input type="button" id="myRecommadnBtn" name="myRecommadnBtn" value="관심종목조회"></span>
      <span class="btns3 save"><input type="button" id="myStockSaveBtn" name="myStockSaveBtn" value="관심종목저장"></span> 
       <button class="inset" id="myRecommadnBtn"><i class="icon-search"></i> 관심종목조회 </button>--%>
    <li><i class="icon-time"></i>처리중입니다(실시간 주식 분석정보)...</li>   
</div>
		
