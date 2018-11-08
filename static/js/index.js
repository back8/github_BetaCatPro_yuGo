var oLoading = document.getElementById('loading');

var menu = document.getElementById('menu');
var tabList = menu.children;
var topRight = document.getElementsByClassName('topRight')[0];
var searchInput = topRight.getElementsByTagName('input')[1];
var search = document.getElementsByClassName('search')[0];

var container = document.getElementById('container');
var thumbnail = document.getElementById('thumbnail');
var innerImg = thumbnail.getElementsByClassName('innerImg');

var goods = document.getElementsByClassName('goods');
var tools = document.getElementsByClassName('tools');

showLoading();
bindContainer();
changeTab();
serachAnimate();
rebuild();
thumbnailBind();
showTools();

// 导航条切换
function changeTab() {
	var lastOne = 0;
	for (var i = 0; i < tabList.length; i++) {
		(function(index) {
			tabList[index].onmouseover = function() {
				buffer(tabList[lastOne].getElementsByTagName('div')[0], {
					'width': '0px'
				});
				buffer(this.getElementsByTagName('div')[0], {
					'width': '80px'
				});
				lastOne = index;
			}
			tabList[index].onmouseout = function() {
				buffer(tabList[lastOne].getElementsByTagName('div')[0], {
					'width': '0px'
				});
				buffer(this.getElementsByTagName('div')[0], {
					'width': '0px'
				});
				lastOne = index;
			}
		})(i);
	}
}

//搜索宽动画
function serachAnimate(){
	search.onclick = function(e){
		var ev = e || window.event;
		buffer(topRight,{'margin-right':'-60px'},function(){
			searchInput.style.display = 'block';
			buffer(searchInput,{'width':'200px'});
		});

		stopBubble(ev);
		
	}
}

// document.onclick = function(){
// 	buffer(searchInput,{'width':'0px'},function(){
// 			searchInput.style.display = 'none';
// 			buffer(topRight,{'margin-right':'80px'});
// 		});
// }

// 控制container的位置
function bindContainer() {
	var screenHeight = client().height;
	var screenWidth = client().width;
	container.style.top = screenHeight + 'px';
}

function thumbnailBind() {
	for (var i = 0; i < innerImg.length; i++) {
		innerImg[i].onmouseover = function() {
			for (var j = 0; j < innerImg.length; j++) {
				innerImg[j].style.transform = 'scale(1)';
			}
			this.style.transform = 'scale(1.1)';
		}
		innerImg[i].onmouseleave = function() {
			for (var j = 0; j < innerImg.length; j++) {
				innerImg[j].style.transform = 'scale(1)';
			}
		}
	}
}

function showTools() {
	for (var i = 0; i < goods.length; i++) {
		goods[i].onmouseover = function() {
			var that = this;
			this.getElementsByClassName('tools')[0].style.display = 'block';
			toolsAnimationIn(that);
		}
		goods[i].onmouseleave = function() {
			var that = this;
			this.getElementsByClassName('tools')[0].style.display = 'none';
			toolsAnimationOut(that);
		}
	}

}

//定义tools的出场/退场动画
function toolsAnimationIn(that) {
	for (var i = 0; i < tools.length; i++) {
		var oLi = tools[i].getElementsByTagName('li');
		for (var j = 0; j < oLi.length; j++) {
			oLi[j].style.marginTop = 29 + 'px';
			buffer(oLi[j], {
				'margin-top': 0
			}, function() {
				that.onmouseover = null;
			});
		}
	}
}

function toolsAnimationOut(that) {
	for (var i = 0; i < tools.length; i++) {
		var oLi = tools[i].getElementsByTagName('li');
		for (var j = 0; j < oLi.length; j++) {
			oLi[j].style.marginTop = 0 + 'px';
			buffer(oLi[j], {
				'margin-top': 0
			}, function() {
				that.onmouseover = function() {
					that.getElementsByClassName('tools')[0].style.display = 'block';
					toolsAnimationIn(that);
				};
			});
		}
	}
}

//页面重构,不想用媒寻了,太麻烦了,就用这种简单粗暴的方法
function rebuild() {
	var screenWidth = client().width;
	var containerWidth = container.offsetWidth;

	window.onresize = function() {
		container.style.width = containerWidth + 'px';
	}
}

function showLoading() {
	var oSpan = oLoading.getElementsByTagName('span')[0];
	var aDiv = oLoading.getElementsByTagName('div');
	var arr = ['1.jpg','1-1.jpg','1-2.jpg','1-3.jpg'];
	var iNow = 0;

	for (var i = 0; i < arr.length; i++) {

		// var objImg = new Image();
		// objImg.src = '/static/images/call-to-action/' + arr[i];
		// objImg.onload = function() {
		// 	iNow++;
		// 	oSpan.style.width = iNow / arr.length * 100 + '%';
		// 	/*if(iNow == arr.length){
		// 		alert(123);
		// 	}*/
		// };
		setInterval(function(){
			iNow++;
			oSpan.style.width = iNow / arr.length * 100 + '%';
		}, 1000)


	}
	oSpan.addEventListener('webkitTransitionend', spanChange, false);
	oSpan.addEventListener('transitionend', spanChange, false);

	function spanChange() {
		if (oSpan.style.width == '100%') {
			oSpan.style.display = 'none';
			aDiv[0].style.height = 0;
			aDiv[1].style.height = 0;
		}
	}

	aDiv[0].addEventListener('webkitTransitionend', divChange, false);
	aDiv[0].addEventListener('transitionend', divChange, false);


	function divChange() {
		oLoading.parentNode.removeChild(oLoading);
	}

	//预加载 js css
	/*var bj = document.createElement('object');
	bj.data = 'base.js';
	document.body.appendChild(bj);
	bj.width = 0;
	bj.height = 0;
	bj.onload = function(){
	};*/

}