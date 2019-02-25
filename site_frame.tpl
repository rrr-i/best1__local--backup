<!--{printXMLDeclaration}--><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<title><!--{if $tpl_page_class_name == "LC_Page_Index"}-->
クルーズの専門旅行会社【ベストワンクルーズ】で海外の船旅へ<!--{else}-->
<!--{if $tpl_subtitle|strlen >= 1}--><!--{$tpl_subtitle|h}-->|<!--{elseif $tpl_title|strlen >= 1}--><!--{$tpl_title|h}-->|<!--{/if}-->クルーズ・船旅専門旅行会社【ベストワンクルーズ】<!--{/if}--></title>
<!--{*<title><!--{$arrSiteInfo.shop_name|h}--><!--{if $tpl_subtitle|strlen >= 1}--> / <!--{$tpl_subtitle|h}--><!--{elseif $tpl_title|strlen >= 1}--> / <!--{$tpl_title|h}--><!--{/if}--></title>*}-->
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<!--{if $tpl_opengraph}-->
<meta property="og:title" content="<!--{$tpl_subtitle|h}-->"/>
<meta property="og:site_name" content="クルーズ・船旅専門旅行会社【ベストワンクルーズ】"/>
<meta property="og:image" content="<!--{$tpl_og_image}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.author|strlen >= 1}-->
    <meta name="author" content="<!--{$arrPageLayout.author|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.description|strlen >= 1}-->
    <meta name="description" content="<!--{$arrPageLayout.description|h}-->" />
<!--{elseif  $tpl_subtitle|strlen >= 1}-->
    <meta name="description" content="<!--{$tpl_subtitle}-->|クルーズ旅行と船旅の事ならクルーズ専門旅行会社【ベストワンクルーズ】海外・国内クルーズ、豪華客船の商品を豊富に格安で取り揃えております。エーゲ海・地中海・カリブ海・ハワイ・アラスカ・日本発着等の世界中のクルーズが取扱いございます。" />
<!--{else}-->
    <meta name="description" content="<!--{$tpl_title}-->|クルーズ旅行と船旅の事ならクルーズ専門旅行会社【ベストワンクルーズ】海外・国内クルーズ、豪華客船の商品を豊富に格安で取り揃えております。エーゲ海・地中海・カリブ海・ハワイ・アラスカ・日本発着等の世界中のクルーズが取扱いございます。" />
<!--{/if}-->
<!--{if $arrPageLayout.keyword|strlen >= 1}-->
    <meta name="keywords" content="<!--{$arrPageLayout.keyword|h}-->" />
<!--{elseif  $tpl_subtitle|strlen >= 1}-->
    <meta name="keywords" content="<!--{$tpl_subtitle}-->,クルーズ,海外クルーズ,国内クルーズ,激安格安クルーズ,クルーズ旅行,船旅,船の旅,豪華客船,客船,cruise,ベストワンクルーズ" />
<!--{else}-->
    <meta name="keywords" content="<!--{$tpl_title}-->,クルーズ,海外クルーズ,国内クルーズ,激安格安クルーズ,クルーズ旅行,船旅,船の旅,豪華客船,客船,cruise,ベストワンクルーズ" />
<!--{/if}-->
<!--{if $arrPageLayout.meta_robots|strlen >= 1}-->
    <meta name="robots" content="<!--{$arrPageLayout.meta_robots|h}-->" />
<!--{/if}-->
<meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, maximum-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />
<link rel="icon" type="image/vnd.microsoft.icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />

<!--{* 全ページに?以降のqueryを含めないようにcanonicalリンクを設定 *}-->
<!--{* if $arrPageLayout.page_id == 3 *}-->
<!--{assign var=parse_url_for_canonical_url value=$smarty.server.REQUEST_URI|parse_url}-->
<link rel="canonical" href="<!--{$smarty.const.HTTPS_URL}--><!--{$parse_url_for_canonical_url.path|regex_replace:"/^./":""}-->" />
<!--{* /if *}-->

<!--{*<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/import.css?<!--{$smarty.now|date_format:'%Y%m%d%H%M%S'}-->" type="text/css" media="all" />*}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/common.css?<!--{$smarty.now|date_format:'%Y%m%d%H%M%S'}-->" type="text/css" media="all" />
<!--{foreach from=$css_list item=css}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/<!--{$css}-->?v=<!--{$tpl_ver}-->" type="text/css" media="all" />
<!--{/foreach}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/custom.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/jquery.ui/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/jquery.ui/jquery-ui.structure.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/jquery.ui/jquery-ui.theme.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/print.css" type="text/css" media="print" />

<!--{* Page Top アイコンのスタイル *}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/pagetop.css" type="text/css" media="all" />

<!--{* Font Awesome *}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/font-awesome-4.3.0/css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

<!--{* Social Buttons for Bootstrap *}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/bootstrap_button.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/bootstrap-social.css" type="text/css" media="all" />

<!--{* 吹き出し *}-->
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/balloon_message.css" type="text/css" media="all" />

<!-- IE5-IE9 -->
<!--[if IE]>
    <link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/print_ie9.css" type="text/css" media="print" />
<![endif]-->

<link rel="alternate" type="application/rss+xml" title="RSS" href="<!--{$smarty.const.HTTP_URL}-->rss/<!--{$smarty.const.DIR_INDEX_PATH}-->" />
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery-1.11.0.min.js"></script>
<!--{*
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery-migrate-1.2.1.min.js"></script>
 *}-->

<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.js"></script>
<!--{*#2342 次期メジャーバージョン(2.14)にてeccube.legacy.js,eccube.admin.legacy.jsは削除予定.モジュール、プラグインの互換性を考慮して2.13では残します.*}-->
<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.legacy.js"></script>
<!--{if $tpl_page_class_name === "LC_Page_Abouts"}-->
    <!--{if ($smarty.server.HTTPS != "") && ($smarty.server.HTTPS != "off")}-->
        <script async type="text/javascript" src="https://maps-api-ssl.google.com/maps/api/js?sensor=false"></script>
    <!--{else}-->
        <script async type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <!--{/if}-->
<!--{/if}-->

<!--{* mura 2014-08-12 このifが無いとjsの読み込み時にコケる *}-->
<!--{if $js_list|@count > 0}-->
<!--{foreach from=$js_list item=js}-->
<!--{if $js}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/<!--{$js}-->"></script>
<!--{/if}-->
<!--{/foreach}-->
<!--{/if}-->

<!--{* mura 2014-09-03 #9136 ブラウザの「戻る」で選択されたタブを固定する処理 *}-->
<!--{if $tpl_hashchange_egtab}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/emerge_hashchange.js"></script>
<!--{else}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/emerge.js"></script>
<!--{/if}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/jquery-ui.js"></script>
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/jquery.ui.datepicker-ja.js"></script>

<!--{* dトラベル連携 - URLパラメータ付与 *}-->
<!--{if $tpl_page_class_name != "LC_Page_Contact_Complete"}-->
<script type="text/javascript" src="/user_data/js/coop.js"></script>
<!--{/if}-->

<!--{* mura 2014-08-12 #9209 サイト右下に入れた位置固定ナビに非表示ボタンを付ける *}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/jquery.cookie.js"></script>

<!--{* バルーン *}-->
<script async type="text/javascript" src="<!--{$TPL_URLPATH}-->js/jquery.balloon.min.js"></script>
<script async type="text/javascript" src="<!--{$TPL_URLPATH}-->js/balloon.js"></script>

<!--{* Page Top アイコンの処理 *}-->
<script async type="text/javascript" src="<!--{$TPL_URLPATH}-->js/pagetop.js"></script>

<!--{* カレンダーの祝日判定 *}-->
<script type="text/javascript" src="/user_data/packages/sphone/js/HolidayChk.js"></script>

<!--{* Apprise *}-->
<script async type="text/javascript" src="<!--{$TPL_URLPATH}-->js/apprise.min.js"></script>
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/apprise.min.css" type="text/css" media="all" />

<!--{* Coloring Depature Date *}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/coloring_depaturedate.js"></script>

<!--{* サイド余白バナー用JS *}-->
<script async type="text/javascript" src="<!--{$TPL_URLPATH}-->js/side_banner.js?v=<!--{$tpl_ver}-->"></script>

<!--{* Lazyload *}-->
<script type="text/javascript" src="<!--{$TPL_URLPATH}-->js/jquery.lazyload.min.js"></script>

<!--{* [2018-03-30/sato] GMOトークン決済 *}-->
<script src="https://p01.mul-pay.jp/ext/js/token.js" ></script>

<!--{* [20181101/sato] Google Conversion Tag リニューアル版 *}-->
<!-- Global site tag (gtag.js) - Google Ads: 1066773226 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-1066773226"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-1066773226');
</script>

<!--{if $tpl_conversion}-->
<!--{isProduct}-->

<!--{if $contactTypeId == 1}-->
<!-- Event snippet for 資料請求完了コンバージョン(18年11月1日～) conversion page -->
<script> gtag('event', 'conversion', { 'send_to': 'AW-1066773226/b1cACLDQmIwBEOrV1vwD', 'value': 0.1, 'currency': 'JPY' }); </script> 
<!--{elseif $contactTypeId == 2}-->
<!-- Event snippet for 仮予約完了コンバージョン conversion page -->
<script> gtag('event', 'conversion', { 'send_to': 'AW-1066773226/UCwsCPbYoIwBEOrV1vwD', 'value': 0.3, 'currency': 'JPY' }); </script> 
<!--{elseif $contactTypeId == 3}-->
<!-- Event snippet for オンライン予約完了コンバージョン conversion page -->
<script> gtag('event', 'conversion', { 'send_to': 'AW-1066773226/4uf7CPza6oYBEOrV1vwD', 'value': 0.6, 'currency': 'JPY' }); </script> 
<!--{else}-->
<!-- Event snippet for 資料請求完了コンバージョン conversion page -->
<script> gtag('event', 'conversion', { 'send_to': 'AW-1066773226/V-GoCK61pQMQ6tXW_AM', 'value': 1.0, 'currency': 'JPY' }); </script> 
<!--{/if}-->

<!-- Yahoo Code for your Conversion Page -->
<img height="1" width="1" alt="" src="//b91.yahoo.co.jp/pagead/conversion/1000038978/imp.gif?value=0&label=Z01-COP0wgQQnYL4ygM&guid=ON&script=0"/>

<!-- Facebook Conversion Code for お問い合わせ -->
<script>(function() {
      var _fbq = window._fbq || (window._fbq = []);
        if (!_fbq.loaded) {
            var fbds = document.createElement('script');
            fbds.async = true;
            fbds.src = '//connect.facebook.net/en_US/fbds.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(fbds, s);
            _fbq.loaded = true;
        }
})();
window._fbq = window._fbq || [];
window._fbq.push(['track', '6025673381851', {'value':'0.00','currency':'JPY'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6025673381851&amp;cd[value]=0.00&amp;cd[currency]=JPY&amp;noscript=1" /></noscript>

<!--{/isProduct}-->
<!--{/if}-->

<!--{if $tpl_page_class_name == "LC_Page_Products_Detail"}-->
<!-- User Heat Tag -->
<script type="text/javascript">
(function(add, cla){window['UserHeatTag']=cla;window[cla]=window[cla]||function(){(window[cla].q=window[cla].q||[]).push(arguments)},window[cla].l=1*new Date();var ul=document.createElement('script');var tag = document.getElementsByTagName('script')[0];ul.async=1;ul.src=add;tag.parentNode.insertBefore(ul,tag);})('//uh.nakanohito.jp/uhj2/uh.js', '_uhtracker');_uhtracker({id:'uhoZNrVBnT'});
</script>
<!-- End User Heat Tag -->
<!--{/if}-->

<!--{* [2018-02-20/sato] A8.net - 資料請求と予約のサンクスページ用 - 最新iOS対応 *}-->
<script src="//statics.a8.net/a8sales/a8sales.js"></script>

<script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
    $(function(){
        <!--{$tpl_onload}-->
        ;
        <!--{* mura 2014-07-30 #8973 グローバルナビ「お役立ち情報」のメニュー表示 *}-->
        $('#header #globalmenu ul li a#MENU_INFOR').hover(function(){$('#header-dropdown-info').show();},function(){$('#header-dropdown-info').hide();});
        $('#header-dropdown-info').hover(function(){$(this).show();},function(){$(this).hide();});

        <!--{* mura 2014-08-07 #9171 スマートフォンでアクセスした場合に電話番号にリンクを貼って、タップで電話ができるようにする *}-->
        if(window.navigator.userAgent.indexOf('iPhone') > 0 || window.navigator.userAgent.indexOf('Android') > 0){
            $('.sp-tel-link').each(function(){
                var str = $(this).text();
                $(this).html($('<a>').attr('href', 'tel:' + str.replace(/-/g, '')).append(str + '</a>'));
            });
            $('.header-sp-tel-link').each(function(){
<!--{*                var tel = '03-5312-6247';*}-->
<!--{*                $(this).html($('<a>').attr('href', 'tel:' + str.replace(/-/g, '')).append(str + '</a>'));*}-->

                $(this).click(function(){window.location.href='tel:' + '03-5312-6247'.replace(/-/g, '');});
            });
        }

        <!--{* mura 2014-08-12 #9209 サイト右下に入れた位置固定ナビに非表示ボタンを付ける *}-->
        $('#id-fixed-navigation-close').click(function(){
            $.cookie('fixed-navigation-closed', 'closed', {path: '/'});
            $('#id-fixed-navigation').hide();
        });
        if ((typeof $.cookie('fixed-navigation-closed') !== 'undefined') && $.cookie('fixed-navigation-closed') === 'closed') {
            $('#id-fixed-navigation').hide();
        } else {
            $('#id-fixed-navigation').show();
        }
        $('a.sidespace_banner_close').click(function() {
            $.cookie('sidespace_banner_closed', 'closed', {path: '/'});
            $('#sidespace_banner').hide();
        });
        if ((typeof $.cookie('sidespace_banner_closed') !== 'undefined') && $.cookie('sidespace_banner_closed') === 'closed') {
            $('#sidespace_banner').hide();
        } else {
            $('#sidespace_banner').show();
        }

        // Facebook会員登録
        $('#facebook_entry').on('click', function() {
            function submit(r) {
                $(':hidden[name="email"]').val(r.email);
                $(':hidden[name="nickname"]').val(r.name);
                $(':hidden[name="password"]').val("");
                if (r.gender == 'male') {
                    $(':hidden[name="sex"]').val("1");
                } else {
                    $(':hidden[name="sex"]').val("2");
                }
                $(':hidden[name="impressed"]').val("1");
                $(':hidden[name="name01"]').val(r.last_name);
                $(':hidden[name="name02"]').val(r.first_name);
                $('#form2').submit();
            }

            FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                    console.log('Logged in.');
                    FB.api('/me', function(response) {
                        if (response && !response.error) {
                            submit(response);
                        }
                    });
                } else {
                    FB.login(function(response) {
                        console.log('Welcome!  Fetching your information.... ');
                        // ログインに成功したら会員登録を実行する
                        if (response.authResponse) {
                            FB.api('/me', function(response) {
                                console.log('Good to see you, ' + response.name + '.');
                                if (response && !response.error) {
                                    submit(response);
                                }
                            });
                        }
                    }, {
                        scope: 'email, public_profile',
                        return_scopes: true
                    });
                }
            });
        });

        // User-Agentがスマホの場合は、ヘッダーのバルーンを非表示にする
        // サイドバナーも非表示にする
        var ua = {};
        ua.name = navigator.userAgent.toLowerCase();

        ua.isiPhone = ua.name.indexOf('iphone') >= 0;
        ua.isiPod = ua.name.indexOf('ipod') >= 0;
        ua.isiPad = ua.name.indexOf('ipad') >= 0;
        ua.isiOS = (ua.isiPhone || ua.isiPod || ua.isiPad);
        ua.isAndroid = ua.name.indexOf('android') >= 0;
        ua.isTablet = (ua.isiPad || (ua.isAndroid && ua.name.indexOf('mobile') < 0));

        if (ua.isiOS || ua.isTablet || ua.isAndroid) {
            $('#balloon-message').css({display : 'none'});
            $('#sidespace_banner').css({display : 'none'});
        }

        // 本日日付を更新日として表示する
        var today = new Date();
        var year  = today.getFullYear();
        var month = today.getMonth() + 1;
        var day   = today.getDate();

        $('#update_date').text(month + '月' + day + '日');

        // Lazyloadの実行
        $("img.lazy_s").lazyload({threshold : 50, effect: "fadeIn"});
        $("img.lazy").lazyload({threshold : 50, effect: "fadeIn"});
    });
//]]></script>

<!--{strip}-->
    <!--{* ▼Head COLUMN*}-->
    <!--{if $arrPageLayout.HeadNavi|@count > 0}-->
        <!--{* ▼上ナビ *}-->
        <!--{foreach key=HeadNaviKey item=HeadNaviItem from=$arrPageLayout.HeadNavi}-->
            <!--{* ▼<!--{$HeadNaviItem.bloc_name}--> *}-->
            <!--{if $HeadNaviItem.php_path != ""}-->
                <!--{include_php file=$HeadNaviItem.php_path}-->
            <!--{else}-->
                <!--{include file=$HeadNaviItem.tpl_path}-->
            <!--{/if}-->
            <!--{* ▲<!--{$HeadNaviItem.bloc_name}--> *}-->
        <!--{/foreach}-->
        <!--{* ▲上ナビ *}-->
    <!--{/if}-->
    <!--{* ▲Head COLUMN*}-->
<!--{/strip}-->
</head>

<!-- ▼BODY部 スタート -->
<!--{include file='./site_main.tpl'}-->
<!-- ▲BODY部 エンド -->

</html>
