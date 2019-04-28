//购物车服务层
app.service('cartService',function($http){
    //购物车列表
    this.findCartList=function(shopcartId){
        return $http.get('/shopcart/findcart?shopcartId='+shopcartId);
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
    //查找此用户地址
    this.findaddress = function (userId) {
        return $http.get('/address/findaddress?userId='+userId);
    }




   /* //添加订单
    this.addorder=function (cartList,userId) {
        return $http.get('/order/addorder?shopcart='+cartList+'$userId='+userId);
    }*/
   this.truechecked = function (shopcartremark1, bookNumber, shopcartid) {
       return $http.get('shopcart/ischecked?shopcartremark1='+shopcartremark1+'&bookNumber'+bookNumber+'&shopcartid'+shopcartid)
   }

});
