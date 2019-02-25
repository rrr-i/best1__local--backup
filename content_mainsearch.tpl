<script type="text/javascript" src="//media.line.me/js/line-button.js?v=20140411" ></script>
    
    <div id="resultblock">
<!--{if $tpl_list_tab}-->
<!--{include file=$tpl_list_tab}-->
<!--{/if}-->

<!--{* mura 2014-06-26 #8558 方面・日程から探す  *}-->

<!--{* mura 2014-07-16 #8668 note-8 検索項目の表示 ここから *}-->
<!--{if $include_var_is_viewhistory}-->
    <!--{* mura 2014-07-16 #8829 「最近見たクルーズ」(viewhistory)用 *}-->
    <!--{if $tpl_linemax > 0}-->
        <div id="viewhistory_result_note" class="result_note">
            最近見たクルーズが<!--{$arrProducts|@count}-->件あります。<span>(99件を超えた場合は古いのが削除されます)</span>
        </div>
        <div id="cruisebreadcrumbblock">
            <div class="block">
                <div class="subtitle">
                    <p style="float: left;"><i class="fa fa-anchor"></i>&nbsp;ご予約までの流れ&nbsp;<i class="fa fa-anchor"></i></p>
                    <p style="float: right; margin-right: 20px; text-decoration: underline;"><a href="<!--{$smarty.const.HTTP_URL}-->user_data/info/about_book.php" alt="詳細な説明はこちらから">詳細な説明はこちらから</a></p>
                </div>
                <ul>
                    <li>
                        <div class="outerblock">&#9312;コース選択と予約</div>
                        <div class="innerblock">ご希望のコースの予約フォームから、お客様情報を送信してください。資料請求だけでも承ります。</div>
                    </li>
                    <li class="arrow"><i class="fa fa-arrow-right"></i></li>
                    <li>
                        <div class="outerblock">&#9313;ご予約内容確認のご連絡</div>
                        <div class="innerblock">弊社の担当者より、お電話またはメールで「空室&bull;料金&bull;ご予約内容」を確認させていただきます。</div>
                    </li>
                    <li class="arrow"><i class="fa fa-arrow-right"></i></li>
                    <li>
                        <div class="outerblock">&#9314;正式予約/予約書類案内</div>
                        <div class="innerblock">正式予約をご依頼いただきましたら、ご予約書類とご予約金請求書をメールかFAXでご案内します。</div>
                    </li>
                    <li class="arrow"><i class="fa fa-arrow-right"></i></li>
                    <li>
                        <div class="outerblock">&#9315;ご予約金入金</div>
                        <div class="innerblock">5日以内にお振込下さい。入金確認後に正式予約になります。残金請求/乗船券は後日ご案内します。</div>
                    </li>
                </ul>
            </div>
        </div>
    <!--{/if}-->
<!--{else}-->
    <div class="condition_note">
        <!--{assign var=hasCondition value=false}-->
        <ul>
            <li>
                <!--{if $tpl_linemax > 0}-->
                    <span class="search-result-title">検索結果</span>：<span class="search-result-count"><!--{$tpl_linemax}-->件</span>
                <!--{else}-->
                    <span class="search-result-none">検索結果なし</span>
                <!--{/if}-->
            </li>

            <li><span class="search-result-title">検索条件</span></li>

            <!--{assign var=from value=$arrFixCategory[$smarty.const.DIRECTION_CATEGORY_ID]}-->
            <!--{assign var=name value="search_condition_direction"}-->
            <!--{assign var=title value="方面"}-->
            <!--{assign var=note value=""}-->
            <!--{assign var=note value=$smarty.request.$name|sfGetCategoryNameByCategoryId}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrDepartureDateYm}-->
            <!--{assign var=name value="search_condition_departure_date_ym"}-->
            <!--{assign var=title value="出発年月"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach key=key item=option from=$from}-->
                <!--{if $smarty.request.$name == $key}--><!--{assign var=temp value=$key|substr:0:7}--><!--{assign var=note value="`$note``$temp`"}--><!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->

            <!--{assign var=from value=$arrDepartureDateD}-->
            <!--{assign var=name value="search_condition_departure_date_d"}-->
            <!--{assign var=title value="出発日"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach key=key item=option from=$from}-->
                <!--{if $smarty.request.$name == $key}--><!--{assign var=temp value=$key}--><!--{assign var=note value="`$note``$temp`日"}--><!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span>～</li><!--{/if}-->

            <!--{assign var=from value=$arrDepartureDateYmTo}-->
            <!--{assign var=name value="search_condition_departure_date_ym_to"}-->
            <!--{assign var=title value="出発年月"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach key=key item=option from=$from}-->
                <!--{if $smarty.request.$name == $key}--><!--{assign var=temp value=$key|substr:0:7}--><!--{assign var=note value="`$note``$temp`"}--><!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->

            <!--{assign var=from value=$arrDepartureDateDTo}-->
            <!--{assign var=name value="search_condition_departure_date_d_to"}-->
            <!--{assign var=title value="出発日"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach key=key item=option from=$from}-->
                <!--{if $smarty.request.$name == $key}--><!--{assign var=temp value=$key}--><!--{assign var=note value="`$note``$temp`日"}--><!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrFixCategory[$smarty.const.NIGHTS_CATEGORY_ID]}-->
            <!--{assign var=name value="search_condition_fixed_duration"}-->
            <!--{assign var=title value="期間"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach item=option from=$from}-->
                <!--{if $smarty.request.$name == $option.value}--><!--{assign var=note value="`$note``$option.title`"}--><!--{/if}-->
            <!--{/foreach}-->

            <!--{* mura 2014-08-06 #9094 タブの泊数を検索条件に表示する *}-->
            <!--{if $smarty.request.$name && !$note}-->
                <!--{assign var=extra value=$smarty.request.$name|sfGetExtraSearchConditionFixedDuration}-->
                <!--{assign var=note value="`$note``$extra`"}-->
            <!--{/if}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrBudget}-->
            <!--{assign var=name value="search_condition_budget"}-->
            <!--{assign var=title value="予算"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach item=option from=$from}-->
                <!--{if $smarty.request.$name == $option.value}--><!--{assign var=note value="`$note``$option.title`"}--><!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrWom}-->
            <!--{assign var=name value="search_condition_order_by_wom"}-->
            <!--{assign var=title value="クチコミ"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach item=option from=$from}-->
                <!--{if $smarty.request.$name == $option.value}--><!--{assign var=note value="`$note``$option.title`"}--><!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->

            <!--{assign var=from value=$arrCruiseType}-->
            <!--{assign var=name value="search_condition_cruise_type"}-->
            <!--{assign var=title value="旅行形態"}-->
            <!--{assign var=note value=""}-->
            <!--{foreach item=option from=$from}-->
                <!--{if is_array($option.value)}-->
                <!--{if in_array($option.value, $smarty.request.$name) || ($option.value == $smarty.request.$name)}--><!--{assign var=note value="`$note``$option.title` "}--><!--{/if}-->
                <!--{/if}-->
            <!--{/foreach}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->

            <!--{assign var=from value=$arrFixCategory[$smarty.const.DEPARTURE_CATEGORY_ID]}-->
            <!--{assign var=name value="search_condition_departure_point"}-->
            <!--{assign var=title value="出発地"}-->
            <!--{assign var=note value=""}-->
            <!--{assign var=note value=$smarty.request.$name|sfGetCategoryNameByCategoryId}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrFixCategory[$smarty.const.COMPANY_CATEGORY_ID]}-->
            <!--{assign var=name value="search_condition_cruise_company"}-->
            <!--{assign var=title value="船会社"}-->
            <!--{assign var=note value=""}-->
            <!--{assign var=note value=$smarty.request.$name|sfGetCategoryNameByCategoryId}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrFixCategory[$smarty.const.SHIP_CATEGORY_ID]}-->
            <!--{assign var=name value="search_condition_passenger_ferry"}-->
            <!--{assign var=title value="客船"}-->
            <!--{assign var=note value=""}-->
            <!--{assign var=note value=$smarty.request.$name|sfGetCategoryNameByCategoryId}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->


            <!--{assign var=from value=$arrPassengerFerryRank}-->
            <!--{assign var=name value="search_condition_passenger_ferry_rank"}-->
            <!--{assign var=title value="客船クラス"}-->
            <!--{assign var=note value=""}-->
            <!--{assign var=note value=$smarty.request.$name|sfGetCategoryNameByCategoryId}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->

            <!--{assign var=from value=$arrFixCategory[$smarty.const.SITE_CATEGORY_ID]}-->
            <!--{assign var=name value="search_condition_site_name"}-->
            <!--{assign var=title value="寄港地"}-->
            <!--{assign var=note value=""}-->
            <!--{assign var=note value=$smarty.request.$name|sfGetCategoryNameByCategoryId}-->
            <!--{if $note}--><li><!--{assign var=hasCondition value=true}--><!--{$title}-->：<span><!--{$note}--></span></li><!--{/if}-->

            <!--{if !$hasCondition}--><li>条件指定なし</li><!--{/if}-->
        </ul>
    </div>
    <!--{* mura 2014-07-16 #8668 note-8 検索項目の表示 ここまで*}-->
<!--{/if}-->
<!--{*
<!--{if $tpl_linemax > 0}-->
    <!--{if $include_var_is_viewhistory}-->
        <div id="viewhistory_result_note" class="result_note">
            最近見たクルーズが<!--{$arrProducts|@count}-->件あります。<span>(99件を超えた場合は古いのが削除されます)</span>
        </div>
    <!--{else}-->
        <div class="result_note">
            <span class="search-result-title">検索結果</span>：<span class="search-result-count"><!--{$tpl_linemax}-->件</span>
        </div>
    <!--{/if}-->
<!--{else}-->
    <!--{if !$include_var_is_viewhistory}-->検索結果なし<!--{/if}-->
<!--{/if}-->
*}-->
      <div id="resultlistblock1" class="tabblocks">
<!--{if $tpl_linemax > 0}-->
        <div class="navi"><!--{if $tpl_strnavi!="&nbsp;"}--><!--{$tpl_strnavi}--><!--{/if}-->
	  <div class="sort-blc">
            <div class="sort-text-blc">
	      <span class="sort-label">検索結果並び替え</span>
	      <input class="btn_sort_clear" type="button" value="並び替えをクリア" onclick="$.each(['price','duration','distance'], function(i, v){var k = 'sort_'+v; var vSort = $(`input:hidden[name='${k}']`); if(vSort.size() > 0)    {vSort.val('');}else{$('<input>',{type:'hidden',name:k,value:null}).appendTo('#form-search-condition');}});$('#form-search-condition').submit();return false;" />
	    </div>
	    <div class="sort-inline-blc">
              <input class="<!--{if $sortPrice == 1}-->btn_sortprice_on<!--{else}-->btn_sortprice_off<!--{/if}-->" type="button" value="料金の安い順" onclick="$('<input>',{type:'hidden',name:'sort_price',value:<!--{if $sortPrice == 1}-->null<!--{else}-->1<!--{/if}-->}).appendTo('#form-search-condition');$('#form-search-condition').submit();return false;" />
              <input class="<!--{if $sortPrice == 2}-->btn_sortprice_on<!--{else}-->btn_sortprice_off<!--{/if}-->" type="button" value="料金の高い順" onclick="$('<input>',{type:'hidden',name:'sort_price',value:<!--{if $sortPrice == 2}-->null<!--{else}-->2<!--{/if}-->}).appendTo('#form-search-condition');$('#form-search-condition').submit();return false;" />
	    </div>
	    <div class="sort-inline-blc">
              <input class="<!--{if $sortDuration == 1}-->btn_sortduration_on<!--{else}-->btn_sortduration_off<!--{/if}-->" type="button" value="日数の短い順" onclick="$('<input>',{type:'hidden',name:'sort_duration',value:<!--{if $sortDuration == 1}-->null<!--{else}-->1<!--{/if}-->}).appendTo('#form-search-condition');$('#form-search-condition').submit();return false;" />
              <input class="<!--{if $sortDuration == 2}-->btn_sortduration_on<!--{else}-->btn_sortduration_off<!--{/if}-->" type="button" value="日数の長い順" onclick="$('<input>',{type:'hidden',name:'sort_duration',value:<!--{if $sortDuration == 2}-->null<!--{else}-->2<!--{/if}-->}).appendTo('#form-search-condition');$('#form-search-condition').submit();return false;" />
	    </div>
	    <div class="sort-inline-blc">
              <input class="<!--{if $sortDistance == 1}-->btn_sortdistance_on<!--{else}-->btn_sortdistance_off<!--{/if}-->" type="button" value="出発日の近い順" onclick="$('<input>',{type:'hidden',name:'sort_distance',value:<!--{if $sortDistance == 1}-->null<!--{else}-->1<!--{/if}-->}).appendTo('#form-search-condition');$('#form-search-condition').submit();return false;" />
              <input class="<!--{if $sortDistance == 2}-->btn_sortdistance_on<!--{else}-->btn_sortdistance_off<!--{/if}-->" type="button" value="出発日の遠い順" onclick="$('<input>',{type:'hidden',name:'sort_distance',value:<!--{if $sortDistance == 2}-->null<!--{else}-->2<!--{/if}-->}).appendTo('#form-search-condition');$('#form-search-condition').submit();return false;" />
	    </div>
	  </div>
          <br /><span class="list-notice">下記コースの空室・料金は日々変動します。事前に弊社までご照会ください。</span>
        </div>
<!--{/if}-->

        <!--{foreach name=loopProductList from=$arrProducts key=key item=val}-->
            <!--{if $val.name}-->
                <!--{assign var=firstAreaName value=$val.attr.area.name}-->

                <!--{* mura 2014-07-15 #8830 最近見たクルーズの並び順を見た順(新しいものが上)にする *}-->
                <!--{if !$include_var_no_direction}-->
                <!--{if $firstAreaName != $lastAreaName}--><h3 class="result_group_caption"><!--{$firstAreaName}--></h3><!--{/if}-->
                <!--{/if}-->

                <!--{assign var=ym    value="search_condition_departure_date_ym"}-->
                <!--{assign var=d     value="search_condition_departure_date_d"}-->
                <!--{assign var=ym_to value="search_condition_departure_date_ym_to"}-->
                <!--{assign var=d_to  value="search_condition_departure_date_d_to"}-->

                <!--{assign var=nextlink value="<a href=\"/B/`$val.attr.company.category_code`/`$val.sub_comment26`.html?ym=`$smarty.request.$ym`&d=`$smarty.request.$d`&ym_to=`$smarty.request.$ym_to`&d_to=`$smarty.request.$d_to`\" target=\"_blank\">続きを見る&gt;</a>"}-->
                <!--{if $val.sub_large_image22 === '1'}-->
                    <div class="resultrow osusume">
                <!--{else}-->
                    <div class="resultrow">
                <!--{/if}-->
                  <div class="resulttitle type_<!--{$val.attr.type.id}-->">
                      <h4>
                            <!--{assign var=truncateMargin value=0}-->
                            <!--{assign var=defaultTruncateSize value=53}-->
                            <!--{assign var=addClass value=""}-->
                            
                            <!--{if $val.create_date|sfDiffDateTime:28}-->
                                <img src="<!--{$TPL_URLPATH}-->img/list/ico_up.gif" width="34" height="11" alt="新着" class="up_icon" />
                                <!--{assign var=truncateMargin value=$truncateMargin+4}-->
                                <!--{assign var=addClass value="has-terminal-icon-small"}-->
                            <!--{/if}-->

                            <!--{if $priorCategoryUpperLevel != 0 && $tpl_pageno <= 1 && $smarty.foreach.loopProductList.iteration <= $priorCategoryUpperLevel}-->
                                <img src="<!--{$TPL_URLPATH}-->img/list/ico_osusume.jpg" width="37" height="14" alt="オススメ" class="osusume_icon" />
                                <!--{assign var=truncateMargin value=$truncateMargin+4}-->
                                <!--{assign var=addClass value="has-terminal-icon-small"}-->
                            <!--{elseif $val.sub_large_image22 === '1'}-->
                                <img src="<!--{$TPL_URLPATH}-->img/list/ico_osusume.jpg" width="37" height="14" alt="オススメ" class="osusume_icon" />
                            <!--{/if}-->

                            <!--{if $val.attr.terminal.main_image}-->
                                <img src="/upload/category_image/<!--{$val.attr.terminal.main_image}-->" alt="<!--{$val.attr.terminal.name}-->" id="icon_terminal_<!--{$val.attr.terminal.id}-->" class="terminal_icon" />
                                <!--{if $val.attr.terminal.id == 607}-->
                                    <!--{*<!--{assign var=truncateSize value=47}-->*}-->
                                    <!--{assign var=addClass value="has-terminal-icon-large"}-->
                                    <!--{assign var=truncateMargin value=$truncateMargin+6}-->
                                <!--{else}-->
                                    <!--{*<!--{assign var=truncateSize value=49}-->*}-->
                                    <!--{assign var=addClass value="has-terminal-icon-small"}-->
                                    <!--{assign var=truncateMargin value=$truncateMargin+4}-->
                                <!--{/if}-->
                            <!--{/if}-->


                            <!--{assign var=truncateSize value=$defaultTruncateSize-$truncateMargin}-->
                            <!--{assign var=ym    value="search_condition_departure_date_ym"}-->
                            <!--{assign var=d     value="search_condition_departure_date_d"}-->
                            <!--{assign var=ym_to value="search_condition_departure_date_ym_to"}-->
                            <!--{assign var=d_to  value="search_condition_departure_date_d_to"}-->

                            <a href="/B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html?ym=<!--{$smarty.request.$ym}-->&d=<!--{$smarty.request.$d}-->&ym_to=<!--{$smarty.request.$ym_to}-->&d_to=<!--{$smarty.request.$d_to}-->" class="str_width_<!--{$truncateSize}--> <!--{$addClass}-->" target="_blank"><!--{$val.name}--></a>
                      </h4>
                      <!--{if $val.attr.class.main_image}-->
                      <img src="/upload/category_image/<!--{$val.attr.class.main_image}-->" alt="<!--{$val.attr.class.name}-->" id="icon_class_<!--{$val.attr.class.id}-->" class="class_icon" />
                      <!--{/if}-->
                  </div>

                  <div class="resultleft resultfloat">
                    <div class="resulttop">
                      <img class="imgleft" src="/upload/category_image/<!--{$val.attr.type.mark_image}-->" width="110" height="22" alt="<!--{$val.attr.type.name}-->" />
                      <img src="/upload/category_image/<!--{$val.attr.company.main_image}-->" width="110" height="22" alt="<!--{$val.attr.company.name}-->" />
                    </div>
                    <div class="resultbottom">
                      <div>
                        <img class="imgleft" src="/upload/category_image/<!--{$val.attr.ship.main_image}-->" width="104" height="70" alt="<!--{$val.attr.ship.name}-->" />
                        <!--{assign var=image_key value=sub_image3}-->
                        <!--{if $val[$image_key]}-->
                        <a href="/resize_image.php?width=500&image=<!--{$val[$image_key]}-->" class="expansion" target="_blank"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$val[$image_key]}-->" alt="マップ" width="104" height="70" /></a>
                        <!--{else}-->
                        <img src="/upload/category_image/<!--{$val.attr.area.main_image}-->" alt="マップ" width="104" height="70" />
                        <!--{/if}-->
                      </div>
                      <div class="resultanchorage">
                        <p class="product_no_area">
                          <span class="product_no_label">商品番号</span>：&nbsp;<span class="product_no"><!--{$val.product_id}--></span>
                        </p>
                        <!--{* 友達に知らせる *}-->
                        <!--{assign var=subject value="おすすめしたいコース"}-->
                        <!--{assign var=body value="`$val.name`\r\n`$smarty.const.HTTP_URL`B/`$val.attr.company.category_code`/`$val.sub_comment26`.html"}-->
                        <a href="mailto:?subject=<!--{$subject|escape:"url"}-->&amp;body=<!--{$body|escape:"url"}-->"><img style="float: right; margin: 0px 14px 4px 0px;" src="<!--{$TPL_URLPATH}-->img/detail/btn_share.jpg" width="90" alt="友達に知らせる" /></a>
                        <p>
                        <!--{if $val.sub_comment28}-->
                            <span>&lt;&lt;主要な寄港地&gt;&gt;</span><!--{$val.sub_comment28}-->
                        <!--{else}-->
                  <!--{section name=cnt loop=$val.attr.site}-->
                  <!--{if $smarty.section.cnt.first}--><span>&lt;&lt;主要な寄港地&gt;&gt;</span><!--{/if}-->
                  <!--{$val.attr.site[cnt].category_name}--><!--{if !$smarty.section.cnt.last}-->&nbsp;/&nbsp;<!--{/if}-->
                  <!--{/section}-->
                  <!-- <li>&nbsp;&nbsp;<a href="#">続きを見る&nbsp;&gt;&gt;</a></li> -->
                        <!--{/if}-->
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="resultcenter resultfloat">
                    <ul>
                      <!--{assign var=ps value=$val.status[$val.product_id]}-->
                      <!--{foreach from=$ps item=status}-->
                      <li><img src="<!--{$TPL_URLPATH}--><!--{$arrSTATUS_IMAGE[$status]}-->" width="45" height="28" alt="<!--{$arrSTATUS[$status]}-->" id="icon<!--{$status}-->" /></li>
                      <!--{/foreach}-->
                    </ul>
                    <table style="table-layout: fixed;">
                      <tr class="row1">
                        <th>客船</th>
                        <td><a href="/ship/<!--{$val.attr.ship.category_code}-->/" target="_blank"><!--{$val.attr.ship.category_name}-->号</a></td>
                        <th class="restth">泊数</th>
                        <td class="resttd"><!--{$val.attr.stay.name}--></td>
                      </tr>
                      <tr class="row2">
                        <th>出発地/方面</th>
                        <td colspan="3"><span class="terminal"><!--{$val.attr.terminal.category_name}--><!--{if $val.sub_large_image6}--> / <!--{$val.sub_large_image6}-->着<!--{/if}--></span> / <span class="bold"><a href="/B/<!--{$val.attr.area.code}-->/" style="color:rgba(0,0,0,0.75); font-weight:bold;" target="_blank"><!--{$val.attr.area.name}--></a></span></td>
                      </tr>
                      <tr class="row3">
                        <th>出発日</th>
                        <td colspan="3">
                          <p class="startdate">
                            <!--{if $val.product_id == 25773}-->
                              ???（6月上旬〜中旬）
                            <!--{elseif $val.product_id == 26519}-->
                              ???（5月下旬）
                            <!--{elseif $val.attr.company.category_id == 2233}-->
                              ???
                            <!--{else}-->
                              <!--{$val.sub_title31|sfTruncateDepatureDate:144:$nextlink}-->
                            <!--{/if}-->
                          </p>
                        </td>
                      </tr>
                      <tr class="row4 end">
                        <th>料金<br /><span style="font-size: 10px;font-weight: normal;">(大人一人<br />あたり)</span></th>
                        <td colspan="3">
                        <!--{* $val.priceNote|default:'お問合わせください。' *}-->

                          <p class="price<!--{if $val.attr.type.category_id == 11}--> price_cruise<!--{/if}--><!--{if $val.attr.type.category_id == 12}--> price_air<!--{/if}--><!--{if $val.attr.type.category_id == 13}--> price_tour<!--{/if}--><!--{if $val.attr.type.category_id == 2064}--> price_best1<!--{/if}-->">
                            <!--{if $val.sub_large_image24 && $val.sub_large_image24 == 1 && $val.sub_large_image15}-->
                                <!--{$val.price_str_api_pc|default:'お問合わせ下さい'}-->
                            <!--{else}-->
                                <!--{$val.sub_title29|default:'お問合わせ下さい'}-->
                            <!--{/if}-->
                            </p>
                          <!--{if $val.sub_comment27}--><p class="unit">
                            <span>1日</span>/<!--{$val.sub_comment27}-->
                          </p><!--{/if}-->

                        <!--{if $val.sub_title29|count_characters <= 15}--><span class="p_eat_free">全食事無料付き</span><!--{/if}-->
                        <!--{if $val.priceNoteTrimed}--><span class="nextlink">&nbsp;<!--{$nextlink}--></span><!--{/if}-->
                          <div class="clearfix"></div>
                          <!--{if $val.sub_title29|count_characters > 15}--><span class="p_eat_free_br">全食事無料付き</span><br /><!--{/if}-->
                          <p class="<!--{if $val.attr.type.category_id == 11}-->price_cruise_s<!--{/if}--><!--{if $val.attr.type.category_id == 12}-->price_air_s<!--{/if}--><!--{if $val.attr.type.category_id == 13}-->price_tour_s<!--{/if}--><!--{if $val.attr.type.category_id == 2064}-->price_best1_s<!--{/if}-->">船内施設・イベント利用無料</p>
                          <div id="option_icons">
                            <!--{if $val.attr.type.category_id == 11 || $val.attr.type.category_id == 12 || $val.attr.type.category_id == 13 || $val.attr.type.category_id == 973 || $val.attr.type.category_id == 1181 || $val.attr.type.category_id == 2064}-->
                              <ul id="travelform">
                                <li>
                                  <img class="imgleft" src="/upload/category_image/c<!--{$val.attr.type.category_id}-->.png" alt="<!--{$val.attr.type.name}-->" />
                                  <!--{if !is_null($val.sub_large_image21)}-->
                                  <p class="price_realtime">
                                    <span>☆</span><a href="/B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html?ym=<!--{$smarty.request.$ym}-->&d=<!--{$smarty.request.$d}-->&ym_to=<!--{$smarty.request.$ym_to}-->&d_to=<!--{$smarty.request.$d_to}-->#schedulenoncontents" class="p_underline" target="_blank">空室/料金ﾘｱﾙﾀｲﾑ表示</a>
                                  </p>
                                  <!--{/if}-->
                                </li>
                              </ul>
                            <!--{/if}-->
                            <!--{if ($val.attr.type.category_id == 11 || $val.attr.type.category_id == 12 || $val.attr.type.category_id == 13 || $val.attr.type.category_id == 973 || $val.attr.type.category_id == 1181 || $val.attr.type.category_id == 2064) && ($val.option != "" && $val.option|@count > 0)}-->
                              <span>&nbsp;/&nbsp;</span>
                            <!--{/if}-->
                            <!--{if $val.option != "" && $val.option|@count > 0}-->
                              <!--{assign var=po value=$val.option}-->
                              <ul id="option">
                              <!--{foreach from=$po item=option}-->
                                <li><img src="<!--{$TPL_URLPATH}--><!--{$arrPriceOptionImage[$option]}-->" alt="<!--{$arrPriceOptionText[$option]}-->" id="icon<!--{$option}-->" /></li>
                              <!--{/foreach}-->
                              </ul>
                            <!--{/if}-->
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div class="resultright resultfloat">
                        <div>
                            <!--{assign var=reviewLevel value=$arrProducts.productReviewStatOfCompany[$val.product_id].recommend_level1_average|default:''}-->
                            <!--{assign var=reviewTotal value=$arrProducts.productReviewStatOfCompany[$val.product_id].total|default:0}-->
                            <!--{assign var=ym    value="search_condition_departure_date_ym"}-->
                            <!--{assign var=d     value="search_condition_departure_date_d"}-->
                            <!--{assign var=ym_to value="search_condition_departure_date_ym_to"}-->
                            <!--{assign var=d_to  value="search_condition_departure_date_d_to"}-->
                            <p class="reviewave"><span>クチコミ平均評価</span>（<!--{$reviewTotal}-->件）
                                <!--{if $arrHostCompanyMark[$val.sub_large_image19]}-->
                                <span class="host-company-mark"><!--{$arrHostCompanyMark[$val.sub_large_image19]}--></span>
                                <!--{/if}-->
                                <!--{if $reviewTotal > 0}-->
                                    <a href="/B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html?ym=<!--{$smarty.request.$ym}-->&d=<!--{$smarty.request.$d}-->&ym_to=<!--{$smarty.request.$ym_to}-->&d_to=<!--{$smarty.request.$d_to}-->#name-review" class="link-review" target="_blank">クチコミを見る</a>
                                <!--{/if}-->
                            </p>
                            <div class="review-block">
                                <!--{if $reviewLevel}-->
                                <ul>
                                    <li><p><!--{$reviewLevel|default:''}--></p></li>
                                    <li><img src="<!--{$TPL_URLPATH}-->img/common/star_<!--{$reviewLevel|sfGetReviewLevelText}-->.jpg" height="14" alt="<!--{$reviewLevel|h}-->" /></li>
                                    <li><a href="<!--{$smarty.const.HTTP_URL}-->products/review.php?product_id=<!--{$val.product_id}-->">クチコミ投稿</a></li>
                                </ul>
                                <!--{else}-->
                                <a class="a-review" href="<!--{$smarty.const.HTTP_URL}-->products/review.php?product_id=<!--{$val.product_id}-->">クチコミ投稿</a>
                                <!--{/if}-->
                            </div>
                        </div>

                    <div class="btnfav">

                        <!--{if $include_var_add_date}-->
                            <!--{* mura 2014-07-15 #8817 include_var_add_date は data/Smarty/templates/default/mypage/index.tpl で指定 *}-->
                            <div class="btnfavdel"><!--{$val.add_date}--></div>
                        <!--{else}-->

                        <!--{if $val.is_favorite}-->
                        <div class="btnfavdel"><a href="/mypage/" class="rollover">お気に入り登録済み</a></div>
                        <!--{else}-->
                        <a href="javascript:void(0);" class="rollover" onclick="addFavoriteProduct(<!--{$val.product_id}-->);return false;"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_fav.jpg" width="137" height="18" alt="お気に入りに入れる" /></a>
                        <!--{/if}-->

                        <!--{/if}-->
        <!--{*                <a href="#" class="rollover"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_fav.jpg" width="137" height="18" alt="お気に入りに入れる"></a>（10件）*}-->
                    </div>

                    <div class="socialblock">
                        <!--{*<a href="#"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_twitter.jpg" width="21" height="21" alt="twitter" /></a>*}-->
                        <div class="facebook"><iframe src="//www.facebook.com/plugins/like.php?href=<!--{$smarty.const.HTTP_URL}-->B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html&amp;width&amp;layout=button&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:35px;" allowTransparency="true"></iframe></div>

                        <a target="_blank" href="https://twitter.com/share?url=<!--{$smarty.const.HTTP_URL}-->B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html&text=<!--{$val.name}-->"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_twitter.jpg" width="21" height="21" alt="twitter" /></a>
                        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

                        <span>
                        <script type="text/javascript">
                                               new media_line_me.LineButton({"pc":true,"lang":"ja","type":"b", "text":"<!--{$val.name}--> <!--{$smarty.const.HTTP_URL}-->B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html", "withUrl":false});
 </script>
                        </span>

                        <!--{*<a><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_facebook.jpg" width="21" height="21" alt="facebook" /></a>*}-->
                    </div>
                    <!--{assign var=ym    value="search_condition_departure_date_ym"}-->
                    <!--{assign var=d     value="search_condition_departure_date_d"}-->
                    <!--{assign var=ym_to value="search_condition_departure_date_ym_to"}-->
                    <!--{assign var=d_to  value="search_condition_departure_date_d_to"}-->
                    <a class="detailbutton" href="/B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html?ym=<!--{$smarty.request.$ym}-->&d=<!--{$smarty.request.$d}-->&ym_to=<!--{$smarty.request.$ym_to}-->&d_to=<!--{$smarty.request.$d_to}-->" class="rollover" target="_blank"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_detail.jpg" width="199" height="27" alt="コースの詳細を見る" /></a>

                    <!--{if $arrProducts.onlineProductCount[$val.product_id] > 0}-->
                    <a class="reserveonlinebutton" href="/B/<!--{$val.attr.company.category_code}-->/<!--{$val.sub_comment26}-->.html#online_price" class="rollover" target="_blank"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_reserve_online.png" width="199" height="27" alt="オンライン予約" /></a>
                    <!--{/if}-->

                    <div class="resultresponseblock">
                      <!--{if $arrProducts.onlineProductCount[$val.product_id] == 0}-->
                      <a href="<!--{$smarty.const.HTTPS_URL}-->contact/?contact_type_id=2&amp;product_id=<!--{$val.product_id}-->" class="rollover reserve" target="_blank"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_reserve.jpg" width="82" height="23" alt="予約する" /></a>
                      <a href="<!--{$smarty.const.HTTPS_URL}-->contact/?product_id=<!--{$val.product_id}-->" class="rollover" target="_blank"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_estimate.jpg" width="112" height="23" alt="見積もり資料請求" /></a>
                      <!--{else}-->
                      <a href="<!--{$smarty.const.HTTPS_URL}-->contact/?contact_type_id=2&amp;product_id=<!--{$val.product_id}-->" class="rollover reserve" target="_blank"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_reserve.jpg" width="82" height="23" alt="予約する" /></a>
                      <a href="<!--{$smarty.const.HTTPS_URL}-->contact/?product_id=<!--{$val.product_id}-->" class="rollover" target="_blank"><img src="<!--{$TPL_URLPATH}-->img/common/btn_result_estimate.jpg" width="112" height="23" alt="見積もり資料請求" /></a>
                      <!--{/if}-->
                    </div>
                  </div>
                </div>
            <!--{/if}-->

            <!--{assign var=lastAreaName value=$val.attr.area.name}-->
        <!--{/foreach}-->

        <form name="form1" id="form1" method="get" action="<!--{if $tpl_action}--><!--{$tpl_action}--><!--{else}-->?<!--{/if}-->">
          <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
          <input type="hidden" name="mode" value="<!--{$mode|h}-->" />
          <input type="hidden" name="type" value="<!--{$type|h}-->" />
          <input type="hidden" name="id" value="<!--{$id|h}-->" />
          <!--{* ▼検索条件 *}-->
          <input type="hidden" name="category_id" value="<!--{$arrSearchData.category_id|h}-->" />
          <input type="hidden" name="maker_id" value="<!--{$arrSearchData.maker_id|h}-->" />
          <input type="hidden" name="name" value="<!--{$arrSearchData.name|h}-->" />
          <!--{* ▲検索条件 *}-->
          <!--{* ▼ページナビ関連 *}-->
          <input type="hidden" name="orderby" value="<!--{$orderby|h}-->" />
          <input type="hidden" name="disp_number" value="<!--{$disp_number|h}-->" />
          <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
          <!--{* ▲ページナビ関連 *}-->
          <input type="hidden" name="rnd" value="<!--{$tpl_rnd|h}-->" />

          <!--{* mura 2014-07-31 #9015 ページャの検索条件引継ぎ処理 *}-->
          <!--{sfCreateSearchConditionHidden}-->

        </form>
        <div class="navi"><!--{$tpl_strnavi}--></div>
<!--{if $objNavi->max_page <= 1}-->
        <div class="nocoursemessage">
        <p>
        検索いただきありがとうございます。<br />
        お客様のご希望検索条件に該当するコースが既に発表になっていますが、弊社のコース登録、掲載されていない場合がございます。
        恐れ入りますが直接ご連絡 03-5312-6247 か <a href="mailto:guest@best1cruise.com">guest@best1cruise.com</a> いただきましたら、コースをお探しいたします。
        ご相談お待ちしております。誠にありがとうございます。
        </p>
        </div>
<!--{/if}-->
      </div>
      <div id="resultlistblock2" class="tabblocks">
      <!-- TAB 2 -->
      </div>
    </div>
    <div id="backnumber_area"><a href="<!--{$tpl_backnumber_url}-->" target="_blank"><!--{$tpl_backnumber_note}--></a></div>
<!--{* 「お気に入りに入れる」用 カテゴリページ用 *}-->
<form id="form-favorite" method="post" action="?">
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="add_favorite" />
    <!--{*<input type="hidden" name="product_id" value="" id="id-formfav-product_id" />*}-->
    <input type="hidden" name="favorite_product_id" value="" class="favorite-product-id" />
    <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />

</form>
<script type="text/javascript">
    function addFavoriteProduct(productId) {
        if (!productId) {
            return false;
        }

        <!--{*$('#id-formfav-product_id').val(productId);*}-->
        $('.favorite-product-id').val(productId);
        <!--{if $tpl_category_code}-->
        $('#form-favorite').submit();
        <!--{else}-->
        $('#form-search-condition').submit();
        <!--{/if}-->
    }
    
    //料金部分の「円」と「～」の部分のフォントサイズを下げる
    $(function(){
        $('#resultblock .resultcenter td p.price').each(function() {
          var priceText = $(this).text();
          if(priceText.indexOf("円")>-1){
            priceText = priceText.replace(/円/g,"<span class='yen'>円</span>");
            priceText = priceText.replace("～","<span class='namisen'>～</span>");
            $(this).html(priceText);
          }
        });
    });

    // [検索条件] 各項目前に数字を付与し、矢印もつける
    $(function(){
      var cnt = 1;
      var li = '.condition_note li';
      var length = $(li).length;
      $(li).each(function(i){
        if(length > 3){
          if(i != 0 && i != 1){
            if(i != length-1) $(this).append(`<span class="apparrow">→</span>`);
            $(this).prepend(`<span class="prenumber">【${cnt}】</span>`);
            cnt++;
          }
        }
      });
      $(li + ' .apparrow').css({'margin':'0px 0px 0px 5px'});
    });
</script>
