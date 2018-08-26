leftSwipe();
var getTranslateY = function(node){
    var regRule = /translate(X|\dd)?\(\s*(\w+\s*,)?\s*([^,]+)(\s*,[^)]+)?\s*\)/;
    var regRule2 = /matrix\(.*,\s*(\w+)\s*\)/;
    var transform = node.style.transform;
    var reg;
    if(!transform){
        return null;
    }
    reg = regRule.exec(transform);
    if(null === reg){
        reg = regRule2.exec(transform);
        return reg ? reg[1] : null;
    }
    return reg[3].split('p')[0];
}
function leftSwipe(){
   var parentBox = document.querySelector('.box2');//左侧的div
   var childBox = parentBox.querySelector('ul');//左侧div中的ul
   var next = document.querySelector('.right');
   var last = document.querySelector('.left');
   //获取高度
   var w = parentBox.offsetWidth;
   var W = childBox.offsetWidth;
   //获取定位区间
   var maxPosition = 0;
   var minPosition = w-W;
   //设定缓冲距离、
   var distance = 100;
   //获取滑动区间
   var maxSwipe = maxPosition + distance;
   var minSwipe = minPosition - distance;
   //需要一个变量记录当前位置
   var currX = 0;
   // 1、可以滑动(transform ,touch )

   next.addEventListener('click',function(e){
   		var translateX = parseInt(getTranslateY(childBox));
        translateX -= 231;
        childBox.style.transition = "all 0.5s";
        childBox.style.transform = "translateX("+translateX+"px)";
   })
    last.addEventListener('click',function(e){
   		var translateX = parseInt(getTranslateY(childBox));
   		if(translateX<maxPosition){
	        translateX += 231;
   		}
        childBox.style.transition = "all 0.5s";
        childBox.style.transform = "translateX("+translateX+"px)";
   })

}