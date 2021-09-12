var contentDivision = $("<div id=\"mainWork\"></div>");
var asideMenu = $("<p><a href=\"#\"><img src=\"\" class=\"mt_5\"/></a></p>");
var menuBaseUrl = baseUrl+"resources/javascript/menu/" ;

/* 각 메뉴에 대한 별도 스크립트 include  */
head.js(  menuBaseUrl + "csCommon.js" 	//공통
		, menuBaseUrl + "cs/csCust.js"  //고객
		, menuBaseUrl + "cs/csBill.js"  //빌링
		, menuBaseUrl + "cs/csEntr.js"  //가입
		, menuBaseUrl + "prm/prm.js"	//파트너
		, menuBaseUrl + "roam/roam.js"	//로밍
		, menuBaseUrl+ "cos/cosInfo.js"  //수수료정보
		, menuBaseUrl+ "cos/cosPol.js"  //수수료정책
		, menuBaseUrl+ "cos/cosRep.js"  //수수료장표
		, menuBaseUrl + "bsar/bs.js"	//청구
		, menuBaseUrl + "bsar/ar.js"	//수납
		, menuBaseUrl + "vo/vo.js"	//바우처
		, menuBaseUrl + "res/res.js"	//리소스
		, menuBaseUrl + "ccs/ccsWork.js"	//리소스
		, menuBaseUrl + "wm/wm.js"	//리소스
		, menuBaseUrl + "cs/csCug.js" //CUG
		, menuBaseUrl + "or/orUser.js" 
		, menuBaseUrl + "sample/sample.js" //sample
		, menuBaseUrl + "pdh/pdh.js"	//파트너
		, menuBaseUrl + "hotkey.js"	//hotkey event 처리
		, menuBaseUrl + "co/coUtil.js"
		, menuBaseUrl + "api/openApi.js" //openApi
);

// 네비게이션 영역의 타이틀을 설정함.
function setNavigationTitle(title){
	$("#navigationTitle").html(title);// 메뉴명칭을 설정함. dialog창은 제외됨.
}

// 작업 영역을 생성함
function createMainWorkArea(workAreaName, menuObject, imageUrl, loadUrl){
	try{
		
		
		setNavigationTitle($(menuObject).html());
			
		/* 1. workArea loading 처리 */
		//기 존재하는 workarea를 숨긴다.
		$("#mainWorkArea").find("[id=mainWork]").each(function(e){
			$(this).hide();
		});
		
		var workArea = $("#mainWorkArea").find("[id=mainWork][workAreaName="+workAreaName+"]");
		if(typeof($(workArea).attr('workAreaName')) != 'undefined'){ //해당 workArea가있으면 찾아서 show한다.
			$(workArea).show(); 
			$(this).hideLoading();
		}else{//없으면 생성하고 show한다.
			var newContentDivision = $(contentDivision).clone();
			$(newContentDivision).attr("workAreaName", workAreaName);
			$("#mainWorkArea").append(newContentDivision);
			$(newContentDivision).load(loadUrl, function(e){
				$(this).hideLoading();
			});
			
			/* 2. right aside menu 처리 */
			var mainWorkLength = $("#mainWorkArea").find("[id=mainWork]").length ;
			if(mainWorkLength ==10){ //10개이상은 제한한다.
				return ;
			}
			var newAsideMenu = $(asideMenu).clone();
			$(newAsideMenu).find('a').attr('id', 'asideMenu')
									 .attr('workAreaName', workAreaName)
									 .attr('navigationTitle', $(menuObject).html());
			$(newAsideMenu).find('img').attr('src', imageUrl);
			$("#asideMenuArea").append(newAsideMenu);
			
			//bind click event
			$(newAsideMenu).find('a').bind('click', clickAsideMenu);
		}
	}catch(e){
		alert('menu.js err : '+e);
	}
}

function reloadMainWorkArea(workAreaName, loadUrl){
	try{	
		var newContentDivision = $(contentDivision).clone();
		$(newContentDivision).attr("workAreaName", workAreaName);
		$("#mainWorkArea").append(newContentDivision);
		$(newContentDivision).load(loadUrl, function(e){
			$(this).hideLoading();
		});
	}catch(e){
		alert('menu.js err : '+e);
	}
}
// reload workarea
function reloadMainWorkArea(workAreaName, loadUrl){
	$("#mainWorkArea").find("[id=mainWork]").each(function(e){
		if($(this).attr('workAreaName') == workAreaName){
			$(this).loadingDialog(); 
			$(this).load(loadUrl, function(e){

				$(this).hideLoading();
			}) ;
			return false;
		}
	});
}

// 오른쪽 메뉴 클릭 이벤트 처리
function clickAsideMenu(){
	$("#mainWorkArea").find("[id=mainWork]").each(function(e){
		$(this).hide();
	});
	$("#mainWorkArea").find("[id=mainWork][workAreaName="+$(this).attr('workAreaName')+"]").show();
	setNavigationTitle($(this).attr('navigationTitle'));
}

$(function(e){
	//초기 공지사항 로딩 
	createMainWorkArea(  'notice'
						, $("<a href=\"#\" id=\"menuClick\" menuId=\"notice\" >Notice</a>")
						, baseUrl + 'resources/images/common/left/btn_notice.gif'
						, baseUrl + 'notice/list');
	//상단메뉴 클릭시 처리
	$("#menu").find("a").live("click", function(e){
		e.preventDefault();
		var menuId = $(this).attr("menuId");
		//alert(menuId+"/"+secNo);
		//alert(menuId+"/"+secNo);
		//var today = new Date();
		//today.setDate( today.getDate() + parseInt( expireDate ) );
		//파일쿠키
		//document.cookie = "secNo" + "=" + escape( $(this).attr("secNo") ) + "; path=/; expires=" + today.toGMTString() + ";";

	    //메모리 쿠기
	    document.cookie = "secNo" + "=" + escape( $(this).attr("secNo") ) + "; path=/;";
	    $("#myMenuBtn").prev().hide();  
		if(eval("window.clickMenu_"+menuId) != null){
			//dialog.js에 정의된 parameter임.
			dialogTitleAppId  = menuId ;
			$(this).loadingDialog();			
			var menuFunction= eval("clickMenu_"+menuId);			
			menuFunction($(this));  
		}else{
			//alert("function clickMenu_"+menuId +"()이 정의 되지 않았습니다. 확인 하십시요.!!");
		}
	});
	
	
	//상단메뉴 클릭시 처리
	$("#my_menu").find("a").live("click", function(e){
		e.preventDefault();
		var menuId = $(this).attr("menuId");
		$("#myMenuBtn").prev().hide();
		if(eval("window.clickMenu_"+menuId) != null){
			$(this).loadingDialog();
			var menuFunction= eval("clickMenu_"+menuId);
			//alert(menuFunction);
			menuFunction($(this)); 
		}else{
			//alert("function clickMenu_"+menuId +"()이 정의 되지 않았습니다. 확인 하십시요.!!");
		}
	});
	
	// 네비게이션 바의 X 클릭시 현재 창을 제거한다.
	$("#removeWorkAreaBtn").click(function(e){
		e.preventDefault();
		
		//삭제하고자 하는 작업영역을 선택함
		var currentWorkArea = null; 
		$("[id=mainWork]").each(function(e){
			if($(this).css('display') != 'none'){
				currentWorkArea = $(this);
				return false ;
			}
		});
		
		// 선택된 작업영역에 해당하는 오른쪽 메뉴 삭제
		$("[id=asideMenu][workAreaName="+$(currentWorkArea).attr('workAreaName')+"]").parent().remove();
		
		// 선택된 작업 영역 삭제
		if(currentWorkArea != null){
			$(currentWorkArea).remove();
			if($("[id=mainWork]").last().length > 0){
				$("[id=mainWork]").last().show();
				//네비게이션 영역 타이틀 변경
				setNavigationTitle($("[id=asideMenu]").last().attr('navigationTitle'));	
			}else{
				setNavigationTitle("Click the menu!");	
			}			
		}
	});
	$("#myMenuBtn").prev().hide();
	$("#myMenuBtn").click(function(e){
		e.preventDefault();
		$(this).prev().slideToggle();
	}); 
});