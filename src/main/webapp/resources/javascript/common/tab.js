/*
 * jquery tab customize 
 * 
 * 2012.09.19
 * */
//tab 생성
function common_tab(tab_id){
	
	var common_tab_id = '#'+tab_id;
	$(common_tab_id).tabs({selected:0});
	/*$(common_tab_id).addClass('tab-contents');*/
	$(common_tab_id+' ul:first').removeClass('ui-widget-header').addClass('tab_header');
	$(common_tab_id).removeClass('ui-widget-content').addClass('tab_body'); 
    $(common_tab_id+' ul .ui-state-default').css('border','0px');
    $(common_tab_id+' ul .ui-state-active').css('border','0px');
   
	return common_tab_id;
}



function positionPasses(){
  var currentPassed = false;
  var hasCurrent = passes.querySelector('.current') ? true : false;
  for(var i = 0; i < lis.length; i++){
    var order = i;
    if(lis[i].classList.contains('current')) currentPassed = true;
    
    if(!currentPassed) order += 1;
    
    var offset = (order-1) * 100;
    if(hasCurrent) offset = 260 + (order+1)*40;
    console.log(hasCurrent, i, order, offset);
    //lis[i].innerHTML = offset + '/' + i + '/' + hasCurrent;
    lis[i].style.webkitTransform = 'translate3d(0, {offset}px, 0)'.replace('{offset}', offset);
  } 
}

positionPasses();