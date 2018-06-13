$(window).ready(function() {
	//下拉
	$("#my").mouseenter(function(){
		$("#my-2").stop().show(300);
	});
	$("#my").mouseleave(function(){
		$("#my-2").stop().hide(300);
	});
});


function move(obj, attr, target, speed, callback) {
	//关闭当前的上一个定时器
	clearInterval(obj.timer);

	//获取当前样式
	var current = parseInt(getStyle(obj, attr));
	//判断速度的方向
	if(current > target) {
		speed = -speed;
	}
	//创建一个定时器
	obj.timer = setInterval(function() {
		//获取当前样式
		var oldValue = parseInt(getStyle(obj, attr));
		//alert(oldValue);
		var newValue = oldValue + speed;
		//要求当移动到target时停止移动
		if((speed > 0 && newValue > target) || (speed < 0 && newValue < target)) {
			newValue = target;
		}
		//修改样式
		obj.style[attr] = newValue + "px";

		//当移动到800停止
		if(newValue == target) {
			clearInterval(obj.timer);
			callback && callback();
		}
	}, 30);
};

function getStyle(obj, name) {
	if(window.getComputedStyle) {
		return getComputedStyle(obj, null)[name];
	} else {
		return obj.currentStyle[name];
	}
};

function animate(ele, json, fn) {
	clearInterval(ele.timer);
	ele.timer = setInterval(function() {
		var bool = true;
		for(var k in json) {
			var leader;
			if(k === "opacity") {
				leader = getStyle(ele, k) * 100 || 1;
			} else {
				leader = parseInt(getStyle(ele, k)) || 0;
			}
			var step = (json[k] - leader) / 10;
			step = step > 0 ? Math.ceil(step) : Math.floor(step);
			leader = leader + step;
			if(k === "opacity") {
				ele.style[k] = leader / 100;
				ele.style.filter = "alpha(opacity=" + leader + ")";
			} else if(k === "zIndex") {
				ele.style.zIndex = json[k];
			} else {
				ele.style[k] = leader + "px";
			}
			if(json[k] !== leader) {
				bool = false;
			}
		}
		if(bool) {
			clearInterval(ele.timer);
			if(fn) {
				fn();
			}
		}
	}, 25);
};