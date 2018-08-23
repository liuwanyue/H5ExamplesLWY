<!DOCTYPE html>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<html>
<!--<#assign x = 'http://localhost:8093/b2b-app-web/html/'>
    <#assign xonline = 'http://app-b2b.hivescm.com/app-service-b2b/b2b-app-web/html/'>
        <#assign xontest = 'http://app-b2b-test.beescm.cn/app-service-b2b/b2b-app-web/html/'>
            <#assign xdev = 'http://app.hivescm.top/b2b/b2b-app-web/html/'>-->

<head>
    <meta charset="UTF-8">
    <title>促销活动</title>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
    
<#setting number_format="#">
    <style>
        @media screen and (min-width: 900px) {
            html {
                font-size: 100px;
            }
        }

        * {
            padding: 0;
            margin: 0;
        }

        .header1 {
            height: 10.5rem;
            overflow: hidden;
        }
        .header2 {
        }
        .all .header1 .banner {
            display: block;
            width: 100%;
        }
        .all .header2 .banner {
            display: block;
            width: 100%;
        }
        .all {
            position: relative;
            overflow: hidden;
        }

        .all .header .banner {
            display: block;
            width: 100%;
            /*height: 100%;*/
        }

        .all .content {
            background: ${activityVo.bgColor};
            height: 100%;
            width: 100%;
        }

        .all .content .evfloor {
            padding-top: 1.2rem;
            /*margin-bottom: .3rem;*/
        }

        .all .content .floor {
            display: flex;
            height: 2.4rem;
            line-height: 2.4rem;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            /*color: #ff7a01;*/
            font-weight: 700;
            text-align: center;

            margin-bottom: .5rem;
            background: rgba(0, 0, 0, 0.1);
            margin: 0px 1rem;
            /*  filter: alpha(opacity=20);
              opacity: 0.2;
              !*background: url("http://test-1254060329.costj.myqcloud.com/50e35d9de2184addba5417c9996d5b59.png") center center no-repeat;*!
              background-size: 19rem 2rem;
              background-color: #000000;*/
        }

        .all .content .floor .floor-div {
            width:  100%;
            color: #fff;
        }

        .all .content .floor .floor-div span {
            display:  block;
            width:  100%;
            color:   #fff;
            /*opacity: 0.9;*/
        }

        .all .content .evfloor .floor-item {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            flex-grow: 1;
            flex-direction: row;
            margin: 0 1rem;
            margin-top: .5rem;
        }

        .all .content .item {
            /*float: left;*/
            position: relative;
            /*width: 100%;*/
            height: 6rem;
            margin-top: .3rem;
            background: white;
            /*padding-bottom: .15rem;*/
            /*margin-bottom: .6rem;*/
            margin-bottom: .8rem;
            overflow: hidden;
        }

        .all .content .item .goodsimg {
            float: left;
            height: 6.3rem;
            overflow: hidden;
            width: 6.3rem;
        }

        .all .content .item .goodsimg img {
            width: 100%;
            height: 100%;
        }

        .all .content .item .goodsContent {
            float: left;
            overflow: hidden;
            height: 6rem;
            width: 13.45rem;
        }

        .all .content .item .goodsContent span {
            padding: .1rem auto .2rem .4rem;
        }

        .all .content .item .goodsContent .flP {

        }

        .all .content .item .goodsContent .flP .goodsname {
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            overflow: hidden;
            margin: 0.3rem 0.3rem 0.8rem 0.3rem;
            font-size: 0.8rem;
            line-height: 1rem;
            min-height: 2rem;
            max-height: 2rem;
            width: 90%;
        }

        .all .content .item .goodsContent .price {
            height: 2.7rem;
        }

        .all .content .item .goodsContent .cart {
            position: absolute;
            width: 22%;
            right: -.03rem;
            z-index: 5;
            bottom: .45rem;
        }

        .all .content .item .goodsContent .pirt {
            height: 2.2rem;
            position: relative;
            /*margin-left: 0.26666667rem;*/
            padding-bottom: 0;
            margin-bottom: 0;
            height: 2.8rem;
        }

        .all .content .item .pirt p {
            line-height: 1.17333333rem;
            font-size: .8rem;
        }

        .all .content .item .pirt span.big {
            font-size: 1rem;
            line-height: 2.6;
        }
    </style>


    <script>
        (function (win) {
            var doc = win.document;
            var docEl = doc.documentElement;
            var tid;

            function refreshRem() {
                var width = docEl.getBoundingClientRect().width;
                if (width > 540) { // 最大宽度
                    width = 540;
                }
                var rem = width / 12;
                docEl.style.fontSize = rem + 'px';
            }

            win.addEventListener('resize', function () {
                clearTimeout(tid);
                tid = setTimeout(refreshRem, 300);
            }, false);
            win.addEventListener('pageshow', function (e) {
                if (e.persisted) {
                    clearTimeout(tid);
                    tid = setTimeout(refreshRem, 300);
                }
            }, false);

            refreshRem();

        })(window);

        // function toCart(skuId, dealerId, count, unit, integerZeroConvert) {
        //     window.jsObj.joinShoppingCart(skuId, dealerId, count, unit, integerZeroConvert);
        // }

        function toCart(skuId, dealerId, count, unit, integerZeroConvert) {
            var u = navigator.userAgent;
            if(window.__wxjs_environment === 'miniprogram'){ //小程序
                console.log("xiaochengxu")
                wx.miniProgram.navigateTo({url: '/pages/details/details?skuId=' + skuId});
            }else if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) {
                window.jsObj.joinShoppingCart(skuId, dealerId, count, unit, integerZeroConvert);
            } else if (u.indexOf('iPhone') > -1) {
                var obj={
                    'skuIdKey':skuId,
                    'dealerIdKey':dealerId,
                    'countKey':count,
                    'unitKey':unit,
                    'integerZeroConvertKey':integerZeroConvert
                }
                window.webkit.messageHandlers.addGoodsCartByWeb.postMessage(obj)
            }else{
                alert('设备不支持');
            }
        }


        /*function toDetil(skuId) {
            window.jsObj.enterGoodsDetail(skuId);
        }*/
        function toDetil(skuId) {
            var u = navigator.userAgent;
            if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) {
                window.jsObj.enterGoodsDetail(skuId);
            } else if (u.indexOf('iPhone') > -1) {
                window.webkit.messageHandlers.enterGoodsDetail.postMessage(skuId)
            }else{
                alert('设备不支持');
            }
        }
		//获取地址栏参数
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }
        var banner = GetQueryString('banner');
        var dom;
        if(banner==1){
            dom = document.getElementById('top2')
            dom.style.display='none'

        }else if(banner==2) {
            dom = document.getElementById('top1')
            dom.style.display='none'
        }
    </script>
</head>
<body>
<div class="all">
    <div class="header1" id="top1">
        <#if activityVo.bannerUrl??>
            <img src="${activityVo.bannerUrl}" class="banner"/>
        <#else>
            <img src="http://test-1254060329.costj.myqcloud.com/702d1e29accd4cb48a027aa5dbf59da7.png" class="banner"/>
        </#if>
    </div>
    <div class="header2" id="top2">
	    <#if activityVo.bannerUrl??>
	        <img src="${activityVo.bannerUrl}" class="banner"/>
	    <#else>
	        <img src="http://test-1254060329.costj.myqcloud.com/702d1e29accd4cb48a027aa5dbf59da7.png" class="banner"/>
	    </#if>
    </div>
    <div class="content">
        <#list activityVo.activityGroups as groups>
            <div class="evfloor">
                <div class="floor">
                    <div class="floor-div">
                        <span>${groups.title!}</span>
                    </div>

                </div>
                <div class="floor-item">
                <#if (groups.goods! ? size > 0)>
                <#list groups.goods as goods>
                    <div class="item">
                        <div class="goodsimg" onclick="toDetil('${goods.skuId}')">
                            <img src="${goods.picsUrl}"/>
                        </div>
                        <div class="goodsContent">
                            <p class="flP"><span class="goodsname">${goods.goodsName}</span></p>
                            <div class="pirt">
                                <p><span style="color:#D81722"><span>￥</span><span
                                        class="big">${goods.dealerName}</span></span>
                                    <img src="http://test-1254060329.costj.myqcloud.com/2f946769c7314962b63134a3d11802fd.png"
                                         class="cart"
                                         onclick="toCart('${goods.skuId}',${goods.dealerId},${goods.minimumOrderQuantity},'${goods.quantityUnit}','${goods.integerZeroConvert}')"/>
                                <#--<img src="http://test-1254060329.costj.myqcloud.com/2f946769c7314962b63134a3d11802fd.png"-->
                                <#--class="cart" onclick="toCart(${goods.skuId})"/>-->
                                </p>
                            </div>
                        </div>
                    </div>
                </#list>
                </#if>
                </div>
            </div>
        </#list>
    </div>
</div>
</body>
</html>