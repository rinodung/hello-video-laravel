@extends('admin.master')

@section('content')

<style type="text/css">

.panel-options{

}
#view-selector-container table{
	float:left;
	width:260px !important;
}

#view-selector-container table td:nth-child(2){
	width:200px !important;
}

#view-selector-container table td:first-child{
	text-align:right;
	width:90px !important;
	padding-right:10px;
}

#view-selector-container table td .dcs-p-dcs-jd-dcs-y-dcs-g{
	min-width:190px;
	max-width:190px;
}

#view-selector-container table td .dcs-p-dcs-jd-dcs-y-dcs-g-dcs-ne{
	max-width:165px;
}

.ViewSelector2-item select{
	border: 1px solid #d4d2d0;
border-radius: 4px;
-moz-box-sizing: border-box;
box-sizing: border-box;
font: inherit;
font-weight: 400;
height: 2.4285714285714284em;
line-height: 1.4285714285714286em;
padding: .42857142857142855em;
max-width:200px;
}

.ViewSelector2-item{
	float:left;
}

.ViewSelector2-item label{
	margin-left: 15px;
	margin-right: 5px;
}

.ViewSelector .ViewSelector2-item:nth-child(3){
	display:none;
}

#charts_env .panel-options{
	padding-top:6px;
	padding-right:6px;
}
.Chartjs-figure{
	height:250px;
}
#chart-1-container, #chart-3-container, #chart-4-container, #active-users-container{
	width:auto;
	height:250px;
	display:block;
	position:relative;
}
.Chartjs-legend {
list-style: none;
margin: 0;
padding: 1em 0 0;
text-align: center;
}
.Chartjs-legend>li {
display: inline-block;
padding: .25em .5em;
}
.Chartjs-legend>li>i {
display: inline-block;
height: 1em;
margin-right: .5em;
vertical-align: -.1em;
width: 1em;
}

.chart1-panel{
	height:315px;
}

/********** Active Users **********/

.ActiveUsers {
	background: #f4f2f0;
	border: 0px solid #d4d2d0;
	border-radius: 0px;
	font-weight: 300;
	padding: .5em 1.5em;
	white-space: nowrap;
	height:315px;
	text-align:center;
	padding-top:75px;
}

.active-users-panel{
	padding:0px;
	height:315px;
}

.ActiveUsers-value{
	font-size: 80px;
	display: block;
	text-align: center;
}

.ActiveUsers.is-increasing {
	-webkit-animation: increase 3s;
	animation: increase 3s;
}

.ActiveUsers.is-decreasing {
	-webkit-animation: decrease 3s;
	animation: decrease 3s;
}

@-webkit-keyframes increase {
    10% {
        background-color: #eaffea;
        border-color: hsla(120, 100%, 25%, .5);
        color: hsla(120, 100%, 25%, 1)
    }
}
@keyframes increase {
    10% {
        background-color: #eaffea;
        border-color: hsla(120, 100%, 25%, .5);
        color: hsla(120, 100%, 25%, 1)
    }
}
@-webkit-keyframes decrease {
    10% {
        background-color: #ffeaea;
        border-color: hsla(0, 100%, 50%, .5);
        color: red
    }
}
@keyframes decrease {
    10% {
        background-color: #ffeaea;
        border-color: hsla(0, 100%, 50%, .5);
        color: red
    }
}

#google_analytics_login_container{
  position:relative;
  z-index:2;
}

#google_analytics_login{
  position: absolute;
  width: 100%;
}

#google_analytics_login img{
  width:100%;
}

.gapi-analytics-auth-styles-signinbutton-image{
  width: 45px;
  height: 50px;
  float: left;
  margin-left: 15px;
}

.gapi-analytics-auth-styles-signinbutton{
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -200px;
  width: 400px;
  font-size: 30px;
  text-align: center;
  margin-top: -22px;
  cursor:pointer;
}

</style>
		
		
		<div class="row">
			<div class="col-sm-3 col-xs-6">
		
				<div class="tile-stats tile-red">
					<div class="icon"><i class="entypo-users"></i></div>
					<div class="num" data-start="0" data-end="{{ $total_subscribers }}" data-postfix="" data-duration="1500" data-delay="0">0</div>
		
					<h3>Total Subscribers</h3>
					<p>The total amount of subscribers on your site.</p>
				</div>
		
			</div>
		
			<div class="col-sm-3 col-xs-6">
		
				<div class="tile-stats tile-green">
					<div class="icon"><i class="entypo-user-add"></i></div>
					<div class="num" data-start="0" data-end="{{ $new_subscribers }}" data-postfix="" data-duration="1500" data-delay="600">0</div>
		
					<h3>New Subscribers</h3>
					<p>New Subscribers for today.</p>
				</div>
		
			</div>
		
			<div class="col-sm-3 col-xs-6">
		
				<div class="tile-stats tile-aqua">
					<div class="icon"><i class="entypo-video"></i></div>
					<div class="num" data-start="0" data-end="{{ $total_videos }}" data-postfix="" data-duration="1500" data-delay="1200">0</div>
		
					<h3>Videos</h3>
					<p>Total videos on your site.</p>
				</div>
		
			</div>
		
			<div class="col-sm-3 col-xs-6">
		
				<div class="tile-stats tile-blue">
					<div class="icon"><i class="entypo-doc-text"></i></div>
					<div class="num" data-start="0" data-end="{{ $total_posts }}" data-postfix="" data-duration="1500" data-delay="1800">0</div>
		
					<h3>Posts</h3>
					<p>Total Posts/Articles on your site.</p>
				</div>
		
			</div>
		</div>
		
		<br />

<div id="google_analytics_login_container">
  <div id="google_analytics_login">
    <img src="{{ URL::to('/') }}/application/assets/admin/images/admin-bg.jpg" />
    <div id="embed-api-auth-container"></div>
  </div>
</div>

<script>
(function(w,d,s,g,js,fs){
  g=w.gapi||(w.gapi={});g.analytics={q:[],ready:function(f){this.q.push(f);}};
  js=d.createElement(s);fs=d.getElementsByTagName(s)[0];
  js.src='https://apis.google.com/js/platform.js';
  fs.parentNode.insertBefore(js,fs);js.onload=function(){g.load('analytics');};
}(window,document,'script'));
</script>

<script src="{{ URL::to('/') }}/application/assets/admin/js/ganalytics/Chart.min.js"></script>
<script src="{{ URL::to('/') }}/application/assets/admin/js/ganalytics/moment.min.js"></script>
<script src="{{ URL::to('/') }}/application/assets/admin/js/ganalytics/active-users.js"></script>
<script src="{{ URL::to('/') }}/application/assets/admin/js/ganalytics/view-selector2.js"></script>




<div class="row">
	<div class="col-sm-8">



		<div class="panel panel-primary" id="charts_env">

			<div class="panel-heading">
			<div class="panel-title">This Week vs. Last Week</div>

			<div class="panel-options">
				<div class="ViewSelector" id="view-selector-container"></div>
			</div>
		</div>

			<div class="panel-body chart1-panel">

				<div class="tab-content">

					<div id="chart-1-container"></div>
					<div class="Chartjs-legend" id="legend-1-container"></div>					

				</div>

			</div>

		</div>

	</div>

	<div class="col-sm-4">



		<div class="panel panel-primary" id="charts_env">

			<div class="panel-heading">
			<div class="panel-title">Real-time Visitors</div>

		</div>

			<div class="panel-body active-users-panel">

				<div class="tab-content">

					<div id="active-users-container"></div>					

				</div>

			</div>

		</div>

	</div>

</div>

<div class="row">
	<div class="col-sm-6">



		<div class="panel panel-primary" id="charts_env">

			<div class="panel-heading">
			<div class="panel-title">Top Browsers by Pageviews</div>

		</div>

			<div class="panel-body">

				<div class="tab-content">

					<div id="chart-3-container"></div>
					<div class="Chartjs-legend" id="legend-3-container"></div>					

				</div>

			</div>

		</div>

	</div>

	<div class="col-sm-6">



		<div class="panel panel-primary" id="charts_env">

			<div class="panel-heading">
			<div class="panel-title">Top Countries by Sessions</div>

		</div>

			<div class="panel-body">

				<div class="tab-content">

					<div id="chart-4-container"></div>
					<div class="Chartjs-legend" id="legend-4-container"></div>					

				</div>

			</div>

		</div>

	</div>

</div>

<script>

gapi.analytics.ready(function() {

  /**
   * Authorize the user immediately if the user has already granted access.
   * If no access has been created, render an authorize button inside the
   * element with the ID "embed-api-auth-container".
   */
  gapi.analytics.auth.authorize({
    container: 'embed-api-auth-container',
    clientid: '{{ $settings->google_oauth_key }}',
  });

   /**
   * Create a new ActiveUsers instance to be rendered inside of an
   * element with the id "active-users-container" and poll for changes every
   * five seconds.
   */
  var activeUsers = new gapi.analytics.ext.ActiveUsers({
    container: 'active-users-container',
    pollingInterval: 5
  });


  /**
   * Add CSS animation to visually show the when users come and go.
   */
  activeUsers.once('success', function() {
    var element = this.container.firstChild;
    var timeout;

    this.on('change', function(data) {
      var element = this.container.firstChild;
      var animationClass = data.delta > 0 ? 'is-increasing' : 'is-decreasing';
      element.className += (' ' + animationClass);

      clearTimeout(timeout);
      timeout = setTimeout(function() {
        element.className =
            element.className.replace(/ is-(increasing|decreasing)/g, '');
      }, 3000);
    });
  });


  /**
   * Create a new ViewSelector instance to be rendered inside of an
   * element with the id "view-selector-container".
   */
  // var viewSelector = new gapi.analytics.ViewSelector({
  //   container: 'view-selector-container'
  // });

  // Render the view selector to the page.
  //viewSelector.execute();


  /**
   * Create a new DataChart instance with the given query parameters
   * and Google chart options. It will be rendered inside an element
   * with the id "chart-container".
   */
  var dataChart = new gapi.analytics.googleCharts.DataChart({
    query: {
      metrics: 'ga:sessions',
      dimensions: 'ga:date',
      'start-date': '30daysAgo',
      'end-date': 'today'
    },
    chart: {
      container: 'chart-container',
      type: 'LINE',
      options: {
        width: '100%'
      }
    }
  });

  function renderTopBrowsersChart(ids) {

    query({
      'ids': ids,
      'dimensions': 'ga:browser',
      'metrics': 'ga:pageviews',
      'sort': '-ga:pageviews',
      'max-results': 5
    })
    .then(function(response) {

    	//console.log(response.rows);
      	var data = [];
     	var colors = ['#4D5360','#949FB1','#D4CCC5','#E2EAE9','#F7464A'];

      	response.rows.forEach(function(row, i) {
        	data.push({ value: +row[1], color: colors[i], label: row[0] });
      	});

      	new Chart(makeCanvas('chart-3-container')).Doughnut(data);
      	generateLegend('legend-3-container', data);
    });
  }

  /**
   * Extend the Embed APIs `gapi.analytics.report.Data` component to
   * return a promise the is fulfilled with the value returned by the API.
   * @param {Object} params The request parameters.
   * @return {Promise} A promise.
   */
   function query(params) {
	return new Promise(function(resolve, reject) {
	  var data = new gapi.analytics.report.Data({query: params});
	  data.once('success', function(response) { resolve(response); })
	      .once('error', function(response) { reject(response); })
	      .execute();
	});
	}

	/**
   * Create a new canvas inside the specified element. Set it to be the width
   * and height of its container.
   * @param {string} id The id attribute of the element to host the canvas.
   * @return {RenderingContext} The 2D canvas context.
   */
  function makeCanvas(id) {
    var container = document.getElementById(id);
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');

    container.innerHTML = '';
    canvas.width = container.offsetWidth;
    canvas.height = container.offsetHeight;
    container.appendChild(canvas);

    return ctx;
  }

  /**
   * Draw the a chart.js line chart with data from the specified view that
   * overlays session data for the current week over session data for the
   * previous week.
   */
  function renderWeekOverWeekChart(ids) {

    // Adjust `now` to experiment with different days, for testing only...
    var now = moment(); // .subtract(3, 'day');

    var thisWeek = query({
      'ids': ids,
      'dimensions': 'ga:date,ga:nthDay',
      'metrics': 'ga:sessions',
      'start-date': moment(now).subtract(1, 'day').day(0).format('YYYY-MM-DD'),
      'end-date': moment(now).format('YYYY-MM-DD')
    });

    var lastWeek = query({
      'ids': ids,
      'dimensions': 'ga:date,ga:nthDay',
      'metrics': 'ga:sessions',
      'start-date': moment(now).subtract(1, 'day').day(0).subtract(1, 'week')
          .format('YYYY-MM-DD'),
      'end-date': moment(now).subtract(1, 'day').day(6).subtract(1, 'week')
          .format('YYYY-MM-DD')
    });

    Promise.all([thisWeek, lastWeek]).then(function(results) {

      var data1 = results[0].rows.map(function(row) { return +row[2]; });
      var data2 = results[1].rows.map(function(row) { return +row[2]; });
      var labels = results[1].rows.map(function(row) { return +row[0]; });

      labels = labels.map(function(label) {
        return moment(label, 'YYYYMMDD').format('ddd');
      });

      var data = {
        labels : labels,
        datasets : [
          {
            label: 'Last Week',
            fillColor : "rgba(220,220,220,0.5)",
            strokeColor : "rgba(220,220,220,1)",
            pointColor : "rgba(220,220,220,1)",
            pointStrokeColor : "#fff",
            data : data2
          },
          {
            label: 'This Week',
            fillColor : "rgba(151,187,205,0.5)",
            strokeColor : "rgba(151,187,205,1)",
            pointColor : "rgba(151,187,205,1)",
            pointStrokeColor : "#fff",
            data : data1
          }
        ]
      };

      new Chart(makeCanvas('chart-1-container')).Line(data);
      generateLegend('legend-1-container', data.datasets);
    });
  }

  /**
   * Draw the a chart.js doughnut chart with data from the specified view that
   * compares sessions from mobile, desktop, and tablet over the past seven
   * days.
   */
  function renderTopCountriesChart(ids) {
    query({
      'ids': ids,
      'dimensions': 'ga:country',
      'metrics': 'ga:sessions',
      'sort': '-ga:sessions',
      'max-results': 5
    })
    .then(function(response) {

      var data = [];
      var colors = ['#4D5360','#949FB1','#D4CCC5','#E2EAE9','#F7464A'];

      response.rows.forEach(function(row, i) {
        data.push({
          label: row[0],
          value: +row[1],
          color: colors[i]
        });
      });

      new Chart(makeCanvas('chart-4-container')).Doughnut(data);
      generateLegend('legend-4-container', data);
    });
  }

  /**
   * Create a visual legend inside the specified element based off of a
   * Chart.js dataset.
   * @param {string} id The id attribute of the element to host the legend.
   * @param {Array.<Object>} items A list of labels and colors for the legend.
   */
  function generateLegend(id, items) {
    var legend = document.getElementById(id);
    legend.innerHTML = items.map(function(item) {
      var color = item.color || item.fillColor;
      var label = item.label;
      return '<li><i style="background:' + color + '"></i>' + label + '</li>';
    }).join('');
  }


  // Set some global Chart.js defaults.
  Chart.defaults.global.animationSteps = 60;
  Chart.defaults.global.animationEasing = 'easeInOutQuart';
  Chart.defaults.global.responsive = true;
  Chart.defaults.global.maintainAspectRatio = false;


  /**
   * Create a new ViewSelector2 instance to be rendered inside of an
   * element with the id "view-selector-container".
   */
  var viewSelector = new gapi.analytics.ext.ViewSelector2({
    container: 'view-selector-container',
  })
  .execute();


  /**
   * Update the activeUsers component, the Chartjs charts, and the dashboard
   * title whenever the user changes the view.
   */
  viewSelector.on('viewChange', function(data) {
    //var title = document.getElementById('view-name');
    //title.innerHTML = data.property.name + ' (' + data.view.name + ')';

    // Start tracking active users for this view.
    activeUsers.set(data).execute();

    // Render all the of charts for this view.
    renderWeekOverWeekChart(data.ids);
    renderTopBrowsersChart(data.ids);
    renderTopCountriesChart(data.ids);

    $('#google_analytics_login_container').fadeOut();

  });

});
</script>

@stop