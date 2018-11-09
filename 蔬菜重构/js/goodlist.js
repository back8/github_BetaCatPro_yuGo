var menu = document.getElementById('menu');
var tabList = menu.children;
var topRight = document.getElementsByClassName('topRight')[0];
var searchInput = topRight.getElementsByTagName('input')[0];
var search = document.getElementsByClassName('search')[0];
var container = document.getElementById('container');


changeTab();
serachAnimate();
rebuild();

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

document.onclick = function(){
	buffer(searchInput,{'width':'0px'},function(){
			searchInput.style.display = 'none';
			buffer(topRight,{'margin-right':'80px'});
		});
}

//页面重构,不想用媒寻了,太麻烦了,就用这种简单粗暴的方法
function rebuild() {
	var screenWidth = client().width;
	var containerWidth = container.offsetWidth;

	window.onresize = function() {
		container.style.width = containerWidth + 'px';
	}
}