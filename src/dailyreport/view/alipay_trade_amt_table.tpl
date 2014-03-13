<table>
    <thead><tr><th></th><th>本 店</th><th>{$T.data.category.category_name}<p>{Util.formatF($T.data.category.category_shop_num, 1, 1, 0)}家{#if $T.data.shop.shop_type == 0}C{#elseif $T.data.shop.shop_type == 1}B{#/if}店</p></th><th>诊断</th></tr></thead>
    <tbody>
        <tr>
            <td><b>{$T.name}</b></td>
            <td>{Util.formatF($T.data.shop.alipay_trade_amt, 1, 0, 0)}</td>
            <td>{Util.formatF($T.data.category.total_alipay_trade_amt, 1, 0, 0)}</td>
            <td>本店排名<span class="block">{Util.formatF($T.data.shop.rank_alipay_trade_amt, 1, 1, 0)}</span> 位 <a href="javascript: void(0)" class="{#if $T.data.shop.rank_alipay_trade_amt_num > 0}rise{#elseif $T.data.shop.rank_alipay_trade_amt_num < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.rank_alipay_trade_amt_num), 1, 1, 0)} 位</a>
            </td>
        </tr>
        <tr>
            <td><b>环 &nbsp;&nbsp;&nbsp;比</b></td>
            <td><a href="javascript: void(0)" class="{#if $T.data.shop.alipay_trade_amt_change > 0}rise{#elseif $T.data.shop.alipay_trade_amt_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.alipay_trade_amt_change) * 100, 1, 1, 0)}%</a></td>
            <td><a href="javascript: void(0)" class="{#if $T.data.category.alipay_change > 0}rise{#elseif $T.data.category.alipay_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.category.alipay_change) * 100, 1, 1, 0)}%</a></td>
            <td>
                {#if $T.data.shop.alipay_trade_amt_change == '-' && $T.data.category.alipay_change == '-'}
                    -
                {#elseif ($T.data.shop.alipay_trade_amt_change == '-' || $T.data.shop.alipay_trade_amt_change == 0) && $T.data.category.alipay_change > 0}
                    行业增长
                {#elseif ($T.data.shop.alipay_trade_amt_change == '-' || $T.data.shop.alipay_trade_amt_change == 0) && $T.data.category.alipay_change > 0}
                    行业增长
                {#elseif $T.data.shop.alipay_trade_amt_change > 0 && ($T.data.category.alipay_change == '-' || $T.data.category.alipay_change == 0)}
                    本店增长
                {#elseif ($T.data.shop.alipay_trade_amt_change == '-' || $T.data.shop.alipay_trade_amt_change == 0) && $T.data.category.alipay_change < 0}
                    行业下降
                {#elseif $T.data.shop.alipay_trade_amt_change < 0 && ($T.data.category.alipay_change == '-' || $T.data.category.alipay_change == 0)}
                    本店下降
                {#elseif $T.data.shop.alipay_trade_amt_change == '-' && $T.data.category.alipay_change > 0}
                    行业增长
                {#elseif $T.data.shop.alipay_trade_amt_change < 0 && $T.data.category.alipay_change > 0}
                    本店下降，行业增长
                {#elseif $T.data.shop.alipay_trade_amt_change > 0 && $T.data.category.alipay_change < 0}
                    本店上升，行业下降
                {#elseif $T.data.shop.alipay_trade_amt_change > 0 && $T.data.category.alipay_change > 0}
                    {#if $T.data.shop.alipay_trade_amt_change > $T.data.category.alipay_change}
                        本店增幅 &gt; 行业增幅
                    {#elseif $T.data.shop.alipay_trade_amt_change == $T.data.category.alipay_change}
                        本店增幅 == 行业增幅
                    {#else}
                        本店增幅 &lt; 行业增幅
                    {#/if}
                {#elseif $T.data.shop.alipay_trade_amt_change < 0 && $T.data.category.alipay_change < 0}
                    {#if $T.data.shop.alipay_trade_amt_change > $T.data.category.alipay_change}
                        本店降幅 &gt; 行业降幅
                    {#elseif $T.data.shop.alipay_trade_amt_change == $T.data.category.alipay_change}
                        本店降幅 == 行业降幅
                    {#else}
                        本店降幅 &lt; 行业降幅
                    {#/if}
                {#/if}
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: left;text-indent: 2em;">
                店铺支付宝成交金额最多的宝贝
                <p style="color: #f56781;">{#if $.isEmptyObject($T.data.shop.trade_auction)}--{#else}
                    <a style="color: #f56781" href="{$T.data.shop.trade_auction.src_url}" target="_blank"><img src="{$T.data.shop.trade_auction.pic_url}_20x20.jpg" /> {$T.data.shop.trade_auction.title}</a>
                {#/if}
                </p>
            </td>
        </tr>
    </tbody>
</table>
