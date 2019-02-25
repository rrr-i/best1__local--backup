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

<!--{* js用オンライン予約コース判定 - デフォルト値設定 *}-->
<!--{assign var=sub_large_image24 value=$arrProduct.sub_large_image24|default:0}-->

<script>//<![CDATA[
    // 規格2に選択肢を割り当てる。
    var runSlider = false;
    var remodal = null;
    var images = {};
    /*
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        eccube.setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
    */
    $(function(){
      // 20170615 [sato] オンライン料金IDにページ内遷移してきた場合、料金表をOPENにする
      if(location.hash.match(/#online[0-9]{8}/)){
        var opTd = $(location.hash);
        var opTr = opTd.parent('tr');
        var opTrn = opTr.next('tr');
        var opTd = opTrn.prev('tr').find('td');
        opTrn.removeClass('close').addClass('open');
        opTd.removeClass('nocheck').addClass('check');

        displayPrice();
        var offset = $(opTd).offset();
        $("html,body").animate({scrollTop:offset.top});
      }
      
      // 日付は1つしかない場合は、最初から料金表をOPENにする
      var opTbody = $('#online_price .other_price_list tbody');
      if(opTbody.size() <= 2){
        var opTr  = opTbody.closest('tr');
        var opTd = opTr.prev('tr').find('td');
        opTr.removeClass('close').addClass('open');
        opTd.removeClass('nocheck').addClass('check');
      }
      $("#shipinfoblock .date").on('click', function() {
        var tr  = $(this).closest('tr');
        var trn = $(this).closest('tr').next('tr');
        if (trn.hasClass('open')) {
          $(this).html($(this).html().replace('▲','▼'));
          tr.find('td').removeClass('check').addClass('nocheck');
          trn.removeClass('open').addClass('close');
        } else {
          $(this).html($(this).html().replace('▼','▲'));
          tr.find('td').removeClass('nocheck').addClass('check');
          trn.removeClass('close').addClass('open');
        }
      });

        // 遷移元が口コミ評価リンクの場合、クチコミガイド部分が表示された状態にする.
        if(location.hash == '#review'){
          // 口コミを表示する
          displayReview();
          var offset = $('#detail-blc-tabarea-top .tab-review #reviewblock > .title').offset();
          $("html,body").animate({scrollTop:offset.top});
        }
        // (アプリ用) 遷移元が「動画」へのリンクの場合、タブ移動を行い位置移動する.
        if(location.hash == '#staff'){
          displayVideo();
          var offset = $('#detail-blc-tabarea-top .tab-point #staffblock').offset();
          $("html,body").animate({scrollTop:offset.top});
        }
        // (アプリ用) 遷移元が「ご旅行条件」へのリンクの場合、タブ移動を行い位置移動する.
        if(location.hash == '#guide'){
          displayReview();
          var offset = $('#detail-blc-tabarea-top .tab-review #guideblock > .title').offset();
          $("html,body").animate({scrollTop:offset.top});
        }

        remodal = $('[data-remodal-id=modal]').remodal();
        $('.link-review').click(function() {
            displayReview();
            return false;
        });
        $('.detail-blc-tab a').click(function(event) {
            event.preventDefault();
            $('.detail-blc-tab a').removeClass('selected');
            $(this).addClass('selected');
            tabChange();
            if(!runSlider && $(this).data('contentsblock')=="tab-point") {
                if ($('.sitebxslider').size() > 0) {
                    $('.sitebxslider').bxSlider({
                        auto: true,
                        pager: false,
                        pause: 4000,
                        speed: 1000,
                        controls: false,
                        maxSlides: 3,
                        minSlides: 3,
                        fixedHeight: 180,
                        slideWidth: 620
                    }).reloadSlider();
                }
                if ($('.siteportbxslider').size() > 0) {
                  $('.siteportbxslider').bxSlider({
                        auto: true,
                        pager: true,
                        pause: 4000,
                        speed: 1000,
                        controls: true,
                        maxSlides: 3,
                        minSlides: 3,
                        fixedHeight: 180,
                        slideMargin: 10,
                        slideWidth: 620,
                        moveSlides: 1
                    }).reloadSlider();
                }
                $('.charmslider').bxSlider({
                    auto: true,
                    pause: 6000,
                    speed: 1000,
                    pager: true,
                    controls: true,
                    slideWidth: 620,
                    fixedHeight: 190,
                    maxSlides: 3,
                    minSlides: 3,
                    slideMargin: 10,
                    moveSlides: 1
                }).reloadSlider();

            }
        });
        tabChange();
        var onreview = getGetParameter('onreview');
        if (onreview == 1) {
            // 口コミを表示する
            displayReview();
        }
        $('.btn-addfav-run').on('click', function() {
            var productId = $(this).data('product_id');
            if (!productId) {
                return false;
            }
            $('.favorite-product-id').val(productId);
            $('#form-favorite').submit();
            //$(this).hide().closest('.list-blc-addfav').find('.btn-addfav-done').show();
            return false;
        });
        $('.price_realtime').on('click', function() {
            // 価格表を表示する
            displayPrice();
        });
        $('.btn_online').on('click', function() {
            // 価格表を表示する
            displayPrice();
        });
        /*
            $('#roomgallery a.expansion,#mapblock a.expansion').facebox({
                loadingImage : '<!--{$TPL_URLPATH}-->js/jquery.facebox/loading.gif',
                closeImage   : '<!--{$TPL_URLPATH}-->js/jquery.facebox/closelabel.png'
            });
        */
            $('#roomgallery a.expansion,#mapblock a.expansion').click(function(event) {
                event.preventDefault();
                $('p.image img').remove();
                var img = $('<img>').attr('src', $(this).attr('href')).css({"width": "100%"}).bind('load', function() {
                    remodal.open();
                });
                $('p.image').append(img);
                return false;
            });
            $(document).on('click', '#charmgallery a.expansion', function(event) {
                event.preventDefault();
                $('p.image img').remove();
                var img = $('<img>').attr('src', $(this).attr('href')).css({"width": "100%"}).bind('load', function() {
                    remodal.open();
                });
                $('p.image').append(img);
                return false;
            });
            var cnt = 1;
            $('a.expansion').each(function() {
                $(this).data('image-index', cnt++);
                images[cnt] = $('<img src="'+$(this).attr('href')+'">');
            });
            $('td,th').removeAttr('width');

            // オプショナルツアーバナークリック時にパンフレット部分へ遷移.
            $('#bnr_optional_tour').click(function() {
                displayReview();
                var offset = $('#detail-blc-tabarea-top .tab-review #reviewblock #charmblock .ul_panf_2').offset();
                $("html,body").animate({scrollTop:offset.top});
            });
            // 「港情報はこちら」クリック時にパンフレット部分へ遷移.
            $('#bnr_port_information').click(function() {
                displayReview();
                var offset = $('#detail-blc-tabarea-top .tab-review #reviewblock #charmblock .ul_panf_2').offset();
                $("html,body").animate({scrollTop:offset.top});
            });
            $('.bnr_port_information').click(function() {
                displayReview();
                var offset = $('#detail-blc-tabarea-top .tab-review #reviewblock #charmblock .ul_panf_2').offset();
                $("html,body").animate({scrollTop:offset.top});
            });
    });


    // APIコースのスケジュールの寄港地文言を目立たせる.
    $(function(){
      var flgApi = <!--{$sub_large_image24}-->;
      if(flgApi == 1){
        var len = $('#schedule table tbody tr').length;
        var flg = false;
        for(var i=1; i<=len; i++){
          var rowspan = $('#schedule table tbody tr:nth-child('+i+') td:nth-child(1)').attr('rowspan');
          var cnt = 2;
          if(flg) cnt = cnt - 1;
          if(rowspan > 1){
            flg = true;
          }else{
            flg = false;
          }
          var tr = $('#schedule table tbody tr:nth-child('+i+') td:nth-child('+cnt+')');
          $(tr).css({cssText:"color: #44444e; font-weight: bold; font-family: 'Hiragino Kaku Gothic Pro', 'ヒラギノ角ゴ Pro W3', 'メイリオ', 'Lucida Grande', Verdana, 'ＭＳ Ｐゴシック', sans-serif !important;"});
        }
      }
    });


    // [2018-02-08/sato] スケジュール表の寄港地名下に説明文を挿入する.
    $(function () {
    
      // 寄港地コード,寄港地名,説明文 の配列をphpより取得.
      area_id = <!--{$arrAttr.area.id}-->;
    
      // 初回反映(2018-02-08): 日本発着 日本船と外国船
      // 2018-03-29: 「地中海」「ハワイ」追加
      // 2018-04-03: 「エーゲ海」追加
      // 2019-02-08: 全てに表示
      if(true){
        var listPortDescription = <!--{$listPortDescription}-->;
        var arrPorts = [], arrTexts = [];
        var insertColumn = false;
        var cntTable = $('#schedule table').length;
        var flgGuiMap = $('#schedule > table').hasClass('schedule--gui-map');
        if(cntTable > 1){ // TODO 表が2つ以上ある場合の処理
          // Skip
        }else{
          // thead内にカラムデータが含まれている場合の処理
          var thead = '#schedule table thead tr';
          var numberOfDataHhead = $(thead).children().length;
          for(var t1=1; t1<numberOfDataHhead+1; t1++){
            if($(thead + ' th:nth-child('+t1+')').text().match(/寄港地|日程/)){
              insertColumn = t1;
              break;
            }
          }
          // tbody内のデータ処理
          var table = '#schedule table tbody';
          for(var i=1; i<$(table).children().length+1; i++){
            // カラムデータ取得.
            var tr = table + ' tr:nth-child('+i+')';
            var numberOfData = $(tr).children().length;
            if(i == 1 && !insertColumn){
              var numberOfColumn = numberOfData;
              for(var i2=1; i2<numberOfData+1; i2++){
                if($(tr + ' th:nth-child('+i2+')').text().match(/寄港地|日程/) || $(tr + ' td:nth-child('+i2+')').text().match(/寄港地|日程/)){
                  insertColumn = i2;
                  break;
                }
              }
            }else if(insertColumn){
              if(numberOfData == numberOfColumn){
                // rowspanの存在によるズレ対処.
                var listRowspan = [];
                for(var i3=1; i3<numberOfData+1; i3++){
                  var rowspan = $(tr + ' td:nth-child('+i3+')').attr('rowspan');
                  if(rowspan > 0){
                    listRowspan[i3] = rowspan;
                  }
                }
                arrPorts[i] = [insertColumn, $(tr + ' td:nth-child('+insertColumn+')').text()];
              }else{
                var minusCnt = insertColumn;
                for(var rowspanKey in listRowspan){
                  if(insertColumn > rowspanKey) minusCnt--;
                }
                arrPorts[i] = [minusCnt, $(tr + ' td:nth-child('+minusCnt+')').text()];
              }
            }
          }
        }
        // カラムに「寄港地」もしくは「日程」が存在する場合.
        if(insertColumn){
          // 寄港地名の存在を確認.
          for(var portName in listPortDescription){
            for(var portKey in arrPorts){
              var reg = new RegExp(portName);
              var match = arrPorts[portKey][1].match(reg);
              if(match){
                if(!arrTexts[portKey] || arrTexts[portKey][1] > match.index){
                  arrTexts[portKey] = [arrPorts[portKey][0], match.index, listPortDescription[portName]];
                }
              }
            }
          }
          var listScheduleKeys = Object.keys(arrPorts);
          var keyPort1st = listScheduleKeys[0];
          var keyPortLast = listScheduleKeys[listScheduleKeys.length-1];
    
          // スケジュール表に挿入.
          for(var textKey in arrTexts){
            var vDesc      = arrTexts[textKey][2]['description'];
            var vImgPort   = arrTexts[textKey][2]['img_port'];
            var vMapParam  = arrTexts[textKey][2]['map_param'];
            var vAddPort   = arrTexts[textKey][2]['address_port'];
            var vTransPort = arrTexts[textKey][2]['transport_port'];
            var vNameAir   = arrTexts[textKey][2]['name_airport'];
            var vUrlAir    = arrTexts[textKey][2]['url_airport'];
            var vTransAir  = arrTexts[textKey][2]['transport_airport'];
            var target     = table + ' tr:nth-child('+textKey+')' + ' td:nth-child('+arrTexts[textKey][0]+')';
    
            if(vDesc){
              // 観光オススメ
              $(target).append('<div class="port_description"></div>');
              $(target + ' div.port_description').text(vDesc);
            }
    
            if(flgGuiMap && (textKey == keyPort1st || textKey == keyPortLast)){
              if(vAddPort){
                // 港情報、オプショナルツアー
                $(target).append('<div class="info-optour"></div>');
                $(target+' div.info-optour').append('<ul class="tab"></ul>');
                $(target+' div.info-optour').append('<ul class="tab-content"></ul>');
                $(target+' div.info-optour ul.tab').append('<li class="active">港情報のご案内</li><li>オプショナルツアーのご案内</li>');
                $(target+' div.info-optour ul.tab-content').append('<li class="active"></li><li></li>');
                $(target+' div.info-optour ul.tab-content li:nth-child(1)').text(vAddPort);
                $(target+' div.info-optour ul.tab-content li:nth-child(2)').append('<a href="#">PDFを開いてチェック</a>');
              }
    
              if(vImgPort && vMapParam){
                // Googleマップ、寄港地画像
                $(target).append('<div class="image-movie flexbox"></div>');
                $(target+' div.image-movie').append('<ul class="map"></ul>');
                $(target+' div.image-movie').append('<ul class="image"></ul>');
                $(target+' div.image-movie ul.map').append('<iframe src="https://www.google.com/maps/embed?pb='+vMapParam+'" width="235" height="145" frameborder="0" style="border:0" allowfullscreen></iframe>'); 
                $(target+' div.image-movie ul.image').append('<img alt="" src="https://www.best1cruise.com/upload/category_image/'+vImgPort+'" class="hoverZoomLink">');
              }
    
              if(vTransPort && vNameAir && vUrlAir &&vTransAir){
                // 港までの交通情報、空港名、空港のURL、空港までの交通情報
                $(target).append('<div class="access"></div>');
                $(target+' div.access').append('<ul class="tab"></ul>');
                $(target+' div.access').append('<ul class="tab-content"></ul>');
                $(target+' div.access ul.tab').append('<li class="active">港への交通手段</li><li>最寄りの空港情報</li>');
                $(target+' div.access ul.tab-content').append('<li class="active"></li><li></li>');
                $(target+' div.access ul.tab-content li:nth-child(1)').text(vTransPort);
                $(target+' div.access ul.tab-content li:nth-child(2)').append('空港名: <a href="'+vUrlAir+'" target="_blank" rel="nofollow">'+vNameAir+'</a> '+vTransAir);
              }
            }
          }
        }
      }
    });
    

    // [20190117/sato] 新レイアウトスケジュール表内のタブ切り替え
    $(function(){
      var tab = '#scheduleblock #schedule .info-optour ul.tab li';
      var tab2 = '#scheduleblock #schedule .access ul.tab li';
      $(tab + ',' + tab2).on('click', function() {
        $(this).parent().parent().find('ul li').removeClass('active');
        var objInfoOptour = $(this).addClass('active').parent().parent();
        objInfoOptour.find('.tab-content li').eq(objInfoOptour.find('.tab li').index(this)).addClass('active');
      });
    });

    $(document).ready(function() {
        // 遷移元が「空室／料金リアルタイム表示」リンクの場合、価格表が表示された状態にする.
        if(location.hash == '#price_realtime'){
          // 口コミを表示する
          displayPrice();
        }
    });

    //サブエリアの表示/非表示
    var speed = 500;
    var stateSub = 0;
    function fnSubToggle(areaEl, imgEl) {
        areaEl.slideToggle(speed);
        if (stateSub == 0) {
            $(imgEl).attr("src", "<!--{$TPL_URLPATH}-->img/button/btn_plus.png");
            stateSub = 1;
        } else {
            $(imgEl).attr("src", "<!--{$TPL_URLPATH}-->img/button/btn_minus.png");
            stateSub = 0
        }
    }
    // 口コミを表示する
    function displayReview() {
        // console.log('call displayReview()');
        $('.detail-blc-tab a').removeClass('selected');
        $('.detail-blc-tab .tab4 a').addClass('selected');
        tabChange();
        var offset = $('#detail-blc-tabarea-top .tab-review #reviewblock > .title').offset();
        $(window).scrollTop(offset.top);
    }
    // 価格表を表示する
    function displayPrice() {
        // console.log('call displayPrice()');
        $('.detail-blc-tab a').removeClass('selected');
        $('.detail-blc-tab .tab2 a').addClass('selected');
        tabChange();
        var offset = $('#detail-blc-tabarea-top .tab-price .priceinfoblock > .title').offset();
        $(window).scrollTop(offset.top-12);
    }
    // 動画を表示する
    function displayVideo() {
        $('.detail-blc-tab a').removeClass('selected');
        $('.detail-blc-tab .tab3 a').addClass('selected');
        tabChange();
        var offset = $('#detail-blc-tabarea-top .tab-point #staffblock').offset();
        $(window).scrollTop(offset.top);
    }
    //この商品に対するお客様の声エリアの表示/非表示
    var stateReview = 0;
    function fnReviewToggle(areaEl, imgEl) {
        areaEl.slideToggle(speed);
        if (stateReview == 0) {
            $(imgEl).attr("src", "<!--{$TPL_URLPATH}-->img/button/btn_plus.png");
            stateReview = 1;
        } else {
            $(imgEl).attr("src", "<!--{$TPL_URLPATH}-->img/button/btn_minus.png");
            stateReview = 0
        }
    }
    //お勧めエリアの表示/非表示
    var statewhobought = 0;
    function fnWhoboughtToggle(areaEl, imgEl) {
        areaEl.slideToggle(speed);
        if (statewhobought == 0) {
            $(imgEl).attr("src", "<!--{$TPL_URLPATH}-->img/button/btn_plus.png");
            statewhobought = 1;
        } else {
            $(imgEl).attr("src", "<!--{$TPL_URLPATH}-->img/button/btn_minus.png");
            statewhobought = 0
        }
    }
    function tabChange() {
        $('.detail-blc-tab a').each(function() {
            if ($(this).hasClass('selected')) {
                //console.log('show .'+$(this).data('contentsblock'));
                $('.'+$(this).data('contentsblock')).show();
            } else {
                //console.log('hide .'+$(this).data('contentsblock'));
                $('.'+$(this).data('contentsblock')).hide();
            }
        });
    }

var _gallery = new Array();
<!--{section name=cnt loop=$arrSiteCat}-->
var arrgallery = new Array();
arrgallery["name"]    = "<!--{$arrSiteCat[cnt].category_name}-->";
arrgallery["country"] = "<!--{$arrSiteCat[cnt].information}-->";
arrgallery["flag"]    = "<!--{$arrSiteCat[cnt].main_image}-->";
arrgallery["image"]   = "<!--{$arrSiteCat[cnt].icon_image}-->";
arrgallery["text"]    = "<!--{$arrSiteCat[cnt].note|nl2br|strip:""}-->";
arrgallery["image_type"]    = "<!--{$arrSiteCat[cnt].image_type}-->";
arrgallery["point"]    = "<!--{$arrSiteCat[cnt].static_ranking|nl2br|strip:""}-->";
_gallery[<!--{$smarty.section.cnt.index}-->] = arrgallery;
<!--{/section}-->

  setSiteInfor(0);
  $('.bx-loading').css("display","none");

  $(document).on('click','#sitegallery ul li a', function(event) {
      event.preventDefault();
      setSiteInfor(this.id.replace("site_photo_",""));
      $('body,html').animate({scrollTop:$('.detail-blc-tab').offset().top},1);
  });
/*
  $('#sitegallery ul li a').live('click',function(event) {
      event.preventDefault();
      setSiteInfor(this.id.replace("site_photo_",""));
  });
*/

  // 寄港地の詳細を表示
  function setSiteInfor(_id) {
    if(!_id) return;
    _country = _gallery[_id]["country"];
    if(_gallery[_id]["flag"]!="") {
        _flg = '<img src="/upload/category_image/' + _gallery[_id]["flag"] + '" />';
        _country = _flg + _country;
    }
    if(_gallery[_id]["image"]=="") {
      $("#site_image").hide();
    } else {
      $("#site_image").show();
      if(_gallery[_id]["image_type"]=="1") {
        _dir = "<!--{$smarty.const.IMAGE_SAVE_URLPATH}-->";
      } else {
        _dir = "/upload/category_image/";
      }
      $("#site_image").attr("src",_dir + _gallery[_id]["image"]);
    }
    if(_gallery[_id]["flag"]!="") {
		//$("#site_country_image").attr("src","/upload/category_image/" + _gallery[_id]["flag"]);
	}
    $("#site_city").html(_gallery[_id]["name"]);
    $("#site_country").html(_country);
    $("#siteinline #siteleft p.font span#site_note").html(_gallery[_id]["text"]);
    if(_gallery[_id]["point"]=="") {
      $("#site_point_title").css("display","none");
    } else {
      $("#site_point_title").css("display","inline");
    }
    $("#site_point").html(_gallery[_id]["point"]);
  }

  $(function(){
    $('.readMorePanfBtn').on('click', function() {
      $(this).css('display','none');
      $('.readMorePanf').slideDown('fast');
      $('.readClosePanfBtn').css('display','block');
    });
    $('.readClosePanfBtn').on('click', function() {
      $('.readMorePanf').css('display','none');
      $('.readMorePanfBtn').css('display','block');
      $(this).css('display','none');
    });

   $(function(){
     $(".qanda_question").on("click",function(){
       $(this).next(".qanda_answer").slideToggle();
     });
     $(".question_block-moretext").on("click",function(){
       $(".question_block").css("height","inherit");
       if($(this).text() == "全件表示"){
         $(this).text("閉じる");
       }else{
         $(this).text("全件表示");
       $(".question_block").css("height","500px");
       }
     });
   });
/*
    $('#detail-blc-tabarea-top ul li.tab2').click(function() { 
      var maxHeight = 0;
    
      //最大の高さを取得
      $('#roomgallery li').each(function(){
        var height = $(this).height(); 
        if(height>maxHeight){
          maxHeight=height;
        }
      });
    
      //最大の高さに合わせて全てのliタグの高さを変更
      if(maxHeight>0){
       $('#roomgallery li').each(function(){
         $(this).height(maxHeight); 
       });
      }
    });
*/
  });

  // 客室特典情報 - 表示開閉動作.
  $(function(){
    $('.roomspecial_open').on('click', function() {
      t = $(this).parents('li').find('.roomspecial');
      tClose = $(this).parents('li').find('.roomspecial_close');
      $(t).css('display','inline-block');
      $(this).css('display','none');
      $(tClose).css('display','inline-block');
    });
    $('.roomspecial_close').on('click', function() {
      t = $(this).parents('li').find('.roomspecial');
      tOpen  = $(this).parents('li').find('.roomspecial_open');
      $(t).css('display','none');
      $(this).css('display','none');
      $(tOpen).css('display','inline-block');
    });
  });

  //funatsu 18?10?16
  $(function(){
    $('.sub_title31, .sub_title31--more').click(function(){
      if($('.sub_title31--more').length){
        $('.sub_title31--more').toggleClass('sub_title31--hide');
        $('.sub_title31').toggleClass('sub_title31--open');
      }
    });
  });

//]]></script>
<!--{assign var=review value=$productReviewStatOfCompany[$arrProduct.product_id]}-->
<!--{assign var=reviewLevel value=$review.recommend_level1_average}-->
<!--{assign var=reviewTotal value=$review.total|default:0}-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/fontawesome.css" integrity="sha384-1rquJLNOM3ijoueaaeS5m+McXPJCGdr5HcA03/VHXxcp2kX2sUrQDmFc3jR5i/C7" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/brands.css" integrity="sha384-rf1bqOAj3+pw6NqYrtaE1/4Se2NBwkIfeYbsFdtiR6TQz0acWiwJbv1IM/Nt/ite" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

<div class="list-blc-course">
  <div class="list-blc-course-title">
    <h2><span><!--{$arrProduct.name|h}--></span></h2>
  </div>
    <div class="list-blc-company">
      <!--{assign var=typename value=$arrAttr.type.name|replace:'航空券付きクルーズツアー':'航空券付ツアー'}-->
      <!--{assign var=typename value=$typename|replace:'添乗員同行クルーズツアー':'添乗員付ツアー'}-->
      <!--{assign var=typename value=$typename|replace:'レストラン船(ランチ・サンセット・ディナー)':'レストラン船'}-->
      <!--{if $arrAttr.type.id == 11}-->
      <!--{assign var=typeclassname value="ico-course-cruise"}-->
      <!--{elseif $arrAttr.type.id == 12}-->
      <!--{assign var=typeclassname value="ico-course-plane"}-->
      <!--{elseif $arrAttr.type.id == 13}-->
      <!--{assign var=typeclassname value="ico-course-cond"}-->
      <!--{elseif $arrAttr.type.id == 973}-->
      <!--{assign var=typeclassname value="ico-course-cond"}-->
      <!--{elseif $arrAttr.type.id == 2064}-->
      <!--{assign var=typeclassname value="ico-course-b1tour"}-->
      <!--{/if}-->
    <div class="<!--{$typeclassname}-->"><i class="fa fa-caret-right"></i>&nbsp;<!--{$typename}--></div>
      <div class="list-blc-company"><a class="company-link" href="/B/<!--{$arrAttr.company.code}-->/" target="_blank">
      <img src="/upload/category_image/<!--{$arrAttr.company.main_image}-->" width="150" height="44" alt="<!--{$arrAttr.company.name}-->" /></a></div>
        <div class="<!--{if $reviewLevel > 0}-->list-blc-addfav<!--{else}-->list-blc-addfav-nolist<!--{/if}-->">
        <!--{if $arrProduct.is_favorite}-->
        <a href="/mypage/" class="btn-addfav btn-addfav-done" style="color:#999;"><i class="fas fa-heart"></i>お気に入り登録済み</a>
        <a href="#" class="btn-addfav btn-addfav-run" data-product_id="<!--{$arrProduct.product_id}-->" style="display: none;"><i class="fas fa-heart"></i>お気に入りに追加する</a>
        <!--{else}-->
        <a href="/mypage/" class="btn-addfav btn-addfav-done" style="color:#999; display: none;"><i class="fas fa-heart"></i>お気に入り登録済み</a>
        <a href="#" data-product_id="<!--{$arrProduct.product_id}-->" class="btn-addfav btn-addfav-run"><i class="fas fa-heart"></i>お気に入りに追加する</a>
        <!--{/if}-->
        </div></div>
  <!-- img src="<!--{$TPL_URLPATH}-->img/detail/bn_detail_main_sample.jpg" width="640" height="200" alt=" " / -->
  <div class="list-blc-course-detail">
    <div class="list-blc-course-image">
        <h2 class="attr_ship_name">
      <span class="ico-type"><!--{$arrAttr.class.name}-->客船</span>
      <span class="course-code">商品コード:<!--{$arrProduct.product_id}--></span>
      <span class="aftr_ship_name_title"><a href="/ship/<!--{$arrAttr.ship.code}-->/" target="_blank"><!--{$arrAttr.ship.name}-->号</a></span>
      </h2>
      <div>
      <div class="top_ship--img">
        <img src="/upload/category_image/<!--{$arrAttr.ship.main_image}-->" alt="<!--{$arrAttr.ship.name}-->" /><br />
        <p><a href="#" class="link-review"><i class="fas fa-star"></i> <!--{$_sphtml->reviewString($reviewTotal, $reviewLevel)}--></a></p>
      </div>
      <div class="attr_stay_name">
        <span class="p_stay_name"><!--{$arrAttr.stay.name}--></span>
        <!--{if $arrAttr.stay.name|count_characters <= 5}-->
          <!--{if $arrProduct.product_id == 27601 || ($arrProduct.sub_large_image24 == 1 && $arrAttr.company.category_id == 622)}-->
          <span class="p_eat_free">船内での全食事（アルコールやカクテルを除く）は無料</span>
          <!--{else}-->
          <span class="p_eat_free">全食事無料付き</span>
          <!--{/if}-->
        <!--{else}-->
          <!--{if $arrProduct.product_id == 27601 || ($arrProduct.sub_large_image24 == 1 && $arrAttr.company.category_id == 622)}-->
          <span class="p_eat_free_br">船内での全食事（アルコールやカクテルを除く）は無料</span>
          <!--{else}-->
          <span class="p_eat_free_br">全食事無料付き</span>
          <!--{/if}-->
        <!--{/if}-->
        <p class="<!--{if $arrAttr.type.id == 11}-->price_cruise_s<!--{/if}--><!--{if $arrAttr.type.id == 12}-->price_air_s<!--{/if}--><!--{if $arrAttr.type.id == 13}-->price_tour_s<!--{/if}--><!--{if $arrAttr.type.id == 2064}-->price_best1_s<!--{/if}-->">船内施設・イベント利用無料</p>
      </div>
      <!--{assign var=image_key value=sub_image3}-->
      <!--{if $arrProduct[$image_key]}-->
      <div id="mapblock"><a data-modal-target="modal" href="/resize_image.php?width=500&image=<!--{$arrProduct[$image_key]}-->" class="expansion link-map">航海図を見る</a></div>
      <!--{/if}-->

      <a class="link-map shipinformation_link" href="#shipinformation">客船概要情報</a>
      <div class="remodal shipinformation" data-remodal-id="shipinformation">
        <p><!--{$arrAttr.ship.information|nl2br}-->
        <button data-remodal-action="close" class="remodal-close"></button>
        </p>
      </div>

      <!--{if $arrAttr.ship.code != ""}-->
      <a class="link-map shipinformation_link" href="/ship/<!--{$arrAttr.ship.code}-->/" target="_blank">客船紹介ページ</a>
      <!--{/if}-->
    </div>

      <div class="list-blc-sns">
        <div class="list-blc-share" style="margin-top:20px;">
          <a href="<!--{$smarty.const.HTTP_URL}-->products/review.php?product_id=<!--{$arrProduct.product_id}-->" class="btn-addreview"><i class="fas fa-edit"></i>口コミを投稿する</a>
          <ul>
            <li><a class="line" target="_blank" href="http://line.me/R/msg/text/?<!--{$arrProduct.name|h}--> <!--{$smarty.const.HTTP_URL}-->B/<!--{$arrAttr.company.category_code}-->/<!--{$arrProduct.sub_comment26}-->.html"><i class="fab fa-line"></i><!--LINE--></a>
            <li><a class="twitter" target="_blank" href="https://twitter.com/share?url=<!--{$smarty.const.HTTP_URL}-->B/<!--{$arrAttr.company.category_code}-->/<!--{$arrProduct.sub_comment26}-->.html&text=<!--{$arrProduct.name}-->"><i class="fab fa-twitter-square"></i><!--Twitter--></a>
            <li><a class="facebook" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<!--{$smarty.const.HTTP_URL}-->B/<!--{$arrAttr.company.category_code}-->/<!--{$arrProduct.sub_comment26}-->.html"><i class="fab fa-facebook-square"></i><!--Facebook--></a>
            <li><!--{assign var=subject value="おすすめしたいコース"}-->
            <!--{assign var=body value="`$arrProduct.name`\r\n`$smarty.const.HTTP_URL`B/`$arrAttr.company.category_code`/`$arrProduct.sub_comment26`.html"}-->
            <a href="mailto:?subject=<!--{$subject|escape:"url"}-->&amp;body=<!--{$body|escape:"url"}-->" class="btn-addfriend"><i class="far fa-envelope"></i><!--メールで共有--></a>
            </li>
          </ul>
          <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
        </div>
        </div>
    </div>
          <div class="remodal shipinformation" data-remodal-id="shipinformation<!--{$arrAttr.ship.id}-->">
        <p><!--{$arrAttr.ship.information|nl2br}-->
        <button data-remodal-action="close" class="remodal-close"></button>
        </p>
      </div>
    <div class="list-blc-course-price">
      <table>
        <tr>
          <th><i class="fas fa-map-marker-alt"></i>方面</th>
          <td class="bold"><a href="/B/<!--{$arrAttr.area.code}-->/" style="color:rgba(0,0,0,0.75); font-weight:bold;" target="_blank"><!--{$arrAttr.area.name}--></a></td>
        </tr>
        <tr>
          <th><i class="fas fa-ship"></i>発着</th>
          <td class="attr_terminal_name"><!--{$arrAttr.terminal.name}--><!--{if $arrProduct.sub_large_image6}--> / <!--{$arrProduct.sub_large_image6}-->着<!--{/if}--></td>
        </tr>
        <tr>
          <th><i class="far fa-calendar-alt"></i>出発日</th>
          <td class="sub_title31">
            <!--{if $arrProduct.product_id == 25773}-->
              ???（6月上旬〜中旬）
            <!--{elseif $arrProduct.product_id == 26519}-->
              ???（5月下旬）
            <!--{elseif $arrAttr.company.category_id == 2233}-->
              ???
            <!--{else}-->
              <!--{$arrProduct.sub_title31|default:'お問合わせください'}-->
            <!--{/if}-->
          </td>
        </tr>
        <!--{if $arrProduct.sub_title31|count_characters >= 300}-->
          <tr class="sub_title31--more">
	    <td>
              タップして続きを表示
	    </td>
          </tr>
        <!--{/if}-->
        </tr>
        <!--{if $arrAttr.stay.information > 0 && $arrAttr.stay.information < 21}-->
        <tr>
          <th><i class="far fa-calendar-alt"></i>到着日</th>
          <td>上記日付 + <!--{$arrAttr.stay.information-1}-->日後帰着</td>
        </tr>
        <!--{/if}-->
        <!--{*<tr>
          <th>寄港地</th>
          <td>
            <!--{if $arrProduct.sub_comment28}-->
            <!--{$arrProduct.sub_comment28}-->
            <!--{else}-->
            <!--{section name=cnt loop=$arrAttr.site}-->
            <!--{$arrAttr.site[cnt].category_name}--><!--{if !$smarty.section.cnt.last}-->&nbsp;/&nbsp;<!--{/if}-->
            <!--{/section}-->
            <!--{/if}-->
          </td>
        </tr>*}-->
      </table>
      <div class="list-blc-price">
        <p class="price_content_title"><i class="fas fa-yen-sign"></i>料金</p>
        <p class="price<!--{if $arrAttr.type.id == 11}--> price_cruise<!--{/if}--><!--{if $arrAttr.type.id == 12}--> price_air<!--{/if}--><!--{if $arrAttr.type.id == 13}--> price_tour<!--{/if}--><!--{if $arrAttr.type.id == 2064}--> price_best1<!--{/if}-->">
        <!--{$arrProduct.sub_title29|default:'お問合わせ下さい'}-->

        <!--{if $arrProduct.sub_title29}-->
        <span class="no_text-shadow">1日/<!--{$arrProduct.sub_comment27}--></span>
        <!--{/if}-->

        <!--{if !is_null($arrProduct.sub_large_image21)}-->
        <p class="price_realtime">
          <span>☆</span><span class="p_underline">空室 / 部屋料金を確認する</span>
        </p>
        <!--{/if}-->
      </div>
    </div>
  </div>
</div>
<div style="margin:10px 0 0 0; text-align: center; ">
  <span style="font-size: 85%; letter-spacing: -3px;">
  ※<a style="text-decoration: underline; color:#000; font-size: 150%; letter-spacing: -3px;" href="<!--{$smarty.const.HTTPS_URL}-->contact/?product_id=<!--{$tpl_product_id}-->">上記コースの空室・料金</a>は日々変動します。事前に弊社までご照会ください。
  </span>
</div>

<div class="blc-contact-button-detail">
  <ul>
  <!--{if count($arrOnlineProduct) > 0}-->
      <li class="btn_online" style="width:100%;margin:0;"><span class="online_reservation_button onlineno-button-style" href="#"><span class="reservation_button--left">オンライン最安値予約<br />(２４時間いつでも・カード決済)</span></span></li>
    <!--{/if}-->
      <li><a class="reserve no-button-style<!--{if count($arrOnlineProduct) < 1}--> big_reserve_button<!--{/if}-->" href="<!--{$smarty.const.HTTPS_URL}-->contact/?contact_type_id=2&amp;product_id=<!--{$arrProduct.product_id}-->" target="_blank"><i class="fas fa-envelope"></i><span class="no_button--inline2">メール<br />（仮予約）</span></a>
      <li><a class="inquiry no-button-style" href="<!--{$smarty.const.HTTPS_URL}-->contact/?product_id=<!--{$arrProduct.product_id}-->" target="_blank"><i class="fas fa-book-open"></i><span class="no_button--inline3">資料請求<br />（無料）</span></a>
  </ul>
</div>


<!--{* コスタ ネオ ロマンチカ 18年1/13 TV放映 *}-->
<!--{if $arrProduct.product_id == 20612 | $arrProduct.product_id == 20700 | $arrProduct.product_id == 20701 | $arrProduct.product_id == 20704 | $arrProduct.product_id == 20706 | $arrProduct.product_id == 20708 | $arrProduct.product_id == 20709 | $arrProduct.product_id == 20711 | $arrProduct.product_id == 20712 | $arrProduct.product_id == 20714 | $arrProduct.product_id == 20715 | $arrProduct.product_id == 20716 | $arrProduct.product_id == 20612 | $arrProduct.product_id == 20650 | $arrProduct.product_id == 20652 | $arrProduct.product_id == 20654 | $arrProduct.product_id == 20655 | $arrProduct.product_id == 20656 | $arrProduct.product_id == 20657 | $arrProduct.product_id == 20660 | $arrProduct.product_id == 20661}-->
  <div style="border: 4px solid #28AB66; background: #28AB66;">
    <iframe width="312" height="180" src="https://www.youtube.com/embed/Etq-AR-R4as" frameborder="0" allowfullscreen=""></iframe>
    <iframe width="312" height="180" src="https://www.youtube.com/embed/mMhSe32KvVI" frameborder="0" allowfullscreen=""></iframe>
    <!-- <img src="/user_data/img/cabin_intro/bnr_detail_sp_cos_neo_cm_onair.png" alt="" height="175"> -->
  </div>
<!--{/if}-->

<div id="detail-blc-tabarea-top" class="detail-blc-tabarea">
	<div class="detail-blc-tab">
		<ul>
                        <li class="tab1"><a data-contentsblock="tab-map" href="#" class="selected">スケジュール<br />コース日程<br />航海マップ</a>
                        <li class="tab2"><a data-contentsblock="tab-price" href="#">お得割引情報<br />客室詳細情報<br />料金/出発日</a>
                        <li class="tab3"><a data-contentsblock="tab-point" href="#">寄港地の魅力<br />船会社の魅力<br />船内施設の魅力</a>
                          <li class="tab4"><a data-contentsblock="tab-review" href="#">パンフ/OPツアー<br />クチコミ体験談<br />旅行条件/規定</a>
		</ul>
	</div>
	<div class="tab-map tabs">
      <!--{* スケジュール *}-->
      <!--{assign var=title_key value=sub_title25}-->
      <!--{assign var=image_key value=sub_image3}-->
      <!--{if !$arrProduct[$image_key] && !$arrProduct[$title_key]}-->
        <!--{assign var=type value=0}-->
      <!--{elseif !$arrProduct[$image_key]}-->
        <!--{assign var=type value=1}-->
      <!--{else}-->
        <!--{assign var=type value=2}-->
      <!--{/if}-->


      <!--{* [20180806/sato] セレブリティ・ミレニアム 2019/04/13出発 *}-->
      <!--{if $arrProduct.product_id == 28564}-->
        <img src="/user_data/charms/448/cel_mil_20190413_campaign.png?20180806071508" width="100%" alt="早期予約特典のご案内" />
      <!--{/if}-->

      <!--{* ウィンドスター モニター料金 20180703 *}-->
      <!--{if $arrProduct.product_id == 27601}-->
        <img src="/user_data/charms/1278/bnr_sp_detail_monitorprice.jpg" width="100%" alt="モニター料金" />
      <!--{/if}-->

      <!--{* [20180507/sato] ミステリーツアー用注意バナー *}-->
      <!--{if $arrProduct.product_id == 26519}-->
        <img src="/user_data/charms/2233/bnr_sp_detail_mystery_departure_late_may.png" width="100%" alt="このミステリーコースの出発日は、5月下旬になります。" />
      <!--{elseif $arrProduct.product_id == 25773}-->
        <img src="/user_data/charms/2233/bnr_sp_detail_mystery_departure_may_jun.png?20180514080158" width="100%" alt="このミステリーコースの出発日は、6月上旬〜中旬になります。" />
      <!--{elseif $arrProduct.product_id == 26543}-->
        <img src="/user_data/charms/2233/bnr_sp_detail_mystery_departure_early_august.png" width="100%" alt="このミステリーコースの出発日は、8月上旬になります。" />
      <!--{elseif $arrProduct.product_id == 26655 || $arrProduct.product_id == 26656}-->
        <img src="/user_data/charms/2233/bnr_sp_detail_mystery_departure_mid_jun.png" width="100%" alt="このミステリーコースの出発日は、6月中旬になります。" />
      <!--{elseif $arrProduct.product_id == 26657}-->
        <img src="/user_data/charms/2233/bnr_sp_detail_mystery_departure_late_jun.png" width="100%" alt="このミステリーコースの出発日は、6月下旬になります。" />
      <!--{elseif $arrProduct.product_id == 26658 || $arrProduct.product_id == 26659 || $arrProduct.product_id == 26660 || $arrProduct.product_id == 26661 || $arrProduct.product_id == 26662}-->
        <img src="/user_data/charms/2233/bnr_sp_detail_mystery_departure_early_jul.png" width="100%" alt="このミステリーコースの出発日は、7月上旬になります。" />
      <!--{/if}-->

      <!--{* [20180518/sato] 桂文枝さん参加バナー追加 *}-->
      <!--{if $arrProduct.product_id == 21987}-->
        <img src="/user_data/charms/16/bnr_detail_180810.jpg" alt="桂文枝さん参加バナー" width="100%" />
      <!--{/if}-->

      <div id="scheduleblock" class="block">
        <a name="schedule"></a>
        <div class="title">
        <h3>スケジュール/コース日程</h3>
        </div>
        <!--{assign var=style_id value=$arrProduct.sub_title27|default:0}-->
<!--{if $arrProduct.sub_comment1}-->
        <div class="inlineblock<!--{if $arrProduct.sub_large_image24 == 1}--> schedule_inlineblock_api<!--{/if}-->" id="schedule_inlineblock_<!--{$arrPriceTableStyle[$style_id]}-->">
          <div style="border-bottom: 4px solid #60a814;" id="schedule" <!--{if $type<2}-->class="fullwidth"<!--{/if}-->>
<!--{$arrProduct.sub_comment1}-->
            <a class="bnr_port_information" href="#ul_panf_2">オプショナル・寄港地情報はこちら</a>
          </div>

      <!--{* [20180827/sato] ダイヤ2019ポイント *}-->
      <!--{if $arrProduct.product_id ==25428}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190326.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25433}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190403.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25431}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190411.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25432}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190419.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25434}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190427.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25435}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190502.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25436}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190506.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25437}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190511.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25438}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190518.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25440 || $arrProduct.product_id == 30404}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190511.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25441 || $arrProduct.product_id == 30405}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190601.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25442}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190511.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25443}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190615.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25444}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190620.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25445 || $arrProduct.product_id == 30406}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190628.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25446 || $arrProduct.product_id == 30407}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190703.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25447}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190711.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25448}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190703.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25449}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190727.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25450}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190804.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25451}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190815.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25452}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190823.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25453}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190711.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25454}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190909.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25455}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190918.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25456}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190823.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25457}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190918.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25458}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20191015.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25459}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190918.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==25460}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190703.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28396}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20191112.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28397}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20191121.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28394}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190703.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28398}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20191121.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28395}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20190703.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28368}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20200120.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28387}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20200204.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28388}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20200204.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28389}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20200204.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28390}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20200204.png" width="100%" alt="2019年ポイント画像" />
      <!--{elseif $arrProduct.product_id ==28391}-->
        <img style="margin-left: 15px;" src="/user_data/img/tokusyu/princess/point/2019_prn_detail_p20200204.png" width="100%" alt="2019年ポイント画像" />
      <!--{/if}-->




          <!--{if $type>0}-->
          <div class="title">
          <h3>航海マップ / 補足情報</h3>
          </div>
          <div id="mapblock" style="text-align: center" <!--{if $type==1}-->class="floatbottom"<!--{/if}-->>
            <!--{if $arrProduct[$image_key]}-->
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$image_key]}-->" alt="マップ" width="400" />
            <!--{*
            <a href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$image_key]}-->" class="expansion" target="_blank">航海図を拡大する</a>
            *}-->
            <p class="scale_map_img" style="text-align: center"><a href="/resize_image.php?width=500&image=<!--{$arrProduct[$image_key]}-->" class="expansion" target="_blank"><i class="fas fa-search-plus"></i>航海図を拡大する</a></p>
            <!--{/if}-->
            <p style="text-align: left"><!--{if $arrProduct[$image_key]}-->上記地図は目安で内容と異なる場合がございます。<!--{/if}--><!--{$arrProduct[$title_key]}--></p>
          </div>
          <!--{/if}-->

        <div class="question_block title">
        <h3>クルーズ Q&A</h3>
        <p class="question_block-moretext">全件表示</p>
          <!--{if $arrAttr.type.id == 11 || $arrAttr.type.id == 2064}-->
          <div class="mapblock_caption">
          <p class="qanda_question"><span class="q-balloon">1. クルーズ料金には含まれているものは？</span></p>
          <p class="qanda_answer" style="display:block"><span class="a-balloon">出港時間の約4－5時間前までには港に到着し、チェックイン乗船手続きはお早めにご対応ください。</span></p>
          <p class="qanda_question"><span class="q-balloon">2. 食事はどんなものがあるの？</span></p>
          <p class="qanda_answer"><span class="a-balloon">入港（到着日）は入港時間から下船まで約3－4時間かかりますので、航空券や新幹線や送迎などのお手配のお時間にお気を付けください。</span></p>
          <!--{/if}-->

          <!--{if $arrProduct.product_id == 8475}-->
          <p class="qanda_question"><span class="q-balloon">3. チップについて</span></p>
          <p class="qanda_answer"><span class="a-balloon">寄港地・寄港時間は予告なく変更になることがあります。</span></p>
          <!--{elseif $arrProduct.product_id == 23640}-->
          <p class="qanda_question"><span class="q-balloon">4. 言葉は通じますか？</span></p>
          <p class="qanda_answer"><span class="a-balloon">毎日の夕食時間は、17:30から、20:00からになります。</span></p>
          <!--{elseif $arrProduct.product_id == 27601 || ($arrProduct.sub_large_image24 == 1 && $arrAttr.company.category_id == 622)}-->
          <p class="qanda_question"><span class="q-balloon">5. 船酔いはしませんか？</span></p>
          <p class="qanda_answer"><span class="a-balloon">毎日の夕食時間は相席はなく、その都度お客様の人数にあったお席にご案内します。</span></p>
          <!--{else}-->
          <p class="qanda_question"><span class="q-balloon">6. 船内の服装は？持ち物は？</span></p>
          <p class="qanda_answer"><span class="a-balloon">フォーマル(正装)ナイトは、7泊8日コースで原則2回ございます。参加必須ではございません。</span></p>
          <p class="qanda_question"><span class="q-balloon">7. 小さい子供や老人など家族旅行でも大丈夫ですか？</span></p>
          <p class="qanda_answer"><span class="a-balloon">毎日の夕食時間は、1回目17:30(目安)から、2回目20:00(目安)からのどちらかになります。</span></p>
          <!--{/if}-->
          <p class="qanda_question"><span class="q-balloon">8. 避難訓練はありますか？</span></p>
          <p class="qanda_answer"><span class="a-balloon">ご予約時は、有効期限がクルーズ下船日から6ヶ月以上のパスポートが必要です。有効期限が満たない場合はご自身で更新下さい。ただし、事前のご予約は可能です。</span></p>
          <p class="qanda_question"><span class="q-balloon">9. 船は安全なの？　緊急時や悪天候の対策は？</span></p>
          <p class="qanda_answer"><span class="a-balloon">「船酔い」は、大きな客船・揺れ防止装置により</span>安定しているため揺れません。天候によっては揺れがある場合があるので、酔い止め薬を自身でご持参下さい。</span></p>
          <p class="qanda_question"><span class="q-balloon">10. お部屋のタイプの違い</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">11. 寄港地でどんなことができるの？</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">12. ドレスコードについて</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">13. チップについて</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">14. 医療施設について</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">15. 船内での支払いについて</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">16. OPツアー</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">17. 送迎について</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">18. ドリンクパッケージ</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">19. Wi-fiの有無</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          <p class="qanda_question"><span class="q-balloon">20. トライアル保険</span></p>
          <p class="qanda_answer"><span class="a-balloon">Sample Text</span></p>
          </div>
        
        </div>

          <!--{* [20180709/sato] コスタネオロマンチカ - コースポイントバナー *}-->
          <!--{if $arrProduct.product_id == 20662 || $arrProduct.product_id == 20724}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180710.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20663 || $arrProduct.product_id == 20725}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180711.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20664 || $arrProduct.product_id == 20727}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180712.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20665 || $arrProduct.product_id == 20729}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180721.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20666 || $arrProduct.product_id == 20730}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180722.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20667 || $arrProduct.product_id == 20732}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180723.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20689 || $arrProduct.product_id == 20738}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180730.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20690 || $arrProduct.product_id == 20739}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180731.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 20691 || $arrProduct.product_id == 20741}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180801.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23117}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180821.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23118}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180823.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23120 || $arrProduct.product_id == 23137 || $arrProduct.product_id == 27512}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180831.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23121 || $arrProduct.product_id == 23138 || $arrProduct.product_id == 27515}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180901.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23133 || $arrProduct.product_id == 23140 || $arrProduct.product_id == 27523}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20180906.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23122 || $arrProduct.product_id == 23139 || $arrProduct.product_id == 27518}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20181021.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23131 || $arrProduct.product_id == 23142 || $arrProduct.product_id == 27513}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20181103.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 23127 || $arrProduct.product_id == 27516}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20181111.png" width="100%" alt="コスタネオロマンチカ コースポイント" />

          <!--{* [20180726/sato] 2019追加 *}-->
          <!--{elseif $arrProduct.product_id == 25510 || $arrProduct.product_id == 25516 || $arrProduct.product_id == 25553 || $arrProduct.product_id == 25559 || $arrProduct.product_id == 28406 || $arrProduct.product_id == 28407 || $arrProduct.product_id == 28875 || $arrProduct.product_id == 28876}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190428.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25517 || $arrProduct.product_id == 25518 || $arrProduct.product_id == 25550 || $arrProduct.product_id == 25585 || $arrProduct.product_id == 28408 || $arrProduct.product_id == 28409 || $arrProduct.product_id == 28877 || $arrProduct.product_id == 28878}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190505.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25525 || $arrProduct.product_id == 25526 || $arrProduct.product_id == 25555 || $arrProduct.product_id == 25563 || $arrProduct.product_id == 28412 || $arrProduct.product_id == 28414 || $arrProduct.product_id == 28879 || $arrProduct.product_id == 28881 || $arrProduct.product_id == 29754 || $arrProduct.product_id == 29755}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190511.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25521 || $arrProduct.product_id == 25522 || $arrProduct.product_id == 25551 || $arrProduct.product_id == 25561 || $arrProduct.product_id == 28416 || $arrProduct.product_id == 28417 || $arrProduct.product_id == 28882 || $arrProduct.product_id == 28883}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190518.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25523 || $arrProduct.product_id == 25524 || $arrProduct.product_id == 25554 || $arrProduct.product_id == 25562 || $arrProduct.product_id == 28418 || $arrProduct.product_id == 28419 || $arrProduct.product_id == 28884 || $arrProduct.product_id == 28885}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190526.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25519 || $arrProduct.product_id == 25520 || $arrProduct.product_id == 25584 || $arrProduct.product_id == 25586 || $arrProduct.product_id == 28421 || $arrProduct.product_id == 28423}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190603.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25530 || $arrProduct.product_id == 25529 || $arrProduct.product_id == 25557 || $arrProduct.product_id == 25565 || $arrProduct.product_id == 28424 || $arrProduct.product_id == 28426 || $arrProduct.product_id == 28888 || $arrProduct.product_id == 28889 || $arrProduct.product_id == 28886 || $arrProduct.product_id == 28887}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190609.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25528 || $arrProduct.product_id == 25527 || $arrProduct.product_id == 25556 || $arrProduct.product_id == 25564 || $arrProduct.product_id == 28428 || $arrProduct.product_id == 28429 || $arrProduct.product_id == 28890 || $arrProduct.product_id == 28891}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190616.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25531 || $arrProduct.product_id == 25532 || $arrProduct.product_id == 25558 || $arrProduct.product_id == 25568 || $arrProduct.product_id == 28430 || $arrProduct.product_id == 28431 || $arrProduct.product_id == 28901 || $arrProduct.product_id == 28892}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190623.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25533 || $arrProduct.product_id == 25570 || $arrProduct.product_id == 28432 || $arrProduct.product_id == 28893 || $arrProduct.product_id == 28559 || $arrProduct.product_id == 31564}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190629.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25534 || $arrProduct.product_id == 25573 || $arrProduct.product_id == 28434	|| $arrProduct.product_id == 28894 || $arrProduct.product_id == 31566}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190630.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25535 || $arrProduct.product_id == 25576 || $arrProduct.product_id == 28559 || $arrProduct.product_id == 28902 || $arrProduct.product_id == 31569}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190701.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25536 || $arrProduct.product_id == 25537 || $arrProduct.product_id == 25538 || $arrProduct.product_id == 25571 || $arrProduct.product_id == 25574 || $arrProduct.product_id == 25577 || $arrProduct.product_id == 28553 || $arrProduct.product_id == 28555 || $arrProduct.product_id == 28556 || $arrProduct.product_id == 28895 || $arrProduct.product_id == 31565}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190704.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25540 || $arrProduct.product_id == 25572 || $arrProduct.product_id == 28561 || $arrProduct.product_id == 28898}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190709.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25541 || $arrProduct.product_id == 25575 || $arrProduct.product_id == 28562 || $arrProduct.product_id == 28899}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190710.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25539 || $arrProduct.product_id == 25578 || $arrProduct.product_id == 28563 || $arrProduct.product_id == 28900}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190711.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25542 || $arrProduct.product_id == 25569}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190902.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25543 || $arrProduct.product_id == 25544 || $arrProduct.product_id == 25579 || $arrProduct.product_id == 25582}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190908.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25546 || $arrProduct.product_id == 25545 || $arrProduct.product_id == 25580 || $arrProduct.product_id == 25617}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190915.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25591 || $arrProduct.product_id == 25592 || $arrProduct.product_id == 25603 || $arrProduct.product_id == 25608}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190922.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25595 || $arrProduct.product_id == 25596 || $arrProduct.product_id == 25605 || $arrProduct.product_id == 25610}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20190928.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25587 || $arrProduct.product_id == 25588 || $arrProduct.product_id == 25601 || $arrProduct.product_id == 25606}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20191006.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25593 || $arrProduct.product_id == 25594 || $arrProduct.product_id == 25604 || $arrProduct.product_id == 25609}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20191014.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25547 || $arrProduct.product_id == 25548 || $arrProduct.product_id == 25581 || $arrProduct.product_id == 25583}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20191027.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25589 || $arrProduct.product_id == 25590 || $arrProduct.product_id == 25602 || $arrProduct.product_id == 25607}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20191103.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25597 || $arrProduct.product_id == 25598 || $arrProduct.product_id == 25611 || $arrProduct.product_id == 25612}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20191109.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{elseif $arrProduct.product_id == 25599 || $arrProduct.product_id == 25600 || $arrProduct.product_id == 25613 || $arrProduct.product_id == 25614}-->
            <img style="margin: 20px 0px;" src="/user_data/charms/396/other_images/course_detail_p20191117.png" width="100%" alt="コスタネオロマンチカ コースポイント" />
          <!--{/if}-->

          <!--{* [20180726/sato] リピーター割引詳細画像 *}-->
          <!--{if $arrProduct.product_id == 20662 || $arrProduct.product_id == 20663 || $arrProduct.product_id == 20664 || $arrProduct.product_id == 20665 || $arrProduct.product_id == 20666 || $arrProduct.product_id == 20667 || $arrProduct.product_id == 20689 || $arrProduct.product_id == 20690 || $arrProduct.product_id == 20691 || $arrProduct.product_id == 23117 || $arrProduct.product_id == 23118 || $arrProduct.product_id == 23121 || $arrProduct.product_id == 23133 || $arrProduct.product_id == 23120 || $arrProduct.product_id == 23131 || $arrProduct.product_id == 23127 || $arrProduct.product_id == 23122}-->
            <img src="/user_data/charms/396/other_images/com_repeat_discoutn.png" width="100%" alt="コスタネオロマンチカ リピーター割引詳細画像" />
          <!--{elseif $arrProduct.product_id == 25510 || $arrProduct.product_id == 25516 || $arrProduct.product_id == 25517 || $arrProduct.product_id == 25518 || $arrProduct.product_id == 25525 || $arrProduct.product_id == 25526 || $arrProduct.product_id == 25521 || $arrProduct.product_id == 25522 || $arrProduct.product_id == 25523 || $arrProduct.product_id == 25524 || $arrProduct.product_id == 25519 || $arrProduct.product_id == 25520 || $arrProduct.product_id == 25530 || $arrProduct.product_id == 25529 || $arrProduct.product_id == 25528 || $arrProduct.product_id == 25527 || $arrProduct.product_id == 25531 || $arrProduct.product_id == 25532 || $arrProduct.product_id == 25533 || $arrProduct.product_id == 25534 || $arrProduct.product_id == 25535 || $arrProduct.product_id == 25536 || $arrProduct.product_id == 25537 || $arrProduct.product_id == 25538 || $arrProduct.product_id == 25540 || $arrProduct.product_id == 25541 || $arrProduct.product_id == 25539 || $arrProduct.product_id == 25542 || $arrProduct.product_id == 25543 || $arrProduct.product_id == 25544 || $arrProduct.product_id == 25546 || $arrProduct.product_id == 25545 || $arrProduct.product_id == 25591 || $arrProduct.product_id == 25592 || $arrProduct.product_id == 25595 || $arrProduct.product_id == 25596 || $arrProduct.product_id == 25587 || $arrProduct.product_id == 25588 || $arrProduct.product_id == 25593 || $arrProduct.product_id == 25594 || $arrProduct.product_id == 25547 || $arrProduct.product_id == 25548 || $arrProduct.product_id == 25589 || $arrProduct.product_id == 25590 || $arrProduct.product_id == 25597 || $arrProduct.product_id == 25598 || $arrProduct.product_id == 25599 || $arrProduct.product_id == 25600}-->
            <img src="/user_data/charms/396/other_images/com_repeat_discoutn.png" width="100%" alt="コスタネオロマンチカ リピーター割引詳細画像" />
          <!--{elseif $arrProduct.product_id == 27512 || $arrProduct.product_id == 27515 || $arrProduct.product_id == 27523 || $arrProduct.product_id == 27512 || $arrProduct.product_id == 27518 || $arrProduct.product_id == 27513 || $arrProduct.product_id == 27516 || $arrProduct.product_id == 27518}-->
            <img src="/user_data/charms/396/other_images/com_repeat_discoutn.png" width="100%" alt="コスタネオロマンチカ リピーター割引詳細画像" />
          <!--{elseif $arrProduct.product_id == 28406 || $arrProduct.product_id == 28407 || $arrProduct.product_id == 28408 || $arrProduct.product_id == 28409 || $arrProduct.product_id == 28412 || $arrProduct.product_id == 28414 || $arrProduct.product_id == 28416 || $arrProduct.product_id == 28417 || $arrProduct.product_id == 28418 || $arrProduct.product_id == 28419 || $arrProduct.product_id == 28421 || $arrProduct.product_id == 28423 || $arrProduct.product_id == 28424 || $arrProduct.product_id == 28426 || $arrProduct.product_id == 28428 || $arrProduct.product_id == 28429 || $arrProduct.product_id == 28430 || $arrProduct.product_id == 28431 || $arrProduct.product_id == 28432 || $arrProduct.product_id == 28434 || $arrProduct.product_id == 28559 || $arrProduct.product_id == 28553 || $arrProduct.product_id == 28555 || $arrProduct.product_id == 28556 || $arrProduct.product_id == 28561 || $arrProduct.product_id == 28562 || $arrProduct.product_id == 28563}-->
            <img src="/user_data/charms/396/other_images/com_repeat_discout2.png?20180830082824" width="100%" alt="コスタネオロマンチカ 2019未来割詳細画像" />
          <!--{/if}-->


          <!--{* [20180726/sato] バリュー画像 *}-->
          <!--{if $arrProduct.product_id == 20724 || $arrProduct.product_id == 20725 || $arrProduct.product_id == 20727 || $arrProduct.product_id == 20729 || $arrProduct.product_id == 20730 || $arrProduct.product_id == 20732 || $arrProduct.product_id == 20738 || $arrProduct.product_id == 20739 || $arrProduct.product_id == 20741 || $arrProduct.product_id == 23137 || $arrProduct.product_id == 23138 || $arrProduct.product_id == 23140 || $arrProduct.product_id == 23137 || $arrProduct.product_id == 23139 || $arrProduct.product_id == 23142}-->
            <img src="/user_data/charms/396/other_images/value_cos_neo.png" width="100%" alt="コスタネオロマンチカ バリュー料金詳細画像" />
            <img src="/user_data/charms/396/other_images/value_drinkpakage.png" width="100%" alt="コスタネオロマンチカ ドリンクパッケージ詳細画像" />
          <!--{elseif $arrProduct.product_id == 25553 || $arrProduct.product_id == 25559 || $arrProduct.product_id == 25550 || $arrProduct.product_id == 25585 || $arrProduct.product_id == 25555 || $arrProduct.product_id == 25563 || $arrProduct.product_id == 25551 || $arrProduct.product_id == 25561 || $arrProduct.product_id == 25554 || $arrProduct.product_id == 25562 || $arrProduct.product_id == 25584 || $arrProduct.product_id == 25586 || $arrProduct.product_id == 25557 || $arrProduct.product_id == 25565 || $arrProduct.product_id == 25556 || $arrProduct.product_id == 25564 || $arrProduct.product_id == 25558 || $arrProduct.product_id == 25568 || $arrProduct.product_id == 25570 || $arrProduct.product_id == 25573 || $arrProduct.product_id == 25576 || $arrProduct.product_id == 25571 || $arrProduct.product_id == 25574 || $arrProduct.product_id == 25577 || $arrProduct.product_id == 25572 || $arrProduct.product_id == 25575 || $arrProduct.product_id == 25578 || $arrProduct.product_id == 25569 || $arrProduct.product_id == 25579 || $arrProduct.product_id == 25582 || $arrProduct.product_id == 25580 || $arrProduct.product_id == 25617 || $arrProduct.product_id == 25603 || $arrProduct.product_id == 25608 || $arrProduct.product_id == 25605 || $arrProduct.product_id == 25610 || $arrProduct.product_id == 25601 || $arrProduct.product_id == 25606 || $arrProduct.product_id == 25604 || $arrProduct.product_id == 25609 || $arrProduct.product_id == 25581 || $arrProduct.product_id == 25583 || $arrProduct.product_id == 25602 || $arrProduct.product_id == 25607 || $arrProduct.product_id == 25611 || $arrProduct.product_id == 25612 || $arrProduct.product_id == 25613 || $arrProduct.product_id == 25614 || $arrProduct.product_id == 29754 || $arrProduct.product_id == 29755}-->
            <img src="/user_data/charms/396/other_images/value_cos_neo.png" width="100%" alt="コスタネオロマンチカ バリュー料金詳細画像" />
            <img src="/user_data/charms/396/other_images/value_drinkpakage.png" width="100%" alt="コスタネオロマンチカ ドリンクパッケージ詳細画像" />
          <!--{/if}-->


          <!--{* [20180920/sato] コスタネオロマンチカ - 特定のパンフレット表示 *}-->
          <!--{if $arrProduct.product_id == 28875 || $arrProduct.product_id == 28876 || $arrProduct.product_id == 28877 || $arrProduct.product_id == 28878 || $arrProduct.product_id == 28879 || $arrProduct.product_id == 28881 || $arrProduct.product_id == 28882 || $arrProduct.product_id == 28883 || $arrProduct.product_id == 28884 || $arrProduct.product_id == 28885 || $arrProduct.product_id == 28886 || $arrProduct.product_id == 28887 || $arrProduct.product_id == 28888 || $arrProduct.product_id == 28889 || $arrProduct.product_id == 28890 || $arrProduct.product_id == 28891 || $arrProduct.product_id == 28901 || $arrProduct.product_id == 28892}-->
          <div class="pampblock_5row">
            <ul>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/family_promotion.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/family_promotion.png" alt="パンフレットを見る">
                  <p>お子様半額<br />ファミリー<br />プロモーション</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruisePO.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruisePO.png" alt="パンフレットを見る">
                  <p>マイファースト<br />コスタ割<br />太平洋クルーズ 2019年春</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseAC.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseAC.png" alt="パンフレットを見る">
                  <p>マイファースト<br />コスタ割<br />2019年5月～7月</p>
                </a>
              </li>
            </ul>
            <ul>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseFAM.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseFAM.png" alt="パンフレットを見る">
                  <p>マイファースト<br />コスタ割<br />2019年4月～8月</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/2018_cosneo_guide.pdf">
                  <img src="/user_data/img/cabin_intro/2018_cosneo_guide.png" alt="パンフレットを見る">
                  <p>2018年<br />太平洋・日本海<br />クルーズ<br />ガイドブック</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/201710_201801_shoreexcursions.pdf">
                  <img src="/user_data/img/cabin_intro/201710_201801_shoreexcursions_01.jpg" alt="パンフレットを見る">
                  <p>2017年<br />10月-2018年1月<br />寄港地観光ツアーの案内</p>
                </a>
              </li>
            </ul>
          </div>
          <!--{elseif $arrProduct.product_id == 28893 || $arrProduct.product_id == 28894 || $arrProduct.product_id == 28902 || $arrProduct.product_id == 28895 || $arrProduct.product_id == 28896 || $arrProduct.product_id == 28897 || $arrProduct.product_id == 28898 || $arrProduct.product_id == 28899 || $arrProduct.product_id == 28900 || $arrProduct.product_id == 29756 || $arrProduct.product_id == 29757 || $arrProduct.product_id == 31564 || $arrProduct.product_id == 31565 || $arrProduct.product_id == 31566 || $arrProduct.product_id == 31567 || $arrProduct.product_id == 31567 || $arrProduct.product_id == 31568 || $arrProduct.product_id == 31569 || $arrProduct.product_id == 31570 || $arrProduct.product_id == 31571}-->
          <div class="pampblock_5row">
            <ul>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseSOJ.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseSOJ.png" alt="パンフレットを見る">
                  <p>マイファースト<br />コスタ割<br />日本海クルーズ 2019年夏</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseAC.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseAC.png" alt="パンフレットを見る">
                  <p>マイファースト<br />コスタ割<br />2019年5月～7月</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseFAM.pdf">
                  <img src="/user_data/img/cabin_intro/cos_neo/pamphlet/2019myfirstcruiseFAM.png" alt="パンフレットを見る">
                  <p>マイファースト<br />コスタ割<br />2019年4月～8月</p>
                </a>
              </li>
            </ul>
            <ul>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/2018_cosneo_guide.pdf">
                  <img src="/user_data/img/cabin_intro/2018_cosneo_guide.png" alt="パンフレットを見る">
                  <p>2018年<br />太平洋・日本海<br />クルーズ<br />ガイドブック</p>
                </a>
              </li>
              <li>
                <a target="_blank" href="/user_data/img/cabin_intro/201710_201801_shoreexcursions.pdf">
                  <img src="/user_data/img/cabin_intro/201710_201801_shoreexcursions_01.jpg" alt="パンフレットを見る">
                  <p>2017年<br />10月-2018年1月<br />寄港地観光ツアーの案内</p>
                </a>
              </li>
            </ul>
          </div>
          <!--{elseif $arrProduct.product_id == 29840}-->
          <div class="pampblock_5row">
            <ul>
              <li>
                <a target="_blank" href="/user_data/charms/352/pm_gw_20190427.pdf">
                  <img src="/user_data/charms/352/pm_gw_20190427.png" alt="パンフレットを見る">
                  <p>2019年GW<br />横浜発着クルーズ9日間</p>
                </a>
              </li>
            </ul>
          </div>
          <!--{elseif $arrProduct.product_id == 23880 || $arrProduct.product_id == 28267 || $arrProduct.product_id == 28268}-->
          <div class="pampblock_5row">
            <ul>
              <li>
                <a target="_blank" href="/user_data/charms/16/pm_2019_jj.pdf">
                  <img src="/user_data/charms/16/pm_2019_jj.png" alt="パンフレットを見る">
                  <p>2019年<br />日本発着クルーズ</p>
                </a>
              </li>
            </ul>
          </div>
          <!--{/if}-->


          <!-- EC-CUBE上で選択したバナー表示 -->
          <!--{if $arrAttr.area.id == 71 || $arrAttr.area.id == 1213}-->
                <!--{* [20180920/sato] 表示しない *}-->
          <!--{elseif $arrAttr.type.id == 11 && $arrAttr.area.id != 70 && $arrAttr.area.id != 619}-->
          <div style="border-bottom: 4px solid #60a814;margin-top:10px;" class="fullwidth"></div>
          <div class="title">
            <h3>ホテル・送迎・OPツアー予約</h3>
          </div>
          <div id="bnr_hotel">
            <img src="/user_data/charms/other/list_bnr_sp_01_1.jpg"/>
            <a href="/user_data/charms/other/list_hotel.pdf" target="_blank"><img style="float:left" src="/user_data/charms/other/list_bnr_sp_01_2.jpg?20190104023155"/></a>
            <a href="/user_data/charms/other/list_pick.pdf" target="_blank"><img style="float:right" src="/user_data/charms/other/list_bnr_sp_01_3.jpg?20190104023155"/></a>
            <img id="bnr_optional_tour" style="clear:both" src="/user_data/charms/other/list_bnr_sp_01_4.jpg?20190104023155"/>
          </div>
          <!--{elseif $arrProduct.sub_large_image23 && $arrAttr.type.id != 13}-->
            <!--{foreach item=bnr_num from=$arrProduct.sub_large_image23|json_decode}-->
              <!--{if $bnr_num == 1}-->
          <div style="border-bottom: 4px solid #60a814;margin-top:10px;" class="fullwidth"></div>
          <div class="title">
            <h3>ホテル・送迎・OPツアー予約</h3>
          </div>
          <div id="bnr_hotel">
            <img src="/user_data/charms/other/list_bnr_sp_<!--{$bnr_num|string_format:"%02d"}-->_1.jpg?20190104023155"/>
            <a href="/user_data/charms/other/list_hotel.pdf" target="_blank"><img style="float:left" src="/user_data/charms/other/list_bnr_sp_<!--{$bnr_num|string_format:"%02d"}-->_2.jpg?20190104023155"/></a>
            <a href="/user_data/charms/other/list_pick.pdf" target="_blank"><img style="float:right" src="/user_data/charms/other/list_bnr_sp_<!--{$bnr_num|string_format:"%02d"}-->_3.jpg?20190104023155"/></a>
            <img id="bnr_optional_tour" style="clear:both" src="/user_data/charms/other/list_bnr_sp_<!--{$bnr_num|string_format:"%02d"}-->_4.jpg?20190104023155"/>
          </div>
              <!--{/if}-->
            <!--{/foreach}-->
          <!--{/if}-->
        </div>
<!--{else}-->
      <div class="noncontents" id="schedulenoncontents">
        <p class="default font">スケジュールとコースの日程をご案内致します。詳細はお気軽にご相談・お問い合わせください。<br />
また下記のパンフレット・資料を参考にご覧ください。</p>
        <!--{if $arrProduct[$title_key]}--><p class="comment"><!--{$arrProduct[$title_key]}--></p><!--{/if}-->
      </div>
<!--{/if}-->
      </div>
	</div><!-- /.tab-map -->
	<div class="tab-price tabs">
      <!--{if $arrCampaignComment|@count > 0 && $arrAttr.type.id == 11}-->
        <div class="detail-blc-special block">
            <div class="title">
            <h3>キャンペーン</h3>
            </div>
            <h2>スペシャルオファー/期間限定キャンペーン</h2>
            <ul>
                <!--{foreach from=$arrCampaignComment item=row}--><li><!--{$row}--></li><!--{/foreach}-->
            </ul>
<!--
            <p>
* こちらの特典は「クルーズのみ」が対象となります。<br />
* 掲載内容は、予告なく変更になる場合もございます。
            </p>
-->
        </div>
      <!--{elseif $arrAttr.type.id == 2064}-->
        <div class="detail-blc-special-best1tour block">
            <div class="title">
            <h3>お得割引情報</h3>
            </div>
            <h2>ベストワンのツアーはここが違う！</h2>
            <ul>
                <li class="point1">最安値宣言！ 通常コースより約30%〜70%OFF。</li>
                <li>コースに自信有！ お客様満足度の高いコースを社内審査で厳選しています。</li>
                <li>ホテル・送迎・オプショナルツアー等、アレンジ自由自在。</li>
                <li class="point1">成田／羽田以外　関空発・福岡発・札幌発の地方発着も充実（ホテル送迎は別途手配可能です）。</li>
                <li>1出発日30名様のお集まりで、弊社若手スタッフ乗船（決定ではありません。添乗員サービスではありません。）</li>
                <li class="point1">出発間際のご予約・ご相談も承っております。</li>
                <li class="point1">クルーズのみ 特別割引料金もご案内。</li>
            </ul>
        </div>
      <!--{/if}-->


<!--{assign var=style_id value=$arrProduct.sub_title28|default:0}-->
      <div id="shipinfoblock" class="block">
        <a name="info"></a>
        <div class="title">
        <h3>客室情報</h3>
        </div>
        <div id="<!--{$arrPriceTableStyle[$style_id]}-->" class="inlineblock">

        <!--{if $arrRoomImage|@count > 0}-->
        <div id="roomgallery">
          <ul class="roomgallery_list">
            <!--{section name=cnt loop=$arrRoomImage}--><!--{if $arrRoomImage[cnt].img}-->
            <li class="roomgallery_inner--top">
              <!--{*<a href="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrRoomImage[cnt].img|h}-->" target="_blank" class="expansion"><img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrRoomImage[cnt].img|h}-->" width="130" /><br /><!--{$arrRoomImage[cnt].text}--></a>*}-->
              <a href="/resize_image.php?width=350&image=<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrRoomImage[cnt].img|h}-->" target="_blank" class="expansion">
                <img class="inner--top_image" src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrRoomImage[cnt].img|h}-->" width="286" />
                <br />
                <div>
                  <span class="room_title"><!--{$arrRoomImage[cnt].text}--></span>
                  <!--{if $arrRoomImage[cnt].room_size}-->
                  <span class="room_width">部屋の広さ:<!--{$arrRoomImage[cnt].room_size}--></span>
                  <!--{/if}-->
                  <!--{if $arrRoomImage[cnt].occupancy}-->
                    <span class="room_capacity"><!--{$arrRoomImage[cnt].occupancy}--></span>
                  <!--{/if}-->
                </div>
              </a>

              <div class="roomgallery_inner" style="margin-top: 10px;">
                <!--{if $arrRoomImage[cnt].description_icon}-->
                  <ul class="on_board_equipment">
                    <!--{foreach item=iconedRoomDescription key=classRoomIcon from=$arrRoomImage[cnt].description_icon}-->
                      <li><img src="<!--{$TPL_URLPATH}-->img/detail/ico_<!--{$classRoomIcon}-->.png"><span><!--{$iconedRoomDescription}--></span></li>
                    <!--{/foreach}-->
                  </ul>
                <!--{/if}-->

                <!--{if $arrRoomImage[cnt].description}-->
                <h3 class="no_on_board_equipment_title">その他設備</h3> 
                <ul class="no_on_board_equipment">
                    <!--{foreach item=valDescription from=$arrRoomImage[cnt].description}-->
                      <li><!--{$valDescription}--></li>
                    <!--{/foreach}-->
                </ul>
                <!--{/if}-->

                <!--{if $arrRoomImage[cnt].special}-->
                <input class="roomspecial_open" type="button" value="特典情報を表示" />
                <input class="roomspecial_close" type="button" value="特典情報を閉じる" />
                <span class="roomspecial">
                  <h3 class="no_on_board_equipment_title roomspecial_title">特典情報</h3> 
                    <ul>
                  <!--{foreach item=valspecial key=keyspecial from=$arrRoomImage[cnt].special}-->
                    <li><!--{$valspecial}--></li>
                  <!--{/foreach}-->
                  </ul>
                </span>
                <!--{/if}-->

              </div>
            </li>
            <!--{/if}--><!--{/section}-->
          </ul>
          <!--{if $arrAttr.ship.category_id == 425}--><img width="100%" src="/user_data/charms/425/room_intro_balcony.png" alt="ダイヤモンド・プリンセス バルコニー紹介画像" /><!--{/if}-->
          <span style="font-size: 24px;">※内容は船会社によって変更や目安になります。</span>
        </div>
        <!--{/if}-->
        </div>
    </div>
    <div id="shipinfoblock" class="priceinfoblock block">
        <div class="title">
        <h3>料金/出発日</h3>
        </div>
        <!--{if $arrAttr.type.id == 11}--><img style="margin-bottom: 5px; width:100%;" src="/user_data/packages/sphone/img/detail/bnr_intro_price_cruise.png?20190115040541" alt="料金の見方（クルーズのみの場合）" /><!--{/if}-->
        <!--{if count($arrOnlineProduct) > 0}-->
        <div id="pricetable_default" class="inlineblock">
        <!--{else}-->
        <div id="<!--{$arrPriceTableStyle[$style_id]}-->" class="inlineblock">
        <!--{/if}-->

        <!--{if $arrProduct.product_id == 29840}-->
          <div class="noncontents" id="schedulenoncontents" style="margin-bottom: 8px; background-color: #C80814;">
            <p style="font-size: 20px; font-weight: bold; color: #fff; padding: 15px; text-align: center;">★【在庫数残りわずか！】弊社のみの在庫になります。</p>
          </div>
        <!--{/if}-->

        <!--{* ダイヤモンド2018年の対象コース用にキャンペーン画像を表示する *}-->
        <!--{if $arrProduct.product_id == 17263 || $arrProduct.product_id == 17264 || $arrProduct.product_id == 17265 || $arrProduct.product_id == 17266 || $arrProduct.product_id == 17267 || $arrProduct.product_id == 17268 || $arrProduct.product_id == 17269 || $arrProduct.product_id == 17270 || $arrProduct.product_id == 17271 || $arrProduct.product_id == 17272 || $arrProduct.product_id == 17274 || $arrProduct.product_id == 17275 || $arrProduct.product_id == 17276 || $arrProduct.product_id == 17277 || $arrProduct.product_id == 17278 || $arrProduct.product_id == 17279 || $arrProduct.product_id == 17280 || $arrProduct.product_id == 17281 || $arrProduct.product_id == 17282 || $arrProduct.product_id == 17283 || $arrProduct.product_id == 17284 || $arrProduct.product_id == 17285 || $arrProduct.product_id == 17286 || $arrProduct.product_id == 17287 || $arrProduct.product_id == 17288 || $arrProduct.product_id == 17289 || $arrProduct.product_id == 17290 || $arrProduct.product_id == 17291 || $arrProduct.product_id == 17292 || $arrProduct.product_id == 17293 || $arrProduct.product_id == 17294 || $arrProduct.product_id == 17295 || $arrProduct.product_id == 25428 || $arrProduct.product_id == 25433 || $arrProduct.product_id == 25431 || $arrProduct.product_id == 25432 || $arrProduct.product_id == 25434 || $arrProduct.product_id == 25435 || $arrProduct.product_id == 25436 || $arrProduct.product_id == 25437 || $arrProduct.product_id == 25438 || $arrProduct.product_id == 30404 || $arrProduct.product_id == 30405 || $arrProduct.product_id == 25442 || $arrProduct.product_id == 25443 || $arrProduct.product_id == 25444 || $arrProduct.product_id == 30406 || $arrProduct.product_id == 30407 || $arrProduct.product_id == 25447 || $arrProduct.product_id == 25448 || $arrProduct.product_id == 25449}-->
          <img src="/user_data/charms/425/campaign3.png?20181204121318" width="100%" alt="特典3 キャプテンサークルメンバー割引" />
          <img src="/user_data/charms/425/campaign4.png?20181204121318" width="100%" alt="特典4 ベストワン特別割引" />
          <img src="/user_data/charms/425/campaign5.png?20181204121318" width="100%" alt="特典5 ベストワンリピーター割引" />
          <a href="https://www.princesscruises.jp/pdf/jhp2018.pdf" target="_blank" rel="nofollow"><img src="/user_data/charms/425/pm_prn_2018_jpn.png" width="100%" alt="ダイヤモンド・プリンセス 2018年 日本発着コース Digital Pamphret" /></a>
          <a href="http://www.princesscruises.jp/pdf/JPP2017_answerbook.pdf" target="_blank" rel="nofollow"><img src="/user_data/charms/425/pm_prn_2018_jpn_answer.png" width="100%" alt="ダイヤモンド・プリンセス 2018年 日本発着コース アンサ>ーブック Digital Pamphret" /></a>
          <a href="http://www.princesscruises.jp/pdf/JPP2017_shoex.pdf" target="_blank" rel="nofollow"><img src="/user_data/charms/425/pm_prn_2018_jpn_port.png" width="100%" alt="ダイヤモンド・プリンセス 2018年 日本発着コース 寄港地観光ツアーのご案内 Digital Pamphret" /></a>
        <!--{elseif $arrProduct.product_id == 25450 || $arrProduct.product_id == 25451 || $arrProduct.product_id == 25452 || $arrProduct.product_id == 25453 || $arrProduct.product_id == 25454 || $arrProduct.product_id == 25455 || $arrProduct.product_id == 25456 || $arrProduct.product_id == 25457 || $arrProduct.product_id == 25458 || $arrProduct.product_id == 25459 || $arrProduct.product_id == 25460 || $arrProduct.product_id == 28396 || $arrProduct.product_id == 28397 || $arrProduct.product_id == 28394 || $arrProduct.product_id == 28398 || $arrProduct.product_id == 28395 || $arrProduct.product_id == 28368 || $arrProduct.product_id == 28387 || $arrProduct.product_id == 28388 || $arrProduct.product_id == 28389 || $arrProduct.product_id == 28390 || $arrProduct.product_id == 28391}-->
          <img src="/user_data/charms/425/campaign1.png?20181204121318" width="100%" alt="特典1 早期予約割引" />
          <img src="/user_data/charms/425/campaign2.png?20181204121318" width="100%" alt="特典2 3-4人目無料" />
          <img src="/user_data/charms/425/campaign3.png?20181204121318" width="100%" alt="特典3 キャプテンサークルメンバー割引" />
          <img src="/user_data/charms/425/campaign4.png?20181204121318" width="100%" alt="特典4 ベストワン特別割引" />
          <img src="/user_data/charms/425/campaign5.png?20181204121318" width="100%" alt="特典5 ベストワンリピーター割引" />
          <a href="https://www.princesscruises.jp/pdf/jhp2018.pdf" target="_blank" rel="nofollow"><img src="/user_data/charms/425/pm_prn_2018_jpn.png" width="100%" alt="ダイヤモンド・プリンセス 2018年 日本発着コース Digital Pamphret" /></a>
          <a href="http://www.princesscruises.jp/pdf/JPP2017_answerbook.pdf" target="_blank" rel="nofollow"><img src="/user_data/charms/425/pm_prn_2018_jpn_answer.png" width="100%" alt="ダイヤモンド・プリンセス 2018年 日本発着コース アンサ>ーブック Digital Pamphret" /></a>
          <a href="http://www.princesscruises.jp/pdf/JPP2017_shoex.pdf" target="_blank" rel="nofollow"><img src="/user_data/charms/425/pm_prn_2018_jpn_port.png" width="100%" alt="ダイヤモンド・プリンセス 2018年 日本発着コース 寄港地観光ツアーのご案内 Digital Pamphret" /></a>
        <!--{/if}-->

        <!--{* コスタ ネオ ロマンチカ 2018年の対象コース用にキャンペーン画像等を表示する *}-->
        <!--{if $arrProduct.product_id == 17224 || $arrProduct.product_id == 17230 || $arrProduct.product_id == 17233 || $arrProduct.product_id == 17234 || $arrProduct.product_id == 17239 || $arrProduct.product_id == 17232 || $arrProduct.product_id == 17231 || $arrProduct.product_id == 18672 || $arrProduct.product_id == 18673 || $arrProduct.product_id == 19203}-->
          <img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_best1waribiki_small.png" alt="ベストワン割引"><img style="width:100%;padding-top:1px;padding-bottom:1px;"  src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_mouitido_neoroman_small.png" alt="もう一度ネオロマンチカ割引"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_souki_waribiki_small.jpg" alt="早期割引あり"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_13saimiman_muryou_small.png" alt="13才未満無料"><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/cos_guide.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_2017_2018_guidebook.png" alt="コスタネオロマンチカ 2017-2018年 ガイドブック"></a><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/2017_winter_pamp.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_201710_201803_pamphlet.png" alt="コスタネオロマンチカ 2017年10月～2018年3月 パンフレット"></a><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/CostaNR_shore.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_2017_optional.png" alt="コスタネオロマンチカ 2017年 寄港地観光ツアーのご案内"></a>
        <!--{elseif $arrProduct.product_id == 20662 || $arrProduct.product_id == 20663 || $arrProduct.product_id == 20664 || $arrProduct.product_id == 20665 || $arrProduct.product_id == 20666 || $arrProduct.product_id == 20667 || $arrProduct.product_id == 20686 || $arrProduct.product_id == 20687 || $arrProduct.product_id == 20688 || $arrProduct.product_id == 20689 || $arrProduct.product_id == 20690 || $arrProduct.product_id == 20691 || $arrProduct.product_id == 20612 || $arrProduct.product_id == 20650 || $arrProduct.product_id == 20652 || $arrProduct.product_id == 20654 || $arrProduct.product_id == 20655 || $arrProduct.product_id == 20656 || $arrProduct.product_id == 20657 || $arrProduct.product_id == 20658 || $arrProduct.product_id == 20659 || $arrProduct.product_id == 20660 || $arrProduct.product_id == 20661 || $arrProduct.product_id == 20724 || $arrProduct.product_id == 20725 || $arrProduct.product_id == 20727 || $arrProduct.product_id == 20729 || $arrProduct.product_id == 20730 || $arrProduct.product_id == 20732 || $arrProduct.product_id == 20733 || $arrProduct.product_id == 20735 || $arrProduct.product_id == 20736 || $arrProduct.product_id == 20738 || $arrProduct.product_id == 20739 || $arrProduct.product_id == 20741 || $arrProduct.product_id == 20700 || $arrProduct.product_id == 20701 || $arrProduct.product_id == 20704 || $arrProduct.product_id == 20706 || $arrProduct.product_id == 20708 || $arrProduct.product_id == 20709 || $arrProduct.product_id == 20711 || $arrProduct.product_id == 20712 || $arrProduct.product_id == 20714 || $arrProduct.product_id == 20715 || $arrProduct.product_id == 20716}-->
          <img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_best1waribiki_small.png" alt="ベストワン割引"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_mouitido_neoroman_small.png" alt="もう一度ネオロマンチカ割引"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_souki_waribiki_small.jpg" alt="早期割引あり"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_13saimiman_muryou_small.png" alt="13才未満無料"><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/cos_guide.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_2017_2018_guidebook.png" alt="コスタネオロマンチカ 2017-2018年 ガイドブック"></a><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/2018_spring_pamp.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_201804_201808_pamphlet.png" alt="コスタネオロマンチカ 2018年4月～2018年8月 パンフレット"></a><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/CostaNR_shore.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_2017_optional.png" alt="コスタネオロマンチカ 2017年 寄港地観光ツアーのご案内"></a><a target="_blank" href="http://www.best1cruise.com/user_data/img/cabin_intro/CostaNR_shore_20170926_zantei.pdf"><img style="width:100%;padding-top:1px;padding-bottom:1px;" src="http://www.best1cruise.com/user_data/img/cabin_intro/cos_neo_banner_pdf_2018_optional_zantei.png" alt="コスタネオロマンチカ 2018年 寄港地観光ツアーのご案内 暫定版"></a>
        <!--{/if}-->

        <!--{* [20180920/sato] コスタ ネオ ロマンチカ特集掲載のバリューを除いたコースに表示 *}-->
        <!--{if $arrProduct.product_id == 27512 || $arrProduct.product_id == 27515 || $arrProduct.product_id == 27516 || $arrProduct.product_id == 27517 || $arrProduct.product_id == 27518 || $arrProduct.product_id == 27519 || $arrProduct.product_id == 27520 || $arrProduct.product_id == 27521 || $arrProduct.product_id == 27513 || $arrProduct.product_id == 27514 || $arrProduct.product_id == 27522}-->
          <!--{* 2018リピーター割 *}-->
          <img style="width:100%;padding-top:1px;padding-bottom:5px;" src="/user_data/img/cabin_intro/bnr_detail_cos_neo_cla_pre.png" alt="クルーズ代金に含まれる特典" />
        <!--{elseif $arrProduct.product_id == 28875 || $arrProduct.product_id == 28876 || $arrProduct.product_id == 28877 || $arrProduct.product_id == 28878 || $arrProduct.product_id == 28879 || $arrProduct.product_id == 28881 || $arrProduct.product_id == 28882 || $arrProduct.product_id == 28883 || $arrProduct.product_id == 28884 || $arrProduct.product_id == 28885 || $arrProduct.product_id == 28886 || $arrProduct.product_id == 28887 || $arrProduct.product_id == 28888 || $arrProduct.product_id == 28889 || $arrProduct.product_id == 28890 || $arrProduct.product_id == 28891 || $arrProduct.product_id == 28901 || $arrProduct.product_id == 28892 || $arrProduct.product_id == 28893 || $arrProduct.product_id == 28894 || $arrProduct.product_id == 28902 || $arrProduct.product_id == 28895 || $arrProduct.product_id == 28896 || $arrProduct.product_id == 28897 || $arrProduct.product_id == 28898 || $arrProduct.product_id == 28899 || $arrProduct.product_id == 28900 || $arrProduct.product_id == 29756 || $arrProduct.product_id == 29757 || $arrProduct.product_id == 31564 || $arrProduct.product_id == 31565 || $arrProduct.product_id == 31566 || $arrProduct.product_id == 31567 || $arrProduct.product_id == 31568 || $arrProduct.product_id == 31569 || $arrProduct.product_id == 31570 || $arrProduct.product_id == 31571}-->
          <!--{* 2019マイファーストコスタ割 *}-->
          <img style="width:100%;padding-top:1px;padding-bottom:5px;" src="/user_data/img/cabin_intro/bnr_detail_cos_neo_cla_pre.png" alt="クルーズ代金に含まれる特典" />
        <!--{elseif $arrProduct.product_id == 25510 || $arrProduct.product_id == 25516 || $arrProduct.product_id == 25517 || $arrProduct.product_id == 25518 || $arrProduct.product_id == 25519 || $arrProduct.product_id == 25520 || $arrProduct.product_id == 25525 || $arrProduct.product_id == 25526 || $arrProduct.product_id == 25528 || $arrProduct.product_id == 25527 || $arrProduct.product_id == 25521 || $arrProduct.product_id == 25522 || $arrProduct.product_id == 25523 || $arrProduct.product_id == 25524 || $arrProduct.product_id == 25530 || $arrProduct.product_id == 25529 || $arrProduct.product_id == 25531 || $arrProduct.product_id == 25532 || $arrProduct.product_id == 25533 || $arrProduct.product_id == 25534 || $arrProduct.product_id == 25535 || $arrProduct.product_id == 25536 || $arrProduct.product_id == 25537 || $arrProduct.product_id == 25538 || $arrProduct.product_id == 25540 || $arrProduct.product_id == 25541 || $arrProduct.product_id == 25539 || $arrProduct.product_id == 25542 || $arrProduct.product_id == 25543 || $arrProduct.product_id == 25544 || $arrProduct.product_id == 25546 || $arrProduct.product_id == 25545 || $arrProduct.product_id == 25547 || $arrProduct.product_id == 25548 || $arrProduct.product_id == 25591 || $arrProduct.product_id == 25592 || $arrProduct.product_id == 25593 || $arrProduct.product_id == 25594 || $arrProduct.product_id == 25595 || $arrProduct.product_id == 25596 || $arrProduct.product_id == 25587 || $arrProduct.product_id == 25588 || $arrProduct.product_id == 25589 || $arrProduct.product_id == 25590 || $arrProduct.product_id == 25597 || $arrProduct.product_id == 25598 || $arrProduct.product_id == 25599 || $arrProduct.product_id == 25600}-->
          <!--{* 2019コンフォート *}-->
          <img style="width:100%;padding-top:1px;padding-bottom:5px;" src="/user_data/img/cabin_intro/bnr_detail_cos_neo_cla_pre.png" alt="クルーズ代金に含まれる特典" />
        <!--{/if}-->

        <!--{* MSCスプレンディダ4出発日限定コース用に航空券手配可能バナーを表示する *}-->
        <!--{if $arrProduct.product_id == 23880 || $arrProduct.product_id == 21999}-->
          <img style="width:100%;padding-top:1px;padding-bottom:1px;" src="/user_data/packages/default/img/sp_list/list_bnr_mscsp_onewayticket.png" alt="片道航空券手配できます。" />
        <!--{/if}-->

        <!--{* [20190104/sato] コスタクルーズ お子様半額ファミリープロモーション（取り敢えずロマン特集掲載コースへ） *}-->
        <!--{if $arrProduct.product_id == 28875 || $arrProduct.product_id == 28876 || $arrProduct.product_id == 28877 || $arrProduct.product_id == 28878 || $arrProduct.product_id == 28879 || $arrProduct.product_id == 28881 || $arrProduct.product_id == 28882 || $arrProduct.product_id == 28883 || $arrProduct.product_id == 28884 || $arrProduct.product_id == 28885 || $arrProduct.product_id == 28886 || $arrProduct.product_id == 28887 || $arrProduct.product_id == 28888 || $arrProduct.product_id == 28889 || $arrProduct.product_id == 28890 || $arrProduct.product_id == 28891 || $arrProduct.product_id == 28901 || $arrProduct.product_id == 28892 || $arrProduct.product_id == 28893 || $arrProduct.product_id == 28894 || $arrProduct.product_id == 28902 || $arrProduct.product_id == 28895 || $arrProduct.product_id == 28896 || $arrProduct.product_id == 28897 || $arrProduct.product_id == 28898 || $arrProduct.product_id == 28899 || $arrProduct.product_id == 28900 || $arrProduct.product_id == 29756 || $arrProduct.product_id == 29757 || $arrProduct.product_id == 31564 || $arrProduct.product_id == 31565 || $arrProduct.product_id == 31566 || $arrProduct.product_id == 31567 || $arrProduct.product_id == 31568 || $arrProduct.product_id == 31569 || $arrProduct.product_id == 31570 || $arrProduct.product_id == 31571}-->
          <a href="/user_data/img/cabin_intro/cos_neo/pamphlet/family_promotion.pdf" target="_blank">
            <img style="width:100%;padding-top:1px;padding-bottom:5px;" src="/user_data/packages/default/img/sp_list/list_bnr_promo_cos_family_half.png" alt="コスタクルーズ お子様半額ファミリープロモーション" />
          </a>
        <!--{/if}-->

        <!--{* [20190110/sato] コスタ ネオ ロマンチカ特集 脚付き15,000円キャッシュバックプラン *}-->
        <!--{if $arrProduct.product_id == 31564 || $arrProduct.product_id == 31565 || $arrProduct.product_id == 31566 || $arrProduct.product_id == 31567 || $arrProduct.product_id == 31568 || $arrProduct.product_id == 31569 || $arrProduct.product_id == 31570 || $arrProduct.product_id == 31571}-->
          <img style="width:100%;padding-top:1px;padding-bottom:5px;" src="/user_data/packages/default/img/sp_list/list_bnr_promo_cos_long_travel_cashback.png" alt="コスタ ネオ ロマンチカ 脚付き15,000円キャッシュバックプラン（条件あり）" />
        <!--{/if}-->

        <!--{* [20190107/sato] ダイヤモンド・プリンセス 秋の特別キャンペーン *}-->
        <!--{if $arrProduct.product_id == 25440 || $arrProduct.product_id == 25441 || $arrProduct.product_id == 25442 || $arrProduct.product_id == 25443 || $arrProduct.product_id == 25445 || $arrProduct.product_id == 25446}-->
          <img style="width:100%;padding-top:1px;padding-bottom:5px;" src="/user_data/packages/default/img/sp_list/list_bnr_prn_2019_autumn_promo.png" alt="ダイヤモンド・プリンセス 秋の特別キャンペーン " />
        <!--{/if}-->

        <!--{if count($arrOnlineProduct) > 0 && $onlineItem == 1}-->
          <!--{* バッチで登録したコースか手動で登録したコースかでオンライン予約の料金表のテンプレートが変更される *}-->
          <img style="margin-bottom: 8px;" src="/user_data/packages/sphone/img/detail/bnr_contact_online.png" width="100%" alt="オンライン予約はこちらから" />
          <!--{include file=`$tpl_online_price_list_template` }-->
        <!--{elseif $arrProduct.sub_comment2}-->
          <!--{$arrProduct.sub_comment2}-->
        <!--{else}-->
      <div id="shipinfononcontents" class="noncontents">
        <p class="default font">クルーズ料金・出発日・客室情報をご案内致します。詳細はお気軽にご相談・お問い合わせください。<br />
また下記のパンフレット・資料を参考にご覧ください。
        </p>
      </div>
        <!--{/if}-->

<!--{if $arrAttr.type.id == 11}-->
    ※チップ船上支払いの場合は、お一人様あたり1日、約1,000円（8〜12ドル）前後かかります。（クルーズ料金とは別途）<br />
<!--{/if}-->

<!--{* mura 2014-07-08 #8220 空室料金表コメント *}-->
<!--{if $arrProduct.product_id == 21171}-->
    ※2〜11歳が無料、12〜17歳が有料になります。12歳のお客様がご乗船される場合は、お問い合わせ下さい。<br />
    ※空室・料金・出発日・お部屋の内装は船会社の事情により変更・変動いたします。
<!--{elseif $arrProduct.sub_large_image18}-->
    <!--{$arrProduct.sub_large_image18|h}-->
<!--{else}-->
    ※空室・料金・出発日・お部屋の内装は船会社の事情により変更・変動いたします。
<!--{/if}-->

      </div><!-- /.inlineblock -->
    </div><!-- /#shipinfoblock -->



	</div><!-- /.tab-price -->
	<div class="tab-point tabs">

      <!--{* 寄港地 *}-->
      <!--{if $arrSiteCat[0].category_name != ""}-->
      <!--{assign var=title_key value=sub_title4}-->
      <!--{assign var=comment_key value=sub_comment13}-->
      <!--{assign var=image_key value=sub_image1}-->
      <!--{assign var=alt_key value=sub_title4}-->
      <div id="siteblock" class="block border-b">
        <a name="site"></a>
        <div class="title">
        <h3><!--{$arrProduct[$alt_key]}--></h3>
        </div>
        <div class="inlineblock">

            <div class="sitetableblock">
                <table class="sitetable">
                    <tr>
                    <th width="40">国名</th>
                    <td width="245" id="site_country"><!--{if $arrSiteCat[0].main_image}--><img id="site_country_image" src="/upload/category_image/<!--{$arrSiteCat[0].main_image}-->" alt="<!--{$arrSiteCat[0].information}-->の国旗" /><!--{/if}--><!--{$arrSiteCat[0].information}--></td>
                    <th width="40">寄港地名</th>
                    <td width="200" id="site_city"><!--{$arrSiteCat[0].category_name}--></td>
                    </tr>
                    <tr>
                    <th width="40"><p id="site_point_title">見どころ</p></th>
                    <td width="210"><p id="site_point"><!--{$arrSiteCat[0].static_ranking}--></p></td>
                    </tr>
                </table>
            </div>

          <div id="siteinline">
                  <div id="siteleft">
              <p class="font">
              <img src="/upload/category_image/<!--{$arrSiteCat[0].icon_image}-->" width="462" height="294" alt="<!--{$arrSiteCat[0].category_name}-->のイメージ" class="siteimage" id="site_image" />
              <span id="site_note"><!--{$arrSiteCat[0].note|strip_tags}--></span>
              </p>
            </div>
            <div id="siteright">
              <div id="sitegallery">
                <ul class="<!--{if $arrSiteCat|@count > 3}-->siteportbxslider<!--{else}-->nositebxslider<!--{/if}-->">
                <!--{section name=cnt loop=$arrSiteCat}-->
                <!--{if $arrSiteCat[cnt].category_name != ""}-->
                <li><a target="_blank" href="<!--{if $arrSiteCat[cnt].image_type == "0"}-->/upload/category_image/<!--{else}--><!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{/if}--><!--{$arrSiteCat[cnt].icon_image}-->" id="site_photo_<!--{$smarty.section.cnt.index}-->"><img src="<!--{if $arrSiteCat[cnt].image_type == "0"}-->/upload/category_image/<!--{else}--><!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{/if}--><!--{$arrSiteCat[cnt].icon_image}-->" alt="<!--{$arrSiteCat[cnt].category_name|h}-->" /><!--{$arrSiteCat[cnt].category_name|h}--></a></li>
                <!--{/if}-->
                <!--{/section}-->
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--{/if}-->


      <!--{* オススメポイント *}-->
      <!--{assign var=title_key value=sub_title26}-->
      <!--{assign var=image_key value=sub_image2}-->
      <!--{if $arrProduct[$image_key]}-->
        <!--{assign var=image_path value="`$arrProduct[$image_key]`"}-->
        <!--{assign var=image_path value="`$smarty.const.IMAGE_SAVE_URLPATH``$image_path`"}-->
      <!--{else}-->
        <!--{assign var=image_path value="`$TPL_URLPATH_PC`img/detail/bg_recommend.jpg"}-->
      <!--{/if}-->
      <!--{assign var=style_id value=$arrProduct.sub_title30|default:0}-->
      <!--{if $arrProduct.main_comment || $arrProduct.sub_large_image8 || $arrProduct.sub_large_image9}-->
      <div id="staffblock" class="block border-b">
        <a name="staff"></a>
        <div class="title">
        <h3><!--{$arrProduct[$title_key]|strip_tags}--></h3>
        </div>
        <!--{if $arrProduct.sub_large_image8 || $arrProduct.sub_large_image9}-->
        <div class="inlineblock">
          <!--{if $arrProduct.sub_large_image8}-->
          <div class="staffotherblock staffcompanyblock underline clearfix">
            <div class="staffrecommend_inner_image">
              <div class="staffrecommend_inner_logo">
                <div class="logo_image_outline borderoutline">
                  <img src="/upload/category_image/<!--{$arrAttr.company.main_image}-->" width="170" alt="<!--{$arrProduct[$title_key]}-->" />
                </div>
                <span>ロゴ</span>
              </div>
              <div class="sub_image9_outline">
                <div class="sub_image9 borderoutline">
                  <img style="margin-right: 10px" src="<!--{$product_sub_large_iamge9_thumb}-->" height="150" alt="<!--{$arrProduct[$title_key]}-->" />
                </div>
                <span>船内画像</span>
              </div>
              <!--{if $arrProduct.sub_large_image8_video}-->
              <div class="inner_video borderoutline">
                <iframe width="210" height="150" src="<!--{$arrProduct.sub_large_image8_video[0].url}-->" frameborder="0" allowfullscreen=""></iframe>
                <span>動画</span>
              </div>
              <!--{/if}-->
            </div>
            <div class="staffrecommend_inner_content">
              <p class="staffothertitle font">【<!--{$arrAttr.company.name}-->の特徴・魅力】</p>
              <!--{$arrProduct.sub_large_image8}-->
            </div>
          </div>
          <!--{/if}-->
          <!--{if $arrProduct.sub_large_image9}-->
          <div class="staffotherblock staffshipblock staffcompanyblock underline clearfix">
            <div class="staffrecommend_inner_image">
              <div class="staffrecommend_inner_logo">
                <div class="logo_image_outline borderoutline">
                  <img src="/upload/category_image/<!--{$arrAttr.company.main_image}-->" width="170" alt="<!--{$arrProduct[$title_key]}-->" />
                </div>
                <span>ロゴ</span>
              </div>
              <div class="sub_image9_outline">
                <div class="sub_image9 borderoutline">
                  <img src="/upload/category_image/<!--{$arrAttr.ship.main_image}-->" width="150" alt="<!--{$arrProduct[$title_key]}-->" />
                </div>
                <span>船内画像</span>
              </div>
            </div>
            <div class="staffrecommend_inner_content">
              <p class="staffothertitle font">【<!--{$arrAttr.ship.name}-->の特徴・魅力・ポイント】</p>
              <div class="point_cruisecompany">
              <!--{$arrProduct.sub_large_image9|strip_tags}-->
              </div>
            </div>
          </div>
          <!--{/if}-->
        </div>
        <!--{/if}-->
        <!--{if $arrProduct.main_comment}-->
        <div class="inlineblock">
          <div id="staffrecommend" class="staffrecommend_<!--{$arrPriceTableStyle[$style_id]}--> clearfix">
          <!--{if $arrProduct.sub_comment29 eq 1}-->
            <div class="staffrecommend_inner_image"><img style="margin-right: 10px" src="<!--{$image_path}-->" width="150" alt="<!--{$arrProduct[$title_key]}-->" /><br /></div>
            <div class="staffrecommend_inner_content font"><!--{$arrProduct.main_comment}--></div>
          <!--{else}-->
            <div class="staffrecommend_inner_content_full font"><!--{$arrProduct.main_comment}--></div>
          <!--{/if}-->
          </div>
        </div>
        <!--{/if}-->
      </div>

      <!--{/if}-->



      <!--{* 船内施設 *}-->
<!--{if $arrCharmGallery|@count > 0}-->

      <!--{assign var=arrCharmCount1 value=0}-->
      <!--{assign var=arrCharmCount2 value=0}-->
      <!--{assign var=arrCharmCount3 value=0}-->
      <!--{assign var=arrCharmCount4 value=0}-->
      <!--{assign var=arrCharmCount5 value=0}-->
      <!--{assign var=arrCharmCount6 value=0}-->
      <!--{section name=cnt loop=$arrCharmGallery}-->
        <!--{if $arrCharmGallery[cnt].text != ""}-->
          <!--{if $arrCharmGallery[cnt].type == 1}-->
            <!--{assign var=arrCharmCount1 value=$arrCharmCount1+1}-->
          <!--{elseif $arrCharmGallery[cnt].type == 2}-->
            <!--{assign var=arrCharmCount2 value=$arrCharmCount2+1}-->
          <!--{elseif $arrCharmGallery[cnt].type == 3}-->
            <!--{assign var=arrCharmCount3 value=$arrCharmCount3+1}-->
          <!--{elseif $arrCharmGallery[cnt].type == 4}-->
            <!--{assign var=arrCharmCount4 value=$arrCharmCount4+1}-->
          <!--{elseif $arrCharmGallery[cnt].type == 5}-->
            <!--{assign var=arrCharmCount5 value=$arrCharmCount5+1}-->
          <!--{elseif $arrCharmGallery[cnt].type == 6}-->
            <!--{assign var=arrCharmCount6 value=$arrCharmCount6+1}-->
          <!--{/if}-->
        <!--{/if}-->
      <!--{/section}-->
       <div class="title">
        <h3>船内の魅力をたっぷりご紹介♪</h3>
        </div>
      <!--{* 船内食事の魅力 *}-->
      <!--{if $arrCharmCount1 > 0}-->
      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h4>レストランの魅力</h4>
        </div>
        <div class="inlineblock inlineblock-line">
          <div id="charmMainGallery">
            <ul>
            <!--{assign var=setted value=false}-->
            <!--{section name=cnt loop=$arrCharmGallery}-->
              <!--{if $arrCharmGallery[cnt].text != ""}-->
              <!--{if $arrCharmGallery[cnt].type == 1}-->
              <li>
                <div class="charmLeft">
                  <div class="inner-border">
                    <img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" height="150" alt="<!--{$arrCharmGallery[cnt].text|h}-->" />
                  </div>
                </div>
                <div class="charmRight">
                  <span>
                    <!--{$arrCharmGallery[cnt].text|h}-->
                    <!--{if $arrCharmGallery[cnt].deck != ""}-->
                    &nbsp;: <!--{$arrCharmGallery[cnt].deck|h}-->
                    <!--{/if}-->
                  </span>
                  <div><!--{$arrCharmGallery[cnt].detail|h}--><div>
                </div>
              </li>
              <!--{assign var=setted value=true}-->
              <!--{/if}-->
              <!--{/if}-->
            <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>
      <!--{/if}-->
      <hr width="85%">
      <!--{* 船内施設の魅力 *}-->
      <!--{if $arrCharmCount2 > 0}-->
      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h4>施設の魅力</h4>
        </div>
        <div class="inlineblock inlineblock-line">
          <div id="charmMainGallery">
            <ul>
            <!--{assign var=setted value=false}-->
            <!--{section name=cnt loop=$arrCharmGallery}-->
              <!--{if $arrCharmGallery[cnt].text != ""}-->
              <!--{if $arrCharmGallery[cnt].type == 2}-->
              <li>
                <div class="charmLeft">
                  <div class="inner-border">
                    <img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" height="150" alt="<!--{$arrCharmGallery[cnt].text|h}-->" />
                  </div>
                </div>
                <div class="charmRight">
                  <span>
                    <!--{$arrCharmGallery[cnt].text|h}-->
                    <!--{if $arrCharmGallery[cnt].deck != ""}-->
                    &nbsp;: <!--{$arrCharmGallery[cnt].deck|h}-->
                    <!--{/if}-->
                  </span>
                  <div><!--{$arrCharmGallery[cnt].detail|h}--><div>
                </div>
              </li>
              <!--{assign var=setted value=true}-->
              <!--{/if}-->
              <!--{/if}-->
            <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>
      <!--{/if}-->
      <hr width="85%">

      <!--{* 船内イベントの魅力 *}-->
      <!--{if $arrCharmCount3 > 0}-->
      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h4>イベント・ショーの魅力</h4>
        </div>
        <div class="inlineblock inlineblock-line">
          <div id="charmMainGallery">
            <ul>
            <!--{assign var=setted value=false}-->
            <!--{section name=cnt loop=$arrCharmGallery}-->
              <!--{if $arrCharmGallery[cnt].text != ""}-->
              <!--{if $arrCharmGallery[cnt].type == 3}-->
              <li>
                <div class="charmLeft">
                  <div class="inner-border">
                    <img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" height="150" alt="<!--{$arrCharmGallery[cnt].text|h}-->" />
                  </div>
                </div>
                <div class="charmRight">
                  <span>
                    <!--{$arrCharmGallery[cnt].text|h}-->
                    <!--{if $arrCharmGallery[cnt].deck != ""}-->
                    &nbsp;: <!--{$arrCharmGallery[cnt].deck|h}-->
                    <!--{/if}-->
                  </span>
                  <div><!--{$arrCharmGallery[cnt].detail|h}--><div>
                </div>
              </li>
              <!--{assign var=setted value=true}-->
              <!--{/if}-->
              <!--{/if}-->
            <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>
      <!--{/if}-->
      <hr width="85%">

      <!--{* 子供・ファミリー向けの魅力 *}-->
      <!--{if $arrCharmCount4 > 0}-->
      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h4>子供・ファミリー施設の魅力</h4>
        </div>
        <div class="inlineblock inlineblock-line">
          <div id="charmMainGallery">
            <ul>
            <!--{assign var=setted value=false}-->
            <!--{section name=cnt loop=$arrCharmGallery}-->
              <!--{if $arrCharmGallery[cnt].text != ""}-->
              <!--{if $arrCharmGallery[cnt].type == 4}-->
              <li>
                <div class="charmLeft">
                  <div class="inner-border">
                    <img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" height="150" alt="<!--{$arrCharmGallery[cnt].text|h}-->" />
                  </div>
                </div>
                <div class="charmRight">
                  <span>
                    <!--{$arrCharmGallery[cnt].text|h}-->
                    <!--{if $arrCharmGallery[cnt].deck != ""}-->
                    &nbsp;: <!--{$arrCharmGallery[cnt].deck|h}-->
                    <!--{/if}-->
                  </span>
                  <div><!--{$arrCharmGallery[cnt].detail|h}--><div>
                </div>
              </li>
              <!--{assign var=setted value=true}-->
              <!--{/if}-->
              <!--{/if}-->
            <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>
      <!--{/if}-->
      <hr width="85%">

      <!--{* スポーツ・エステの魅力 *}-->
      <!--{if $arrCharmCount5 > 0}-->
      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h4>スポーツ・エステの魅力</h4>
        </div>
        <div class="inlineblock inlineblock-line">
          <div id="charmMainGallery">
            <ul>
            <!--{assign var=setted value=false}-->
            <!--{section name=cnt loop=$arrCharmGallery}-->
              <!--{if $arrCharmGallery[cnt].text != ""}-->
              <!--{if $arrCharmGallery[cnt].type == 5}-->
              <li>
                <div class="charmLeft">
                  <div class="inner-border">
                    <img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" height="150" alt="<!--{$arrCharmGallery[cnt].text|h}-->" />
                  </div>
                </div>
                <div class="charmRight">
                  <span>
                    <!--{$arrCharmGallery[cnt].text|h}-->
                    <!--{if $arrCharmGallery[cnt].deck != ""}-->
                    &nbsp;: <!--{$arrCharmGallery[cnt].deck|h}-->
                    <!--{/if}-->
                  </span>
                  <div><!--{$arrCharmGallery[cnt].detail|h}--><div>
                </div>
              </li>
              <!--{assign var=setted value=true}-->
              <!--{/if}-->
              <!--{/if}-->
            <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>
      <!--{/if}-->
      <hr width="85%">

      <!--{* 船内ショッピングの魅力 *}-->
      <!--{if $arrCharmCount6 > 0}-->
      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h4>船内ショッピング・買い物の魅力</h4>
        </div>
        <div class="inlineblock inlineblock-line">
          <div id="charmMainGallery">
            <ul>
            <!--{assign var=setted value=false}-->
            <!--{section name=cnt loop=$arrCharmGallery}-->
              <!--{if $arrCharmGallery[cnt].text != ""}-->
              <!--{if $arrCharmGallery[cnt].type == 6}-->
              <li>
                <div class="charmLeft">
                  <div class="inner-border">
                    <img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" height="150" alt="<!--{$arrCharmGallery[cnt].text|h}-->" />
                  </div>
                </div>
                <div class="charmRight">
                  <span>
                    <!--{$arrCharmGallery[cnt].text|h}-->
                    <!--{if $arrCharmGallery[cnt].deck != ""}-->
                    &nbsp;: <!--{$arrCharmGallery[cnt].deck|h}-->
                    <!--{/if}-->
                  </span>
                  <div><!--{$arrCharmGallery[cnt].detail|h}--><div>
                </div>
              </li>
              <!--{assign var=setted value=true}-->
              <!--{/if}-->
              <!--{/if}-->
            <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>
      <!--{/if}-->

      <div id="charmblock" class="block">
        <a name="charm"></a>
        <div class="title">
        <h3><!--{if $arrCharmCount1 > 0 || $arrCharmCount2 > 0 || $arrCharmCount3 > 0 || $arrCharmCount4 > 0 || $arrCharmCount5 > 0 || $arrCharmCount6 > 0}-->その他施設の魅力<!--{else}-->施設の魅力<!--{/if}--></h3>
        </div>
        <div class="inlineblock">
          <div id="charmgallery">
            <ul class="charmslider">
        <!--{assign var=setted value=false}-->
        <!--{section name=cnt loop=$arrCharmGallery}-->
          <!--{if $arrCharmGallery[cnt].text != ""}-->
          <!--{if $arrCharmGallery[cnt].type == 0}-->
          <!--{*<li><a class="expansion" href="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" target="_blank"><img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" width="150" height="100" alt=" " /><!--{$arrCharmGallery[cnt].text|h}--></a></li>*}-->
          <li><a class="expansion" href="/resize_image.php?width=350&image=<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" target="_blank"><div class="inner-border"><img src="<!--{$smarty.const.CHARM_DATA_URL}--><!--{$arrAttr.ship.category_id}-->/<!--{$arrCharmGallery[cnt].img}-->" width="205" height="137" alt=" " /></div><!--{$arrCharmGallery[cnt].text|h}--></a></li>
          <!--{assign var=setted value=true}-->
          <!--{/if}-->
          <!--{/if}-->
        <!--{/section}-->
            </ul>
          </div>
        </div>
      </div>

<!--{/if}-->


	</div><!-- /.tab-point -->
	<div class="tab-review tabs">

      <!--{* クチコミ *}-->
<!--{if $arrReview|@count > 0}-->
      <div id="reviewblock" class="block">
        <a name="review"></a>

<!--{if $arrCharmPamp|@count>0}-->
      <div id="charmblock" class="block">
          <div id="charminfo">
          <a name="charminfoanchor" id="charminfoanchor"></a>
          <div class="title">
            <h3>ご予約前／ご予約後 お客様へ パンフレット、オプショナルツアー、乗船の流れ、こども施設、ドレスコード、特典情報等</h3>
          </div>

            <!--{foreach item=row key=key from=$arrCharmPamp}-->

            <!--{if $row.swap_company && $row.swap_company_default}-->
              <!--{assign var=image_path value="`$smarty.const.CHARM_DATA_URL``$arrAttr.company.category_id`/`$row.img`"}-->
            <!--{elseif $row.img_default}-->
              <!--{assign var=image_path value="`$smarty.const.CHARM_DATA_URL``$arrAttr.ship.category_id`/`$row.img`"}-->
            <!--{else}-->
              <!--{assign var=image_path value="`$smarty.const.CHARM_DATA_URL``$row.img`"}-->
            <!--{/if}-->

            <!--{if $key==1}-->
              <h3>・パンフレット・ガイドブック・デッキプラン 早わかり詳細情報</h3>
              <ul class="ul_panf_1">
            <!--{elseif $key==5}-->
              <h3>・寄港地オプショナルツアー・港／ターミナル・空港／移動・ホテル／宿泊 早わかり詳細情報</h3>
              <ul class="ul_panf_2">
            <!--{elseif $key==9 or $key==13 or $key==17 or $key==21 or $key==25}-->
              <!--{if $key==9}--><div class="readMorePanf"><!--{/if}-->
              <ul>
            <!--{elseif $key==26}-->
              <h3>・船会社限定割引／特典・リピーター特典／割引 早わかり詳細情報</h3>
              <ul class="ul_panf_3">
            <!--{/if}-->

            <li>
              <!--{if $row.url}-->
                <!--{if $row.no_display}-->
                  <span class="nodisplay"></span>
                <!--{else}-->
                  <!--{if $row.url|regex_replace:'/^http/':'x' ne $row.url}-->
                  <a target="_blank" href="<!--{$row.url}-->" rel="nofollow">
                  <!--{else}-->
                  <a target="_blank" href="<!--{$smarty.const.CHARM_DATA_URL}--><!--{if $row.swap_company}--><!--{$arrAttr.company.category_id}--><!--{else}--><!--{$arrAttr.ship.category_id}--><!--{/if}-->/<!--{$row.url}-->">
                  <!--{/if}-->
                    <img src="<!--{$image_path}-->" width="120" height="168" alt="<!--{$row.text}-->"><br><!--{$row.text}-->
                  </a>
                <!--{/if}-->
              <!--{elseif $row.no_display}-->
                <span class="nodisplay"></span>
              <!--{else}-->
                <span class="nolink">
                  <img src="<!--{$image_path}-->" width="120" height="168" alt="<!--{$row.text}-->"><br><!--{$row.text}-->
                </span>
              <!--{/if}-->
            </li>

            <!--{if $key==25}-->
              <li></li>
              <li></li>
              <li><a href="#charminfo" class="readClosePanfBtn"><img alt="閉じる" src="/user_data/packages/sphone/img/detail/btn_read_close_panf.jpg"/></a></li>
            <!--{/if}-->

            <!--{if $key==4 or $key==8 or $key==12 or $key==16 or $key==20 or $key==24 or $key==25 or $key==29}--></ul><!--{/if}-->

            <!--{if $key==8}-->
              <ul>
                <li><a class="readMorePanfBtn"><img alt="続きを見る" src="/user_data/packages/sphone/img/detail/btn_read_more_panf.jpg" width="100%"/></a></li>
              </ul>
            <!--{/if}-->

            <!--{if $key==25}--></div><!--{/if}-->

            <!--{/foreach}-->

          </div>
      </div>
<!--{/if}-->

        <div class="title"><a name="name-review"><h3>クチコミガイド 参加体験談</h3></a></div>
        <div class="inlineblock">
<!--{if !$arrReview|@count}-->
        <div id="reviewbuttonblock_info">
        <p>クルーズの評価・感動体験など<br />皆様のクルーズ体験のご投稿を是非お待ちしております。</p>
        </div>
<!--{/if}-->
            <!--{foreach item=review from=$arrReview name=reviewloop}-->
            <!--{if $smarty.foreach.reviewloop.iteration<=3}-->
            <!--{*最大3件表示*}-->
            <!--{assign var=product value=$review.product}-->
            <!--{assign var=attr value=$review.attr}-->

            <div class="reviewrow">
                <!-- <!--{$review.review_id|h}--> -->
                <!--{if $tpl_product_id == $review.product_id}-->
                <div class="reviewdetail_current_product">
                <!--{else}-->
                <div class="reviewdetail">
                <!--{/if}-->
                    <div class="reviewimageblock">
                        <h3><!--{$review.name|h}--></h3>
                        <div>
                        <!--{assign var=key value="photo1"}-->
                        <!--{if $review.$key}-->
                        <img src="<!--{$IMAGE_REVIEW_URLPATH}--><!--{$review.$key|h}-->" width="200" alt=" " class="reviewimage1" />
                        <!--{else}-->
                        <!--{/if}-->

                        <!--{assign var=key value="photo2"}-->
                        <!--{if $review.$key}-->
                        <img src="<!--{$IMAGE_REVIEW_URLPATH}--><!--{$review.$key|h}-->" width="200" alt=" " class="reviewimage2" />
                        <!--{else}-->
                        <!--{/if}-->

                        <!--{assign var=key value="photo3"}-->
                        <!--{if $review.$key}-->
                        <img src="<!--{$IMAGE_REVIEW_URLPATH}--><!--{$review.$key|h}-->" width="200" alt=" " class="reviewimage3" />
                        <!--{else}-->
                        <!--{/if}-->
                        </div>

                    </div>
                    <div class="reviewdatablock">
                        <div class="reviewoutline">
                          <div>
                            <p class="nickname">ニックネーム <span><!--{$review.reviewer_name|h}--></span></p>
                            <p class="entrydate">投稿日時 <!--{$review.create_date|sfDispDBDate:'ja'|h}--></p>
                          </div>
                          <div class="bottomblock">
                            <p class="area">方面 <span><!--{$attr.area.name|h}--></span> / 客船 <span><!--{$attr.ship.name|h}--></span></p>
                          </div>
                        </div>
                        <div class="reviewpoint">
                            <table>
                                <tr>
                                    <!--{assign var=key value="recommend_level1"}-->
                                    <th><strong>総合評価</strong></th>
                                    <td><strong><!--{$review.$key|h}--></strong></td>
                                    <td><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$review.$key|sfGetReviewLevelText}-->.jpg" width="118" height="23" alt="<!--{$review.$key|h}-->" /></td>

                                    <!--{assign var=key value="recommend_level2"}-->
                                    <th>寄港地観光</th>
                                    <td><strong><!--{$review.$key|h}--></strong></td>
                                    <td><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$review.$key|sfGetReviewLevelText}-->.jpg" width="90" height="18" alt="<!--{$review.$key|h}-->" /></td>
                                </tr>
                                <tr>

                                    <!--{assign var=key value="recommend_level5"}-->
                                    <th>船内エンタメ</th>
                                    <td><strong><!--{$review.$key|h}--></strong></td>
                                    <td><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$review.$key|sfGetReviewLevelText}-->.jpg" width="90" height="18" alt="<!--{$review.$key|h}-->" /></td>

                                    <!--{assign var=key value="recommend_level3"}-->
                                    <th>客室/内装</th>
                                    <td><strong><!--{$review.$key|h}--></strong></td>
                                    <td><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$review.$key|sfGetReviewLevelText}-->.jpg" width="90" height="18" alt="<!--{$review.$key|h}-->" /></td>
                                </tr>
                                <tr>

                                    <!--{assign var=key value="recommend_level4"}-->
                                    <th>食事/ドリンク</th>
                                    <td><strong><!--{$review.$key|h}--></strong></td>
                                    <td><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$review.$key|sfGetReviewLevelText}-->.jpg" width="90" height="18" alt="<!--{$review.$key|h}-->" /></td>

                                    <!--{assign var=key value="recommend_level6"}-->
                                    <th>サービス/接客</th>
                                    <td><strong><!--{$review.$key|h}--></strong></td>
                                    <td><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$review.$key|sfGetReviewLevelText}-->.jpg" width="90" height="18" alt="<!--{$review.$key|h}-->" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="reviewcomment">
                            <!--{*<div class="reviewcomment_left">*}-->
                                  <p>
                                      <!--{sfSeeMore text=$review.comment|h max_length=218 id=$review.review_id prefix_more="reviewnext" prefix_remains="review-comment-remains"}-->
                                  </p>
                            <!--{*</div>*}-->
                        </div>
                    </div>
                </div>
            </div>
            <!--{/if}-->
            <!--{/foreach}-->
        </div>
      </div>
<!--{/if}-->


      <!--{* 旅行準備お役立ち情報 *}-->
      <div id="travellinkblock" class="block">
        <a name="travellink"></a>
        <div class="title"><h3>旅行準備お役立ち予約情報　AIG損保／オプショナルツアー／ホテル／旅グッズ／おみやげ宅配</h3></div>
        <div class="travellinksubtitle">お客様ご自身で、AIG損保／オプショナルツアー／ホテル／旅グッズ／おみやげ宅配 の便利で安心なオンライン予約できます。</div>
        <div class="inlineblock">
          <table>
            <tbody>
                <tr class="table_aui_insurance">
                  <th><a href="https://www-429.aig.co.jp/ota/?p=oKC1XT01" target="_blank" rel="nofollow">AIG損保予約</a></th>
                  <td>安心の海外旅行保険をご自身でオンライン予約</td>
                </tr>
                <tr class="table_travel_hotel">
                  <th><a href="http://appleworld.com/b1c/index.html" target="_blank" rel="nofollow">ホテル予約</a></th>
                  <td>豊富なコンテンツと日本最大級の海外ホテルクチコミで、安心のホテル選びをご自身でオンライン予約で！</td>
                </tr>
                <tr class="table_travel_goods">
                  <th><a href="http://www.gift-land.com/partner/best1/goods/" target="_blank" rel="nofollow">旅グッズ予約</a></th>
                  <td>スーツケース、機内グッズなど、便利な旅行用品もご自身でオンライン予約で準備OK</td>
                </tr>
                <tr class="table_travel_gift">
                  <th><a href="http://www.gift-land.com/partner/best1/" target="_blank" rel="nofollow">おみやげ宅配予約</a></th>
                  <td>お土産をご自身でオンライン予約で事前に決めておけば、もっと旅行中の時間が充実します！</td>
                </tr>
                <tr>
                  <th><a href="http://www.best1cruise.com/user_data/veltra/best1_alan.php" target="_blank" rel="nofollow">オプショナルツアー予約</a></th>
                  <td>クルーズ発着都市の寄港地観光をご自身でオンライン予約！日本語現地ツアーがいっぱい！</td>
                </tr>
            </tbody>
          </table>
        </div>
      </div>


      <!--{* ご利用条件 *}-->
      <div id="guideblock" class="block">
        <a name="guide"></a>
<!--{if $arrProduct.sub_title3}-->
<div class="title"><h3><!--{$arrProduct.sub_title3}--></h3></div>
        <div class="guidesubtitle">&lt;<!--{$arrAttr.company.name}-->&gt;</div>
        <div class="inlineblock">
        <!--{if $arrProduct.sub_comment3 || $arrProduct.sub_large_image3 || $arrProduct.sub_large_image5}-->
        <!--{if $arrProduct.sub_comment3}-->
        <h3><!--{$arrProduct.sub_large_image1}--></h3>
        <!--{$arrProduct.sub_comment3}-->
        <!--{/if}-->
        <!--{if $arrProduct.sub_large_image3}-->
        <h3><!--{$arrProduct.sub_large_image2}--></h3>
        <!--{$arrProduct.sub_large_image3}-->
        <!--{/if}-->
        <!--{if $arrProduct.sub_large_image5}-->
        <h3><!--{$arrProduct.sub_large_image4}--></h3>
        <!--{$arrProduct.sub_large_image5}-->
        <!--{/if}-->
        <!--{else}-->
          <!--{$arrAttr.company.information}-->
        <!--{/if}-->

        <!-- クルーズ取消手続料金 -->
        <!--{if $arrAttr.type.id == 11}-->
        <h3>クルーズのみ・手配旅行弊社取消手続料金</h3>
        <table class="table-ones-travel-info">
            <tbody>
                <tr>
                    <th>弊社取消手続料金</th>
                    <td><a class="link_no_color" href="/user_data/info/tousyakitei.php" target="_blank">ご予約後取消の場合、弊社取消手続料金がかかります。ご予約前に必ずご確認下さい。詳細はこちら。</a></td>
                </tr>
            </tbody>
        </table>
        <!--{/if}-->

        <!-- 渡航情報の安全・衛生情報 -->
        <h3>渡航先の安全・衛生情報</h3>
        <table class="table-ones-travel-info">
            <tbody>
                <tr>
                    <th>安全情報</th>
                    <td><a href="http://www.anzen.mofa.go.jp/" target="_blank" rel="nofollow">外務省のホームページへのリンク</a></td>
                </tr>
                <tr>
                    <th>衛生情報</th>
                    <td><a href="http://www.forth.go.jp/" target="_blank" rel="nofollow">厚生労働省「検疫感染症情報」ホームページへのリンク</a></td>
                </tr>
            </tbody>
        </table>

        <!--{* mura 2014-08-20 #9196 募集主催企画会社の登録 *}-->
        <!--{if $arrHostCompanyName[$arrProduct.sub_large_image19]}-->
        <table class="table-host">
            <tbody>
                <tr>
                    <th class="table-host-company">募集主催企画会社</th>
                    <td class="table-host-company"><!--{$arrHostCompanyName[$arrProduct.sub_large_image19]|default:"-"}--></td>
                </tr>
                <tr>
                    <th class="table-host-company">受託販売旅行会社</th>
                    <td class="table-host-company">ベストワンドットコム（ベストワンクルーズ）</td>
                </tr>
            </tbody>
        </table>
        <!--{/if}-->

            <!--{if $arrProduct.sub_large_image20}-->
            <div class="detail-creator-name">作成：<!--{$arrProduct.sub_large_image20|h}--></div>
            <!--{/if}-->
        </div>
<!--{/if}-->
    </div>


	</div><!-- /.tab-review -->
</div>


<div class="blc-contact-button-detail">
  <ul>
  <!--{if count($arrOnlineProduct) > 0}-->
      <ul class="online-charm-list">
        <li class="online-charm-title">オンラン予約の魅力</li>
        <li>24H いつでも簡単便利、安心に予約</li>
        <li>カード決済自由自在・振り込みもできる</li>
        <li>クルーズ手配手数料はいつも、どのコースも全て無料</li>
        <li>さらに最安値料金挑戦 最大５％割引適用 *電話・メール・郵送対応原則一切なし</li>
        <li>オンライン予約限定の激安商品あり、弊社独自商品も</li>
        <li>緊急時は、無料でメールや電話でも安心フォロー *対応原則３回まで</li>
        <li>電子パンフや港情報などOPツアーなど 全てWEBで情報閲覧可能</li>
      </ul>
      <li class="btn_online" style="width:100%;margin:0;"><span class="online_reservation_button onlineno-button-style" href="#"><span class="reservation_button--left">オンライン最安値予約<br />(２４時間いつでも・カード決済)</span></span></li>
    <!--{/if}-->
      <li><a class="reserve no-button-style<!--{if count($arrOnlineProduct) < 1}--> big_reserve_button<!--{/if}-->" href="<!--{$smarty.const.HTTPS_URL}-->contact/?contact_type_id=2&amp;product_id=<!--{$arrProduct.product_id}-->" target="_blank"><i class="fas fa-envelope"></i><span class="no_button--inline2">メール<br />（仮予約）</span></a>
      <li><a class="inquiry no-button-style" href="<!--{$smarty.const.HTTPS_URL}-->contact/?product_id=<!--{$arrProduct.product_id}-->" target="_blank"><i class="fas fa-book-open"></i><span class="no_button--inline3">資料請求<br />（無料）</span></a>
  </ul>
</div>



<form id="form-favorite" method="post" action="?">
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="add_favorite" />
    <!--{*<input type="hidden" name="product_id" value="" id="id-formfav-product_id" />*}-->
    <input type="hidden" name="favorite_product_id" value="" class="favorite-product-id" />
</form>

<div class="remodal" data-remodal-id="modal">
  <button data-remodal-action="close" class="remodal-close"></button>
  <p class="image">
  </p>
</div>
