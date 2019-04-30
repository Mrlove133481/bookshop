//购物车控制层
app.controller('cartController',function($scope,cartService){
   // $scope.book.books.bookNumber=1;
    //查询购物车列表
    $scope.findCartList=function(shopcartId){
        cartService.findCartList(shopcartId).success(
            function(response){
                $scope.cartList=response;
                $scope.totalValue= cartService.sum($scope.cartList);
            }
        );
    }
    //数量加
    $scope.up=function(booknumber,shopcartid,shopcartcount,shopcartId){
        var aftercount = parseInt(shopcartcount)+1;
        cartService.addGoodsToCartList(booknumber,shopcartid,aftercount).success(
            function(response){
                if(response.success){//如果成功
                    $scope.findCartList(shopcartId);//刷新列表
                }else{
                    alert(response.message);
                }
            }
        );
    }
    //数量减
    $scope.down=function(booknumber,shopcartid,shopcartcount,shopcartId){
        var inputid = booknumber+"1";
        var beforecount =  document.getElementById(inputid).value;
        if(shopcartcount>1){
            var aftercount = parseInt(shopcartcount)-1;

            cartService.addGoodsToCartList(booknumber,shopcartid,aftercount).success(
                function(response){
                    if(response.success){//如果成功
                        $scope.findCartList(shopcartId);//刷新列表
                    }else{
                        alert(response.message);
                    }
                }
            );
        }

    }
    //删除
    $scope.deletecartbook=function(booknumber,shopcartid,shopcartcount,shopcartId){
        cartService.addGoodsToCartList(booknumber,shopcartid,shopcartcount).success(
            function(response){
                if(response.success){//如果成功
                    $scope.findCartList(shopcartId);//刷新列表
                }else{
                    alert(response.message);
                }
            }
        );
    }
    /*//判断是否是当前选择图书
    $scope.selectedbook=function (shopcartremark1,bookNumber,shopcartid) {
        if(shopcartremark1=="0"){
            alert(shopcartremark1);
           cartService.truechecked(shopcartremark1,bookNumber,shopcartid).success(
               function(response){
                   if(response.success){//如果成功
                       $scope.findCartList(shopcartId);//刷新列表
                   }else{
                       alert(response.message);
                   }
               }
           );
        }else {
            alert(shopcartremark1);
            cartService.truechecked(shopcartremark1,bookNumber,shopcartid).success(
                function(response){
                    if(response.success){//如果成功
                        $scope.findCartList(shopcartId);//刷新列表
                    }else{
                        alert(response.message);
                    }
                }
            );
        }
    }
    $scope.checkedbook = function (bookNumber) {
                $("#bookNumber").prop("checked",false);
    }*/
    //查询地址
    $scope.findaddress= function (userId) {
        cartService.findaddress(userId).success(
            function (response) {
                $scope.addresses =response;
               for(var i =0;i<response.length;i++){
                   if(response[i].addressDefault=='1'){
                       $scope.address = response[i];
                       break;
                   }
               }
            }
        )
    }
    //添加地址
    $scope.addaddress = function () {
        var addressReceiver = $("#addressReceiver").val();
        var addressTelnum = $("#addressTelnum").val();
        var addressProvince = $("#addressProvince option:selected").val();
        var addressCity = $("#addressCity option:selected").val();
        var addressTown = $("#addressTown option:selected").val();
        var addressLocation = $("#addressLocation").val();
        var userId = $("#userId").val();
        if(addressTelnum ==""){
            layer.msg("请输入手机号码！",{time:700},function () {
                layer.close(index);
            })
        }else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(addressTelnum))){
            layer.msg("格式不正确！",{time:700},function () {
                layer.close(index);
                $("#addressTelnum").focus();
            })
        }else {
            $.ajax({
                type: "POST",
                url: "/address/addaddress",
                data:{
                    addressReceiver:addressReceiver,
                    addressTelnum:addressTelnum,
                    addressProvince:addressProvince,
                    addressCity:addressCity,
                    addressTown:addressTown,
                    addressLocation:addressLocation,
                    userId:userId
                },
                success: function(msg){
                    if(msg.success){
                        $(document.body).css("overflow","visible");
                        $('.theme-login').removeClass("selected");
                        $('.item-props-can').removeClass("selected");
                        $('.theme-popover-mask').hide();
                        $('.theme-popover').slideUp(200);
                        //刷新地址列表
                        $scope.findaddress(userId);
                    }else {
                        $(document.body).css("overflow","visible");
                        $('.theme-login').removeClass("selected");
                        $('.item-props-can').removeClass("selected");
                        $('.theme-popover-mask').hide();
                        $('.theme-popover').slideUp(200);
                        layer.msg("保存失败！", {time: 400}, function () {
                            layer.close(index);
                        })
                    }
                },
                dataType:'json'
            });
        }
    }
    //选择地址
    $scope.selectedaddress= function (address) {
        $scope.address = address;
    }
    //判断地址对象是否是当前地址
    $scope.isselectedaddress = function (address) {
        if(address==$scope.address){
            return true;
        }else {
            return false
        }
    }
    //设置某个地址为默认地址
    $scope.setdefaultaddress = function (addressId,userId) {
        cartService.setdefaultaddress(addressId,userId).success(
            function(response){
                if(response.success){//如果成功
                    //刷新地址列表
                    $scope.findaddress(userId);
                }else{
                    alert(response.message);
                }
            }
        )
    }
    //删除地址
    $scope.deleteaddress = function (addressId,userId) {
        cartService.deleteaddress(addressId,userId).success(
            function(response){
                if(response.success){//如果成功
                    //刷新地址列表
                    $scope.findaddress(userId);
                }else{
                    alert(response.message);
                }
            }
        )
    }
    //保存订单
    $scope.submitOrder=function(userId){
        var orderReceiverlocation=$scope.address.addressProvince+$scope.address.addressCity+$scope.address.addressTown+$scope.address.addressLocation;//地址
        var orderReceiverphone=$scope.address.addressTelnum;//手机
        var orderReceiver=$scope.address.addressReceiver;//联系人
        var orderUserid=userId;//用户id
        var totalmoney=$scope.totalValue.totalMoney;//总金额
        var liuyan = $("#liuyan").val();
        $.ajax({
            type: "POST",
            url: "/order/addorder",
            dataType:'json',
            data:{
                orderReceiverlocation:orderReceiverlocation,
                orderReceiverphone:orderReceiverphone,
                orderReceiver:orderReceiver,
                orderUserid:orderUserid,
                totalmoney:totalmoney,
                liuyan:liuyan
            },
            success: function(msg){
                if(msg.success){
                    //页面跳转
                    location.href="/page/success.jsp";
                }else {
                    alert(msg.message);	//也可以跳转到提示页面
                }
            }

        });



       /* cartService.submitOrder( $scope.order,totalmoney).success(
            function(response){
                if(response.success){
                        //页面跳转
                        location.href="/page/success.jsp";
                }else{
                    alert(response.message);	//也可以跳转到提示页面
                }
            }
        );*/
    }
    //立即购买初始化总金额
    $scope.findprice = function(totalmoney){
        $scope.tatolmony=parseFloat(totalmoney) ;
    }
    //立即购买数量加
    $scope.inputnumber=1;
    $scope.nowpayup = function (totalmoney1) {
        $scope.inputnumber += 1;
        $scope.tatolmony =( $scope.inputnumber)*totalmoney1;
    }
    //立即购买数量减
    $scope.nowpaydown =function (totalmoney1) {
       if( $scope.inputnumber>1){
           $scope.inputnumber -= 1;
           $scope.tatolmony = ($scope.inputnumber)*totalmoney1;
       }
    }
    //立即购买提交订单
    $scope.nowpaysubmitOrder = function (userId,bookId) {
        var orderReceiverlocation=$scope.address.addressProvince+$scope.address.addressCity+$scope.address.addressTown+$scope.address.addressLocation;//地址
        var orderReceiverphone=$scope.address.addressTelnum;//手机
        var orderReceiver=$scope.address.addressReceiver;//联系人
        var orderUserid=userId;//用户id
        var totalmoney=$scope.tatolmony;//总金额
        var liuyan = $("#liuyan").val();//留言

        var totalnumber = $scope.inputnumber;//总数量
        var bookId = bookId;
        $.ajax({
            type: "POST",
            url: "/order/addnowpayorder",
            dataType:'json',
            data:{
                orderReceiverlocation:orderReceiverlocation,
                orderReceiverphone:orderReceiverphone,
                orderReceiver:orderReceiver,
                orderUserid:orderUserid,
                totalmoney:totalmoney,
                liuyan:liuyan,
                totalnumber:totalnumber,
                bookId:bookId
            },
            success: function(msg){
                if(msg.success){
                    //页面跳转
                    location.href="/page/success.jsp";
                }else {
                    alert(msg.message);	//也可以跳转到提示页面
                }
            }

        });
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