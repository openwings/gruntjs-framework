<table>
    <thead><tr><th></th><th>本 店</th><th>{$T.data.category.category_name}<p>{Util.formatF($T.data.category.category_shop_num, 1, 1, 0)}家{#if $T.data.shop.shop_type == 0}C{#elseif $T.data.shop.shop_type == 1}B{#/if}店</p></th><th>诊断</th></tr></thead>
    <tbody>
        <tr>
            <td><b>{$T.name}</b></td>
            <td>{$T.data.shop.service_score}</td>
            <td>{$T.data.category.avg_service_score}</td>
            <td>
                {#if $T.data.shop.service_score > $T.data.category.avg_service_score}
                    高于行业水平哦
                {#elseif $T.data.shop.service_score < $T.data.category.avg_service_score}
                    低于行业水平哦
                {#elseif $T.data.shop.service_score == $T.data.category.avg_service_score}
                    与行业水平一致哦
                {#else}
                    --
                {#/if}
            </td>
        </tr>
        <tr>
            <td><b>环 &nbsp;&nbsp;&nbsp;比</b></td>
            <td><a href="javascript: void(0)" class="{#if $T.data.shop.service_score_change > 0}rise{#elseif $T.data.shop.service_score_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.shop.service_score_change) * 1000, 1, 0, 0)}‰</a></td>
            <td><a href="javascript: void(0)" class="{#if $T.data.category.avg_service_change > 0}rise{#elseif $T.data.category.avg_service_change < 0}drop{#else}nochange{#/if}">{Util.formatF(Math.abs($T.data.category.avg_service_change) * 1000, 1, 0, 0)}‰</a></td>
            <td>
                {#if $T.data.shop.service_score_change == '-' && $T.data.category.avg_service_change == '-'}
                    -
                {#elseif ($T.data.shop.service_score_change == '-' || $T.data.shop.service_score_change == 0) && $T.data.category.avg_service_change > 0}
                    行业增长
                {#elseif ($T.data.shop.service_score_change == '-' || $T.data.shop.service_score_change == 0) && $T.data.category.avg_service_change > 0}
                    行业增长
                {#elseif $T.data.shop.service_score_change > 0 && ($T.data.category.avg_service_change == '-' || $T.data.category.avg_service_change == 0)}
                    本店增长
                {#elseif ($T.data.shop.service_score_change == '-' || $T.data.shop.service_score_change == 0) && $T.data.category.avg_service_change < 0}
                    行业下降
                {#elseif $T.data.shop.service_score_change < 0 && ($T.data.category.avg_service_change == '-' || $T.data.category.avg_service_change == 0)}
                    本店下降
                {#elseif $T.data.shop.service_score_change == '-' && $T.data.category.avg_service_change > 0}
                    行业增长
                {#elseif $T.data.shop.service_score_change < 0 && $T.data.category.avg_service_change > 0}
                    本店下降，行业增长
                {#elseif $T.data.shop.service_score_change > 0 && $T.data.category.avg_service_change < 0}
                    本店上升，行业下降
                {#elseif $T.data.shop.service_score_change > 0 && $T.data.category.avg_service_change > 0}
                    {#if $T.data.shop.service_score_change > $T.data.category.avg_service_change}
                        本店增幅 &gt; 行业增幅
                    {#elseif $T.data.shop.service_score_change == $T.data.category.avg_service_change}
                        本店增幅 == 行业增幅
                    {#else}
                        本店增幅 &lt; 行业增幅
                    {#/if}
                {#elseif $T.data.shop.service_score_change < 0 && $T.data.category.avg_service_change < 0}
                    {#if $T.data.shop.service_score_change > $T.data.category.avg_service_change}
                        本店降幅 &gt; 行业降幅
                    {#elseif $T.data.shop.service_score_change == $T.data.category.avg_service_change}
                        本店降幅 == 行业降幅
                    {#else}
                        本店降幅 &lt; 行业降幅
                    {#/if}
                {#/if}
            </td>
        </tr>
    </tbody>
</table>
