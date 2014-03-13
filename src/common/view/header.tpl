<div class="header">
    <div class="logo"><h1><img src="src/images/logo.png"></h1></div>
    <div class="menu">
        <ul>
            <li><a href="{#if $T.pageType != 0}index.html?ptype=0{#else}javascript: void(0){#/if}" class="{#if $T.pageType == 0}zb_on{#else}zb{#/if}">直播室</a></li>
            <li><a href="{#if $T.pageType != 1}index.html?ptype=1{#else}javascript: void(0){#/if}" class="{#if $T.pageType == 1}rb_on{#else}rb{#/if}">健康日报</a></li>
        </ul>
    </div>
</div>
