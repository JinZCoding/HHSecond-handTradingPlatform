$(function() {
	//模拟获取后台信息，用户的个人信息
	var infoArr = {
		"img": "img/img_myinfo/myimage.jpg",
		"name": "陈伟霆"
	};
	$("#my_img").find("img").attr("src", infoArr.img);
	$("#myname").find("span").text(infoArr.name);
	$(".infoImage").find("img").attr("src", infoArr.img);

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