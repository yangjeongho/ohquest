

/*상품등록  */
function clickMenu_prmProductMain(menuObject){
	
	
	    createMainWorkArea('prmProductMain'
			, menuObject, baseUrl + 'resources/images/common/left/btn_product.gif'
			, baseUrl+"pdh/product/productMain?dialogName=dialogContent");
}


/* product Infomation - section code  */
function clickMenu_prmProductCode(menuObject){
		Dialog.open({
			div : '#dialogContent', 
			url : baseUrl+"pdh/product/productCode?dialogName=dialogContent", 
			title : 'Product Section Code', 
			width : 1150, 
			height : 620, 
			modal : true
		});
}

/*할인 상품*/
function clickMenu_discountProduct(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"pdh/discount/discountProd001?dialogName=dialogContent", 
		title : 'Discount', 
		width : 1200, 
		height : 580, 
		modal : true
	});	
}

//channel Management
function clickMenu_channel(menuObject){
	Dialog.open({
		div : '#dialogContent', 
		url : baseUrl+"pdh/channelManagement/channel001?dialogName=dialogContent", 
		title : 'Channel Management', 
		width : 1000, 
		height : 620, 
		modal : true
	});	
}

//상품별 청구항목
function clickMenu_blItmByProd(menuObject){
	Dialog.open({
		div : '#blItmByProdDialogContent', 
		url : baseUrl+"pdh/billItem/blItmByProd?dialogName=blItmByProdDialogContent", 
		title : 'Bill Item List Inquiry', 
		width : 1250, 
		height : 650, 
		modal : true
	});	
}
