$(function() {
	//模拟获取后台信息，用户的个人信息

	var imagsrc = $("#my_img").find("img").attr("data-type");
	//alert(imagsrc);
	var json = eval('(' + imagsrc + ')');
	//alert(json.img);
	$("#my_img").find("img").attr("src",json.img);
	
	

	//
	$(".banner-ul li").on("mouseover", function() {
		$(this).css("background-color", "#EF5350");
		$(this).find("a").css("color", "#fff");
	});

	$(".banner-ul li").mouseleave(function() {
		//判断是否含有current类，如果没有，将样式去掉
		if(!$(this).hasClass("current")) {
			$(this).css("background-color", "#fff");
			$(this).find("a").css("color", "#EF5350");
		}
	});
});