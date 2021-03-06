<table>
    <thead><tr><th></th><th>本 店</th><th>{$T.data.category.category_name}<br /><span>标价（￥{Util.formatF($T.data.category.price_section_lower, 1, 0, 0)}~￥{Util.formatF($T.data.category.price_section_upper, 1, 0, 0)}）<br />{Util.formatF($T.data.category.category_shop_num, 1, 1, 0)}家{#if $T.data.shop.shop_type == 0}C{#elseif $T.data.shop.shop_type == 1}B{#/if}店</span></th><th>诊断</th></tr></thead>
    <tbody>
        <tr>
            <td><b>{$T.name}</b></td>
            <td>{Util.formatF($T.data.shop.avg_user_alipay, 1, 0, 0)}</td>
            <td>{Util.formatF($T.data.category.avg_avg_user_alipay, 1, 0, 0)}</td>
            <td>本店排名<span class="block">{Util.formatF($T.data.shop.rank_user_alipay, 1, 1, 0)}</span> 位 <a href="javascript: void(0)" class="{#if $T.data.shop.rank_user_alipay_num > 0}rise{#elseif $T.data.shop.rank_user_alipay_num < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.rank_user_alipay_num), 1, 1, 0)} 位</a>
            </td>
        </tr>
        <tr>
            <td><b>环 &nbsp;&nbsp;&nbsp;比</b></td>
            <td><a href="javascript: void(0)" class="{#if $T.data.shop.avg_user_alipay_change > 0}rise{#elseif $T.data.shop.avg_user_alipay_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.avg_user_alipay_change) * 100, 1, 0, 0)}%</a></td>
            <td><a href="javascript: void(0)" class="{#if $T.data.category.avg_user_alipay_change > 0}rise{#elseif $T.data.category.avg_user_alipay_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.category.avg_user_alipay_change) * 100, 1, 0, 0)}%</a></td>
            <td>
                {#if $T.data.shop.avg_user_alipay_change == '-' && $T.data.category.avg_user_alipay_change == '-'}
                    -
                {#elseif ($T.data.shop.avg_user_alipay_change == '-' || $T.data.shop.avg_user_alipay_change == 0) && $T.data.category.avg_user_alipay_change > 0}
                    行业增长
                {#elseif ($T.data.shop.avg_user_alipay_change == '-' || $T.data.shop.avg_user_alipay_change == 0) && $T.data.category.avg_user_alipay_change > 0}
                    行业增长
                {#elseif $T.data.shop.avg_user_alipay_change > 0 && ($T.data.category.avg_user_alipay_change == '-' || $T.data.category.avg_user_alipay_change == 0)}
                    本店增长
                {#elseif ($T.data.shop.avg_user_alipay_change == '-' || $T.data.shop.avg_user_alipay_change == 0) && $T.data.category.avg_user_alipay_change < 0}
                    行业下降
                {#elseif $T.data.shop.avg_user_alipay_change < 0 && ($T.data.category.avg_user_alipay_change == '-' || $T.data.category.avg_user_alipay_change == 0)}
                    本店下降
                {#elseif $T.data.shop.avg_user_alipay_change == '-' && $T.data.category.avg_user_alipay_change > 0}
                    行业增长
                {#elseif $T.data.shop.avg_user_alipay_change < 0 && $T.data.category.avg_user_alipay_change > 0}
                    本店下降，行业增长
                {#elseif $T.data.shop.avg_user_alipay_change > 0 && $T.data.category.avg_user_alipay_change < 0}
                    本店上升，行业下降
                {#elseif $T.data.shop.avg_user_alipay_change > 0 && $T.data.category.avg_user_alipay_change > 0}
                    {#if $T.data.shop.avg_user_alipay_change > $T.data.category.avg_user_alipay_change}
                        本店增幅 &gt; 行业增幅
                    {#elseif $T.data.shop.avg_user_alipay_change == $T.data.category.avg_user_alipay_change}
                        本店增幅 == 行业增幅
                    {#else}
                        本店增幅 &lt; 行业增幅
                    {#/if}
                {#elseif $T.data.shop.avg_user_alipay_change < 0 && $T.data.category.avg_user_alipay_change < 0}
                    {#if $T.data.shop.avg_user_alipay_change > $T.data.category.avg_user_alipay_change}
                        本店降幅 &gt; 行业降幅
                    {#elseif $T.data.shop.avg_user_alipay_change == $T.data.category.avg_user_alipay_change}
                        本店降幅 == 行业降幅
                    {#else}
                        本店降幅 &lt; 行业降幅
                    {#/if}
                {#/if}
            </td>
        </tr>
    </tbody>
</table>
