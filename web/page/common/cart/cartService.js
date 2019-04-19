//购物车服务层
app.service('cartService',function($http){
    //购物车列表
    this.findCartList=function(){
        return $http.get('/shopcart/findcart');
    }

    //添加商品到购物车
    this.addGoodsToCartList=function(booknumber,shopcartid,aftercount){
        return $http.get('/shopcart/updatecart?booknumber='+booknumber+'&shopcartid='+shopcartid+'&count='+aftercount);
    }

    //求合计数
    this.sum=function(cartList){
        var totalValue={totalNum:0,totalMoney:0,totalDiscounts:0};
        for(var i=0;i<cartList.length ;i++){
            var cart=cartList[i];//购物车对象
                totalValue.totalNum+=parseInt(cart.shopcartCount);//累加数量
                totalValue.totalMoney+=cart.shopcartCount*cart.bookss.bookPromotionPrice;//累加金额
                totalValue.totalDiscounts+=cart.shopcartCount*(cart.bookss.bookOriginalPrice-cart.bookss.bookPromotionPrice);//累加优惠

        }
        return totalValue;
    }

});
