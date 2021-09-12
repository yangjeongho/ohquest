<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="<s:url value="/resources/jqgrid.lee/js/jquery.jqGrid.min.js" />"></script>
<script type="text/javascript"
	src="<s:url value="/resources/jqgrid.lee/js/i18n/grid.locale-en.js" />"></script>
<script type="text/javascript"
	src="<s:url value="/resources/jqgrid.lee/plugins/jquery.searchFilter.js" />"></script>



<script type="text/javascript">
	function dateFormater(cellvalue, options, rowObject) {
 		gf_console.log(cellvalue);
 		return cellvalue;
	}
	jQuery("#grid").jqGrid({        
		//url : baseUrl +"bsar/bsarJson",
	  	//datatype: 'json',
	    //mtype: 'GET',
	    //data : mydatalee,
		datatype: "local",
	    colNames: ['핫빌조회일시','상품구분', '상품번호','청구년월','합계'],
	  	colModel: [
	   	           	{name:'date',		index:'date', /*  width:55, */sorttype:"text", /* formatter: dateFormater *//* , editoptions:{readonly:true,size:10}, */},
	      			{name:'firstName',	index:'firstName', align:"right"},
	     			{name:'lastName', 	index:'lastName', align:"right"  },
	     			{name:'cc', index:'cc', align:"right" },
	     			{name:'dd', index:'dd', align:"right" }
	    ], 
	    sortable: true,
	    hidegrid: true,
	    height: '200', 
	    width: '1170',
	    scrollOffset:0,
	    shrinkToFit: false,
	    //pager: "#pager", 
	    //caption: "acube grid exam" ,
	    multiselect: true,
	    sortname: 'First Name',
	    sortorder: "desc",
	    gridview: true,
	    ondblClickRow: function(rowid, iRow, iCol, e){
	    	MessageBox.dialog('rowid='+ rowid+" / "+"iRow="+iRow+" / "+"iCol="+iCol+" / "+"e="+e);
	    	//selDatas  ==> new data (json 포멧)
	    	//jQuery("#grid").jqGrid('addRowData', ids.length+1, selDatas.rows); */
	    },
	    gridComplete : function(data){
		
	    },
	    jsonReader: {
	    	root: "rows",
	        //page: "page",
	       	//total: "total",
	      	//records: "records",
	        repeatitems: false,
	        //cell: "cell",
	        //id: "lastName"                 
	    }
	});
		
	jQuery("#grid2").jqGrid({        
		//url : baseUrl +"bsar/bsarJson",
		//datatype: 'json',
		//mtype: 'GET',
		//data : mydatalee,
		
		datatype: "local",
		colNames: ['청구년월', '가입번호','청구분류명', '청구항목명', '청구금액'],
		colModel: [
		      		{name:'add_num',index:'add_num', align:"right"  },
		   			{name:'city', index:'city', align:"right"  },
		   			{name:'district', index:'district', align:"right"  },
		   			{name:'sub_district', index:'sub_district', align:"right" },
		   			{name:'building', index:'building', align:"right" }
		], 
		sortable: true,
		//hidegrid: true,
		height: '265',
		width: '1170',
		scrollOffset:0,
		shrinkToFit: false,
		//pager: "#pager", 
		//caption: "acube grid exam" ,
	    //multiselect: true,
	    sortname: 'add_num',
	    sortorder: "desc",
	    gridview: true,
	    ondblClickRow: function(rowid, iRow, iCol, e){
	    	MessageBox.dialog('rowid='+ rowid+" / "+"iRow="+iRow+" / "+"iCol="+iCol+" / "+"e="+e);
	    	//selDatas  ==> new data (json 포멧)
	    /* 	var selDatas = {"rows":[{"firstName":"yong0","lastName":"yyy0","id":10},{"firstName":"yong1","lastName":"yyy1","id":11},{"firstName":"yong2","lastName":"yyy2","id":12},{"firstName":"yong3","lastName":"yyy3","id":13},{"firstName":"yong4","lastName":"yyy4","id":14},{"firstName":"yong5","lastName":"yyy5","id":15},{"firstName":"yong6","lastName":"yyy6","id":16},{"firstName":"yong7","lastName":"yyy7","id":17},{"firstName":"yong8","lastName":"yyy8","id":18},{"firstName":"yong9","lastName":"yyy9","id":19}]};
	    	jQuery("#grid2").jqGrid('addRowData', ids.length+1, selDatas.rows); */
	    },
	    gridComplete : function(data){
		
	    },
	    jsonReader: {
	    	root: "rows2",
	        //page: "page",
	       	//total: "total",
	      	//records: "records",
	        repeatitems: false,
	        //cell: "cell",
	        //id: "lastName"                 
	    }
	});
	
	
var mydatalee = [];
var intSize = 0;
<c:forEach items="${rows}" var="rows" varStatus="status">
	mydatalee[intSize] = { 
					date:  "<c:out value="${rows.date}" />" ,	
					firstName:  "<c:out value="${rows.firstName}" />" , 
					lastName:  "<c:out value="${rows.lastName}" />" ,
					cc: "<c:out value="${rows.cc}" />" ,
					dd: "<c:out value="${rows.dd}" />" ,
					ee: "<c:out value="${rows.ee}" />", 
					ff: "<c:out value="${rows.ff}" />" ,
					gg: "<c:out value="${rows.gg}" />" ,
					hh: "<c:out value="${rows.hh}" />" ,
	                ii: "<c:out value="${rows.ii}" />" ,
	                jj: "<c:out value="${rows.jj}" />",
	                kk: "<c:out value="${rows.kk}" />"
    };

	jQuery("#grid").jqGrid('addRowData', intSize, mydatalee[intSize]);
	intSize = intSize + 1;
</c:forEach>
 
var mydatalee2 = [];
var intSize2 = 0;

<c:forEach items="${rows2}" var="rows2" varStatus="status">
	mydatalee2[intSize2] = { 
					add_num:  "<c:out value="${rows2.add_num}" />" , 
					city:  "<c:out value="${rows2.city}" />" ,
					district: "<c:out value="${rows2.district}" />" ,
					sub_district: "<c:out value="${rows2.sub_district}" />" ,
					building: "<c:out value="${rows2.building}" />", 
					location: "<c:out value="${rows2.location}" />" ,
					entrance: "<c:out value="${rows2.entrance}" />" ,
					apt: "<c:out value="${rows2.apt}" />" ,
					sys_creation_date: "<c:out value="${rows2.sys_creation_date}" />" ,
					sys_update_date: "<c:out value="${rows2.sys_update_date}" />" ,
					operator_id: "<c:out value="${rows2.operator_id}" />" ,
					application_id: "<c:out value="${rows2.application_id}" />" ,
					dl_service_code: "<c:out value="${rows2.dl_service_code}" />" ,
					dl_update_stamp: "<c:out value="${rows2.dl_update_stamp}" />" 
	};

	jQuery("#grid2").jqGrid('addRowData', intSize2, mydatalee2[intSize2]);
	intSize2 = intSize2 + 1;
</c:forEach>

	
	$("#more").click(function() {
		$.ajax({
			type : "GET",  
			async : true,
			contentType: "application/json",
			url : baseUrl +"bsar/bsarJson",
			data : {"rowNum": 500},
			dataType : 'json',
			success : function(data) {
				//last-data
				var ids = jQuery("#grid").getDataIDs();  
				jQuery("#grid").jqGrid('addRowData', ids.length+1, data.rows);
				var d = new Date();
				gf_console.log(d.getSeconds());
			},	error:function(data){
				//MessageBox.error(data, "err.500");
			}, complete:function(jqXHR, textStatus){
			}
		});
	});
</script>

<div class="mt_20">
	<div class="title">
		<h1>계산내역</h1>
	</div>

	<table id="grid"></table>
</div>



<div class="mt_20">
	<div class="title">
		<h1>상세내역</h1>
	</div>

	<table id="grid2"></table>
</div>
		



  
<!--	
<html> 
<head> 
</head>
<link type="text/css" rel="stylesheet" href="<s:url value="/resources/styles/tab.css"/>" > 
<script type="text/javascript" src="<s:url value="/resources/javascript/common/tab.js"/>"></script> 
<body> 
<h1>양정호 테스트</h1> 
<div id="passes-container" class="container">
  <ul id="passes" class="passes">
    <li class="easyjet">
      <div>
  TEST1
      </div>
    </li>
    <li class="airberlin">
      <div>
     TEST2
      </div>
    </li>
    <li class="ba">
      <div>
TEST3
      </div>
    </li>
    <li class="ba">
      <div>
        test4
      </div>
    </li>
  </ul>
</div>

</body> 
</html> 

_-->

