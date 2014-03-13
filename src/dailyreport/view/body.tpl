<script type="text/javascript" src="src/dailyreport/controller/dailyreport.js"></script>
<div id="J_date"></div>
{#if $T.rCode != 0}
    <div class="loading">您需要的数据暂时无法查看，请稍候访问！</div>
{#else}
    <div class="heath" id="J_summary">
        <ul>
            <li data-name="pv">
                <h1>浏览量</h1>
                <div class="bijiao">环比 <a href="javascript: void(0)" class="{#if $T.data.shop.pv_change > 0}rise{#elseif $T.data.shop.pv_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.pv_change) * 100, 1, 0, 0)}%</a></div>
                <div class="num">{Util.formatF($T.data.shop.pv, 1, 1, 0)}</div>
            </li>
            <li data-name="uv">
                <h1>访客数</h1>
                <div class="bijiao">环比 <a href="javascript: void(0)" class="{#if $T.data.shop.uv_change > 0}rise{#elseif  $T.data.shop.uv_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.uv_change) * 100, 1, 0, 0)}%</a></div>
                <div class="num">{Util.formatF($T.data.shop.uv, 1, 1, 0)}</div>
            </li>
            <li data-name="avg_user_alipay">
                <h1>客单价</h1>
                <div class="bijiao">环比 <a href="javascript: void(0)" class="{#if $T.data.shop.avg_user_alipay_change > 0}rise{#elseif $T.data.shop.avg_user_alipay_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.avg_user_alipay_change) * 100, 1, 0, 0)}%</a></div>
                <div class="num">{Util.formatF($T.data.shop.avg_user_alipay, 1, 0, 0)}</div>
            </li>
            <li data-name="alipay_trade_amt">
                <h1>支付宝成交金额</h1>
                <div class="bijiao">环比 <a href="javascript: void(0)" class="{#if $T.data.shop.alipay_trade_amt_change > 0}rise{#elseif  $T.data.shop.alipay_trade_amt_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.alipay_trade_amt_change) * 100, 1, 0, 0)}%</a></div>
                <div class="num">{Util.formatF($T.data.shop.alipay_trade_amt, 1, 0, 0)}</div>
            </li>
            <li data-name="alipay_convert">
                <h1>全店成交转化率</h1>
                <div class="bijiao">环比 <a href="javascript: void(0)" class="{#if $T.data.shop.alipay_convert_change > 0}rise{#elseif  $T.data.shop.alipay_convert_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.alipay_convert_change) * 100, 1, 0, 0)}%</a></div>
                <div class="num">{Util.formatF($T.data.shop.alipay_convert * 100, 1, 0, 0)}%</div>
            </li>
            <li data-name="service_score">
                <h1>服务态度评分</h1>
                <div class="bijiao">环比 <a href="javascript: void(0)" class="{#if $T.data.shop.service_score_change > 0}rise{#elseif $T.data.shop.service_score_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.service_score_change * 1000), 1, 0, 0)}‰</a></div>
                <div class="num">{$T.data.shop.service_score}</div>
            </li>
        </ul>
        <div class="value" id="J_table"></div>
    </div>
{#/if}
