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


<div class="list-blc-header">
  <h2 class="pagetitle"><!--{$tpl_h1}--></h2>
  <!--{*
  <img src="<!--{$TPL_URLPATH}-->img/list/bn_list_sample.jpg" width="640" height="200" alt="" />
  *}-->
<!--{if $tpl_list_sptop_path || $tpl_list_top_path}-->
  <div class="list-blc-text">
<!--{*
      <h3>クルーズのみとは？</h3>
      <p>
    通常のパックツアーの場合、クルーズ＆航空券＆ホテル＆送迎のすべてが含まれたパックツアーになっていますが、その中の「クルーズのみ」をご予約いただくことが可能です。パックツアーにないコースは、数千とあります。その中からご自身に一番合ったコースを選ぶことが出来ます。
      </p>
*}-->
<!--{if $tpl_list_sptop_path}-->
<!--{include file=$tpl_list_sptop_path}-->
<!--{elseif $tpl_list_top_path}-->
<!--{include file=$tpl_list_top_path assign=var_list_top_path }-->
<!--{assign var=var_list_top_path value=$var_list_top_path|replace:'<br>':''}-->
<!--{assign var=var_list_top_path value=$var_list_top_path|replace:'<br />':''}-->
<!--{$var_list_top_path}-->
<!--{/if}-->
  </div>
<!--{/if}-->
</div>

<div class="list-blc-ranking">
<!--{if $tpl_list_ranking}-->
    <!--{include file=$tpl_list_ranking }-->
<!--{/if}-->
</div>
<!--{if $tpl_sp_common_banner_path}-->
<!--{include file=$tpl_sp_common_banner_path }-->
<!--{/if}-->
<!--{if $tpl_sp_banner_path}-->
<!--{include file=$tpl_sp_banner_path }-->
<!--{/if}-->

<!--{include file=$_sphtml->getBlocFile('search_form') has_title=false}-->
<!--{include file=$_sphtml->getBlocFile('content_mainsearch_resultcount') include_var_add_date=true include_var_no_direction=true}-->
<!--{include file=$_sphtml->getBlocFile('content_mainsearch') include_var_add_date=true include_var_no_direction=true}-->
