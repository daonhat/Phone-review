function chart_1(){
  var data_chart = $('#dn-chart-users').data('chart');
  Highcharts.chart('dn-chart-users', {
      chart: {
          type: 'column'
      },
      title: {
          text: 'Registered user per day'
      },
      subtitle: {
          text: 'The first team'
      },
      xAxis: {
          type: 'category',
          labels: {
              rotation: -45,
              style: {
                  fontSize: '13px',
                  fontFamily: 'Verdana, sans-serif'
              }
          }
      },
      yAxis: {
          min: 0,
          title: {
              text: 'Number user'
          }
      },
      legend: {
          enabled: false
      },
      tooltip: {
          pointFormat: 'Registered user: <b>{point.y:.1f} people</b>'
      },
      series: [{
          name: 'Population',
          data: data_chart,
          dataLabels: {
              enabled: true,
              rotation: -90,
              color: '#FFFFFF',
              align: 'right',
              format: '{point.y:.1f}', // one decimal
              y: 10, // 10 pixels down from the top
              style: {
                  fontSize: '13px',
                  fontFamily: 'Verdana, sans-serif'
              }
          }
      }]
  });
};

function chart_2(){
  var data_chart_2 = $('#dn-chart-phone').data('chart');
  Highcharts.chart('dn-chart-phone', {
      chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: 'pie'
      },
      title: {
          text: 'Phone of all category'
      },
      tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      plotOptions: {
          pie: {
              allowPointSelect: true,
              cursor: 'pointer',
              dataLabels: {
                  enabled: true,
                  format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                  style: {
                      color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                  }
              }
          }
      },
      series: [{
          name: 'Brands',
          colorByPoint: true,
          data: data_chart_2,
      }]
  });
};

function select_date(){
  $(".dn-admin-date-field").change(function(){
    $("#form-admin-date").submit();
  });
};

$(document).on('ready', function() {
  select_date();
});

$(document).on("turbolinks:load", function() {
  chart_1();
  chart_2();
  select_date();
});
