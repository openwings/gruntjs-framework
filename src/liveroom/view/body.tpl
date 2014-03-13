<script type="text/javascript" src="src/liveroom/controller/liveroom.js"></script>
<div class="name">
    <ul>
        <li data-name="pv">
            <h1>浏览量</h1>
            <div class="bijiao">同比 <a href="javascript: void(0)" class="{#if $T.data.ratepv > 0}rise{#elseif $T.data.ratepv < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.ratepv) * 100, 1, 0, 0)}%</a></div>
            <div class="num">{Util.formatF($T.data.pv, 1, 1, 0)}</div>
        </li>
        <li data-name="uv">
            <h1>访客数</h1>
            <div class="bijiao">同比 <a href="javascript: void(0)" class="{#if $T.data.rateuv > 0}rise{#elseif $T.data.rateuv < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.rateuv) * 100, 1, 0, 0)}%</a></div>
            <div class="num">{Util.formatF($T.data.uv, 1, 1, 0)}</div>
        </li>
        <li data-name="num">
            <h1>支付宝成交笔数</h1>
            <div class="bijiao">同比 <a href="javascript: void(0)" class="{#if $T.data.ratenum > 0}rise{#elseif $T.data.ratenum < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.ratenum) * 100, 1, 0, 0)}%</a></div>
            <div class="num">{Util.formatF($T.data.num, 1, 1, 0)}</div>
        </li>
        <li data-name="amt">
            <h1>支付宝成交金额</h1>
            <div class="bijiao">同比 <a href="javascript: void(0)" class="{#if $T.data.rateamt > 0}rise{#elseif $T.data.rateamt < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.rateamt) * 100, 1, 0, 0)}%</a></div>
            <div class="num">{Util.formatF($T.data.amt, 1, 0, 0)}</div>
        </li>
    </ul>
</div>
<div id="liveRoomChart">
    <div class="loading">
    	<img src="src/images/loading.gif" alt="" />
    </div>
</div>
