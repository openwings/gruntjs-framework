/**
* @description controller of liveroom report page
* @author yuhao@taobao.com
**/
(function() {
    var trendConf = {
            path: '/widget/rest_api.do?ik=lz_st_getTrend',
            mockPath: 'src/liveroom/model/trend.json'
        },
        devModel = false,
        chartContent = $('#liveRoomChart'),
        today = Date.today().toString('yyyy-MM-dd');
    $('div.name').delegate('li', 'click.showTrend', function () {
        var m = $(this),
            sort = m.data('name'),
            name = m.find('h1:first').text();
        if (m.hasClass('on')) return;
        m.parent().find('li').removeClass('on');
        m.addClass('on');
        $.get(trendConf[devModel ? 'mockPath' : 'path'], {type: sort}, function (data) {
            if (data.rCode != 0 || $.isEmptyObject(data.res)) {
                $('#liveRoomChart').html('<div class="loading">您需要的数据暂时无法查看，请稍候访问。</div>');
                return;
            }
            renderChart(data, sort, name);
        }, 'JSON');
    }).find('li:first').click();
    /**
        * @param {object} data
        * @param {string} sort number format with
        * @param {string} name of chart title
    **/
    function renderChart(data, sort, name) {
        var xAxis = [], yAxis = [], res = data.res.sources.lz_st_hour_trend;
        for (var i = 0, l = res.length; i < l; i++) {
            xAxis.push(res[i].hour + ':00');
            yAxis.push(+res[i][sort]);
        }
        var lineChart = new Highcharts.Chart({
            chart : {
                renderTo: 'liveRoomChart',
                type: 'area'
            },
            credits: {
                enabled: false
            },
            title: {
                text: today + '   ' + name + '趋势图'
            },
            xAxis: {
                gridLineWidth: 1,
                lineColor: '#EAEAEA',
                tickColor: '#EAEAEA',
                gridLineColor: '#EAEAEA',
                minorTickInterval: 'auto',
                labels: {
                    step: 2
                },
                categories: xAxis
            },
            //tooltip data format
            tooltip: {
                valueDecimals: (sort == 'amt') ? 2 : 0,
                valuePrefix: sort == 'amt' ? '￥' : '',
                formatter: function() {
                    return today + ' ' + this.x + ':00<br />' + this.y;
                }
            },
            yAxis: {
                tickColor: '#EAEAEA',
                lineColor: '#EAEAEA',
                gridLineColor: '#EAEAEA',
                title: {
                    text: ''
                }
            },
            plotOptions: {
                series: {
                    color: '#FC9745',
                    fillColor: {
                        linearGradient: [0, 0, 0, 300],
                        stops: [[0, 'rgb(255,198,135)'], [1, 'rgba(255,255,255,0.5)']]
                    },
                    marker: {
                        fillColor: '#FFFFFF',
                        lineWidth: 2,
                        lineColor: null, // inherit from series,
                        states: {
                            hover: {
                                fillColor: '#FFFFFF',
                                lineWidth: 3,
                                lineColor: '#FF0000'
                            }
                        }
                    }
                }
            },
            series: [{
                name: name,
                data: yAxis
            }]
        });
    }
})();
