/**
* @description common controller detail informations
* @author yuhao@taobao.com
**/
(function() {
    APP.use(['jquery-1.8.2', 'jtemplates', 'highcharts', 'Util', 'Date', 'Boxy'], function () {
        // ptype 1 render liveroom report
        // ptype 2 render dailyreport
        var yesterday = Date.today().addDays(-1),
            yesterdayFormat = yesterday.toString('yyyy-MM-dd');
        var pageType = Util.getQueryString('ptype');
        var dayFromURL = Util.getQueryString('day');
        var devModel = false;
        if (!/^\d{4}-\d{2}-\d{2}$/.test(dayFromURL) || dayFromURL == null) {
            dayFromURL = yesterdayFormat;
        }
        var objDay = new Date(dayFromURL.replace(/-/g, '/')),
            theSelectedDayToYesterday = Math.floor((yesterday.getTime() - objDay.getTime()) / 86400000 + 1);
        if (theSelectedDayToYesterday > 120) {
            dayFromURL = yesterdayFormat;
        }
        if (!/0|1/.test(pageType)) {
            pageType = 0;
        }
        // liveRoom summary infomation
        var dataConfigs = {
            liveRoom: {
                summary: {
                    path: '/widget/rest_api.do?ik=lz_st_getHour',
                    mockPath: 'src/liveroom/model/mock.data.json',
                    args: {
                        //day: '',
                        //hour: ''
                    }
                }
            },
            dailyReport: {
                summary: {
                    path: '/widget/rest_api.do?ik=lz_diagnose_getShopData',
                    mockPath: 'src/dailyreport/model/mock.data.json',
                    args: {
                        day: dayFromURL
                    }
                }
            }
        };
		
        $(function() {
            init();
            function init() {
                // init html modules
                renderHeader();
                renderBody();
            }
            function renderHeader () {
                $('#header').setTemplateURL('src/common/view/header.tpl', [], {}).processTemplate({
                    pageType: pageType
                });
            }
            function renderBody () {
                var bodyPath;
                bodyPath = 'src/' + (pageType == 0 ? 'liveroom' : 'dailyreport') + '/view/body.tpl';
                var shortKey = dataConfigs[pageType == 0 ? 'liveRoom' : 'dailyReport'],
                    path = shortKey.summary[devModel ? 'mockPath' : 'path'],
                    args = shortKey.summary.args;
                $.get(path, args, function (data) {
                    //console.warn(data, 11, data.res, data.rCode != 0 || $.isEmptyObject(data.res));
                    if (pageType == 0) {
                        if(data.rCode == 12) {
                            $('#content').html('<div class="loading">您无权访问数据，请申请授权后再访问。</div>');
                            try {
                                QN.component.invoke({
                                    category : 'qtask_auth',
                                    cmd : '',
                                    param : {
                                        pluginname: '量子店铺经',
                                        apigroup: '数据报表'
                                    },
                                    error : function(msg, cmd, param) {
                                        // 调用失败
                                    },
                                    success : function(rsp, cmd, param) {
                                        // 回调结果
                                    }
                                });
                            } catch(ex) {
                            }
                            return;
                        } else if (data.rCode != 0 || $.isEmptyObject(data.res)) {
                            $('#content').html('<div class="loading">您需要的数据暂时无法查看，请稍候访问。</div>');
                            return;
                        }
                    }
                    $('#content').setTemplateURL(bodyPath, [], {}).processTemplate({
                        pageType: pageType,
                        data: data.res,
                        rCode: data.rCode
                    });
                }, 'JSON');
            }
        });
    });
})();
