<div class="time">
    <span id="J_submitFrom"></span>
    <p>选择时间</p><input id="J_datePicker" type="text" class="bj" value=""><a href="{#if $T.ifLastDay}javascript: void(0){#else}?ptype={$T.pageType}&day={$T.lastDay}{#/if}" class="chose">&lt;&lt; 前一天</a><a href="?ptype={$T.pageType}&day={$T.afterDay}" class="chose">后一天 &gt;&gt;</a>
</div>
