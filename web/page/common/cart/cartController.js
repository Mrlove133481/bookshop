//购物车控制层
app.controller('cartController',function($scope,cartService){
   // $scope.book.books.bookNumber=1;
    //查询购物车列表
    $scope.findCartList=function(){
        cartService.findCartList().success(
            function(response){
                $scope.cartList=response;
                $scope.totalValue= cartService.sum($scope.cartList);
            }
        );
    }
    //数量加
    $scope.up=function(booknumber,shopcartid,shopcartcount){
        var aftercount = parseInt(shopcartcount)+1;
        cartService.addGoodsToCartList(booknumber,shopcartid,aftercount).success(
            function(response){
                if(response.success){//如果成功
                    $scope.findCartList();//刷新列表
                }else{
                    alert(response.message);
                }
            }
        );
    }

    //数量减
    $scope.down=function(booknumber,shopcartid,shopcartcount){
        var inputid = booknumber+"1";
        var beforecount =  document.getElementById(inputid).value;
        if(shopcartcount>1){
            var aftercount = parseInt(shopcartcount)-1;

            cartService.addGoodsToCartList(booknumber,shopcartid,aftercount).success(
                function(response){
                    if(response.success){//如果成功
                        $scope.findCartList();//刷新列表
                    }else{
                        alert(response.message);
                    }
                }
            );
        }

    }

    //删除
    $scope.deletecartbook=function(booknumber,shopcartid,shopcartcount){
        cartService.addGoodsToCartList(booknumber,shopcartid,shopcartcount).success(
            function(response){
                if(response.success){//如果成功
                    $scope.findCartList();//刷新列表
                }else{
                    alert(response.message);
                }
            }
        );
    }

   /* //加
    $scope.up=function(id,price){
        var inputid = id+"1";
        var pricesid =id+"2";
        var count =  document.getElementById(inputid).value;

        document.getElementById(inputid).value =parseInt(count)+1;
        document.getElementById(pricesid).innerText =(parseInt(count)+1)*price;
    }
    //减
    $scope.down=function(id,price) {
        var inputid = id+"1";
        var pricesid =id+"2";
        var count = document.getElementById(inputid).value;

        if(count>1){
            document.getElementById(inputid).value = parseInt(count) - 1;
            document.getElementById(pricesid).innerText =(parseInt(count)-1)*price;
        }
    }*/
});