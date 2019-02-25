<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>パスポート・旅行申込情報入力フォーム・アンケート - 入力画面</title>

  <link rel="stylesheet" href="../commons/css/ui.tabs.css" type="text/css">
  <link href="../commons/css/passport.css?20181227052832" rel="stylesheet" type="text/css">
  <link href="../commons/css/bootstrap.min.css" rel="stylesheet">
  <link href="../commons/css/font-awesome.min.css" rel="stylesheet">
  <link href="../commons/css/style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
    crossorigin="anonymous">


  <link rel="stylesheet" href="../commons/css/ui.tabs.css" type="text/css">

  <!--[if lt IE 9]>
      <script src="../commons/js/html5shiv.js"></script>
      <script src="../commons/js/respond.min.js"></script>
    <![endif]-->
  <link rel="shortcut icon" href="../commons/images/ico/favicon.ico">

  <!-- ui tabs.js -->
  <script src="../commons/js/jquery-1.2.6.js" type="text/javascript"></script>
  <!-- <script src="../commons/js/ui.core.js" type="text/javascript"></script> -->
  <!-- <script src="../commons/js/ui.tabs.js" type="text/javascript"></script> -->

  <!-- <script type="text/javascript"> -->
  <!-- jQuery(function($t){ -->
  <!-- $t('#contens > ul').tabs(); -->
  <!-- }); -->
  <!-- </script> -->

  <script type="text/javascript" src="../commons/js/jquery-1.11.3.js"></script>
  <script type="text/javascript" src="../commons/js/jquery.jpostal.js"></script>
  <script type="text/javascript" src="../commons/js/bootstrap.js"></script>
  <script type="text/javascript" src="../commons/js/validator.min.js"></script>

  <!--JavaScript(System)-->
  <script type="text/javascript" src="../commons/js/system.js"></script>

  <!-- Style -->
  <style>
    body{
       padding-top: 15px;
     }
     label{
       margin-bottom: -1px;
     }
     .form-group {
       margin-bottom: 8px;
     }
     .form-group-center {
       text-align: center;
     }
     @media (min-width: 768px) {
       body{
         padding-top: 60px !important;
       }
       label{
         margin-bottom: 5px !important;
       }
       .form-group {
         margin-bottom: 13px !important;
       }
       .form-group-center {
         text-align: left !important;
       }
       span.asterisk{
         font-size: 15px !important;
         position: relative !important;
         top: 2px !important;
         margin-left: 0px !important;
       }
       .toc {
         width: auto !important;
       }
       .notice {
         margin-top: 15px !important;
         margin-bottom: 20px !important;
       }
       .comment {
         margin-top: 35px !important;
       }
     }
     hr {
       margin-top: 15px;
       margin-bottom: 0px;
     }
     span[aria-hidden="true"] {
       display: none;
     }
     span.name_roman_letter {
       line-height: 30px;
     }
     #fragment_06 {
       display: none;
     }
     #fragment_06 h3, #fragment_07 h3 {
       display: inline-block;
     }
     input[type="checkbox"]{
       transform: scale(1.3);
     }
     button[type="submit"]{
       padding: 25px 60px;
       font-size: 20px;
     }
     .btn_remove_form6, .btn_remove_form7{
       vertical-align: bottom;
     }
     h3 span.text-danger{
       text-decoration: underline;
     }
     #fragment_02-1,#fragment_02-2,#fragment_02-3,#fragment_02-4,#fragment_02-5,#fragment_02-6,#fragment_02-7,#fragment_02-8,#fragment_02-9,#fragment_02-10,
     #fragment_02-11,#fragment_02-12,#fragment_02-13,#fragment_02-14,#fragment_02-15,#fragment_02-16,#fragment_02-17,#fragment_02-18,#fragment_02-19,#fragment_02-20,
     #fragment_02-21,#fragment_02-22,#fragment_02-23,#fragment_02-24,#fragment_02-25,#fragment_02-26,#fragment_02-27,#fragment_02-28{
       display: none;
     }
     form > h4{
       padding-bottom: 10px;
       font-weight: bold;
     }
     span.asterisk{
       font-size: 20px;
       position: absolute;
       top: -4px;
       margin-left: 5px;
     }
     .toc {
       display: inline-block;
       width: 100%;
       border: 1px solid #aaaaaa;
       padding: 10px 20px;
     }
     .toc > p {
       text-align: center;
       font-size: 18px;
       margin-bottom: 5px;
     }
     .notice span.text-danger {
       font-size: 14px;
       font-weight: bold;
     }
     .pagetop {
       display: none;
       position: fixed;
       bottom: 30px;
       right: 15px;
       z-index: 2;
     }
     .pagetop a {
       display: block;
       background:#aaa;
       opacity: 0.6;
       text-align: center;
       color: #fff;
       font-weight: bold;
       font-size: 16px;
       text-decoration: none;
       filter:alpha(opacity=50);
       width:80px;
       height:80px;
       -moz-border-radius: 40px;
       -webkit-border-radius: 40px;
       border-radius: 40px;
       position: relative;
     }
     .pagetop a span{
       position: absolute;
       top: 53%;
       left: 50%;
       transform: translateY(-50%) translateX(-50%);
       white-space: nowrap;
     }
    </style>

  <!--共通メニュー読み込み-->
  <script type="text/javascript">
    $(function () {
      // $("#menu").load("../menu/menu.html");

      // TOPへ戻るボタン設置.
      var $pageTop = $(".pagetop");
      $pageTop.hide();
      $(window).scroll(function () {
        if ($(this).scrollTop() > 500) {
          $pageTop.fadeIn();
        } else {
          $pageTop.fadeOut();
        }
      });
      $('a[href^="#"]').click(function () {
        var href = $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top;
        $("html, body").animate({
          scrollTop: position
        }, 500, "swing");
        return false;
      });

      // 郵便番号から住所を自動入力.
      $('#send_zip_1').jpostal({
        postcode: [
          '#send_zip_1',
          '#send_zip_2'
        ],
        address: {
          '#send_pref_cd': '%3',
          '#send_ad_1': '%4%5',
        },
        url: {
          'http': '../commons/json/',
          'https': '../commons/json/'
        }
      });

      // 郵便番号の入力が空になった場合の処理.
      $('#zipcode01').on('keyup', function (event) {
        if ($(this).val() == '') {
          $('#send_pref_cd').val('');
          $('#send_ad_1').val('');
        }
      });

      // 必須項目に入力がない場合の処理.
      $("input").each(function () {
        $(this).bind('keyup', function (elm) {
          if ($(this).attr('required')) {
            if ($(this).val().length) {
              $(this).parent().removeClass('has-error');
            } else {
              $(this).parent().addClass('has-error');
            }
          }
        });
      });

      // 3人目以降用フォームの追加処理.
      var cnt = 1;
      $(".btn_add_form").click(function () {
        // console.log(cnt);
        var id = 'fragment_02-' + cnt;
        if (cnt <= 28) {
          $('#' + id).css('display', 'block');
          cnt++;
        }
      });

      // 3人目以降用フォームの削除処理.
      $(".btn_remove_form").click(function () {
        // console.log(cnt);
        var target = $('#fragment_02-' + (cnt - 1));
        if (target.length) {
          target.css('display', 'none');
          cnt--;
        }
      });

      // ご自身で手配の場合のフォーム表示処理.
      $(".btn_add_form6").click(function () {
        $('#fragment_06-0').css('display', 'none');
        $('#fragment_06').css('display', 'inherit');
      });
      $(".btn_remove_form6").click(function () {
        $('#fragment_06-0').css('display', 'inherit');
        $('#fragment_06').css('display', 'none');
      });

      // アンケートフォーム表示処理.
      // $(".btn_add_form7").click(function () {
      //   $('#fragment_07-0').css('display', 'none');
      //   $('#fragment_07').css('display', 'inherit');
      // });
      // $(".btn_remove_form7").click(function () {
      //   $('#fragment_07-0').css('display', 'inherit');
      //   $('#fragment_07').css('display', 'none');
      // });

      // 送信ボタン押下時の処理.
      $('form').validator({
        custom: {
          date: function ($el) {
            if ($el.val() != "") {
              if (!$el.val().match(/^([12][0-9][0-9][0-9])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/)) {
                return " "
              }
            }
          },
          time: function ($el) {
            if ($el.val() != "") {
              if (!$el.val().match(/^(0[0-9]|1[0-9]|2[0-3]):(0[0-9]|[1-5][0-9])$/)) {
                return " "
              }
            }
          }
        }
      }).on('submit', function (e) {
        if (e.isDefaultPrevented()) {
          // Validation
        } else {
          // DONE
        }
      })
    })

    /*
         // 入力チェック - ローマ字.
         function checkFormAlphabet($this){
           var str = $this.value;
           while(str.match(/[^A-Z^a-z]/)){
             str = str.replace(/[^A-Z^a-z]/, "");
           }
           $this.value = str;
         }
    */

    // 入力チェック - 日付.
    function checkFormDate($this) {
      var str = $this.value;
      while (str.match(/[^\d^\-]/)) {
        str = str.replace(/[^\d^\-]/, "");
      }
      $this.value = str;
    }

    // 入力チェック - 時間.
    function checkFormTime($this) {
      var str = $this.value;
      while (str.match(/[^\d^\:]/)) {
        str = str.replace(/[^\d^\:]/, "");
      }
      $this.value = str;
    }
  </script>
</head>
<!--/head-->

<body>
  <div class="container">
    <h2 class="main_passport--title">【入力画面】パスポート・旅行申込情報入力フォーム / アンケート</h2>

    <form class="form-horizontal" method='post' action="./passport?kubun={$kubun}" name='Form' role="form" data-toggle="validator">


      <hr>

      <div>予約番号：{if !empty($rsv_num)}{$rsv_num}{/if}</div>
      <div>出発日　：{if !empty($cruise_date_s)}{$cruise_date_s}{/if}</div>
      <div>コース名：{if !empty($course_name)}{$course_name}{/if}</div>

      <hr>

      <p class="danger-caption">
        このページのお客様情報の記入は、【オレンジ色の箇所または <span class="optional"></span>】を除き、全て必須項目となっています。<br />
        記入漏れのないようご注意ください。
      </p>
      <div class="danger-box">
        <h4 class="danger-box_caption">※要確認事項</h4>
        <p>
          ・<b>代表者様のパスポート情報だけでも入力〜更新まで行うことができますが、ご出発日の75〜60日前までには必ずご同行者様のパスポート情報をご入力下さい。</b>
          <br />・<b>これらの情報がないと最終乗船券の発券ができないため、遅れが生じてしまいます。</b>
          <br />・<b>氏名（ローマ字）が間違っている場合は、必ずお問い合せ下さい。</b>
          <br />・予め自動入力されている項目がございます。お客様自身でもご確認下さい。
          <br />・原則、こちらのフォームに関する電話・FAXでのお問い合わせは承っておりません。
          <br />▶お手数をおかけいたしますが、ご協力の程よろしくお願いいたします。
        </p>
      </div>

      <hr>

      <div class="toc">
        <p>目次</p>
        <ul>
          <li>
            <a href="#fragment_01"><span>1.</span> パスポート情報（必須）</a>
          </li>
          <li>
            <a href="#fragment_02"><span>2.</span> 2人目以降の情報（必須）</a>
          </li>
          <li>
            <a href="#fragment_04"><span>3.</span> 旅行申込情報（必須）</a>
          </li>
          <li>
            <a href="#fragment_05"><span>4.</span> 緊急時のご連絡先（必須）</a>
          </li>
          <li>
            <a href="#fragment-title_danger"><span>5.</span>海外旅行保険（AIG）申し込み可否（必須）</a>
          </li>
          <li>
            <a href="#fragment_06-0"><span>6.</span>弊社サービスについてのアンケート（任意）</a>
          </li>
          <li>
            <a href="#form-website"><span>7.</span>弊社ホームページについてのアンケート（任意）</a>
          </li>
        </ul>
      </div>

      <hr>

      <!-- <p><span class="text-danger">*</span>は、必須入力項目になります。</p> -->

      <!-- <hr> -->

      <div id="fragment_01">
        <h3 class="fragment-title" class="fragment-title">パスポート情報（<span class="text-danger">必須</span>）</h3 class="fragment-title">
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）<span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <input type="hidden" name="cli_id_1" value="{if !empty($cli_id_1)}{$cli_id_1}{/if}">
            <span class="name_roman_letter">{if !empty($cli_name_el_1)}{$cli_name_el_1}{/if}</span>
            <input type="hidden" name="cli_name_el_1" value="{if !empty($cli_name_el_1)}{$cli_name_el_1}{/if}" required
              data-error="Sei は必須入力です" />
            <div class="help-block with-errors"></div>
          </div>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <span class="name_roman_letter">{if !empty($cli_name_ef_1)}{$cli_name_ef_1}{/if}</span>
            <input type="hidden" name="cli_name_ef_1" value="{if !empty($cli_name_ef_1)}{$cli_name_ef_1}{/if}" required
              data-error="Mei は必須入力です" />
            <div class="help-block with-errors"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <label class="radio-inline"><input type="radio" name="nation_sw_1" value="1" {if !empty($nation_sw_1) and
                $nation_sw_1 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input type="radio"
                name="nation_sw_1" value="2" {if !empty($nation_sw_1) and $nation_sw_1 eq '2' }checked="checked" {/if}>他
                </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="nation_txt_1" value="{if !empty($nation_txt_1)}{$nation_txt_1}{/if}"
                placeholder="国名" maxlength="20">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <input class="form-control" type="date" name="birth_date_1" value="{if !empty($birth_date_1)}{$birth_date_1}{/if}"
              required data-error="生年月日 は必須入力です" onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
            <div class="help-block with-errors"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <label class="radio-inline"><input type="radio" name="sex_1" value="1" {if !empty($sex_1) and $sex_1 eq '1'
                }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_1" value="2"
                {if !empty($sex_1) and $sex_1 eq '2' }checked="checked" {/if}>女性 </label> <div class="help-block with-errors"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <input class="form-control" type="text" name="pass_txt_1" value="{if !empty($pass_txt_1)}{$pass_txt_1}{/if}"
            placeholder="TR0000001（半角アルファベット2文字と数字7桁）" required data-error="旅券番号 は必須入力です（半角アルファベット2文字と数字7桁）"
            data-minlength="9" maxlength="9">
          <div class="help-block with-errors"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <input class="form-control" type="date" name="pass_date_s_1" value="{if !empty($pass_date_s_1)}{$pass_date_s_1}{/if}"
            required data-error="発行年月日 は必須入力です" onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
          <div class="help-block with-errors"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <input class="form-control" type="date" name="pass_date_e_1" value="{if !empty($pass_date_e_1)}{$pass_date_e_1}{/if}"
            required data-error="有効期限満了日 は必須入力です" onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
          <div class="help-block with-errors"></div>
        </div>
      </div>
  </div>


  <hr>


  <div id="fragment_02">
    <h3 class="fragment-title">2人目情報（<span class="text-danger">2名様の場合は必須</span>）</h3 class="fragment-title">

    <div class="form-group">
      <div class="col-sm-1 col-md-2"></div>
      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <input type="hidden" name="cli_id_2" value="{if !empty($cli_id_2)}{$cli_id_2}{/if}">
        <input type="text" class="form-control" name="cli_name_l_2" value="{if !empty($cli_name_l_2)}{$cli_name_l_2}{/if}"
          placeholder="姓" maxlength="20">
      </div>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <input type="text" class="form-control" name="cli_name_f_2" value="{if !empty($cli_name_f_2)}{$cli_name_f_2}{/if}"
          placeholder="名" maxlength="20">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1 col-md-2"></div>
      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <span class="name_roman_letter">{if !empty($cli_name_el_2)}{$cli_name_el_2}{/if}</span>
        <input type="hidden" name="cli_name_el_2" value="{if !empty($cli_name_el_2)}{$cli_name_el_2}{/if}" />
      </div>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <span class="name_roman_letter">{if !empty($cli_name_ef_2)}{$cli_name_ef_2}{/if}</span>
        <input type="hidden" name="cli_name_ef_2" value="{if !empty($cli_name_ef_2)}{$cli_name_ef_2}{/if}" />
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1 col-md-2"></div>
      <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">フリガナ</label>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <input type="text" class="form-control" name="cli_name_kl_2" value="{if !empty($cli_name_kl_2)}{$cli_name_kl_2}{/if}"
          placeholder="セイ" maxlength="20">
      </div>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <input type="text" class="form-control" name="cli_name_kf_2" value="{if !empty($cli_name_kf_2)}{$cli_name_kf_2}{/if}"
          placeholder="メイ" maxlength="20">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1 col-md-2"></div>
      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
      <div class="col col-xs-6 col-sm-3 col-md-3">
        <label class="radio-inline"><input type="radio" name="nation_sw_2" value="1" {if !empty($nation_sw_2) and
            $nation_sw_2 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input type="radio"
            name="nation_sw_2" value="2" {if !empty($nation_sw_2) and $nation_sw_2 eq '2' }checked="checked" {/if}>他 </label>
            </div> <div class="col col-xs-6 col-sm-3 col-md-3">
          <input type="text" class="form-control" name="nation_txt_2" value="{if !empty($nation_txt_2)}{$nation_txt_2}{/if}"
            placeholder="国名" maxlength="20">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1 col-md-2"></div>
      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
      <div class="col col-xs-12 col-sm-6 col-md-6">
        <input class="form-control" type="date" name="birth_date_2" value="{if !empty($birth_date_2)}{$birth_date_2}{/if}"
          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1 col-md-2"></div>
      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
      <div class="col col-xs-12 col-sm-6 col-md-6">
        <label class="radio-inline"><input type="radio" name="sex_2" value="1" {if !empty($sex_2) and $sex_2 eq '1'
            }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_2" value="2"
            {if !empty($sex_2) and $sex_2 eq '2' }checked="checked" {/if}>女性 </label> </div> </div> <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <input type="text" class="form-control" name="pass_txt_2" value="{if !empty($pass_txt_2)}{$pass_txt_2}{/if}"
              placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
          </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <input class="form-control" type="date" name="pass_date_s_2" value="{if !empty($pass_date_s_2)}{$pass_date_s_2}{/if}"
            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <input class="form-control" type="date" name="pass_date_e_2" value="{if !empty($pass_date_e_2)}{$pass_date_e_2}{/if}"
            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">メールアドレス</label>
        <div class="col-xs-12 col-sm-6 col-md-6">
          <input type="text" class="form-control" name="cli_mail_2" value="{if !empty($cli_mail_2)}{$cli_mail_2}{/if}"
            placeholder="abc@i.softbank.jp">
          <div class="help-block with-errors"></div>
        </div>
      </div>

      <hr>
    </div>


    <div id="fragment_02-1">
      <h3 class="fragment-title">3人目情報（<span class="text-danger">3名様の場合は必須</span>）</h3 class="fragment-title">

      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <input type="hidden" name="cli_id_3" value="{if !empty($cli_id_3)}{$cli_id_3}{/if}">
          <input type="text" class="form-control" name="cli_name_l_3" value="{if !empty($cli_name_l_3)}{$cli_name_l_3}{/if}"
            placeholder="姓" maxlength="20">
        </div>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <input type="text" class="form-control" name="cli_name_f_3" value="{if !empty($cli_name_f_3)}{$cli_name_f_3}{/if}"
            placeholder="名" maxlength="20">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <span class="name_roman_letter">{if !empty($cli_name_el_3)}{$cli_name_el_3}{/if}</span>
          <input type="hidden" name="cli_name_el_3" value="{if !empty($cli_name_el_3)}{$cli_name_el_3}{/if}" />
        </div>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <span class="name_roman_letter">{if !empty($cli_name_ef_3)}{$cli_name_ef_3}{/if}</span>
          <input type="hidden" name="cli_name_ef_3" value="{if !empty($cli_name_ef_3)}{$cli_name_ef_3}{/if}" />
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">フリガナ</label>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <input type="text" class="form-control" name="cli_name_kl_3" value="{if !empty($cli_name_kl_3)}{$cli_name_kl_3}{/if}"
            placeholder="セイ" maxlength="20">
        </div>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <input type="text" class="form-control" name="cli_name_kf_3" value="{if !empty($cli_name_kf_3)}{$cli_name_kf_3}{/if}"
            placeholder="メイ" maxlength="20">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-6 col-sm-3 col-md-3">
          <label class="radio-inline"><input type="radio" name="nation_sw_3" value="1" {if !empty($nation_sw_3) and
              $nation_sw_3 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input type="radio"
              name="nation_sw_3" value="2" {if !empty($nation_sw_3) and $nation_sw_3 eq '2' }checked="checked" {/if}>他
              </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
            <input type="text" class="form-control" name="nation_txt_3" value="{if !empty($nation_txt_3)}{$nation_txt_3}{/if}"
              placeholder="国名" maxlength="20">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <input class="form-control" type="date" name="birth_date_3" value="{if !empty($birth_date_3)}{$birth_date_3}{/if}"
            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-1 col-md-2"></div>
        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
        <div class="col col-xs-12 col-sm-6 col-md-6">
          <label class="radio-inline"><input type="radio" name="sex_3" value="1" {if !empty($sex_3) and $sex_3 eq '1'
              }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_3" value="2"
              {if !empty($sex_3) and $sex_3 eq '2' }checked="checked" {/if}>女性 </label> </div> </div> <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-12 col-sm-6 col-md-6">
              <input type="text" class="form-control" name="pass_txt_3" value="{if !empty($pass_txt_3)}{$pass_txt_3}{/if}"
                placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
            </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <input class="form-control" type="date" name="pass_date_s_3" value="{if !empty($pass_date_s_3)}{$pass_date_s_3}{/if}"
              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <input class="form-control" type="date" name="pass_date_e_3" value="{if !empty($pass_date_e_3)}{$pass_date_e_3}{/if}"
              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">メールアドレス</label>
          <div class="col-xs-12 col-sm-6 col-md-6">
            <input type="text" class="form-control" name="cli_mail_3" value="{if !empty($cli_mail_3)}{$cli_mail_3}{/if}"
              placeholder="abc@i.softbank.jp">
            <div class="help-block with-errors"></div>
          </div>
        </div>

        <hr>
      </div>


      <div id="fragment_02-2">
        <h3 class="fragment-title">4人目情報（<span class="text-danger">4名様の場合は必須</span>）</h3 class="fragment-title">

        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <input type="hidden" name="cli_id_4" value="{if !empty($cli_id_4)}{$cli_id_4}{/if}">
            <input type="text" class="form-control" name="cli_name_l_4" value="{if !empty($cli_name_l_4)}{$cli_name_l_4}{/if}"
              placeholder="姓" maxlength="20">
          </div>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <input type="text" class="form-control" name="cli_name_f_4" value="{if !empty($cli_name_f_4)}{$cli_name_f_4}{/if}"
              placeholder="名" maxlength="20">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <span class="name_roman_letter">{if !empty($cli_name_el_4)}{$cli_name_el_4}{/if}</span>
            <input type="hidden" name="cli_name_el_4" value="{if !empty($cli_name_el_4)}{$cli_name_el_4}{/if}" />
          </div>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <span class="name_roman_letter">{if !empty($cli_name_ef_4)}{$cli_name_ef_4}{/if}</span>
            <input type="hidden" name="cli_name_ef_4" value="{if !empty($cli_name_ef_4)}{$cli_name_ef_4}{/if}" />
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <input type="text" class="form-control" name="cli_name_kl_4" value="{if !empty($cli_name_kl_4)}{$cli_name_kl_4}{/if}"
              placeholder="セイ" maxlength="20">
          </div>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <input type="text" class="form-control" name="cli_name_kf_4" value="{if !empty($cli_name_kf_4)}{$cli_name_kf_4}{/if}"
              placeholder="メイ" maxlength="20">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-6 col-sm-3 col-md-3">
            <label class="radio-inline"><input type="radio" name="nation_sw_4" value="1" {if !empty($nation_sw_4) and
                $nation_sw_4 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input type="radio"
                name="nation_sw_4" value="2" {if !empty($nation_sw_4) and $nation_sw_4 eq '2' }checked="checked" {/if}>他
                </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="nation_txt_4" value="{if !empty($nation_txt_4)}{$nation_txt_4}{/if}"
                placeholder="国名" maxlength="20">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <input class="form-control" type="date" name="birth_date_4" value="{if !empty($birth_date_4)}{$birth_date_4}{/if}"
              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-1 col-md-2"></div>
          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
          <div class="col col-xs-12 col-sm-6 col-md-6">
            <label class="radio-inline"><input type="radio" name="sex_4" value="1" {if !empty($sex_4) and $sex_4 eq '1'
                }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_4" value="2"
                {if !empty($sex_4) and $sex_4 eq '2' }checked="checked" {/if}>女性 </label> </div> </div> <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-12 col-sm-6 col-md-6">
                <input type="text" class="form-control" name="pass_txt_4" value="{if !empty($pass_txt_4)}{$pass_txt_4}{/if}"
                  placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
              </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-12 col-sm-6 col-md-6">
              <input class="form-control" type="date" name="pass_date_s_4" value="{if !empty($pass_date_s_4)}{$pass_date_s_4}{/if}"
                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-12 col-sm-6 col-md-6">
              <input class="form-control" type="date" name="pass_date_e_4" value="{if !empty($pass_date_e_4)}{$pass_date_e_4}{/if}"
                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
            <div class="col-xs-12 col-sm-6 col-md-6">
              <input type="text" class="form-control" name="cli_mail_4" value="{if !empty($cli_mail_4)}{$cli_mail_4}{/if}"
                placeholder="abc@i.softbank.jp">
              <div class="help-block with-errors"></div>
            </div>
          </div>

          <hr>
        </div>


        <div id="fragment_02-3">
          <h3 class="fragment-title">5人目情報（<span class="text-danger">5名様の場合は必須</span>）</h3 class="fragment-title">

          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="hidden" name="cli_id_5" value="{if !empty($cli_id_5)}{$cli_id_5}{/if}">
              <input type="text" class="form-control" name="cli_name_l_5" value="{if !empty($cli_name_l_5)}{$cli_name_l_5}{/if}"
                placeholder="姓" maxlength="20">
            </div>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="cli_name_f_5" value="{if !empty($cli_name_f_5)}{$cli_name_f_5}{/if}"
                placeholder="名" maxlength="20">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <span class="name_roman_letter">{if !empty($cli_name_el_5)}{$cli_name_el_5}{/if}</span>
              <input type="hidden" name="cli_name_el_5" value="{if !empty($cli_name_el_5)}{$cli_name_el_5}{/if}" />
            </div>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <span class="name_roman_letter">{if !empty($cli_name_ef_5)}{$cli_name_ef_5}{/if}</span>
              <input type="hidden" name="cli_name_ef_5" value="{if !empty($cli_name_ef_5)}{$cli_name_ef_5}{/if}" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="cli_name_kl_5" value="{if !empty($cli_name_kl_5)}{$cli_name_kl_5}{/if}"
                placeholder="セイ" maxlength="20">
            </div>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="cli_name_kf_5" value="{if !empty($cli_name_kf_5)}{$cli_name_kf_5}{/if}"
                placeholder="メイ" maxlength="20">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <label class="radio-inline"><input type="radio" name="nation_sw_5" value="1" {if !empty($nation_sw_5) and
                  $nation_sw_5 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input type="radio"
                  name="nation_sw_5" value="2" {if !empty($nation_sw_5) and $nation_sw_5 eq '2' }checked="checked" {/if}>他
                  </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                <input type="text" class="form-control" name="nation_txt_5" value="{if !empty($nation_txt_5)}{$nation_txt_5}{/if}"
                  placeholder="国名" maxlength="20">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-12 col-sm-6 col-md-6">
              <input class="form-control" type="date" name="birth_date_5" value="{if !empty($birth_date_5)}{$birth_date_5}{/if}"
                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-1 col-md-2"></div>
            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
            <div class="col col-xs-12 col-sm-6 col-md-6">
              <label class="radio-inline"><input type="radio" name="sex_5" value="1" {if !empty($sex_5) and $sex_5 eq
                  '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_5"
                  value="2" {if !empty($sex_5) and $sex_5 eq '2' }checked="checked" {/if}>女性 </label> </div> </div>
                  <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-12 col-sm-6 col-md-6">
                  <input type="text" class="form-control" name="pass_txt_5" value="{if !empty($pass_txt_5)}{$pass_txt_5}{/if}"
                    placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-12 col-sm-6 col-md-6">
                <input class="form-control" type="date" name="pass_date_s_5" value="{if !empty($pass_date_s_5)}{$pass_date_s_5}{/if}"
                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-12 col-sm-6 col-md-6">
                <input class="form-control" type="date" name="pass_date_e_5" value="{if !empty($pass_date_e_5)}{$pass_date_e_5}{/if}"
                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
              <div class="col-xs-12 col-sm-6 col-md-6">
                <input type="text" class="form-control" name="cli_mail_5" value="{if !empty($cli_mail_5)}{$cli_mail_5}{/if}"
                  placeholder="abc@i.softbank.jp">
                <div class="help-block with-errors"></div>
              </div>
            </div>

            <hr>
          </div>


          <div id="fragment_02-4">
            <h3 class="fragment-title">6人目情報（<span class="text-danger">6名様の場合は必須</span>）</h3 class="fragment-title">

            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <input type="hidden" name="cli_id_6" value="{if !empty($cli_id_6)}{$cli_id_6}{/if}">
                <input type="text" class="form-control" name="cli_name_l_6" value="{if !empty($cli_name_l_6)}{$cli_name_l_6}{/if}"
                  placeholder="姓" maxlength="20">
              </div>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <input type="text" class="form-control" name="cli_name_f_6" value="{if !empty($cli_name_f_6)}{$cli_name_f_6}{/if}"
                  placeholder="名" maxlength="20">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <span class="name_roman_letter">{if !empty($cli_name_el_6)}{$cli_name_el_6}{/if}</span>
                <input type="hidden" name="cli_name_el_6" value="{if !empty($cli_name_el_6)}{$cli_name_el_6}{/if}" />
              </div>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <span class="name_roman_letter">{if !empty($cli_name_ef_6)}{$cli_name_ef_6}{/if}</span>
                <input type="hidden" name="cli_name_ef_6" value="{if !empty($cli_name_ef_6)}{$cli_name_ef_6}{/if}" />
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <input type="text" class="form-control" name="cli_name_kl_6" value="{if !empty($cli_name_kl_6)}{$cli_name_kl_6}{/if}"
                  placeholder="セイ" maxlength="20">
              </div>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <input type="text" class="form-control" name="cli_name_kf_6" value="{if !empty($cli_name_kf_6)}{$cli_name_kf_6}{/if}"
                  placeholder="メイ" maxlength="20">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-6 col-sm-3 col-md-3">
                <label class="radio-inline"><input type="radio" name="nation_sw_6" value="1" {if !empty($nation_sw_6)
                    and $nation_sw_6 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                    type="radio" name="nation_sw_6" value="2" {if !empty($nation_sw_6) and $nation_sw_6 eq '2' }checked="checked"
                    {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                  <input type="text" class="form-control" name="nation_txt_6" value="{if !empty($nation_txt_6)}{$nation_txt_6}{/if}"
                    placeholder="国名" maxlength="20">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-12 col-sm-6 col-md-6">
                <input class="form-control" type="date" name="birth_date_6" value="{if !empty($birth_date_6)}{$birth_date_6}{/if}"
                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-1 col-md-2"></div>
              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
              <div class="col col-xs-12 col-sm-6 col-md-6">
                <label class="radio-inline"><input type="radio" name="sex_6" value="1" {if !empty($sex_6) and $sex_6 eq
                    '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_6"
                    value="2" {if !empty($sex_6) and $sex_6 eq '2' }checked="checked" {/if}>女性 </label> </div> </div>
                    <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-12 col-sm-6 col-md-6">
                    <input type="text" class="form-control" name="pass_txt_6" value="{if !empty($pass_txt_6)}{$pass_txt_6}{/if}"
                      placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                  </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-12 col-sm-6 col-md-6">
                  <input class="form-control" type="date" name="pass_date_s_6" value="{if !empty($pass_date_s_6)}{$pass_date_s_6}{/if}"
                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-12 col-sm-6 col-md-6">
                  <input class="form-control" type="date" name="pass_date_e_6" value="{if !empty($pass_date_e_6)}{$pass_date_e_6}{/if}"
                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <input type="text" class="form-control" name="cli_mail_6" value="{if !empty($cli_mail_6)}{$cli_mail_6}{/if}"
                    placeholder="abc@i.softbank.jp">
                  <div class="help-block with-errors"></div>
                </div>
              </div>

              <hr>
            </div>


            <div id="fragment_02-5">
              <h3 class="fragment-title">7人目情報（<span class="text-danger">7名様の場合は必須</span>）</h3 class="fragment-title">

              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <input type="hidden" name="cli_id_7" value="{if !empty($cli_id_7)}{$cli_id_7}{/if}">
                  <input type="text" class="form-control" name="cli_name_l_7" value="{if !empty($cli_name_l_7)}{$cli_name_l_7}{/if}"
                    placeholder="姓" maxlength="20">
                </div>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <input type="text" class="form-control" name="cli_name_f_7" value="{if !empty($cli_name_f_7)}{$cli_name_f_7}{/if}"
                    placeholder="名" maxlength="20">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <span class="name_roman_letter">{if !empty($cli_name_el_7)}{$cli_name_el_7}{/if}</span>
                  <input type="hidden" name="cli_name_el_7" value="{if !empty($cli_name_el_7)}{$cli_name_el_7}{/if}" />
                </div>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <span class="name_roman_letter">{if !empty($cli_name_ef_7)}{$cli_name_ef_7}{/if}</span>
                  <input type="hidden" name="cli_name_ef_7" value="{if !empty($cli_name_ef_7)}{$cli_name_ef_7}{/if}" />
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <input type="text" class="form-control" name="cli_name_kl_7" value="{if !empty($cli_name_kl_7)}{$cli_name_kl_7}{/if}"
                    placeholder="セイ" maxlength="20">
                </div>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <input type="text" class="form-control" name="cli_name_kf_7" value="{if !empty($cli_name_kf_7)}{$cli_name_kf_7}{/if}"
                    placeholder="メイ" maxlength="20">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-6 col-sm-3 col-md-3">
                  <label class="radio-inline"><input type="radio" name="nation_sw_7" value="1" {if !empty($nation_sw_7)
                      and $nation_sw_7 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                      type="radio" name="nation_sw_7" value="2" {if !empty($nation_sw_7) and $nation_sw_7 eq '2'
                      }checked="checked" {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                    <input type="text" class="form-control" name="nation_txt_7" value="{if !empty($nation_txt_7)}{$nation_txt_7}{/if}"
                      placeholder="国名" maxlength="20">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-12 col-sm-6 col-md-6">
                  <input class="form-control" type="date" name="birth_date_7" value="{if !empty($birth_date_7)}{$birth_date_7}{/if}"
                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-1 col-md-2"></div>
                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                <div class="col col-xs-12 col-sm-6 col-md-6">
                  <label class="radio-inline"><input type="radio" name="sex_7" value="1" {if !empty($sex_7) and $sex_7
                      eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio" name="sex_7"
                      value="2" {if !empty($sex_7) and $sex_7 eq '2' }checked="checked" {/if}>女性 </label> </div> </div>
                      <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-12 col-sm-6 col-md-6">
                      <input type="text" class="form-control" name="pass_txt_7" value="{if !empty($pass_txt_7)}{$pass_txt_7}{/if}"
                        placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                    </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-12 col-sm-6 col-md-6">
                    <input class="form-control" type="date" name="pass_date_s_7" value="{if !empty($pass_date_s_7)}{$pass_date_s_7}{/if}"
                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                      data-date-error="1999-01-01 の形式で入力して下さい">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-12 col-sm-6 col-md-6">
                    <input class="form-control" type="date" name="pass_date_e_7" value="{if !empty($pass_date_e_7)}{$pass_date_e_7}{/if}"
                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                      data-date-error="1999-01-01 の形式で入力して下さい">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                  <div class="col-xs-12 col-sm-6 col-md-6">
                    <input type="text" class="form-control" name="cli_mail_7" value="{if !empty($cli_mail_7)}{$cli_mail_7}{/if}"
                      placeholder="abc@i.softbank.jp">
                    <div class="help-block with-errors"></div>
                  </div>
                </div>

                <hr>
              </div>


              <div id="fragment_02-6">
                <h3 class="fragment-title">8人目情報（<span class="text-danger">8名様の場合は必須</span>）</h3 class="fragment-title">

                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <input type="hidden" name="cli_id_8" value="{if !empty($cli_id_8)}{$cli_id_8}{/if}">
                    <input type="text" class="form-control" name="cli_name_l_8" value="{if !empty($cli_name_l_8)}{$cli_name_l_8}{/if}"
                      placeholder="姓" maxlength="20">
                  </div>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <input type="text" class="form-control" name="cli_name_f_8" value="{if !empty($cli_name_f_8)}{$cli_name_f_8}{/if}"
                      placeholder="名" maxlength="20">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <span class="name_roman_letter">{if !empty($cli_name_el_8)}{$cli_name_el_8}{/if}</span>
                    <input type="hidden" name="cli_name_el_8" value="{if !empty($cli_name_el_8)}{$cli_name_el_8}{/if}" />
                  </div>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <span class="name_roman_letter">{if !empty($cli_name_ef_8)}{$cli_name_ef_8}{/if}</span>
                    <input type="hidden" name="cli_name_ef_8" value="{if !empty($cli_name_ef_8)}{$cli_name_ef_8}{/if}" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <input type="text" class="form-control" name="cli_name_kl_8" value="{if !empty($cli_name_kl_8)}{$cli_name_kl_8}{/if}"
                      placeholder="セイ" maxlength="20">
                  </div>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <input type="text" class="form-control" name="cli_name_kf_8" value="{if !empty($cli_name_kf_8)}{$cli_name_kf_8}{/if}"
                      placeholder="メイ" maxlength="20">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-6 col-sm-3 col-md-3">
                    <label class="radio-inline"><input type="radio" name="nation_sw_8" value="1" {if
                        !empty($nation_sw_8) and $nation_sw_8 eq '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                        type="radio" name="nation_sw_8" value="2" {if !empty($nation_sw_8) and $nation_sw_8 eq '2'
                        }checked="checked" {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                      <input type="text" class="form-control" name="nation_txt_8" value="{if !empty($nation_txt_8)}{$nation_txt_8}{/if}"
                        placeholder="国名" maxlength="20">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-12 col-sm-6 col-md-6">
                    <input class="form-control" type="date" name="birth_date_8" value="{if !empty($birth_date_8)}{$birth_date_8}{/if}"
                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                      data-date-error="1999-01-01 の形式で入力して下さい">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-1 col-md-2"></div>
                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                  <div class="col col-xs-12 col-sm-6 col-md-6">
                    <label class="radio-inline"><input type="radio" name="sex_8" value="1" {if !empty($sex_8) and
                        $sex_8 eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio"
                        name="sex_8" value="2" {if !empty($sex_8) and $sex_8 eq '2' }checked="checked" {/if}>女性 </label>
                        </div> </div> <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-12 col-sm-6 col-md-6">
                        <input type="text" class="form-control" name="pass_txt_8" value="{if !empty($pass_txt_8)}{$pass_txt_8}{/if}"
                          placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                      </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-12 col-sm-6 col-md-6">
                      <input class="form-control" type="date" name="pass_date_s_8" value="{if !empty($pass_date_s_8)}{$pass_date_s_8}{/if}"
                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                        data-date-error="1999-01-01 の形式で入力して下さい">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-12 col-sm-6 col-md-6">
                      <input class="form-control" type="date" name="pass_date_e_8" value="{if !empty($pass_date_e_8)}{$pass_date_e_8}{/if}"
                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                        data-date-error="1999-01-01 の形式で入力して下さい">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                    <div class="col-xs-12 col-sm-6 col-md-6">
                      <input type="text" class="form-control" name="cli_mail_8" value="{if !empty($cli_mail_8)}{$cli_mail_8}{/if}"
                        placeholder="abc@i.softbank.jp">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>

                  <hr>
                </div>


                <div id="fragment_02-7">
                  <h3 class="fragment-title">9人目情報（<span class="text-danger">9名様の場合は必須</span>）</h3 class="fragment-title">

                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <input type="hidden" name="cli_id_9" value="{if !empty($cli_id_9)}{$cli_id_9}{/if}">
                      <input type="text" class="form-control" name="cli_name_l_9" value="{if !empty($cli_name_l_9)}{$cli_name_l_9}{/if}"
                        placeholder="姓" maxlength="20">
                    </div>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <input type="text" class="form-control" name="cli_name_f_9" value="{if !empty($cli_name_f_9)}{$cli_name_f_9}{/if}"
                        placeholder="名" maxlength="20">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <span class="name_roman_letter">{if !empty($cli_name_el_9)}{$cli_name_el_9}{/if}</span>
                      <input type="hidden" name="cli_name_el_9" value="{if !empty($cli_name_el_9)}{$cli_name_el_9}{/if}" />
                    </div>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <span class="name_roman_letter">{if !empty($cli_name_ef_9)}{$cli_name_ef_9}{/if}</span>
                      <input type="hidden" name="cli_name_ef_9" value="{if !empty($cli_name_ef_9)}{$cli_name_ef_9}{/if}" />
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <input type="text" class="form-control" name="cli_name_kl_9" value="{if !empty($cli_name_kl_9)}{$cli_name_kl_9}{/if}"
                        placeholder="セイ" maxlength="20">
                    </div>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <input type="text" class="form-control" name="cli_name_kf_9" value="{if !empty($cli_name_kf_9)}{$cli_name_kf_9}{/if}"
                        placeholder="メイ" maxlength="20">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-6 col-sm-3 col-md-3">
                      <label class="radio-inline"><input type="radio" name="nation_sw_9" value="1" {if
                          !empty($nation_sw_9) and $nation_sw_9 eq '1' }checked="checked" {/if}>日本 </label> <label
                          class="radio-inline"><input type="radio" name="nation_sw_9" value="2" {if
                          !empty($nation_sw_9) and $nation_sw_9 eq '2' }checked="checked" {/if}>他 </label> </div> <div
                          class="col col-xs-6 col-sm-3 col-md-3">
                        <input type="text" class="form-control" name="nation_txt_9" value="{if !empty($nation_txt_9)}{$nation_txt_9}{/if}"
                          placeholder="国名" maxlength="20">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-12 col-sm-6 col-md-6">
                      <input class="form-control" type="date" name="birth_date_9" value="{if !empty($birth_date_9)}{$birth_date_9}{/if}"
                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                        data-date-error="1999-01-01 の形式で入力して下さい">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-1 col-md-2"></div>
                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                    <div class="col col-xs-12 col-sm-6 col-md-6">
                      <label class="radio-inline"><input type="radio" name="sex_9" value="1" {if !empty($sex_9) and
                          $sex_9 eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio"
                          name="sex_9" value="2" {if !empty($sex_9) and $sex_9 eq '2' }checked="checked" {/if}>女性 </label>
                          </div> </div> <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-12 col-sm-6 col-md-6">
                          <input type="text" class="form-control" name="pass_txt_9" value="{if !empty($pass_txt_9)}{$pass_txt_9}{/if}"
                            placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                        </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-12 col-sm-6 col-md-6">
                        <input class="form-control" type="date" name="pass_date_s_9" value="{if !empty($pass_date_s_9)}{$pass_date_s_9}{/if}"
                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                          data-date-error="1999-01-01 の形式で入力して下さい">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-12 col-sm-6 col-md-6">
                        <input class="form-control" type="date" name="pass_date_e_9" value="{if !empty($pass_date_e_9)}{$pass_date_e_9}{/if}"
                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                          data-date-error="1999-01-01 の形式で入力して下さい">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                      <div class="col-xs-12 col-sm-6 col-md-6">
                        <input type="text" class="form-control" name="cli_mail_9" value="{if !empty($cli_mail_9)}{$cli_mail_9}{/if}"
                          placeholder="abc@i.softbank.jp">
                        <div class="help-block with-errors"></div>
                      </div>
                    </div>

                    <hr>
                  </div>


                  <div id="fragment_02-8">
                    <h3 class="fragment-title">10人目情報（<span class="text-danger">10名様の場合は必須</span>）</h3 class="fragment-title">

                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <input type="hidden" name="cli_id_10" value="{if !empty($cli_id_10)}{$cli_id_10}{/if}">
                        <input type="text" class="form-control" name="cli_name_l_10" value="{if !empty($cli_name_l_10)}{$cli_name_l_10}{/if}"
                          placeholder="姓" maxlength="20">
                      </div>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <input type="text" class="form-control" name="cli_name_f_10" value="{if !empty($cli_name_f_10)}{$cli_name_f_10}{/if}"
                          placeholder="名" maxlength="20">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <span class="name_roman_letter">{if !empty($cli_name_el_10)}{$cli_name_el_10}{/if}</span>
                        <input type="hidden" name="cli_name_el_10" value="{if !empty($cli_name_el_10)}{$cli_name_el_10}{/if}" />
                      </div>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <span class="name_roman_letter">{if !empty($cli_name_ef_10)}{$cli_name_ef_10}{/if}</span>
                        <input type="hidden" name="cli_name_ef_10" value="{if !empty($cli_name_ef_10)}{$cli_name_ef_10}{/if}" />
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <input type="text" class="form-control" name="cli_name_kl_10" value="{if !empty($cli_name_kl_10)}{$cli_name_kl_10}{/if}"
                          placeholder="セイ" maxlength="20">
                      </div>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <input type="text" class="form-control" name="cli_name_kf_10" value="{if !empty($cli_name_kf_10)}{$cli_name_kf_10}{/if}"
                          placeholder="メイ" maxlength="20">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-6 col-sm-3 col-md-3">
                        <label class="radio-inline"><input type="radio" name="nation_sw_10" value="1" {if
                            !empty($nation_sw_10) and $nation_sw_10 eq '1' }checked="checked" {/if}>日本 </label> <label
                            class="radio-inline"><input type="radio" name="nation_sw_10" value="2" {if
                            !empty($nation_sw_10) and $nation_sw_10 eq '2' }checked="checked" {/if}>他 </label> </div>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                          <input type="text" class="form-control" name="nation_txt_10" value="{if !empty($nation_txt_10)}{$nation_txt_10}{/if}"
                            placeholder="国名" maxlength="20">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-12 col-sm-6 col-md-6">
                        <input class="form-control" type="date" name="birth_date_10" value="{if !empty($birth_date_10)}{$birth_date_10}{/if}"
                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                          data-date-error="1999-01-01 の形式で入力して下さい">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-1 col-md-2"></div>
                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                      <div class="col col-xs-12 col-sm-6 col-md-6">
                        <label class="radio-inline"><input type="radio" name="sex_10" value="1" {if !empty($sex_10) and
                            $sex_10 eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input type="radio"
                            name="sex_10" value="2" {if !empty($sex_10) and $sex_10 eq '2' }checked="checked" {/if}>女性
                            </label> </div> </div> <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-12 col-sm-6 col-md-6">
                            <input type="text" class="form-control" name="pass_txt_10" value="{if !empty($pass_txt_10)}{$pass_txt_10}{/if}"
                              placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                          </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-12 col-sm-6 col-md-6">
                          <input class="form-control" type="date" name="pass_date_s_10" value="{if !empty($pass_date_s_10)}{$pass_date_s_10}{/if}"
                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                            data-date-error="1999-01-01 の形式で入力して下さい">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-12 col-sm-6 col-md-6">
                          <input class="form-control" type="date" name="pass_date_e_10" value="{if !empty($pass_date_e_10)}{$pass_date_e_10}{/if}"
                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                            data-date-error="1999-01-01 の形式で入力して下さい">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                          <input type="text" class="form-control" name="cli_mail_10" value="{if !empty($cli_mail_10)}{$cli_mail_10}{/if}"
                            placeholder="abc@i.softbank.jp">
                          <div class="help-block with-errors"></div>
                        </div>
                      </div>

                      <hr>
                    </div>


                    <div id="fragment_02-9">
                      <h3 class="fragment-title">11人目情報（<span class="text-danger">11名様の場合は必須</span>）</h3 class="fragment-title">

                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <input type="hidden" name="cli_id_11" value="{if !empty($cli_id_11)}{$cli_id_11}{/if}">
                          <input type="text" class="form-control" name="cli_name_l_11" value="{if !empty($cli_name_l_11)}{$cli_name_l_11}{/if}"
                            placeholder="姓" maxlength="20">
                        </div>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <input type="text" class="form-control" name="cli_name_f_11" value="{if !empty($cli_name_f_11)}{$cli_name_f_11}{/if}"
                            placeholder="名" maxlength="20">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <span class="name_roman_letter">{if !empty($cli_name_el_11)}{$cli_name_el_11}{/if}</span>
                          <input type="hidden" name="cli_name_el_11" value="{if !empty($cli_name_el_11)}{$cli_name_el_11}{/if}" />
                        </div>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <span class="name_roman_letter">{if !empty($cli_name_ef_11)}{$cli_name_ef_11}{/if}</span>
                          <input type="hidden" name="cli_name_ef_11" value="{if !empty($cli_name_ef_11)}{$cli_name_ef_11}{/if}" />
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <input type="text" class="form-control" name="cli_name_kl_11" value="{if !empty($cli_name_kl_11)}{$cli_name_kl_11}{/if}"
                            placeholder="セイ" maxlength="20">
                        </div>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <input type="text" class="form-control" name="cli_name_kf_11" value="{if !empty($cli_name_kf_11)}{$cli_name_kf_11}{/if}"
                            placeholder="メイ" maxlength="20">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-6 col-sm-3 col-md-3">
                          <label class="radio-inline"><input type="radio" name="nation_sw_11" value="1" {if
                              !empty($nation_sw_11) and $nation_sw_11 eq '1' }checked="checked" {/if}>日本 </label>
                              <label class="radio-inline"><input type="radio" name="nation_sw_11" value="2" {if
                              !empty($nation_sw_11) and $nation_sw_11 eq '2' }checked="checked" {/if}>他 </label> </div>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                            <input type="text" class="form-control" name="nation_txt_11" value="{if !empty($nation_txt_11)}{$nation_txt_11}{/if}"
                              placeholder="国名" maxlength="20">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-12 col-sm-6 col-md-6">
                          <input class="form-control" type="date" name="birth_date_11" value="{if !empty($birth_date_11)}{$birth_date_11}{/if}"
                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                            data-date-error="1999-01-01 の形式で入力して下さい">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-1 col-md-2"></div>
                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                        <div class="col col-xs-12 col-sm-6 col-md-6">
                          <label class="radio-inline"><input type="radio" name="sex_11" value="1" {if !empty($sex_11)
                              and $sex_11 eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input
                              type="radio" name="sex_11" value="2" {if !empty($sex_11) and $sex_11 eq '2' }checked="checked"
                              {/if}>女性 </label> </div> </div> <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-12 col-sm-6 col-md-6">
                              <input type="text" class="form-control" name="pass_txt_11" value="{if !empty($pass_txt_11)}{$pass_txt_11}{/if}"
                                placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                            </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-12 col-sm-6 col-md-6">
                            <input class="form-control" type="date" name="pass_date_s_11" value="{if !empty($pass_date_s_11)}{$pass_date_s_11}{/if}"
                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                              data-date-error="1999-01-01 の形式で入力して下さい">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-12 col-sm-6 col-md-6">
                            <input class="form-control" type="date" name="pass_date_e_11" value="{if !empty($pass_date_e_11)}{$pass_date_e_11}{/if}"
                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                              data-date-error="1999-01-01 の形式で入力して下さい">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                          <div class="col-xs-12 col-sm-6 col-md-6">
                            <input type="text" class="form-control" name="cli_mail_11" value="{if !empty($cli_mail_11)}{$cli_mail_11}{/if}"
                              placeholder="abc@i.softbank.jp">
                            <div class="help-block with-errors"></div>
                          </div>
                        </div>

                        <hr>
                      </div>


                      <div id="fragment_02-10">
                        <h3 class="fragment-title">12人目情報（<span class="text-danger">12名様の場合は必須</span>）</h3 class="fragment-title">

                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <input type="hidden" name="cli_id_12" value="{if !empty($cli_id_12)}{$cli_id_12}{/if}">
                            <input type="text" class="form-control" name="cli_name_l_12" value="{if !empty($cli_name_l_12)}{$cli_name_l_12}{/if}"
                              placeholder="姓" maxlength="20">
                          </div>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <input type="text" class="form-control" name="cli_name_f_12" value="{if !empty($cli_name_f_12)}{$cli_name_f_12}{/if}"
                              placeholder="名" maxlength="20">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <span class="name_roman_letter">{if !empty($cli_name_el_12)}{$cli_name_el_12}{/if}</span>
                            <input type="hidden" name="cli_name_el_12" value="{if !empty($cli_name_el_12)}{$cli_name_el_12}{/if}" />
                          </div>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <span class="name_roman_letter">{if !empty($cli_name_ef_12)}{$cli_name_ef_12}{/if}</span>
                            <input type="hidden" name="cli_name_ef_12" value="{if !empty($cli_name_ef_12)}{$cli_name_ef_12}{/if}" />
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <input type="text" class="form-control" name="cli_name_kl_12" value="{if !empty($cli_name_kl_12)}{$cli_name_kl_12}{/if}"
                              placeholder="セイ" maxlength="20">
                          </div>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <input type="text" class="form-control" name="cli_name_kf_12" value="{if !empty($cli_name_kf_12)}{$cli_name_kf_12}{/if}"
                              placeholder="メイ" maxlength="20">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-6 col-sm-3 col-md-3">
                            <label class="radio-inline"><input type="radio" name="nation_sw_12" value="1" {if
                                !empty($nation_sw_12) and $nation_sw_12 eq '1' }checked="checked" {/if}>日本 </label>
                                <label class="radio-inline"><input type="radio" name="nation_sw_12" value="2" {if
                                !empty($nation_sw_12) and $nation_sw_12 eq '2' }checked="checked" {/if}>他 </label> </div>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                              <input type="text" class="form-control" name="nation_txt_12" value="{if !empty($nation_txt_12)}{$nation_txt_12}{/if}"
                                placeholder="国名" maxlength="20">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-12 col-sm-6 col-md-6">
                            <input class="form-control" type="date" name="birth_date_12" value="{if !empty($birth_date_12)}{$birth_date_12}{/if}"
                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                              data-date-error="1999-01-01 の形式で入力して下さい">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-1 col-md-2"></div>
                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                          <div class="col col-xs-12 col-sm-6 col-md-6">
                            <label class="radio-inline"><input type="radio" name="sex_12" value="1" {if !empty($sex_12)
                                and $sex_12 eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input
                                type="radio" name="sex_12" value="2" {if !empty($sex_12) and $sex_12 eq '2' }checked="checked"
                                {/if}>女性 </label> </div> </div> <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                <input type="text" class="form-control" name="pass_txt_12" value="{if !empty($pass_txt_12)}{$pass_txt_12}{/if}"
                                  placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                              </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-12 col-sm-6 col-md-6">
                              <input class="form-control" type="date" name="pass_date_s_12" value="{if !empty($pass_date_s_12)}{$pass_date_s_12}{/if}"
                                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                data-date-error="1999-01-01 の形式で入力して下さい">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-12 col-sm-6 col-md-6">
                              <input class="form-control" type="date" name="pass_date_e_12" value="{if !empty($pass_date_e_12)}{$pass_date_e_12}{/if}"
                                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                data-date-error="1999-01-01 の形式で入力して下さい">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                            <div class="col-xs-12 col-sm-6 col-md-6">
                              <input type="text" class="form-control" name="cli_mail_12" value="{if !empty($cli_mail_12)}{$cli_mail_12}{/if}"
                                placeholder="abc@i.softbank.jp">
                              <div class="help-block with-errors"></div>
                            </div>
                          </div>

                          <hr>
                        </div>


                        <div id="fragment_02-11">
                          <h3 class="fragment-title">13人目情報（<span class="text-danger">13名様の場合は必須</span>）</h3 class="fragment-title">

                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <input type="hidden" name="cli_id_13" value="{if !empty($cli_id_13)}{$cli_id_13}{/if}">
                              <input type="text" class="form-control" name="cli_name_l_13" value="{if !empty($cli_name_l_13)}{$cli_name_l_13}{/if}"
                                placeholder="姓" maxlength="20">
                            </div>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <input type="text" class="form-control" name="cli_name_f_13" value="{if !empty($cli_name_f_13)}{$cli_name_f_13}{/if}"
                                placeholder="名" maxlength="20">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <span class="name_roman_letter">{if !empty($cli_name_el_13)}{$cli_name_el_13}{/if}</span>
                              <input type="hidden" name="cli_name_el_13" value="{if !empty($cli_name_el_13)}{$cli_name_el_13}{/if}" />
                            </div>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <span class="name_roman_letter">{if !empty($cli_name_ef_13)}{$cli_name_ef_13}{/if}</span>
                              <input type="hidden" name="cli_name_ef_13" value="{if !empty($cli_name_ef_13)}{$cli_name_ef_13}{/if}" />
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <input type="text" class="form-control" name="cli_name_kl_13" value="{if !empty($cli_name_kl_13)}{$cli_name_kl_13}{/if}"
                                placeholder="セイ" maxlength="20">
                            </div>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <input type="text" class="form-control" name="cli_name_kf_13" value="{if !empty($cli_name_kf_13)}{$cli_name_kf_13}{/if}"
                                placeholder="メイ" maxlength="20">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-6 col-sm-3 col-md-3">
                              <label class="radio-inline"><input type="radio" name="nation_sw_13" value="1" {if
                                  !empty($nation_sw_13) and $nation_sw_13 eq '1' }checked="checked" {/if}>日本 </label>
                                  <label class="radio-inline"><input type="radio" name="nation_sw_13" value="2" {if
                                  !empty($nation_sw_13) and $nation_sw_13 eq '2' }checked="checked" {/if}>他 </label> </div>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                <input type="text" class="form-control" name="nation_txt_13" value="{if !empty($nation_txt_13)}{$nation_txt_13}{/if}"
                                  placeholder="国名" maxlength="20">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-12 col-sm-6 col-md-6">
                              <input class="form-control" type="date" name="birth_date_13" value="{if !empty($birth_date_13)}{$birth_date_13}{/if}"
                                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                data-date-error="1999-01-01 の形式で入力して下さい">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-1 col-md-2"></div>
                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                            <div class="col col-xs-12 col-sm-6 col-md-6">
                              <label class="radio-inline"><input type="radio" name="sex_13" value="1" {if
                                  !empty($sex_13) and $sex_13 eq '1' }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input
                                  type="radio" name="sex_13" value="2" {if !empty($sex_13) and $sex_13 eq '2' }checked="checked"
                                  {/if}>女性 </label> </div> </div> <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                  <input type="text" class="form-control" name="pass_txt_13" value="{if !empty($pass_txt_13)}{$pass_txt_13}{/if}"
                                    placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                <input class="form-control" type="date" name="pass_date_s_13" value="{if !empty($pass_date_s_13)}{$pass_date_s_13}{/if}"
                                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                  data-date-error="1999-01-01 の形式で入力して下さい">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                <input class="form-control" type="date" name="pass_date_e_13" value="{if !empty($pass_date_e_13)}{$pass_date_e_13}{/if}"
                                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                  data-date-error="1999-01-01 の形式で入力して下さい">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                              <div class="col-xs-12 col-sm-6 col-md-6">
                                <input type="text" class="form-control" name="cli_mail_13" value="{if !empty($cli_mail_13)}{$cli_mail_13}{/if}"
                                  placeholder="abc@i.softbank.jp">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>

                            <hr>
                          </div>


                          <div id="fragment_02-12">
                            <h3 class="fragment-title">14人目情報（<span class="text-danger">14名様の場合は必須</span>）</h3 class="fragment-title">

                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <input type="hidden" name="cli_id_14" value="{if !empty($cli_id_14)}{$cli_id_14}{/if}">
                                <input type="text" class="form-control" name="cli_name_l_14" value="{if !empty($cli_name_l_14)}{$cli_name_l_14}{/if}"
                                  placeholder="姓" maxlength="20">
                              </div>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <input type="text" class="form-control" name="cli_name_f_14" value="{if !empty($cli_name_f_14)}{$cli_name_f_14}{/if}"
                                  placeholder="名" maxlength="20">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <span class="name_roman_letter">{if !empty($cli_name_el_14)}{$cli_name_el_14}{/if}</span>
                                <input type="hidden" name="cli_name_el_14" value="{if !empty($cli_name_el_14)}{$cli_name_el_14}{/if}" />
                              </div>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <span class="name_roman_letter">{if !empty($cli_name_ef_14)}{$cli_name_ef_14}{/if}</span>
                                <input type="hidden" name="cli_name_ef_14" value="{if !empty($cli_name_ef_14)}{$cli_name_ef_14}{/if}" />
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <input type="text" class="form-control" name="cli_name_kl_14" value="{if !empty($cli_name_kl_14)}{$cli_name_kl_14}{/if}"
                                  placeholder="セイ" maxlength="20">
                              </div>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <input type="text" class="form-control" name="cli_name_kf_14" value="{if !empty($cli_name_kf_14)}{$cli_name_kf_14}{/if}"
                                  placeholder="メイ" maxlength="20">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                <label class="radio-inline"><input type="radio" name="nation_sw_14" value="1" {if
                                    !empty($nation_sw_14) and $nation_sw_14 eq '1' }checked="checked" {/if}>日本 </label>
                                    <label class="radio-inline"><input type="radio" name="nation_sw_14" value="2" {if
                                    !empty($nation_sw_14) and $nation_sw_14 eq '2' }checked="checked" {/if}>他 </label>
                                    </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <input type="text" class="form-control" name="nation_txt_14" value="{if !empty($nation_txt_14)}{$nation_txt_14}{/if}"
                                    placeholder="国名" maxlength="20">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                <input class="form-control" type="date" name="birth_date_14" value="{if !empty($birth_date_14)}{$birth_date_14}{/if}"
                                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                  data-date-error="1999-01-01 の形式で入力して下さい">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-1 col-md-2"></div>
                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                <label class="radio-inline"><input type="radio" name="sex_14" value="1" {if
                                    !empty($sex_14) and $sex_14 eq '1' }checked="checked" {/if}>男性 </label> <label
                                    class="radio-inline"><input type="radio" name="sex_14" value="2" {if
                                    !empty($sex_14) and $sex_14 eq '2' }checked="checked" {/if}>女性 </label> </div> </div>
                                    <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                    <input type="text" class="form-control" name="pass_txt_14" value="{if !empty($pass_txt_14)}{$pass_txt_14}{/if}"
                                      placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                  </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                  <input class="form-control" type="date" name="pass_date_s_14" value="{if !empty($pass_date_s_14)}{$pass_date_s_14}{/if}"
                                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                    data-date-error="1999-01-01 の形式で入力して下さい">
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                  <input class="form-control" type="date" name="pass_date_e_14" value="{if !empty($pass_date_e_14)}{$pass_date_e_14}{/if}"
                                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                    data-date-error="1999-01-01 の形式で入力して下さい">
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                  <input type="text" class="form-control" name="cli_mail_14" value="{if !empty($cli_mail_14)}{$cli_mail_14}{/if}"
                                    placeholder="abc@i.softbank.jp">
                                  <div class="help-block with-errors"></div>
                                </div>
                              </div>

                              <hr>
                            </div>


                            <div id="fragment_02-13">
                              <h3 class="fragment-title">15人目情報（<span class="text-danger">15名様の場合は必須</span>）</h3 class="fragment-title">

                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <input type="hidden" name="cli_id_15" value="{if !empty($cli_id_15)}{$cli_id_15}{/if}">
                                  <input type="text" class="form-control" name="cli_name_l_15" value="{if !empty($cli_name_l_15)}{$cli_name_l_15}{/if}"
                                    placeholder="姓" maxlength="20">
                                </div>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <input type="text" class="form-control" name="cli_name_f_15" value="{if !empty($cli_name_f_15)}{$cli_name_f_15}{/if}"
                                    placeholder="名" maxlength="20">
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <span class="name_roman_letter">{if !empty($cli_name_el_15)}{$cli_name_el_15}{/if}</span>
                                  <input type="hidden" name="cli_name_el_15" value="{if !empty($cli_name_el_15)}{$cli_name_el_15}{/if}" />
                                </div>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <span class="name_roman_letter">{if !empty($cli_name_ef_15)}{$cli_name_ef_15}{/if}</span>
                                  <input type="hidden" name="cli_name_ef_15" value="{if !empty($cli_name_ef_15)}{$cli_name_ef_15}{/if}" />
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <input type="text" class="form-control" name="cli_name_kl_15" value="{if !empty($cli_name_kl_15)}{$cli_name_kl_15}{/if}"
                                    placeholder="セイ" maxlength="20">
                                </div>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <input type="text" class="form-control" name="cli_name_kf_15" value="{if !empty($cli_name_kf_15)}{$cli_name_kf_15}{/if}"
                                    placeholder="メイ" maxlength="20">
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                  <label class="radio-inline"><input type="radio" name="nation_sw_15" value="1" {if
                                      !empty($nation_sw_15) and $nation_sw_15 eq '1' }checked="checked" {/if}>日本 </label>
                                      <label class="radio-inline"><input type="radio" name="nation_sw_15" value="2" {if
                                      !empty($nation_sw_15) and $nation_sw_15 eq '2' }checked="checked" {/if}>他 </label>
                                      </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <input type="text" class="form-control" name="nation_txt_15" value="{if !empty($nation_txt_15)}{$nation_txt_15}{/if}"
                                      placeholder="国名" maxlength="20">
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                  <input class="form-control" type="date" name="birth_date_15" value="{if !empty($birth_date_15)}{$birth_date_15}{/if}"
                                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                    data-date-error="1999-01-01 の形式で入力して下さい">
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-sm-1 col-md-2"></div>
                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                  <label class="radio-inline"><input type="radio" name="sex_15" value="1" {if
                                      !empty($sex_15) and $sex_15 eq '1' }checked="checked" {/if}>男性 </label> <label
                                      class="radio-inline"><input type="radio" name="sex_15" value="2" {if
                                      !empty($sex_15) and $sex_15 eq '2' }checked="checked" {/if}>女性 </label> </div> </div>
                                      <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                      <input type="text" class="form-control" name="pass_txt_15" value="{if !empty($pass_txt_15)}{$pass_txt_15}{/if}"
                                        placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                    </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                    <input class="form-control" type="date" name="pass_date_s_15" value="{if !empty($pass_date_s_15)}{$pass_date_s_15}{/if}"
                                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                      data-date-error="1999-01-01 の形式で入力して下さい">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                    <input class="form-control" type="date" name="pass_date_e_15" value="{if !empty($pass_date_e_15)}{$pass_date_e_15}{/if}"
                                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                      data-date-error="1999-01-01 の形式で入力して下さい">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                  <div class="col-xs-12 col-sm-6 col-md-6">
                                    <input type="text" class="form-control" name="cli_mail_15" value="{if !empty($cli_mail_15)}{$cli_mail_15}{/if}"
                                      placeholder="abc@i.softbank.jp">
                                    <div class="help-block with-errors"></div>
                                  </div>
                                </div>

                                <hr>
                              </div>


                              <div id="fragment_02-14">
                                <h3 class="fragment-title">16人目情報（<span class="text-danger">16名様の場合は必須</span>）</h3
                                  class="fragment-title">

                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <input type="hidden" name="cli_id_16" value="{if !empty($cli_id_16)}{$cli_id_16}{/if}">
                                    <input type="text" class="form-control" name="cli_name_l_16" value="{if !empty($cli_name_l_16)}{$cli_name_l_16}{/if}"
                                      placeholder="姓" maxlength="20">
                                  </div>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <input type="text" class="form-control" name="cli_name_f_16" value="{if !empty($cli_name_f_16)}{$cli_name_f_16}{/if}"
                                      placeholder="名" maxlength="20">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <span class="name_roman_letter">{if !empty($cli_name_el_16)}{$cli_name_el_16}{/if}</span>
                                    <input type="hidden" name="cli_name_el_16" value="{if !empty($cli_name_el_16)}{$cli_name_el_16}{/if}" />
                                  </div>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <span class="name_roman_letter">{if !empty($cli_name_ef_16)}{$cli_name_ef_16}{/if}</span>
                                    <input type="hidden" name="cli_name_ef_16" value="{if !empty($cli_name_ef_16)}{$cli_name_ef_16}{/if}" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <input type="text" class="form-control" name="cli_name_kl_16" value="{if !empty($cli_name_kl_16)}{$cli_name_kl_16}{/if}"
                                      placeholder="セイ" maxlength="20">
                                  </div>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <input type="text" class="form-control" name="cli_name_kf_16" value="{if !empty($cli_name_kf_16)}{$cli_name_kf_16}{/if}"
                                      placeholder="メイ" maxlength="20">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                    <label class="radio-inline"><input type="radio" name="nation_sw_16" value="1" {if
                                        !empty($nation_sw_16) and $nation_sw_16 eq '1' }checked="checked" {/if}>日本 </label>
                                        <label class="radio-inline"><input type="radio" name="nation_sw_16" value="2"
                                        {if !empty($nation_sw_16) and $nation_sw_16 eq '2' }checked="checked" {/if}>他 </label>
                                        </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <input type="text" class="form-control" name="nation_txt_16" value="{if !empty($nation_txt_16)}{$nation_txt_16}{/if}"
                                        placeholder="国名" maxlength="20">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                    <input class="form-control" type="date" name="birth_date_16" value="{if !empty($birth_date_16)}{$birth_date_16}{/if}"
                                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                      data-date-error="1999-01-01 の形式で入力して下さい">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-1 col-md-2"></div>
                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                    <label class="radio-inline"><input type="radio" name="sex_16" value="1" {if
                                        !empty($sex_16) and $sex_16 eq '1' }checked="checked" {/if}>男性 </label> <label
                                        class="radio-inline"><input type="radio" name="sex_16" value="2" {if
                                        !empty($sex_16) and $sex_16 eq '2' }checked="checked" {/if}>女性 </label> </div>
                                        </div> <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                        <input type="text" class="form-control" name="pass_txt_16" value="{if !empty($pass_txt_16)}{$pass_txt_16}{/if}"
                                          placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                      <input class="form-control" type="date" name="pass_date_s_16" value="{if !empty($pass_date_s_16)}{$pass_date_s_16}{/if}"
                                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                        data-date-error="1999-01-01 の形式で入力して下さい">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                      <input class="form-control" type="date" name="pass_date_e_16" value="{if !empty($pass_date_e_16)}{$pass_date_e_16}{/if}"
                                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                        data-date-error="1999-01-01 の形式で入力して下さい">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                      <input type="text" class="form-control" name="cli_mail_16" value="{if !empty($cli_mail_16)}{$cli_mail_16}{/if}"
                                        placeholder="abc@i.softbank.jp">
                                      <div class="help-block with-errors"></div>
                                    </div>
                                  </div>

                                  <hr>
                                </div>


                                <div id="fragment_02-15">
                                  <h3 class="fragment-title">17人目情報（<span class="text-danger">17名様の場合は必須</span>）</h3
                                    class="fragment-title">

                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <input type="hidden" name="cli_id_17" value="{if !empty($cli_id_17)}{$cli_id_17}{/if}">
                                      <input type="text" class="form-control" name="cli_name_l_17" value="{if !empty($cli_name_l_17)}{$cli_name_l_17}{/if}"
                                        placeholder="姓" maxlength="20">
                                    </div>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <input type="text" class="form-control" name="cli_name_f_17" value="{if !empty($cli_name_f_17)}{$cli_name_f_17}{/if}"
                                        placeholder="名" maxlength="20">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <span class="name_roman_letter">{if
                                        !empty($cli_name_el_17)}{$cli_name_el_17}{/if}</span>
                                      <input type="hidden" name="cli_name_el_17" value="{if !empty($cli_name_el_17)}{$cli_name_el_17}{/if}" />
                                    </div>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <span class="name_roman_letter">{if
                                        !empty($cli_name_ef_17)}{$cli_name_ef_17}{/if}</span>
                                      <input type="hidden" name="cli_name_ef_17" value="{if !empty($cli_name_ef_17)}{$cli_name_ef_17}{/if}" />
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <input type="text" class="form-control" name="cli_name_kl_17" value="{if !empty($cli_name_kl_17)}{$cli_name_kl_17}{/if}"
                                        placeholder="セイ" maxlength="20">
                                    </div>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <input type="text" class="form-control" name="cli_name_kf_17" value="{if !empty($cli_name_kf_17)}{$cli_name_kf_17}{/if}"
                                        placeholder="メイ" maxlength="20">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                      <label class="radio-inline"><input type="radio" name="nation_sw_17" value="1" {if
                                          !empty($nation_sw_17) and $nation_sw_17 eq '1' }checked="checked" {/if}>日本 </label>
                                          <label class="radio-inline"><input type="radio" name="nation_sw_17" value="2"
                                          {if !empty($nation_sw_17) and $nation_sw_17 eq '2' }checked="checked" {/if}>他
                                          </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="nation_txt_17" value="{if !empty($nation_txt_17)}{$nation_txt_17}{/if}"
                                          placeholder="国名" maxlength="20">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                      <input class="form-control" type="date" name="birth_date_17" value="{if !empty($birth_date_17)}{$birth_date_17}{/if}"
                                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01" data-date=""
                                        data-date-error="1999-01-01 の形式で入力して下さい">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-1 col-md-2"></div>
                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                      <label class="radio-inline"><input type="radio" name="sex_17" value="1" {if
                                          !empty($sex_17) and $sex_17 eq '1' }checked="checked" {/if}>男性 </label>
                                          <label class="radio-inline"><input type="radio" name="sex_17" value="2" {if
                                          !empty($sex_17) and $sex_17 eq '2' }checked="checked" {/if}>女性 </label> </div>
                                          </div> <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                          <input type="text" class="form-control" name="pass_txt_17" value="{if !empty($pass_txt_17)}{$pass_txt_17}{/if}"
                                            placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                        <input class="form-control" type="date" name="pass_date_s_17" value="{if !empty($pass_date_s_17)}{$pass_date_s_17}{/if}"
                                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                          data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                        <input class="form-control" type="date" name="pass_date_e_17" value="{if !empty($pass_date_e_17)}{$pass_date_e_17}{/if}"
                                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                          data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                      <div class="col-xs-12 col-sm-6 col-md-6">
                                        <input type="text" class="form-control" name="cli_mail_17" value="{if !empty($cli_mail_17)}{$cli_mail_17}{/if}"
                                          placeholder="abc@i.softbank.jp">
                                        <div class="help-block with-errors"></div>
                                      </div>
                                    </div>

                                    <hr>
                                  </div>


                                  <div id="fragment_02-16">
                                    <h3 class="fragment-title">18人目情報（<span class="text-danger">18名様の場合は必須</span>）</h3
                                      class="fragment-title">

                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <input type="hidden" name="cli_id_18" value="{if !empty($cli_id_18)}{$cli_id_18}{/if}">
                                        <input type="text" class="form-control" name="cli_name_l_18" value="{if !empty($cli_name_l_18)}{$cli_name_l_18}{/if}"
                                          placeholder="姓" maxlength="20">
                                      </div>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="cli_name_f_18" value="{if !empty($cli_name_f_18)}{$cli_name_f_18}{/if}"
                                          placeholder="名" maxlength="20">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span
                                          class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <span class="name_roman_letter">{if
                                          !empty($cli_name_el_18)}{$cli_name_el_18}{/if}</span>
                                        <input type="hidden" name="cli_name_el_18" value="{if !empty($cli_name_el_18)}{$cli_name_el_18}{/if}" />
                                      </div>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <span class="name_roman_letter">{if
                                          !empty($cli_name_ef_18)}{$cli_name_ef_18}{/if}</span>
                                        <input type="hidden" name="cli_name_ef_18" value="{if !empty($cli_name_ef_18)}{$cli_name_ef_18}{/if}" />
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="cli_name_kl_18" value="{if !empty($cli_name_kl_18)}{$cli_name_kl_18}{/if}"
                                          placeholder="セイ" maxlength="20">
                                      </div>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <input type="text" class="form-control" name="cli_name_kf_18" value="{if !empty($cli_name_kf_18)}{$cli_name_kf_18}{/if}"
                                          placeholder="メイ" maxlength="20">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                        <label class="radio-inline"><input type="radio" name="nation_sw_18" value="1"
                                            {if !empty($nation_sw_18) and $nation_sw_18 eq '1' }checked="checked" {/if}>日本
                                            </label> <label class="radio-inline"><input type="radio" name="nation_sw_18"
                                            value="2" {if !empty($nation_sw_18) and $nation_sw_18 eq '2' }checked="checked"
                                            {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <input type="text" class="form-control" name="nation_txt_18" value="{if !empty($nation_txt_18)}{$nation_txt_18}{/if}"
                                            placeholder="国名" maxlength="20">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                        <input class="form-control" type="date" name="birth_date_18" value="{if !empty($birth_date_18)}{$birth_date_18}{/if}"
                                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                          data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-1 col-md-2"></div>
                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                        <label class="radio-inline"><input type="radio" name="sex_18" value="1" {if
                                            !empty($sex_18) and $sex_18 eq '1' }checked="checked" {/if}>男性 </label>
                                            <label class="radio-inline"><input type="radio" name="sex_18" value="2" {if
                                            !empty($sex_18) and $sex_18 eq '2' }checked="checked" {/if}>女性 </label> </div>
                                            </div> <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                            <input type="text" class="form-control" name="pass_txt_18" value="{if !empty($pass_txt_18)}{$pass_txt_18}{/if}"
                                              placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                          <input class="form-control" type="date" name="pass_date_s_18" value="{if !empty($pass_date_s_18)}{$pass_date_s_18}{/if}"
                                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span
                                            class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                          <input class="form-control" type="date" name="pass_date_e_18" value="{if !empty($pass_date_e_18)}{$pass_date_e_18}{/if}"
                                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                          <input type="text" class="form-control" name="cli_mail_18" value="{if !empty($cli_mail_18)}{$cli_mail_18}{/if}"
                                            placeholder="abc@i.softbank.jp">
                                          <div class="help-block with-errors"></div>
                                        </div>
                                      </div>

                                      <hr>
                                    </div>


                                    <div id="fragment_02-17">
                                      <h3 class="fragment-title">19人目情報（<span class="text-danger">19名様の場合は必須</span>）</h3
                                        class="fragment-title">

                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <input type="hidden" name="cli_id_19" value="{if !empty($cli_id_19)}{$cli_id_19}{/if}">
                                          <input type="text" class="form-control" name="cli_name_l_19" value="{if !empty($cli_name_l_19)}{$cli_name_l_19}{/if}"
                                            placeholder="姓" maxlength="20">
                                        </div>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <input type="text" class="form-control" name="cli_name_f_19" value="{if !empty($cli_name_f_19)}{$cli_name_f_19}{/if}"
                                            placeholder="名" maxlength="20">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span
                                            class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <span class="name_roman_letter">{if
                                            !empty($cli_name_el_19)}{$cli_name_el_19}{/if}</span>
                                          <input type="hidden" name="cli_name_el_19" value="{if !empty($cli_name_el_19)}{$cli_name_el_19}{/if}" />
                                        </div>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <span class="name_roman_letter">{if
                                            !empty($cli_name_ef_19)}{$cli_name_ef_19}{/if}</span>
                                          <input type="hidden" name="cli_name_ef_19" value="{if !empty($cli_name_ef_19)}{$cli_name_ef_19}{/if}" />
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <input type="text" class="form-control" name="cli_name_kl_19" value="{if !empty($cli_name_kl_19)}{$cli_name_kl_19}{/if}"
                                            placeholder="セイ" maxlength="20">
                                        </div>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <input type="text" class="form-control" name="cli_name_kf_19" value="{if !empty($cli_name_kf_19)}{$cli_name_kf_19}{/if}"
                                            placeholder="メイ" maxlength="20">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                          <label class="radio-inline"><input type="radio" name="nation_sw_19" value="1"
                                              {if !empty($nation_sw_19) and $nation_sw_19 eq '1' }checked="checked" {/if}>日本
                                              </label> <label class="radio-inline"><input type="radio" name="nation_sw_19"
                                              value="2" {if !empty($nation_sw_19) and $nation_sw_19 eq '2' }checked="checked"
                                              {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <input type="text" class="form-control" name="nation_txt_19" value="{if !empty($nation_txt_19)}{$nation_txt_19}{/if}"
                                              placeholder="国名" maxlength="20">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                          <input class="form-control" type="date" name="birth_date_19" value="{if !empty($birth_date_19)}{$birth_date_19}{/if}"
                                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                        </div>
                                      </div>
                                      <div class="form-group">
                                        <div class="col-sm-1 col-md-2"></div>
                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                          <label class="radio-inline"><input type="radio" name="sex_19" value="1" {if
                                              !empty($sex_19) and $sex_19 eq '1' }checked="checked" {/if}>男性 </label>
                                              <label class="radio-inline"><input type="radio" name="sex_19" value="2"
                                              {if !empty($sex_19) and $sex_19 eq '2' }checked="checked" {/if}>女性 </label>
                                              </div> </div> <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span
                                                class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                              <input type="text" class="form-control" name="pass_txt_19" value="{if !empty($pass_txt_19)}{$pass_txt_19}{/if}"
                                                placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span
                                              class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                            <input class="form-control" type="date" name="pass_date_s_19" value="{if !empty($pass_date_s_19)}{$pass_date_s_19}{/if}"
                                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span
                                              class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                            <input class="form-control" type="date" name="pass_date_e_19" value="{if !empty($pass_date_e_19)}{$pass_date_e_19}{/if}"
                                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                          <div class="col-xs-12 col-sm-6 col-md-6">
                                            <input type="text" class="form-control" name="cli_mail_19" value="{if !empty($cli_mail_19)}{$cli_mail_19}{/if}"
                                              placeholder="abc@i.softbank.jp">
                                            <div class="help-block with-errors"></div>
                                          </div>
                                        </div>

                                        <hr>
                                      </div>


                                      <div id="fragment_02-18">
                                        <h3 class="fragment-title">20人目情報（<span class="text-danger">20名様の場合は必須</span>）</h3
                                          class="fragment-title">

                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <input type="hidden" name="cli_id_20" value="{if !empty($cli_id_20)}{$cli_id_20}{/if}">
                                            <input type="text" class="form-control" name="cli_name_l_20" value="{if !empty($cli_name_l_20)}{$cli_name_l_20}{/if}"
                                              placeholder="姓" maxlength="20">
                                          </div>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <input type="text" class="form-control" name="cli_name_f_20" value="{if !empty($cli_name_f_20)}{$cli_name_f_20}{/if}"
                                              placeholder="名" maxlength="20">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字） <span
                                              class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <span class="name_roman_letter">{if
                                              !empty($cli_name_el_20)}{$cli_name_el_20}{/if}</span>
                                            <input type="hidden" name="cli_name_el_20" value="{if !empty($cli_name_el_20)}{$cli_name_el_20}{/if}" />
                                          </div>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <span class="name_roman_letter">{if
                                              !empty($cli_name_ef_20)}{$cli_name_ef_20}{/if}</span>
                                            <input type="hidden" name="cli_name_ef_20" value="{if !empty($cli_name_ef_20)}{$cli_name_ef_20}{/if}" />
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <input type="text" class="form-control" name="cli_name_kl_20" value="{if !empty($cli_name_kl_20)}{$cli_name_kl_20}{/if}"
                                              placeholder="セイ" maxlength="20">
                                          </div>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <input type="text" class="form-control" name="cli_name_kf_20" value="{if !empty($cli_name_kf_20)}{$cli_name_kf_20}{/if}"
                                              placeholder="メイ" maxlength="20">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                            <label class="radio-inline"><input type="radio" name="nation_sw_20" value="1"
                                                {if !empty($nation_sw_20) and $nation_sw_20 eq '1' }checked="checked" {/if}>日本
                                                </label> <label class="radio-inline"><input type="radio" name="nation_sw_20"
                                                value="2" {if !empty($nation_sw_20) and $nation_sw_20 eq '2' }checked="checked"
                                                {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <input type="text" class="form-control" name="nation_txt_20" value="{if !empty($nation_txt_20)}{$nation_txt_20}{/if}"
                                                placeholder="国名" maxlength="20">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                            <input class="form-control" type="date" name="birth_date_20" value="{if !empty($birth_date_20)}{$birth_date_20}{/if}"
                                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-sm-1 col-md-2"></div>
                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                            <label class="radio-inline"><input type="radio" name="sex_20" value="1" {if
                                                !empty($sex_20) and $sex_20 eq '1' }checked="checked" {/if}>男性 </label>
                                                <label class="radio-inline"><input type="radio" name="sex_20" value="2"
                                                {if !empty($sex_20) and $sex_20 eq '2' }checked="checked" {/if}>女性 </label>
                                                </div> </div> <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span
                                                  class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                <input type="text" class="form-control" name="pass_txt_20" value="{if !empty($pass_txt_20)}{$pass_txt_20}{/if}"
                                                  placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span
                                                class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                              <input class="form-control" type="date" name="pass_date_s_20" value="{if !empty($pass_date_s_20)}{$pass_date_s_20}{/if}"
                                                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日 <span
                                                class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                              <input class="form-control" type="date" name="pass_date_e_20" value="{if !empty($pass_date_e_20)}{$pass_date_e_20}{/if}"
                                                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                              <input type="text" class="form-control" name="cli_mail_20" value="{if !empty($cli_mail_20)}{$cli_mail_20}{/if}"
                                                placeholder="abc@i.softbank.jp">
                                              <div class="help-block with-errors"></div>
                                            </div>
                                          </div>

                                          <hr>
                                        </div>


                                        <div id="fragment_02-19">
                                          <h3 class="fragment-title">21人目情報（<span class="text-danger">21名様の場合は必須</span>）</h3
                                            class="fragment-title">

                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <input type="hidden" name="cli_id_21" value="{if !empty($cli_id_21)}{$cli_id_21}{/if}">
                                              <input type="text" class="form-control" name="cli_name_l_21" value="{if !empty($cli_name_l_21)}{$cli_name_l_21}{/if}"
                                                placeholder="姓" maxlength="20">
                                            </div>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <input type="text" class="form-control" name="cli_name_f_21" value="{if !empty($cli_name_f_21)}{$cli_name_f_21}{/if}"
                                                placeholder="名" maxlength="20">
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                              <span class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <span class="name_roman_letter">{if
                                                !empty($cli_name_el_21)}{$cli_name_el_21}{/if}</span>
                                              <input type="hidden" name="cli_name_el_21" value="{if !empty($cli_name_el_21)}{$cli_name_el_21}{/if}" />
                                            </div>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <span class="name_roman_letter">{if
                                                !empty($cli_name_ef_21)}{$cli_name_ef_21}{/if}</span>
                                              <input type="hidden" name="cli_name_ef_21" value="{if !empty($cli_name_ef_21)}{$cli_name_ef_21}{/if}" />
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <input type="text" class="form-control" name="cli_name_kl_21" value="{if !empty($cli_name_kl_21)}{$cli_name_kl_21}{/if}"
                                                placeholder="セイ" maxlength="20">
                                            </div>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <input type="text" class="form-control" name="cli_name_kf_21" value="{if !empty($cli_name_kf_21)}{$cli_name_kf_21}{/if}"
                                                placeholder="メイ" maxlength="20">
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                              <label class="radio-inline"><input type="radio" name="nation_sw_21" value="1"
                                                  {if !empty($nation_sw_21) and $nation_sw_21 eq '1' }checked="checked"
                                                  {/if}>日本 </label> <label class="radio-inline"><input type="radio"
                                                  name="nation_sw_21" value="2" {if !empty($nation_sw_21) and
                                                  $nation_sw_21 eq '2' }checked="checked" {/if}>他 </label> </div> <div
                                                  class="col col-xs-6 col-sm-3 col-md-3">
                                                <input type="text" class="form-control" name="nation_txt_21" value="{if !empty($nation_txt_21)}{$nation_txt_21}{/if}"
                                                  placeholder="国名" maxlength="20">
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span
                                                class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                              <input class="form-control" type="date" name="birth_date_21" value="{if !empty($birth_date_21)}{$birth_date_21}{/if}"
                                                onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                            </div>
                                          </div>
                                          <div class="form-group">
                                            <div class="col-sm-1 col-md-2"></div>
                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span class="text-danger asterisk">*</span></label>
                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                              <label class="radio-inline"><input type="radio" name="sex_21" value="1"
                                                  {if !empty($sex_21) and $sex_21 eq '1' }checked="checked" {/if}>男性 </label>
                                                  <label class="radio-inline"><input type="radio" name="sex_21" value="2"
                                                  {if !empty($sex_21) and $sex_21 eq '2' }checked="checked" {/if}>女性 </label>
                                                  </div> </div> <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号 <span
                                                    class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                  <input type="text" class="form-control" name="pass_txt_21" value="{if !empty($pass_txt_21)}{$pass_txt_21}{/if}"
                                                    placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日 <span
                                                  class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                <input class="form-control" type="date" name="pass_date_s_21" value="{if !empty($pass_date_s_21)}{$pass_date_s_21}{/if}"
                                                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                  data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                <span class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                <input class="form-control" type="date" name="pass_date_e_21" value="{if !empty($pass_date_e_21)}{$pass_date_e_21}{/if}"
                                                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                  data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>メールアドレス</label>
                                              <div class="col-xs-12 col-sm-6 col-md-6">
                                                <input type="text" class="form-control" name="cli_mail_21" value="{if !empty($cli_mail_21)}{$cli_mail_21}{/if}"
                                                  placeholder="abc@i.softbank.jp">
                                                <div class="help-block with-errors"></div>
                                              </div>
                                            </div>

                                            <hr>
                                          </div>


                                          <div id="fragment_02-20">
                                            <h3 class="fragment-title">22人目情報（<span class="text-danger">22名様の場合は必須</span>）</h3
                                              class="fragment-title">

                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span
                                                  class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <input type="hidden" name="cli_id_22" value="{if !empty($cli_id_22)}{$cli_id_22}{/if}">
                                                <input type="text" class="form-control" name="cli_name_l_22" value="{if !empty($cli_name_l_22)}{$cli_name_l_22}{/if}"
                                                  placeholder="姓" maxlength="20">
                                              </div>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <input type="text" class="form-control" name="cli_name_f_22" value="{if !empty($cli_name_f_22)}{$cli_name_f_22}{/if}"
                                                  placeholder="名" maxlength="20">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                <span class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <span class="name_roman_letter">{if
                                                  !empty($cli_name_el_22)}{$cli_name_el_22}{/if}</span>
                                                <input type="hidden" name="cli_name_el_22" value="{if !empty($cli_name_el_22)}{$cli_name_el_22}{/if}" />
                                              </div>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <span class="name_roman_letter">{if
                                                  !empty($cli_name_ef_22)}{$cli_name_ef_22}{/if}</span>
                                                <input type="hidden" name="cli_name_ef_22" value="{if !empty($cli_name_ef_22)}{$cli_name_ef_22}{/if}" />
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span class="optional"></span>フリガナ</label>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <input type="text" class="form-control" name="cli_name_kl_22" value="{if !empty($cli_name_kl_22)}{$cli_name_kl_22}{/if}"
                                                  placeholder="セイ" maxlength="20">
                                              </div>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <input type="text" class="form-control" name="cli_name_kf_22" value="{if !empty($cli_name_kf_22)}{$cli_name_kf_22}{/if}"
                                                  placeholder="メイ" maxlength="20">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span
                                                  class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                <label class="radio-inline"><input type="radio" name="nation_sw_22"
                                                    value="1" {if !empty($nation_sw_22) and $nation_sw_22 eq '1'
                                                    }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                                                    type="radio" name="nation_sw_22" value="2" {if
                                                    !empty($nation_sw_22) and $nation_sw_22 eq '2' }checked="checked" {/if}>他
                                                    </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <input type="text" class="form-control" name="nation_txt_22" value="{if !empty($nation_txt_22)}{$nation_txt_22}{/if}"
                                                    placeholder="国名" maxlength="20">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span
                                                  class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                <input class="form-control" type="date" name="birth_date_22" value="{if !empty($birth_date_22)}{$birth_date_22}{/if}"
                                                  onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                  data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                              </div>
                                            </div>
                                            <div class="form-group">
                                              <div class="col-sm-1 col-md-2"></div>
                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span
                                                  class="text-danger asterisk">*</span></label>
                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                <label class="radio-inline"><input type="radio" name="sex_22" value="1"
                                                    {if !empty($sex_22) and $sex_22 eq '1' }checked="checked" {/if}>男性
                                                    </label> <label class="radio-inline"><input type="radio" name="sex_22"
                                                    value="2" {if !empty($sex_22) and $sex_22 eq '2' }checked="checked"
                                                    {/if}>女性 </label> </div> </div> <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                    <span class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                                    <input type="text" class="form-control" name="pass_txt_22" value="{if !empty($pass_txt_22)}{$pass_txt_22}{/if}"
                                                      placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                  </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                  <span class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                  <input class="form-control" type="date" name="pass_date_s_22" value="{if !empty($pass_date_s_22)}{$pass_date_s_22}{/if}"
                                                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                    data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                  <span class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                  <input class="form-control" type="date" name="pass_date_e_22" value="{if !empty($pass_date_e_22)}{$pass_date_e_22}{/if}"
                                                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                    data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                    class="optional"></span>メールアドレス</label>
                                                <div class="col-xs-12 col-sm-6 col-md-6">
                                                  <input type="text" class="form-control" name="cli_mail_22" value="{if !empty($cli_mail_22)}{$cli_mail_22}{/if}"
                                                    placeholder="abc@i.softbank.jp">
                                                  <div class="help-block with-errors"></div>
                                                </div>
                                              </div>

                                              <hr>
                                            </div>


                                            <div id="fragment_02-21">
                                              <h3 class="fragment-title">23人目情報（<span class="text-danger">23名様の場合は必須</span>）</h3
                                                class="fragment-title">

                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span
                                                    class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <input type="hidden" name="cli_id_23" value="{if !empty($cli_id_23)}{$cli_id_23}{/if}">
                                                  <input type="text" class="form-control" name="cli_name_l_23" value="{if !empty($cli_name_l_23)}{$cli_name_l_23}{/if}"
                                                    placeholder="姓" maxlength="20">
                                                </div>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <input type="text" class="form-control" name="cli_name_f_23" value="{if !empty($cli_name_f_23)}{$cli_name_f_23}{/if}"
                                                    placeholder="名" maxlength="20">
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                  <span class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <span class="name_roman_letter">{if
                                                    !empty($cli_name_el_23)}{$cli_name_el_23}{/if}</span>
                                                  <input type="hidden" name="cli_name_el_23" value="{if !empty($cli_name_el_23)}{$cli_name_el_23}{/if}" />
                                                </div>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <span class="name_roman_letter">{if
                                                    !empty($cli_name_ef_23)}{$cli_name_ef_23}{/if}</span>
                                                  <input type="hidden" name="cli_name_ef_23" value="{if !empty($cli_name_ef_23)}{$cli_name_ef_23}{/if}" />
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                    class="optional"></span>フリガナ</label>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <input type="text" class="form-control" name="cli_name_kl_23" value="{if !empty($cli_name_kl_23)}{$cli_name_kl_23}{/if}"
                                                    placeholder="セイ" maxlength="20">
                                                </div>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <input type="text" class="form-control" name="cli_name_kf_23" value="{if !empty($cli_name_kf_23)}{$cli_name_kf_23}{/if}"
                                                    placeholder="メイ" maxlength="20">
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span
                                                    class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-6 col-sm-3 col-md-3">
                                                  <label class="radio-inline"><input type="radio" name="nation_sw_23"
                                                      value="1" {if !empty($nation_sw_23) and $nation_sw_23 eq '1'
                                                      }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                                                      type="radio" name="nation_sw_23" value="2" {if
                                                      !empty($nation_sw_23) and $nation_sw_23 eq '2' }checked="checked"
                                                      {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <input type="text" class="form-control" name="nation_txt_23" value="{if !empty($nation_txt_23)}{$nation_txt_23}{/if}"
                                                      placeholder="国名" maxlength="20">
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日 <span
                                                    class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                  <input class="form-control" type="date" name="birth_date_23" value="{if !empty($birth_date_23)}{$birth_date_23}{/if}"
                                                    onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                    data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-1 col-md-2"></div>
                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span
                                                    class="text-danger asterisk">*</span></label>
                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                  <label class="radio-inline"><input type="radio" name="sex_23" value="1"
                                                      {if !empty($sex_23) and $sex_23 eq '1' }checked="checked" {/if}>男性
                                                      </label> <label class="radio-inline"><input type="radio" name="sex_23"
                                                      value="2" {if !empty($sex_23) and $sex_23 eq '2' }checked="checked"
                                                      {/if}>女性 </label> </div> </div> <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                                      <input type="text" class="form-control" name="pass_txt_23" value="{if !empty($pass_txt_23)}{$pass_txt_23}{/if}"
                                                        placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                    <span class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                                    <input class="form-control" type="date" name="pass_date_s_23" value="{if !empty($pass_date_s_23)}{$pass_date_s_23}{/if}"
                                                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                      data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                    <span class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                                    <input class="form-control" type="date" name="pass_date_e_23" value="{if !empty($pass_date_e_23)}{$pass_date_e_23}{/if}"
                                                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                      data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                      class="optional"></span>メールアドレス</label>
                                                  <div class="col-xs-12 col-sm-6 col-md-6">
                                                    <input type="text" class="form-control" name="cli_mail_23" value="{if !empty($cli_mail_23)}{$cli_mail_23}{/if}"
                                                      placeholder="abc@i.softbank.jp">
                                                    <div class="help-block with-errors"></div>
                                                  </div>
                                                </div>

                                                <hr>
                                              </div>


                                              <div id="fragment_02-22">
                                                <h3 class="fragment-title">24人目情報（<span class="text-danger">24名様の場合は必須</span>）</h3
                                                  class="fragment-title">

                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名 <span
                                                      class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <input type="hidden" name="cli_id_24" value="{if !empty($cli_id_24)}{$cli_id_24}{/if}">
                                                    <input type="text" class="form-control" name="cli_name_l_24" value="{if !empty($cli_name_l_24)}{$cli_name_l_24}{/if}"
                                                      placeholder="姓" maxlength="20">
                                                  </div>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <input type="text" class="form-control" name="cli_name_f_24" value="{if !empty($cli_name_f_24)}{$cli_name_f_24}{/if}"
                                                      placeholder="名" maxlength="20">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                    <span class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <span class="name_roman_letter">{if
                                                      !empty($cli_name_el_24)}{$cli_name_el_24}{/if}</span>
                                                    <input type="hidden" name="cli_name_el_24" value="{if !empty($cli_name_el_24)}{$cli_name_el_24}{/if}" />
                                                  </div>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <span class="name_roman_letter">{if
                                                      !empty($cli_name_ef_24)}{$cli_name_ef_24}{/if}</span>
                                                    <input type="hidden" name="cli_name_ef_24" value="{if !empty($cli_name_ef_24)}{$cli_name_ef_24}{/if}" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                      class="optional"></span>フリガナ</label>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <input type="text" class="form-control" name="cli_name_kl_24" value="{if !empty($cli_name_kl_24)}{$cli_name_kl_24}{/if}"
                                                      placeholder="セイ" maxlength="20">
                                                  </div>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <input type="text" class="form-control" name="cli_name_kf_24" value="{if !empty($cli_name_kf_24)}{$cli_name_kf_24}{/if}"
                                                      placeholder="メイ" maxlength="20">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍 <span
                                                      class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                    <label class="radio-inline"><input type="radio" name="nation_sw_24"
                                                        value="1" {if !empty($nation_sw_24) and $nation_sw_24 eq '1'
                                                        }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                                                        type="radio" name="nation_sw_24" value="2" {if
                                                        !empty($nation_sw_24) and $nation_sw_24 eq '2' }checked="checked"
                                                        {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <input type="text" class="form-control" name="nation_txt_24"
                                                        value="{if !empty($nation_txt_24)}{$nation_txt_24}{/if}"
                                                        placeholder="国名" maxlength="20">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                    <span class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                                    <input class="form-control" type="date" name="birth_date_24" value="{if !empty($birth_date_24)}{$birth_date_24}{/if}"
                                                      onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                      data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-1 col-md-2"></div>
                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別 <span
                                                      class="text-danger asterisk">*</span></label>
                                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                                    <label class="radio-inline"><input type="radio" name="sex_24" value="1"
                                                        {if !empty($sex_24) and $sex_24 eq '1' }checked="checked" {/if}>男性
                                                        </label> <label class="radio-inline"><input type="radio" name="sex_24"
                                                        value="2" {if !empty($sex_24) and $sex_24 eq '2' }checked="checked"
                                                        {/if}>女性 </label> </div> </div> <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                                        <input type="text" class="form-control" name="pass_txt_24"
                                                          value="{if !empty($pass_txt_24)}{$pass_txt_24}{/if}"
                                                          placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                      </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                                      <input class="form-control" type="date" name="pass_date_s_24"
                                                        value="{if !empty($pass_date_s_24)}{$pass_date_s_24}{/if}"
                                                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                        data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                                      <input class="form-control" type="date" name="pass_date_e_24"
                                                        value="{if !empty($pass_date_e_24)}{$pass_date_e_24}{/if}"
                                                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                        data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                        class="optional"></span>メールアドレス</label>
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                      <input type="text" class="form-control" name="cli_mail_24" value="{if !empty($cli_mail_24)}{$cli_mail_24}{/if}"
                                                        placeholder="abc@i.softbank.jp">
                                                      <div class="help-block with-errors"></div>
                                                    </div>
                                                  </div>

                                                  <hr>
                                                </div>


                                                <div id="fragment_02-23">
                                                  <h3 class="fragment-title">25人目情報（<span class="text-danger">25名様の場合は必須</span>）</h3
                                                    class="fragment-title">

                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <input type="hidden" name="cli_id_25" value="{if !empty($cli_id_25)}{$cli_id_25}{/if}">
                                                      <input type="text" class="form-control" name="cli_name_l_25"
                                                        value="{if !empty($cli_name_l_25)}{$cli_name_l_25}{/if}"
                                                        placeholder="姓" maxlength="20">
                                                    </div>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <input type="text" class="form-control" name="cli_name_f_25"
                                                        value="{if !empty($cli_name_f_25)}{$cli_name_f_25}{/if}"
                                                        placeholder="名" maxlength="20">
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <span class="name_roman_letter">{if
                                                        !empty($cli_name_el_25)}{$cli_name_el_25}{/if}</span>
                                                      <input type="hidden" name="cli_name_el_25" value="{if !empty($cli_name_el_25)}{$cli_name_el_25}{/if}" />
                                                    </div>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <span class="name_roman_letter">{if
                                                        !empty($cli_name_ef_25)}{$cli_name_ef_25}{/if}</span>
                                                      <input type="hidden" name="cli_name_ef_25" value="{if !empty($cli_name_ef_25)}{$cli_name_ef_25}{/if}" />
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                        class="optional"></span>フリガナ</label>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <input type="text" class="form-control" name="cli_name_kl_25"
                                                        value="{if !empty($cli_name_kl_25)}{$cli_name_kl_25}{/if}"
                                                        placeholder="セイ" maxlength="20">
                                                    </div>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <input type="text" class="form-control" name="cli_name_kf_25"
                                                        value="{if !empty($cli_name_kf_25)}{$cli_name_kf_25}{/if}"
                                                        placeholder="メイ" maxlength="20">
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-6 col-sm-3 col-md-3">
                                                      <label class="radio-inline"><input type="radio" name="nation_sw_25"
                                                          value="1" {if !empty($nation_sw_25) and $nation_sw_25 eq '1'
                                                          }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                                                          type="radio" name="nation_sw_25" value="2" {if
                                                          !empty($nation_sw_25) and $nation_sw_25 eq '2' }checked="checked"
                                                          {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <input type="text" class="form-control" name="nation_txt_25"
                                                          value="{if !empty($nation_txt_25)}{$nation_txt_25}{/if}"
                                                          placeholder="国名" maxlength="20">
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                                      <input class="form-control" type="date" name="birth_date_25"
                                                        value="{if !empty($birth_date_25)}{$birth_date_25}{/if}"
                                                        onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                        data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                    </div>
                                                  </div>
                                                  <div class="form-group">
                                                    <div class="col-sm-1 col-md-2"></div>
                                                    <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別
                                                      <span class="text-danger asterisk">*</span></label>
                                                    <div class="col col-xs-12 col-sm-6 col-md-6">
                                                      <label class="radio-inline"><input type="radio" name="sex_25"
                                                          value="1" {if !empty($sex_25) and $sex_25 eq '1' }checked="checked"
                                                          {/if}>男性 </label> <label class="radio-inline"><input type="radio"
                                                          name="sex_25" value="2" {if !empty($sex_25) and $sex_25 eq
                                                          '2' }checked="checked" {/if}>女性 </label> </div> </div> <div
                                                          class="form-group">
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                                          <input type="text" class="form-control" name="pass_txt_25"
                                                            value="{if !empty($pass_txt_25)}{$pass_txt_25}{/if}"
                                                            placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                                        <input class="form-control" type="date" name="pass_date_s_25"
                                                          value="{if !empty($pass_date_s_25)}{$pass_date_s_25}{/if}"
                                                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                          data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                                        <input class="form-control" type="date" name="pass_date_e_25"
                                                          value="{if !empty($pass_date_e_25)}{$pass_date_e_25}{/if}"
                                                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                          data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                          class="optional"></span>メールアドレス</label>
                                                      <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <input type="text" class="form-control" name="cli_mail_25"
                                                          value="{if !empty($cli_mail_25)}{$cli_mail_25}{/if}"
                                                          placeholder="abc@i.softbank.jp">
                                                        <div class="help-block with-errors"></div>
                                                      </div>
                                                    </div>

                                                    <hr>
                                                  </div>


                                                  <div id="fragment_02-24">
                                                    <h3 class="fragment-title">26人目情報（<span class="text-danger">26名様の場合は必須</span>）</h3
                                                      class="fragment-title">

                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <input type="hidden" name="cli_id_26" value="{if !empty($cli_id_26)}{$cli_id_26}{/if}">
                                                        <input type="text" class="form-control" name="cli_name_l_26"
                                                          value="{if !empty($cli_name_l_26)}{$cli_name_l_26}{/if}"
                                                          placeholder="姓" maxlength="20">
                                                      </div>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <input type="text" class="form-control" name="cli_name_f_26"
                                                          value="{if !empty($cli_name_f_26)}{$cli_name_f_26}{/if}"
                                                          placeholder="名" maxlength="20">
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <span class="name_roman_letter">{if
                                                          !empty($cli_name_el_26)}{$cli_name_el_26}{/if}</span>
                                                        <input type="hidden" name="cli_name_el_26" value="{if !empty($cli_name_el_26)}{$cli_name_el_26}{/if}" />
                                                      </div>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <span class="name_roman_letter">{if
                                                          !empty($cli_name_ef_26)}{$cli_name_ef_26}{/if}</span>
                                                        <input type="hidden" name="cli_name_ef_26" value="{if !empty($cli_name_ef_26)}{$cli_name_ef_26}{/if}" />
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                          class="optional"></span>フリガナ</label>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <input type="text" class="form-control" name="cli_name_kl_26"
                                                          value="{if !empty($cli_name_kl_26)}{$cli_name_kl_26}{/if}"
                                                          placeholder="セイ" maxlength="20">
                                                      </div>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <input type="text" class="form-control" name="cli_name_kf_26"
                                                          value="{if !empty($cli_name_kf_26)}{$cli_name_kf_26}{/if}"
                                                          placeholder="メイ" maxlength="20">
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-6 col-sm-3 col-md-3">
                                                        <label class="radio-inline"><input type="radio" name="nation_sw_26"
                                                            value="1" {if !empty($nation_sw_26) and $nation_sw_26 eq
                                                            '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                                                            type="radio" name="nation_sw_26" value="2" {if
                                                            !empty($nation_sw_26) and $nation_sw_26 eq '2' }checked="checked"
                                                            {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <input type="text" class="form-control" name="nation_txt_26"
                                                            value="{if !empty($nation_txt_26)}{$nation_txt_26}{/if}"
                                                            placeholder="国名" maxlength="20">
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                                        <input class="form-control" type="date" name="birth_date_26"
                                                          value="{if !empty($birth_date_26)}{$birth_date_26}{/if}"
                                                          onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                          data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                      </div>
                                                    </div>
                                                    <div class="form-group">
                                                      <div class="col-sm-1 col-md-2"></div>
                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別
                                                        <span class="text-danger asterisk">*</span></label>
                                                      <div class="col col-xs-12 col-sm-6 col-md-6">
                                                        <label class="radio-inline"><input type="radio" name="sex_26"
                                                            value="1" {if !empty($sex_26) and $sex_26 eq '1' }checked="checked"
                                                            {/if}>男性 </label> <label class="radio-inline"><input type="radio"
                                                            name="sex_26" value="2" {if !empty($sex_26) and $sex_26 eq
                                                            '2' }checked="checked" {/if}>女性 </label> </div> </div> <div
                                                            class="form-group">
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input type="text" class="form-control" name="pass_txt_26"
                                                              value="{if !empty($pass_txt_26)}{$pass_txt_26}{/if}"
                                                              placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                                          <input class="form-control" type="date" name="pass_date_s_26"
                                                            value="{if !empty($pass_date_s_26)}{$pass_date_s_26}{/if}"
                                                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                                          <input class="form-control" type="date" name="pass_date_e_26"
                                                            value="{if !empty($pass_date_e_26)}{$pass_date_e_26}{/if}"
                                                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                            class="optional"></span>メールアドレス</label>
                                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                                          <input type="text" class="form-control" name="cli_mail_26"
                                                            value="{if !empty($cli_mail_26)}{$cli_mail_26}{/if}"
                                                            placeholder="abc@i.softbank.jp">
                                                          <div class="help-block with-errors"></div>
                                                        </div>
                                                      </div>

                                                      <hr>
                                                    </div>


                                                    <div id="fragment_02-25">
                                                      <h3 class="fragment-title">27人目情報（<span class="text-danger">27名様の場合は必須</span>）</h3
                                                        class="fragment-title">

                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <input type="hidden" name="cli_id_27" value="{if !empty($cli_id_27)}{$cli_id_27}{/if}">
                                                          <input type="text" class="form-control" name="cli_name_l_27"
                                                            value="{if !empty($cli_name_l_27)}{$cli_name_l_27}{/if}"
                                                            placeholder="姓" maxlength="20">
                                                        </div>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <input type="text" class="form-control" name="cli_name_f_27"
                                                            value="{if !empty($cli_name_f_27)}{$cli_name_f_27}{/if}"
                                                            placeholder="名" maxlength="20">
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <span class="name_roman_letter">{if
                                                            !empty($cli_name_el_27)}{$cli_name_el_27}{/if}</span>
                                                          <input type="hidden" name="cli_name_el_27" value="{if !empty($cli_name_el_27)}{$cli_name_el_27}{/if}" />
                                                        </div>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <span class="name_roman_letter">{if
                                                            !empty($cli_name_ef_27)}{$cli_name_ef_27}{/if}</span>
                                                          <input type="hidden" name="cli_name_ef_27" value="{if !empty($cli_name_ef_27)}{$cli_name_ef_27}{/if}" />
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                            class="optional"></span>フリガナ</label>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <input type="text" class="form-control" name="cli_name_kl_27"
                                                            value="{if !empty($cli_name_kl_27)}{$cli_name_kl_27}{/if}"
                                                            placeholder="セイ" maxlength="20">
                                                        </div>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <input type="text" class="form-control" name="cli_name_kf_27"
                                                            value="{if !empty($cli_name_kf_27)}{$cli_name_kf_27}{/if}"
                                                            placeholder="メイ" maxlength="20">
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-6 col-sm-3 col-md-3">
                                                          <label class="radio-inline"><input type="radio" name="nation_sw_27"
                                                              value="1" {if !empty($nation_sw_27) and $nation_sw_27 eq
                                                              '1' }checked="checked" {/if}>日本 </label> <label class="radio-inline"><input
                                                              type="radio" name="nation_sw_27" value="2" {if
                                                              !empty($nation_sw_27) and $nation_sw_27 eq '2' }checked="checked"
                                                              {/if}>他 </label> </div> <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <input type="text" class="form-control" name="nation_txt_27"
                                                              value="{if !empty($nation_txt_27)}{$nation_txt_27}{/if}"
                                                              placeholder="国名" maxlength="20">
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                                          <input class="form-control" type="date" name="birth_date_27"
                                                            value="{if !empty($birth_date_27)}{$birth_date_27}{/if}"
                                                            onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                            data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                        </div>
                                                      </div>
                                                      <div class="form-group">
                                                        <div class="col-sm-1 col-md-2"></div>
                                                        <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別
                                                          <span class="text-danger asterisk">*</span></label>
                                                        <div class="col col-xs-12 col-sm-6 col-md-6">
                                                          <label class="radio-inline"><input type="radio" name="sex_27"
                                                              value="1" {if !empty($sex_27) and $sex_27 eq '1' }checked="checked"
                                                              {/if}>男性 </label> <label class="radio-inline"><input type="radio"
                                                              name="sex_27" value="2" {if !empty($sex_27) and $sex_27
                                                              eq '2' }checked="checked" {/if}>女性 </label> </div> </div>
                                                              <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="text" class="form-control" name="pass_txt_27"
                                                                value="{if !empty($pass_txt_27)}{$pass_txt_27}{/if}"
                                                                placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input class="form-control" type="date" name="pass_date_s_27"
                                                              value="{if !empty($pass_date_s_27)}{$pass_date_s_27}{/if}"
                                                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input class="form-control" type="date" name="pass_date_e_27"
                                                              value="{if !empty($pass_date_e_27)}{$pass_date_e_27}{/if}"
                                                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                              class="optional"></span>メールアドレス</label>
                                                          <div class="col-xs-12 col-sm-6 col-md-6">
                                                            <input type="text" class="form-control" name="cli_mail_27"
                                                              value="{if !empty($cli_mail_27)}{$cli_mail_27}{/if}"
                                                              placeholder="abc@i.softbank.jp">
                                                            <div class="help-block with-errors"></div>
                                                          </div>
                                                        </div>

                                                        <hr>
                                                      </div>


                                                      <div id="fragment_02-26">
                                                        <h3 class="fragment-title">28人目情報（<span class="text-danger">28名様の場合は必須</span>）</h3
                                                          class="fragment-title">

                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <input type="hidden" name="cli_id_28" value="{if !empty($cli_id_28)}{$cli_id_28}{/if}">
                                                            <input type="text" class="form-control" name="cli_name_l_28"
                                                              value="{if !empty($cli_name_l_28)}{$cli_name_l_28}{/if}"
                                                              placeholder="姓" maxlength="20">
                                                          </div>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <input type="text" class="form-control" name="cli_name_f_28"
                                                              value="{if !empty($cli_name_f_28)}{$cli_name_f_28}{/if}"
                                                              placeholder="名" maxlength="20">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <span class="name_roman_letter">{if
                                                              !empty($cli_name_el_28)}{$cli_name_el_28}{/if}</span>
                                                            <input type="hidden" name="cli_name_el_28" value="{if !empty($cli_name_el_28)}{$cli_name_el_28}{/if}" />
                                                          </div>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <span class="name_roman_letter">{if
                                                              !empty($cli_name_ef_28)}{$cli_name_ef_28}{/if}</span>
                                                            <input type="hidden" name="cli_name_ef_28" value="{if !empty($cli_name_ef_28)}{$cli_name_ef_28}{/if}" />
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                              class="optional"></span>フリガナ</label>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <input type="text" class="form-control" name="cli_name_kl_28"
                                                              value="{if !empty($cli_name_kl_28)}{$cli_name_kl_28}{/if}"
                                                              placeholder="セイ" maxlength="20">
                                                          </div>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <input type="text" class="form-control" name="cli_name_kf_28"
                                                              value="{if !empty($cli_name_kf_28)}{$cli_name_kf_28}{/if}"
                                                              placeholder="メイ" maxlength="20">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-6 col-sm-3 col-md-3">
                                                            <label class="radio-inline"><input type="radio" name="nation_sw_28"
                                                                value="1" {if !empty($nation_sw_28) and $nation_sw_28
                                                                eq '1' }checked="checked" {/if}>日本 </label> <label
                                                                class="radio-inline"><input type="radio" name="nation_sw_28"
                                                                value="2" {if !empty($nation_sw_28) and $nation_sw_28
                                                                eq '2' }checked="checked" {/if}>他 </label> </div> <div
                                                                class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="nation_txt_28"
                                                                value="{if !empty($nation_txt_28)}{$nation_txt_28}{/if}"
                                                                placeholder="国名" maxlength="20">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input class="form-control" type="date" name="birth_date_28"
                                                              value="{if !empty($birth_date_28)}{$birth_date_28}{/if}"
                                                              onInput="checkFormDate(this)" maxlength="10" placeholder="1999-01-01"
                                                              data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <label class="radio-inline"><input type="radio" name="sex_28"
                                                                value="1" {if !empty($sex_28) and $sex_28 eq '1'
                                                                }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input
                                                                type="radio" name="sex_28" value="2" {if
                                                                !empty($sex_28) and $sex_28 eq '2' }checked="checked" {/if}>女性
                                                                </label> </div> </div> <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                <input type="text" class="form-control" name="pass_txt_28"
                                                                  value="{if !empty($pass_txt_28)}{$pass_txt_28}{/if}"
                                                                  placeholder="TR0000001（半角アルファベット2文字と数字7桁）" maxlength="9">
                                                              </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input class="form-control" type="date" name="pass_date_s_28"
                                                                value="{if !empty($pass_date_s_28)}{$pass_date_s_28}{/if}"
                                                                onInput="checkFormDate(this)" maxlength="10"
                                                                placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input class="form-control" type="date" name="pass_date_e_28"
                                                                value="{if !empty($pass_date_e_28)}{$pass_date_e_28}{/if}"
                                                                onInput="checkFormDate(this)" maxlength="10"
                                                                placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                                class="optional"></span>メールアドレス</label>
                                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                              <input type="text" class="form-control" name="cli_mail_28"
                                                                value="{if !empty($cli_mail_28)}{$cli_mail_28}{/if}"
                                                                placeholder="abc@i.softbank.jp">
                                                              <div class="help-block with-errors"></div>
                                                            </div>
                                                          </div>

                                                          <hr>
                                                        </div>


                                                        <div id="fragment_02-27">
                                                          <h3 class="fragment-title">29人目情報（<span class="text-danger">29名様の場合は必須</span>）</h3
                                                            class="fragment-title">

                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="hidden" name="cli_id_29" value="{if !empty($cli_id_29)}{$cli_id_29}{/if}">
                                                              <input type="text" class="form-control" name="cli_name_l_29"
                                                                value="{if !empty($cli_name_l_29)}{$cli_name_l_29}{/if}"
                                                                placeholder="姓" maxlength="20">
                                                            </div>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="cli_name_f_29"
                                                                value="{if !empty($cli_name_f_29)}{$cli_name_f_29}{/if}"
                                                                placeholder="名" maxlength="20">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <span class="name_roman_letter">{if
                                                                !empty($cli_name_el_29)}{$cli_name_el_29}{/if}</span>
                                                              <input type="hidden" name="cli_name_el_29" value="{if !empty($cli_name_el_29)}{$cli_name_el_29}{/if}" />
                                                            </div>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <span class="name_roman_letter">{if
                                                                !empty($cli_name_ef_29)}{$cli_name_ef_29}{/if}</span>
                                                              <input type="hidden" name="cli_name_ef_29" value="{if !empty($cli_name_ef_29)}{$cli_name_ef_29}{/if}" />
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                                class="optional"></span>フリガナ</label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="cli_name_kl_29"
                                                                value="{if !empty($cli_name_kl_29)}{$cli_name_kl_29}{/if}"
                                                                placeholder="セイ" maxlength="20">
                                                            </div>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="cli_name_kf_29"
                                                                value="{if !empty($cli_name_kf_29)}{$cli_name_kf_29}{/if}"
                                                                placeholder="メイ" maxlength="20">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <label class="radio-inline"><input type="radio" name="nation_sw_29"
                                                                  value="1" {if !empty($nation_sw_29) and $nation_sw_29
                                                                  eq '1' }checked="checked" {/if}>日本 </label> <label
                                                                  class="radio-inline"><input type="radio" name="nation_sw_29"
                                                                  value="2" {if !empty($nation_sw_29) and $nation_sw_29
                                                                  eq '2' }checked="checked" {/if}>他 </label> </div>
                                                                  <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <input type="text" class="form-control" name="nation_txt_29"
                                                                  value="{if !empty($nation_txt_29)}{$nation_txt_29}{/if}"
                                                                  placeholder="国名" maxlength="20">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input class="form-control" type="date" name="birth_date_29"
                                                                value="{if !empty($birth_date_29)}{$birth_date_29}{/if}"
                                                                onInput="checkFormDate(this)" maxlength="10"
                                                                placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <label class="radio-inline"><input type="radio" name="sex_29"
                                                                  value="1" {if !empty($sex_29) and $sex_29 eq '1'
                                                                  }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input
                                                                  type="radio" name="sex_29" value="2" {if
                                                                  !empty($sex_29) and $sex_29 eq '2' }checked="checked"
                                                                  {/if}>女性 </label> </div> </div> <div class="form-group">
                                                                <div class="col-sm-1 col-md-2"></div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                                  <span class="text-danger asterisk">*</span></label>
                                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                  <input type="text" class="form-control" name="pass_txt_29"
                                                                    value="{if !empty($pass_txt_29)}{$pass_txt_29}{/if}"
                                                                    placeholder="TR0000001（半角アルファベット2文字と数字7桁）"
                                                                    maxlength="9">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                <input class="form-control" type="date" name="pass_date_s_29"
                                                                  value="{if !empty($pass_date_s_29)}{$pass_date_s_29}{/if}"
                                                                  onInput="checkFormDate(this)" maxlength="10"
                                                                  placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                <input class="form-control" type="date" name="pass_date_e_29"
                                                                  value="{if !empty($pass_date_e_29)}{$pass_date_e_29}{/if}"
                                                                  onInput="checkFormDate(this)" maxlength="10"
                                                                  placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                                  class="optional"></span>メールアドレス</label>
                                                              <div class="col-xs-12 col-sm-6 col-md-6">
                                                                <input type="text" class="form-control" name="cli_mail_29"
                                                                  value="{if !empty($cli_mail_29)}{$cli_mail_29}{/if}"
                                                                  placeholder="abc@i.softbank.jp">
                                                                <div class="help-block with-errors"></div>
                                                              </div>
                                                            </div>

                                                            <hr>
                                                          </div>


                                                          <div id="fragment_02-28">
                                                            <h3 class="fragment-title">30人目情報（<span class="text-danger">30名様の場合は必須</span>）</h3
                                                              class="fragment-title">

                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <input type="hidden" name="cli_id_30" value="{if !empty($cli_id_30)}{$cli_id_30}{/if}">
                                                                <input type="text" class="form-control" name="cli_name_l_30"
                                                                  value="{if !empty($cli_name_l_30)}{$cli_name_l_30}{/if}"
                                                                  placeholder="姓" maxlength="20">
                                                              </div>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <input type="text" class="form-control" name="cli_name_f_30"
                                                                  value="{if !empty($cli_name_f_30)}{$cli_name_f_30}{/if}"
                                                                  placeholder="名" maxlength="20">
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">姓・名（ローマ字）
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <span class="name_roman_letter">{if
                                                                  !empty($cli_name_el_30)}{$cli_name_el_30}{/if}</span>
                                                                <input type="hidden" name="cli_name_el_30" value="{if !empty($cli_name_el_30)}{$cli_name_el_30}{/if}" />
                                                              </div>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <span class="name_roman_letter">{if
                                                                  !empty($cli_name_ef_30)}{$cli_name_ef_30}{/if}</span>
                                                                <input type="hidden" name="cli_name_ef_30" value="{if !empty($cli_name_ef_30)}{$cli_name_ef_30}{/if}" />
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                                  class="optional"></span>フリガナ
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <input type="text" class="form-control" name="cli_name_kl_30"
                                                                  value="{if !empty($cli_name_kl_30)}{$cli_name_kl_30}{/if}"
                                                                  placeholder="セイ" maxlength="20">
                                                              </div>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <input type="text" class="form-control" name="cli_name_kf_30"
                                                                  value="{if !empty($cli_name_kf_30)}{$cli_name_kf_30}{/if}"
                                                                  placeholder="メイ" maxlength="20">
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">国籍
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-6 col-sm-3 col-md-3">
                                                                <label class="radio-inline"><input type="radio" name="nation_sw_30"
                                                                    value="1" {if !empty($nation_sw_30) and
                                                                    $nation_sw_30 eq '1' }checked="checked" {/if}>日本 </label>
                                                                    <label class="radio-inline"><input type="radio"
                                                                    name="nation_sw_30" value="2" {if
                                                                    !empty($nation_sw_30) and $nation_sw_30 eq '2'
                                                                    }checked="checked" {/if}>他 </label> </div> <div
                                                                    class="col col-xs-6 col-sm-3 col-md-4">
                                                                  <input type="text" class="form-control" name="nation_txt_30"
                                                                    value="{if !empty($nation_txt_30)}{$nation_txt_30}{/if}"
                                                                    placeholder="国名" maxlength="20">
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">生年月日
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                <input class="form-control" type="date" name="birth_date_30"
                                                                  value="{if !empty($birth_date_30)}{$birth_date_30}{/if}"
                                                                  onInput="checkFormDate(this)" maxlength="10"
                                                                  placeholder="1999-01-01" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">性別
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                <label class="radio-inline"><input type="radio" name="sex_30"
                                                                    value="1" {if !empty($sex_30) and $sex_30 eq '1'
                                                                    }checked="checked" {/if}>男性 </label> <label class="radio-inline"><input
                                                                    type="radio" name="sex_30" value="2" {if
                                                                    !empty($sex_30) and $sex_30 eq '2' }checked="checked"
                                                                    {/if}>女性 </label> </div> </div> <div class="form-group">
                                                                  <div class="col-sm-1 col-md-2"></div>
                                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">旅券番号
                                                                    <span class="text-danger asterisk">*</span></label>
                                                                  <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                    <input type="text" class="form-control" name="pass_txt_30"
                                                                      value="{if !empty($pass_txt_30)}{$pass_txt_30}{/if}"
                                                                      placeholder="TR0000001（半角アルファベット2文字と数字7桁）"
                                                                      maxlength="9">
                                                                  </div>
                                                              </div>
                                                              <div class="form-group">
                                                                <div class="col-sm-1 col-md-2"></div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">発行年月日
                                                                  <span class="text-danger asterisk">*</span></label>
                                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                  <input class="form-control" type="date" name="pass_date_s_30"
                                                                    value="{if !empty($pass_date_s_30)}{$pass_date_s_30}{/if}"
                                                                    onInput="checkFormDate(this)" maxlength="10"
                                                                    placeholder="1999-01-01" data-date=""
                                                                    data-date-error="1999-01-01 の形式で入力して下さい">
                                                                </div>
                                                              </div>
                                                              <div class="form-group">
                                                                <div class="col-sm-1 col-md-2"></div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">有効期限満了日
                                                                  <span class="text-danger asterisk">*</span></label>
                                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                  <input class="form-control" type="date" name="pass_date_e_30"
                                                                    value="{if !empty($pass_date_e_30)}{$pass_date_e_30}{/if}"
                                                                    onInput="checkFormDate(this)" maxlength="10"
                                                                    placeholder="1999-01-01" data-date=""
                                                                    data-date-error="1999-01-01 の形式で入力して下さい">
                                                                </div>
                                                              </div>
                                                              <div class="form-group">
                                                                <div class="col-sm-1 col-md-2"></div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label"><span
                                                                    class="optional"></span>メールアドレス</label>
                                                                <div class="col-xs-12 col-sm-6 col-md-6">
                                                                  <input type="text" class="form-control" name="cli_mail_30"
                                                                    value="{if !empty($cli_mail_30)}{$cli_mail_30}{/if}"
                                                                    placeholder="abc@i.softbank.jp">
                                                                  <div class="help-block with-errors"></div>
                                                                </div>
                                                              </div>

                                                              <hr>
                                                            </div>


                                                            <div id="fragment_03">
                                                              <h3 class="fragment-title_user">3人目以降用フォーム追加・削除ボタン（任意）</h3>

                                                              <div class="form-group">
                                                                <label class="col col-xs-12 col-sm-1 col-md-2 control-label"></label>
                                                                <div class="col col-xs-5 col-sm-2 col-md-2">
                                                                  <button type="button" class="btn btn-success btn_add_form">+</button>
                                                                  <button type="button" class="btn btn-warning btn_remove_form">-</button>
                                                                </div>
                                                                <span class="help-block col-xs-7">3人目以降は、ボタンを押して追加フォームに入力して下さい。（最大8人まで）</span>
                                                              </div>
                                                            </div>


                                                            <hr>


                                                            <div id="fragment_04">
                                                              <h3 class="fragment-title">旅行申込情報（<span class="text-danger">必須</span>）</h3>
                                                              <div class="form-group">
                                                                <div class="col-sm-1 col-md-2"></div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">ご出発日
                                                                  <span class="text-danger asterisk">*</span></label>
                                                                <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                  <input class="form-control" type="date" name="cruise_date_s"
                                                                    value="{if !empty($cruise_date_s)}{$cruise_date_s}{/if}"
                                                                    required data-error="ご出発日 は必須入力です" maxlength="10"
                                                                    placeholder="1999-01-01" data-date=""
                                                                    data-date-error="1999-01-01 の形式で入力して下さい">
                                                                  <div class="help-block with-errors"></div>
                                                                </div>
                                                              </div>
                                                              <div class="form-group">
                                                                <div class="col-sm-1 col-md-2"></div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">船名
                                                                  <span class="text-danger asterisk">*</span></label>
                                                                <div class="col-xs-12 col-sm-6 col-md-6">
                                                                  <select class="form-control" name="ship_cd" required
                                                                    data-error="船名 は選択必須です">
                                                                    <option value="">船名を選択してください</option>
                                                                    {foreach key=cat_id from=$ship_list item=cat_cp}
                                                                    <option value="{$cat_id}" {if !empty($ship_cd) and
                                                                      $cat_id eq $ship_cd}selected{/if}>{$cat_cp} </option>
                                                                      {/foreach} </select> <div class="help-block with-errors">
                                                                </div>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">コース名
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col col-xs-12 col-sm-6 col-md-6">
                                                                <input type="text" class="form-control" name="course_name"
                                                                  value="{if !empty($course_name)}{$course_name}{/if}"
                                                                  placeholder="MSCスプレンディダ号で行く　日本の美を再発見する　9泊10日　-横浜発着-"
                                                                  required data-error="コース名 は必須入力です" maxlength="150">
                                                                <div class="help-block with-errors"></div>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">船室カテゴリー
                                                                <span class="text-danger asterisk">*</span></label>
                                                              <div class="col-xs-12 col-sm-6 col-md-6">
                                                                <select class="form-control" name="room_1_cd" required
                                                                  data-error="船室カテゴリー は選択必須です">
                                                                  <option value="">船室カテゴリーを選択してください</option>
                                                                  {foreach key=cat_id from=$room_1_list item=cat_cp}
                                                                  <option value="{$cat_id}" {if !empty($room_1_cd) and
                                                                    $cat_id eq $room_1_cd}selected{/if}>{$cat_cp} </option>
                                                                    {/foreach} </select> <div class="help-block with-errors">
                                                              </div>
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">メールアドレス
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                              <input type="email" class="form-control" name="cli_mail_1"
                                                                value="{if !empty($cli_mail_1)}{$cli_mail_1}{/if}"
                                                                placeholder="abc@i.softbank.jp" required data-error="メールアドレス は必須入力です（例:
                                                              abc@i.softbank.jp）">
                                                              <div class="help-block with-errors"></div>
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label for="zipcode" class="col col-xs-12 col-sm-4 col-md-3 control-label">住所(資料送付先)
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-4 col-md-4">
                                                              <div class="input-group">
                                                                <span class="input-group-addon">〒</span>
                                                                <input type="number" id="send_zip_1" name="send_zip_1"
                                                                  value="{if !empty($send_zip_1)}{$send_zip_1}{/if}"
                                                                  class="form-control" placeholder="000" maxlength="3">
                                                                <span class="input-group-addon">-</span>
                                                                <input type="number" id="send_zip_2" name="send_zip_2"
                                                                  value="{if !empty($send_zip_2)}{$send_zip_2}{/if}"
                                                                  class="form-control" placeholder="0000" maxlength="4">
                                                              </div>
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label"></label>
                                                            <div class="col col-xs-12 col-sm-4 col-md-4">
                                                              <select class="form-control" id="send_pref_cd" name="send_pref_cd"
                                                                required data-error="都道府県 は選択必須です">
                                                                <option value="">都道府県を選択してください *</option>
                                                                {foreach key=cat_id from=$send_pref_list item=cat_cp}
                                                                <option value="{$cat_id}" {if !empty($send_pref_cd) and
                                                                  $cat_id eq $send_pref_cd}selected{/if}>{$cat_cp} </option>
                                                                  {/foreach} <div class="help-block with-errors">
                                                            </div>
                                                            </select>
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input type="text" class="form-control" id="send_ad_1" name="send_ad_1"
                                                              value="{if !empty($send_ad_1)}{$send_ad_1}{/if}"
                                                              placeholder="市区町村・番地 *" required data-error="市区町村・番地 は必須入力です"
                                                              maxlength="50">
                                                            <div class="help-block with-errors"></div>
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label"></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input type="text" class="form-control" name="send_ad_2"
                                                              value="{if !empty($send_ad_2)}{$send_ad_2}{/if}"
                                                              placeholder="マンション名" maxlength="50">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">電話番号
                                                            <span class="text-danger asterisk">*</span></label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input type="tel" class="form-control" name="cli_tel_1"
                                                              value="{if !empty($cli_tel_1)}{$cli_tel_1}{/if}"
                                                              placeholder="08000000001" required data-error="電話番号 は必須入力です（ハイフンなし）"
                                                              maxlength="11">
                                                            <div class="help-block with-errors"></div>
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">FAX番号</label>
                                                          <div class="col col-xs-12 col-sm-6 col-md-6">
                                                            <input type="tel" class="form-control" name="cli_fax" value="{if !empty($cli_fax)}{$cli_fax}{/if}"
                                                              placeholder="0300000002" maxlength="11">
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">記念日</label>
                                                          <div class="col-xs-12 col-sm-6 col-md-6">
                                                            <label class="checkbox-inline"><input type="checkbox" name="birth_sw"
                                                                value="2" {if !empty($birth_sw) and $birth_sw eq '2'
                                                                }checked{/if}>お誕生日 </label> <label class="checkbox-inline"><input
                                                                type="checkbox" name="honeymoon_sw" value="2" {if
                                                                !empty($honeymoon_sw) and $honeymoon_sw eq '2'
                                                                }checked{/if}>ハネムーン </label> </div> </div> <div class="form-group">
                                                              <div class="col-sm-1 col-md-2"></div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">ご結婚記念日</label>
                                                              <div class="col-xs-12 col-sm-6 col-md-6">
                                                                <input class="form-control" type="date" name="wedding_date"
                                                                  value="{if !empty($wedding_date)}{$wedding_date}{/if}"
                                                                  maxlength="10" placeholder="1999-01-01" data-date=""
                                                                  data-date-error="1999-01-01 の形式で入力して下さい">
                                                              </div>
                                                          </div>
                                                        </div>


                                                        <hr>


                                                        <div id="fragment_05">
                                                          <h3 id="fragment-title_danger">緊急時のご連絡先（<span class="text-danger">必須</span>）</h3>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">氏名
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="contact_name"
                                                                value="{if !empty($contact_name)}{$contact_name}{/if}"
                                                                placeholder="姓名" required data-error="姓名 は必須入力です"
                                                                maxlength="20">
                                                              <div class="help-block with-errors"></div>
                                                            </div>

                                                            <!--設計にないので非表示とする
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="contact_kana_f" value="{if !empty($aaaaa)}{$aaaaa}{/if}" placeholder="名" required data-error="名 は必須入力です" maxlength="20">
              <div class="help-block with-errors"></div>
            </div>
            -->

                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">フリガナ</label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="contact_kana"
                                                                value="{if !empty($contact_kana)}{$contact_kana}{/if}"
                                                                placeholder="セイメイ" required data-error="セイメイ は必須入力です"
                                                                maxlength="20">
                                                              <div class="help-block with-errors"></div>
                                                            </div>

                                                            <!--設計にないので非表示とする
            <div class="col col-xs-6 col-sm-3 col-md-3">
              <input type="text" class="form-control" name="contact_kana_f" value="{if !empty($aaaaa)}{$aaaaa}{/if}" placeholder="メイ" required data-error="メイ は必須入力です" maxlength="20">
              <div class="help-block with-errors"></div>
            </div>
            -->

                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">続柄
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-6 col-sm-3 col-md-3">
                                                              <input type="text" class="form-control" name="contact_z"
                                                                value="{if !empty($contact_z)}{$contact_z}{/if}"
                                                                placeholder="父" required data-error="続柄 は必須入力です"
                                                                maxlength="20">
                                                              <div class="help-block with-errors"></div>
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">電話番号など連絡先
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="text" class="form-control" name="contact_tel"
                                                                value="{if !empty($contact_tel)}{$contact_tel}{/if}"
                                                                placeholder="電話番号など連絡先" required data-error="電話番号など連絡先 は必須入力です"
                                                                maxlength="100">
                                                              <div class="help-block with-errors"></div>
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">メールアドレス</label>
                                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                              <input type="email" class="form-control" name="contact_mail"
                                                                value="{if !empty($contact_mail)}{$contact_mail}{/if}"
                                                                placeholder="abc@i.softbank.jp">
                                                            </div>
                                                          </div>
                                                          <hr>
                                                          <h3 id="fragment-title_danger">海外旅行保険の可否について（<span class="text-danger">必須</span>）</h3>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label">海外旅行保険に加入しておリますか？
                                                              <span class="text-danger asterisk">*</span></label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <label class="radio-inline"><input type="radio" name="insurance"
                                                                  value="1" {if !empty($insurance) and $insurance eq
                                                                  '1' }checked="checked" {/if}>はい </label> <label class="radio-inline"><input
                                                                  type="radio" name="insurance" value="2" {if
                                                                  !empty($insurance) and $insurance eq '2' }checked="checked"
                                                                  {/if}>いいえ </label> <div class="help-block with-errors"></div>
                                                            <p class="recommendation-text" style="color:#A94442;">※全てのお客様に加入を強く勧めております。</p>
                                                          </div>
                                                        </div>
                                                        <div class="
                                                              form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="optional col col-xs-12 col-sm-4 col-md-3 control-label">「いいえ」
                                                            を選択した方のみ
                                                            <br>ご理由記入欄
                                                          </label>
                                                          <div class="col-xs-12 col-sm-6 col-md-6">
                                                            <textarea name="insurance_txt" cols="30" rows="10"
                                                              maxlength="100" placeholder="ご意見・ご要望">{if !empty($insurance_txt)}{$insurance_txt}{/if}</textarea>
                                                          </div>
                                                        </div>
                                                        <div class="form-group">
                                                          <div class="col-sm-1 col-md-2"></div>
                                                          <label class="col col-xs-12 col-sm-4 col-md-3 control-label">海外旅行保険加入がまだの方
                                                          </label>
                                                          <div class="col-xs-12 col-sm-6 col-md-6">
                                                            <p class="insurance_btn"><a href="https://www-429.aig.co.jp/ota/?p=oKC1XT01"
                                                                target="_blank" rel="nofollow">AIG損保オンライン予約でお申し込み</a></p>
                                                          </div>
                                                        </div>


                                                        <hr id="
                                                                fragment_06hr"
                                                          style="margin: 15px 0;">


                                                        <div id="fragment_06-0">
                                                          <h3 class="fragment-title_user">ご自身でホテル、航空券を手配される場合（任意）</h3>
                                                          <div class="form-group">
                                                            <label class="col col-xs-12 col-sm-1 col-md-2 control-label"></label>
                                                            <div class="col col-xs-2 col-sm-2 col-md-2">
                                                              <button type="button" class="btn btn-success btn_add_form6">+</button>
                                                            </div>
                                                            <span class="help-block">ご自身でお手配の場合は、ボタンを押して入力して下さい。</span>
                                                          </div>
                                                        </div>


                                                        <div id="fragment_06">
                                                          <h3>ご自身でホテル、航空券を手配される場合（任意）</h3>
                                                          <button type="button" class="btn btn-warning btn_remove_form6">-</button>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">前泊ホテル名</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="text" class="form-control" name="self_1"
                                                                value="{if !empty($self_1)}{$self_1}{/if}" placeholder="神戸ベイシェラトン ホテル＆タワーズ"
                                                                maxlength="30">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">前泊ホテル連絡先（TEL）</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="tel" class="form-control" name="self_1_tel"
                                                                value="{if !empty($self_1_tel)}{$self_1_tel}{/if}"
                                                                placeholder="08000000001" maxlength="11">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">前泊ホテル連絡先（FAX）</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="tel" class="form-control" name="self_1_fax"
                                                                value="{if !empty($self_1_fax)}{$self_1_fax}{/if}"
                                                                placeholder="0300000002" maxlength="11">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">行きの航空券（利用航空会社）</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="text" class="form-control" name="self_3"
                                                                value="{if !empty($self_3)}{$self_3}{/if}" placeholder="ANA"
                                                                maxlength="30">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">
                                                              行きの航空券（便名）</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <input type="text" class="form-control" name="self_3_txt"
                                                                value="{if !empty($self_3_txt)}{$self_3_txt}{/if}"
                                                                placeholder="NH001" maxlength="30">
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">出発日</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <div class="input-group">
                                                                <span class="input-group-addon">日付</span>
                                                                <input class="form-control" type="date" name="self_3_date_s"
                                                                  value="{if !empty($self_3_date_s)}{$self_3_date_s}{/if}"
                                                                  placeholder="1999-01-01" onInput="checkFormDate(this)"
                                                                  maxlength="10" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                                <span class="input-group-addon">時間</span>
                                                                <input class="form-control" type="time" name="self_3_time_s"
                                                                  value="{if !empty($self_3_time_s)}{$self_3_time_s}{/if}"
                                                                  placeholder="00:00" onInput="checkFormTime(this)"
                                                                  maxlength="5" data-time="" data-time-error="00:00 の形式で入力して下さい">
                                                              </div>
                                                            </div>
                                                          </div>
                                                          <div class="form-group">
                                                            <div class="col-sm-1 col-md-2"></div>
                                                            <label class="col col-xs-12 col-sm-4 col-md-3 control-label optional">到着日</label>
                                                            <div class="col col-xs-12 col-sm-6 col-md-6">
                                                              <div class="input-group">
                                                                <span class="input-group-addon">日付</span>
                                                                <input class="form-control" type="date" name="self_3_date_e"
                                                                  value="{if !empty($self_3_date_e)}{$self_3_date_e}{/if}"
                                                                  placeholder="1999-01-01" onInput="checkFormDate(this)"
                                                                  maxlength="10" data-date="" data-date-error="1999-01-01 の形式で入力して下さい">
                                                                <span class="input-group-addon">時間</span>
                                                                <input class="form-control" type="time" name="self_3_time_e"
                                                                  value="{if !empty($self_3_time_e)}{$self_3_time_e}{/if}"
                                                                  placeholder="00:00" onInput="checkFormTime(this)"
                                                                  maxlength="5" data-time="" data-time-error="00:00 の形式で入力して下さい">
                                                              </div>
                                                            </div>
                                                          </div>
                                                        </div>


                                                        <hr id="fragment_07hr" style="margin: 15px 0;">


                                                        <div id="fragment_07-0">
                                                          <h3 id="form-website" class="fragment-title_user">弊社サービスについてのアンケート（任意）</h3>
                                                          <div class="form-group">
                                                            <label class="col col-xs-12 col-sm-3 col-md-3 control-label"></label>
                                                            <div class="col col-xs-12 col-sm-7 col-md-6">
                                                              <span class="help-block">
                                                                お答えいただいた方、抽選で毎月2名様に船会社ロイヤリティグッズをプレゼントいたします。(*年1回発送いたします。)
                                                                弊社にお申込みいただいた理由に◯印をお願いいたします。(複数選択可)
                                                              </span>
                                                            </div>
                                                          </div>
                                                        </div>


                                                        <div id="fragment_07">
                                                          <!-- <h3>弊社サービスについてのアンケート（）</h3>
                                                            <button type="button" class="btn btn-warning btn_remove_form7">-</button>
                                                            <br>
                                                            <br> -->
                                                          <div class="form-group">
                                                            <h4 class="form-group__label aste">担当者のサービス</h4>
                                                            <div class="form-group">
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">担当者名</label>
                                                              <div class="col col-xs-5 col-sm-3 col-md-3">
                                                                <input type="text" class="form-control" name="user_name"
                                                                  value="{if !empty($user_name)}{$user_name}{/if}"
                                                                  placeholder="担当者名" maxlength="20">
                                                              </div>
                                                            </div>
                                                            <div class="float-height__hidden">
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">親切・丁寧</label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                <input class="checkbox-inline" type="radio" id="1" name="service_chk_1"
                                                                  value="5" {if !empty($service_chk_1) and
                                                                  $service_chk_1 eq '5' }checked{/if}> <label for="1"
                                                                  class="form-face"><span class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="2" name="service_chk_1"
                                                                  value="4" {if !empty($service_chk_1) and
                                                                  $service_chk_1 eq '4' }checked{/if}> <label for="2"
                                                                  class="form-face"><span class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="3" name="service_chk_1"
                                                                  value="3" {if !empty($service_chk_1) and
                                                                  $service_chk_1 eq '3' }checked{/if}> <label for="3"
                                                                  class="form-face"><span class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="4" name="service_chk_1"
                                                                  value="2" {if !empty($service_chk_1) and
                                                                  $service_chk_1 eq '2' }checked{/if}> <label for="4"
                                                                  class="form-face"><span class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="5" name="service_chk_1"
                                                                  value="1" {if !empty($service_chk_1) and
                                                                  $service_chk_1 eq '1' }checked{/if}> <label for="5"
                                                                  class="form-face"><span class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                              </div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">スピーディ</label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                <input class="checkbox-inline" type="radio" id="11"
                                                                  name="service_chk_2" value="5" {if
                                                                  !empty($service_chk_2) and $service_chk_2 eq '5'
                                                                  }checked{/if}> <label for="11" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="12"
                                                                  name="service_chk_2" value="4" {if
                                                                  !empty($service_chk_2) and $service_chk_2 eq '4'
                                                                  }checked{/if}> <label for="12" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="13"
                                                                  name="service_chk_2" value="3" {if
                                                                  !empty($service_chk_2) and $service_chk_2 eq '3'
                                                                  }checked{/if}> <label for="13" class="form-face"><span
                                                                  class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="14"
                                                                  name="service_chk_2" value="2" {if
                                                                  !empty($service_chk_2) and $service_chk_2 eq '2'
                                                                  }checked{/if}> <label for="14" class="form-face"><span
                                                                  class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="15"
                                                                  name="service_chk_2" value="1" {if
                                                                  !empty($service_chk_2) and $service_chk_2 eq '1'
                                                                  }checked{/if}> <label for="15" class="form-face"><span
                                                                  class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                              </div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">知識・情報量</label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                <input class="checkbox-inline" type="radio" id="21"
                                                                  name="service_chk_3" value="5" {if
                                                                  !empty($service_chk_3) and $service_chk_3 eq '5'
                                                                  }checked{/if}> <label for="21" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="22"
                                                                  name="service_chk_3" value="4" {if
                                                                  !empty($service_chk_3) and $service_chk_3 eq '4'
                                                                  }checked{/if}> <label for="22" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="23"
                                                                  name="service_chk_3" value="3" {if
                                                                  !empty($service_chk_3) and $service_chk_3 eq '3'
                                                                  }checked{/if}> <label for="23" class="form-face"><span
                                                                  class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="24"
                                                                  name="service_chk_3" value="2" {if
                                                                  !empty($service_chk_3) and $service_chk_3 eq '2'
                                                                  }checked{/if}> <label for="24" class="form-face"><span
                                                                  class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="25"
                                                                  name="service_chk_3" value="1" {if
                                                                  !empty($service_chk_3) and $service_chk_3 eq '1'
                                                                  }checked{/if}> <label for="25" class="form-face"><span
                                                                  class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                              </div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">提案力</label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                <input class="checkbox-inline" type="radio" id="31"
                                                                  name="service_chk_4" value="5" {if
                                                                  !empty($service_chk_4) and $service_chk_4 eq '5'
                                                                  }checked{/if}> <label for="31" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="32"
                                                                  name="service_chk_4" value="4" {if
                                                                  !empty($service_chk_4) and $service_chk_4 eq '4'
                                                                  }checked{/if}> <label for="32" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="33"
                                                                  name="service_chk_4" value="3" {if
                                                                  !empty($service_chk_4) and $service_chk_4 eq '3'
                                                                  }checked{/if}> <label for="33" class="form-face"><span
                                                                  class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="34"
                                                                  name="service_chk_4" value="2" {if
                                                                  !empty($service_chk_4) and $service_chk_4 eq '2'
                                                                  }checked{/if}> <label for="34" class="form-face"><span
                                                                  class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="35"
                                                                  name="service_chk_4" value="1" {if
                                                                  !empty($service_chk_4) and $service_chk_4 eq '1'
                                                                  }checked{/if}> <label for="35" class="form-face"><span
                                                                  class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                              </div>
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">ご案内の明確さ</label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                <input class="checkbox-inline" type="radio" id="41"
                                                                  name="service_chk_5" value="5" {if
                                                                  !empty($service_chk_5) and $service_chk_5 eq '5'
                                                                  }checked{/if}> <label for="41" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="42"
                                                                  name="service_chk_5" value="4" {if
                                                                  !empty($service_chk_5) and $service_chk_5 eq '4'
                                                                  }checked{/if}> <label for="42" class="form-face"><span
                                                                  class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="43"
                                                                  name="service_chk_5" value="3" {if
                                                                  !empty($service_chk_5) and $service_chk_5 eq '3'
                                                                  }checked{/if}> <label for="43" class="form-face"><span
                                                                  class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="44"
                                                                  name="service_chk_5" value="2" {if
                                                                  !empty($service_chk_5) and $service_chk_5 eq '2'
                                                                  }checked{/if}> <label for="44" class="form-face"><span
                                                                  class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                <input class="checkbox-inline" type="radio" id="45"
                                                                  name="service_chk_5" value="1" {if
                                                                  !empty($service_chk_5) and $service_chk_5 eq '1'
                                                                  }checked{/if}> <label for="45" class="form-face"><span
                                                                  class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                              </div>
                                                            </div>
                                                            <div class="float-height__hidden">
                                                              <div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">その他（自由記入）</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                  <textarea name="service_txt" cols="30" rows="10"
                                                                    maxlength="100" placeholder="ご意見・ご要望">{if !empty($service_txt)}{$service_txt}{/if}</textarea>
                                                                </div>
                                                              </div>


                                                            </div>
                                                            <div class="form-group">
                                                              <h4 class="form-group__label form-website aste">サイトの使いやすさ</h4>
                                                              <div class="float-height__hidden">
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">情報量</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                  <input class="checkbox-inline" type="radio" id="51"
                                                                    name="hp_chk_1" value="5" {if !empty($hp_chk_1) and
                                                                    $hp_chk_1 eq '5' }checked{/if}> <label for="51"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="52"
                                                                    name="hp_chk_1" value="4" {if !empty($hp_chk_1) and
                                                                    $hp_chk_1 eq '4' }checked{/if}> <label for="52"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="53"
                                                                    name="hp_chk_1" value="3" {if !empty($hp_chk_1) and
                                                                    $hp_chk_1 eq '3' }checked{/if}> <label for="53"
                                                                    class="form-face"><span class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="54"
                                                                    name="hp_chk_1" value="2" {if !empty($hp_chk_1) and
                                                                    $hp_chk_1 eq '2' }checked{/if}> <label for="54"
                                                                    class="form-face"><span class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="55"
                                                                    name="hp_chk_1" value="1" {if !empty($hp_chk_1) and
                                                                    $hp_chk_1 eq '1' }checked{/if}> <label for="55"
                                                                    class="form-face"><span class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                                </div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">見やすさ</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                  <input class="checkbox-inline" type="radio" id="61"
                                                                    name="hp_chk_2" value="5" {if !empty($hp_chk_2) and
                                                                    $hp_chk_2 eq '5' }checked{/if}> <label for="61"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="62"
                                                                    name="hp_chk_2" value="4" {if !empty($hp_chk_2) and
                                                                    $hp_chk_2 eq '4' }checked{/if}> <label for="62"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="63"
                                                                    name="hp_chk_2" value="3" {if !empty($hp_chk_2) and
                                                                    $hp_chk_2 eq '3' }checked{/if}> <label for="63"
                                                                    class="form-face"><span class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="64"
                                                                    name="hp_chk_2" value="2" {if !empty($hp_chk_2) and
                                                                    $hp_chk_2 eq '2' }checked{/if}> <label for="64"
                                                                    class="form-face"><span class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="65"
                                                                    name="hp_chk_2" value="1" {if !empty($hp_chk_2) and
                                                                    $hp_chk_2 eq '1' }checked{/if}> <label for="65"
                                                                    class="form-face"><span class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                                </div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">デザイン性</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                  <input class="checkbox-inline" type="radio" id="71"
                                                                    name="hp_chk_3" value="5" {if !empty($hp_chk_3) and
                                                                    $hp_chk_3 eq '5' }checked{/if}> <label for="71"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="72"
                                                                    name="hp_chk_3" value="4" {if !empty($hp_chk_3) and
                                                                    $hp_chk_3 eq '4' }checked{/if}> <label for="72"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="73"
                                                                    name="hp_chk_3" value="3" {if !empty($hp_chk_3) and
                                                                    $hp_chk_3 eq '3' }checked{/if}> <label for="73"
                                                                    class="form-face"><span class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="74"
                                                                    name="hp_chk_3" value="2" {if !empty($hp_chk_3) and
                                                                    $hp_chk_3 eq '2' }checked{/if}> <label for="74"
                                                                    class="form-face"><span class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="75"
                                                                    name="hp_chk_3" value="1" {if !empty($hp_chk_3) and
                                                                    $hp_chk_3 eq '1' }checked{/if}> <label for="75"
                                                                    class="form-face"><span class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                                </div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">機能（検索などの使いやすさ）</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                  <input class="checkbox-inline" type="radio" id="81"
                                                                    name="hp_chk_4" value="5" {if !empty($hp_chk_4) and
                                                                    $hp_chk_4 eq '5' }checked{/if}> <label for="81"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="82"
                                                                    name="hp_chk_4" value="4" {if !empty($hp_chk_4) and
                                                                    $hp_chk_4 eq '4' }checked{/if}> <label for="82"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="83"
                                                                    name="hp_chk_4" value="3" {if !empty($hp_chk_4) and
                                                                    $hp_chk_4 eq '3' }checked{/if}> <label for="83"
                                                                    class="form-face"><span class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="84"
                                                                    name="hp_chk_4" value="2" {if !empty($hp_chk_4) and
                                                                    $hp_chk_4 eq '2' }checked{/if}> <label for="84"
                                                                    class="form-face"><span class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="85"
                                                                    name="hp_chk_4" value="1" {if !empty($hp_chk_4) and
                                                                    $hp_chk_4 eq '1' }checked{/if}> <label for="85"
                                                                    class="form-face"><span class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                                </div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">ページ表示速度</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9 input-flex">
                                                                  <input class="checkbox-inline" type="radio" id="91"
                                                                    name="hp_chk_5" value="5" {if !empty($hp_chk_5) and
                                                                    $hp_chk_5 eq '5' }checked{/if}> <label for="91"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-laugh-beam max"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="92"
                                                                    name="hp_chk_5" value="4" {if !empty($hp_chk_5) and
                                                                    $hp_chk_5 eq '4' }checked{/if}> <label for="92"
                                                                    class="form-face"><span class="face2 eva"><i class="far fa-smile top"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="93"
                                                                    name="hp_chk_5" value="3" {if !empty($hp_chk_5) and
                                                                    $hp_chk_5 eq '3' }checked{/if}> <label for="93"
                                                                    class="form-face"><span class="face2 eva "><i class="far fa-meh mid"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="94"
                                                                    name="hp_chk_5" value="2" {if !empty($hp_chk_5) and
                                                                    $hp_chk_5 eq '2' }checked{/if}> <label for="94"
                                                                    class="form-face"><span class="face3 eva"><i class="far fa-frown bot"></i></span></label>
                                                                  <input class="checkbox-inline" type="radio" id="95"
                                                                    name="hp_chk_5" value="1" {if !empty($hp_chk_5) and
                                                                    $hp_chk_5 eq '1' }checked{/if}> <label for="95"
                                                                    class="form-face"><span class="face4 eva"><i class="far fa-dizzy min"></i></span></label>
                                                                </div>
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label firstform__inner">その他（自由入力）</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                  <textarea name="hp_txt" cols="30" rows="10" maxlength="100"
                                                                    placeholder="ご意見・ご要望">{if !empty($hp_txt)}{$hp_txt}{/if}</textarea>
                                                                </div>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <label class="col col-xs-12 col-sm-4 col-md-3 control-label">弊社を何でお知りになりましたか？</label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                <input class="checkbox-inline" type="checkbox" name="enq_chk_1"
                                                                  value="1" {if isset($enq_chk_1) and $enq_chk_1 eq '1'
                                                                  }checked{/if}> Yahoo! <input class="checkbox-inline"
                                                                  type="checkbox" name="enq_chk_2" value="2" {if
                                                                  isset($enq_chk_2) and $enq_chk_2 eq '2' }checked{/if}>
                                                                  Google <input class="checkbox-inline" type="checkbox"
                                                                  name="enq_chk_3" value="3" {if isset($enq_chk_3) and
                                                                  $enq_chk_3 eq '3' }checked{/if}> MSN <input class="checkbox-inline"
                                                                  type="checkbox" name="enq_chk_4" value="4" {if
                                                                  isset($enq_chk_4) and $enq_chk_4 eq '4' }checked{/if}>
                                                                  その他検索 <input class="checkbox-inline" type="checkbox"
                                                                  name="enq_chk_5" value="5" {if isset($enq_chk_5) and
                                                                  $enq_chk_5 eq '5' }checked{/if}> Travel.co.jp <input
                                                                  class="checkbox-inline" type="checkbox" name="enq_chk_6"
                                                                  value="6" {if isset($enq_chk_6) and $enq_chk_6 eq '6'
                                                                  }checked{/if}> 楽天 <input class="checkbox-inline" type="checkbox"
                                                                  name="enq_chk_7" value="7" {if isset($enq_chk_7) and
                                                                  $enq_chk_7 eq '7' }checked{/if}> 旅げーたー <input class="checkbox-inline"
                                                                  type="checkbox" name="enq_chk_8" value="8" {if
                                                                  isset($enq_chk_8) and $enq_chk_8 eq '8' }checked{/if}>
                                                                  All About <input class="checkbox-inline" type="checkbox"
                                                                  name="enq_chk_9" value="9" {if isset($enq_chk_9) and
                                                                  $enq_chk_9 eq '9' }checked{/if}> リンク集 <input class="checkbox-inline"
                                                                  type="checkbox" name="enq_chk_10" value="10" {if
                                                                  isset($enq_chk_10) and $enq_chk_10 eq '10' }checked{/if}>
                                                                  当社チラシ <input class="checkbox-inline" type="checkbox"
                                                                  name="enq_chk_11" value="11" {if isset($enq_chk_11)
                                                                  and $enq_chk_11 eq '11' }checked{/if}> DM <input
                                                                  class="checkbox-inline" type="checkbox" name="enq_chk_12"
                                                                  value="12" {if isset($enq_chk_12) and $enq_chk_12 eq
                                                                  '12' }checked{/if}> 新聞 <input class="checkbox-inline"
                                                                  type="checkbox" name="enq_chk_13" value="13" {if
                                                                  isset($enq_chk_13) and $enq_chk_13 eq '13' }checked{/if}>
                                                                  テレビ <input class="checkbox-inline" type="checkbox"
                                                                  name="enq_chk_14" value="14" {if isset($enq_chk_14)
                                                                  and $enq_chk_14 eq '14' }checked{/if}> ポスター <input
                                                                  class="checkbox-inline" type="checkbox" name="enq_chk_15"
                                                                  value="15" {if isset($enq_chk_15) and $enq_chk_15 eq
                                                                  '15' }checked{/if}> 知人の紹介 <input class="checkbox-inline"
                                                                  type="checkbox" name="enq_chk_16" value="16" {if
                                                                  isset($enq_chk_16) and $enq_chk_16 eq '16' }checked{/if}>
                                                                  その他 </div> </div> <div class="form-group">
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">今までにクルーズのご経験はございますか？</label>
                                                                <div class="col col-xs-5 col-sm-3 col-md-3">
                                                                  <label class="radio-inline"><input type="radio" name="experience_sw"
                                                                      value="2" {if !empty($experience_sw) and
                                                                      $experience_sw eq '2' }checked{/if}>ある </label>
                                                                      <label class="radio-inline"><input type="radio"
                                                                      name="experience_sw" value="1" {if
                                                                      !empty($experience_sw) and $experience_sw eq '1'
                                                                      }checked{/if}>ない </label> </div>
                                                                      <!--設計にないので非表示とする <div class="col col-xs-7 col-sm-5 col-md-4">
                                                                    <input type="text" class="form-control" name="ship_chk"
                                                                      value="{if !empty($ship_chk)}{$ship_chk}{/if}"
                                                                      placeholder="主に乗船された船・方面等" maxlength="50">
                                                                </div>
                                                                -->

                                                              </div>
                                                              <div class="form-group">
                                                                <label class="col col-xs-12 col-sm-4 col-md-3 control-label">今後行ってみたいクルーズは？(船名・方面等)</label>
                                                                <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                  <input class="checkbox-inline" type="checkbox" name="area_chk_1"
                                                                    value="1" {if !empty($area_chk_1) and $area_chk_1
                                                                    eq '1' }checked{/if}> ハワイ <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_2" value="2" {if
                                                                    !empty($area_chk_2) and $area_chk_2 eq '2'
                                                                    }checked{/if}> カリブ海 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_3" value="3" {if
                                                                    !empty($area_chk_3) and $area_chk_3 eq '3'
                                                                    }checked{/if}> アジア <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_4" value="4" {if
                                                                    !empty($area_chk_4) and $area_chk_4 eq '4'
                                                                    }checked{/if}> 地中海 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_5" value="5" {if
                                                                    !empty($area_chk_5) and $area_chk_5 eq '5'
                                                                    }checked{/if}> エーゲ海 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_6" value="6" {if
                                                                    !empty($area_chk_6) and $area_chk_6 eq '6'
                                                                    }checked{/if}> アラスカ <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_7" value="7" {if
                                                                    !empty($area_chk_7) and $area_chk_7 eq '7'
                                                                    }checked{/if}> 米西海岸 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_8" value="8" {if
                                                                    !empty($area_chk_8) and $area_chk_8 eq '8'
                                                                    }checked{/if}> バルト海 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_9" value="9" {if
                                                                    !empty($area_chk_9) and $area_chk_9 eq '9'
                                                                    }checked{/if}> 北欧 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_10" value="10" {if
                                                                    !empty($area_chk_10) and $area_chk_10 eq '10'
                                                                    }checked{/if}> オセアニア <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_11" value="11" {if
                                                                    !empty($area_chk_11) and $area_chk_11 eq '11'
                                                                    }checked{/if}> 日本船 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_12" value="12" {if
                                                                    !empty($area_chk_12) and $area_chk_12 eq '12'
                                                                    }checked{/if}> 世界一周 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_14" value="14" {if
                                                                    !empty($area_chk_14) and $area_chk_14 eq '14'
                                                                    }checked{/if}> 日本発着 <input class="checkbox-inline"
                                                                    type="checkbox" name="area_chk_13" value="13" {if
                                                                    !empty($area_chk_13) and $area_chk_13 eq '13'
                                                                    }checked{/if}> その他 </div> </div> <!--設計にないので非表示とします
                                                                    L <div class="form-group">
                                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label"></label>
                                                                  <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                    <input type="text" class="form-control" name="area_chk_txt"
                                                                      value="""その他" maxlength="30">
                                                                  </div>
                                                                </div>
                                                                -->

                                                                <div class="form-group">
                                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">その他船名・方面等</label>
                                                                  <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                    <textarea name="txt_1" maxlength="100" style="height: 35px">{if !empty($txt_1)}{$txt_1}{/if}</textarea>
                                                                  </div>
                                                                </div>
                                                                <div class="form-group">
                                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">どのように弊社HPへ訪れましたか？</label>
                                                                  <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                    <input class="checkbox-inline" type="checkbox" name="ex_chk_1"
                                                                      value="1" {if isset($ex_chk_1) and $ex_chk_1 eq
                                                                      '1' }checked{/if}> メルマガ／ブログを見て <input class="checkbox-inline"
                                                                      type="checkbox" name="ex_chk_2" value="2" {if
                                                                      isset($ex_chk_2) and $ex_chk_2 eq '2' }checked{/if}>
                                                                      船会社の紹介 <input class="checkbox-inline" type="checkbox"
                                                                      name="ex_chk_3" value="3" {if isset($ex_chk_3)
                                                                      and $ex_chk_3 eq '3' }checked{/if}>
                                                                    何度か利用しているため（リピーター）
                                                                  </div>
                                                                </div>
                                                                <!--設計にないので非表示とします L <div class="form-group">
                                                                      <label class="col col-xs-12 col-sm-4 col-md-3 control-label"></label>
                                                                      <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                        <input type="text" class="form-control" name="enq_chk_txt"
                                                                          value="" placeholder="その他">
                                                                      </div>
                                                                    </div>
                                                                    -->

                                                                <div class="form-group">
                                                                  <label class="col col-xs-12 col-sm-4 col-md-3 control-label">ご質問・ご要望など</label>
                                                                  <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                    <textarea name="txt_2" maxlength="200" style="height: 6em;">{if !empty($txt_2)}{$txt_2}{/if}</textarea>
                                                                  </div>
                                                                </div>
                                                              </div>


                                                            </div>

                                                            <hr>

                                                            <div class="form-group notice form-group-center">
                                                              <label class="col col-xs-0 col-sm-3 col-md-3 control-label"></label>
                                                              <div class="col col-xs-12 col-sm-12 col-md-12 texts-danger-send">
                                                                <span class="text-center text-danger-send">※
                                                                  必ずご出発日の75〜60日前までには送信下さい。</span>
                                                                <span class="text-center text-danger-send">※最終確認発券メールが遅れる理由になります。</span>
                                                              </div>
                                                            </div>


                                                            <div class="form-group form-group-center">
                                                              <label class="col col-xs-0 col-sm-3 col-md-3 control-label"></label>
                                                              <div class="col col-xs-12 col-sm-8 col-md-9">
                                                                {if !empty($c_kubun)}
                                                                <button class="btn btn-primary btn-lg" type="submit">送信する</button>
                                                                {/if}
                                                              </div>
                                                            </div>


                                                            <div class="form-group comment form-group-center">
                                                              <label class="col col-xs-0 col-sm-3 col-md-3 control-label"></label>
                                                              <div class="col col-xs-12 col-sm-12 col-md-12">
                                                                <span class="text-center fix-text">ご入力いただきありがとうございました。</span>
                                                              </div>
                                                            </div>


                                                            <!--</form>-->


                                                            <input type="hidden" name="birth_date" value="{if !empty($birth_date)}{$birth_date}{/if}">



                                                            <!--送信区分-->
                                                            <input type="hidden" name="kubun" value="{if !empty($c_kubun)}{$c_kubun}{/if}">

                                                            </form>

                                                            <p class="pagetop">
                                                              <a href="#"><span>TOPへ</span></a>
                                                            </p>

                                                          </div>
                                                          <!--/.container-->
                                                        </div>
                                                        <!--フッター-->
                                                        <footer>
                                                          <small>Copyright 2017 Best1cruise All Rights
                                                            Reserved.</small>
                                                        </footer>
</body>

</html>
