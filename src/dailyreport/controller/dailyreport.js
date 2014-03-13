/**
* @description controller of daily report page
* @author yuhao@taobao.com
**/
(function() {
    var conf = {
            path: '/widget/rest_api.do?ik=lz_diagnose_getShopData',
            peakPath: '/widget/rest_api.do?ik=lz_diagnose_getPeakUv',
            mockPath: 'src/dailyreport/model/mock.data.json',
            mockPeakPath: 'src/dailyreport/model/peak.json',
            tablePath: 'src/dailyreport/view/',
            max: -120,
            min: -1
        },
        devModel = false,
        error = '<div class="loading">您需要的数据暂时无法查看，请稍候访问。</div>',
        loading = '<div class="loading"><img src="src/images/loading.gif" /></div>',
        yesterday = new Date().addDays(-1),
        yesterdayFormat = yesterday.toString('yyyy-MM-dd');
    var dayFromURL = Util.getQueryString('day');
    if (!/^\d{4}-\d{2}-\d{2}$/.test(dayFromURL) || dayFromURL == null) {
        dayFromURL = yesterdayFormat;
    }
    var pageType = Util.getQueryString('ptype');
    if (!/^1$/.test(pageType)) {
        pageType = 1;
    }
    var objDay = new Date(dayFromURL.replace(/-/g, '/')),
        theSelectedDayToYesterday = Math.floor((yesterday.getTime() - objDay.getTime()) / 86400000 + 1);
    if (theSelectedDayToYesterday > Math.abs(conf.max)) {
        dayFromURL = yesterdayFormat;
    }
    //console.warn(Math.floor((yesterday.getTime() - objDay.getTime()) / 86400000 + 1));
    //init YUI datepicker
    initDatePicker();
    $('#J_summary').delegate('li', 'click.showInfo', function () {
        var m = $(this),
            sort = m.data('name'),
            name = m.find('h1:first').text();
        if (m.hasClass('on')) return;
        m.parent().find('li').removeClass('on');
        m.addClass('on');
        $('#J_table').html(loading);

        $.get(conf[devModel ? 'mockPath' : 'path'], {day: dayFromURL}, function (data) {
            //console.warn(sort, ' clicked name');
            if (data.rCode != 0 || $.isEmptyObject(data.res)) {
                $('#J_dailySummary').html(error);
                return;
            }
            if (sort === 'uv') {
                $.get(conf[devModel ? 'mockPeakPath' : 'peakPath'], {day: dayFromURL}, function (data2) {
                    if (data2.rCode != 0 || $.isEmptyObject(data2.res)) {
                        $('#J_table').html(error);
                        return;
                    }
                    var timeSplit;
                    //console.warn(data2, '   when clicked is UV get anohter ajax api named peakPath');
                    if (data2.rCode == 0 && typeof(data2.res.hour) !== 'undefined') {
                        timeSplit = data2.res.hour;
                    } else {
                        timeSplit = '-';
                    }
                    data.res.peak = timeSplit;
                    //console.warn(' UV data is : ', data);
                    renderTable(data, sort, name);
                }, 'JSON');
            } else {
                renderTable(data, sort, name);
            }
        }, 'JSON');
    }).find('li:first').click();
    /**
        * @param {object} data
        * @param {string} sort number format with
        * @param {string} name of thead title
    **/
    function renderTable(data, sort, name) {
        $('#J_table').setTemplateURL(conf.tablePath + sort + '_table.tpl', [], {}).processTemplate({
            type: sort,
            name: name,
            data: data.res
        });
    }
    function initDatePicker() {
        var afterDayTemp = new Date(dayFromURL).addDays(+1).toString('yyyy-MM-dd'),
            afterDay = afterDayTemp >= yesterdayFormat ? yesterdayFormat : afterDayTemp;
        $('#J_date').setTemplateURL(conf.tablePath + 'date.tpl', [], {}).processTemplate({
            ifLastDay: theSelectedDayToYesterday >= Math.abs(conf.max),
            lastDay: new Date(dayFromURL).addDays(-1).toString('yyyy-MM-dd'),
            afterDay:  afterDay,
            pageType: pageType
        });
        APP.use('calendar', 'datatype-date', function (Y) {
            //console.warn(dayFromURL, '   in use calendar');
            $('#J_datePicker').val(dayFromURL);
            var cal = new Y.Calendar('J_datePicker', {
                popup: true,
                date: new Date(dayFromURL),
                closeable : true,
                mindate: new Date().addDays(conf.max),
                maxdate: new Date().addDays(conf.min),
                action: ['click']
            });
            cal.on('select', function(d) {
                var formattedDate = Y.DataType.Date.format(d, {
                    format : '%Y-%m-%d'
                });
                var hFormattedDate = Y.DataType.Date.format(d, {
                    format : '%Y年%m月%d日'
                });
                Y.one('#J_datePicker').set('value', formattedDate);
                //console.warn(d, '   clicked date picker');
                rerenderReport(formattedDate);
            });
        });
    }
    /**
    * @param {string} selDay selected day like '2014-01-25'
    * @returns {string} return what
    **/
    function rerenderReport(selDay) {
        dayFromURL = selDay;
        //console.warn(dayFromURL);
        $('#J_submitFrom').setTemplate('<form method="get"><input type="hidden" name="day" value="'+ dayFromURL +'" /><input type="hidden" name="ptype" value="1" /><input id="J_submit" type="submit" style="display: none;" />', null, {}).processTemplate({
        });
        $('#J_submit').click();
    }
})();
