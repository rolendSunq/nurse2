<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>

  <title>Timepicker for jQuery &ndash; Demos and Documentation</title>
  <meta name="description" content="A lightweight, customizable jQuery timepicker plugin inspired by Google Calendar. Add a user-friendly timepicker dropdown to your app in minutes." />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/timepicker/jquery.timepicker.js"></script>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/timepicker/jquery.timepicker.css" />

  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/timepicker/base.js"></script>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/timepicker/base.css" />

</head>

<body>

  <div id="container">


	<h1><a href="https://github.com/jonthornton/jquery-timepicker">jquery.timepicker</a></h1>
	<div class="description">
	  A lightweight, customizable jQuery timepicker plugin inspired by Google Calendar.
	</div>

	<p>Use this plugin to unobtrusively add a timepicker dropdown to your forms. It's lightweight (2.5kb minified and gzipped) and easy to customize.
	  <a href="https://github.com/jonthornton/jquery-timepicker">View the source code on GitHub</a> or <a href="https://github.com/jonthornton/jquery-timepicker/zipball/master">download (zip)</a>.
	</p>

	<p><a href="https://github.com/jonthornton/jquery-timepicker#timepicker-plugin-for-jquery" class="big">Full documentation available here</a></p>

	<div class="example">
		<script>
		  $(function() {
			$('#basicExample').timepicker();
		  });
		</script>

		<h3>Basic Example</h3>
		<p><input id="basicExample" type="text" class="time" /></p>

		<pre class="code" data-language="javascript">$('#basicExample').timepicker();</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#defaultValueExample').timepicker({ 'scrollDefaultNow': true });
		  });
		</script>

		<h3>Scroll Default Example</h3>
		<p>Set the scroll position to local time if no value selected.</p>
		<p><input id="defaultValueExample" type="text" class="time" /></p>

		<pre class="code" data-language="javascript">$('#defaultValueExample').timepicker({ 'scrollDefaultNow': true });</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#setTimeExample').timepicker();
		  	$('#setTimeButton').on('click', function (){
		  	  $('#setTimeExample').timepicker('setTime', new Date());
		  	});
		  });
		</script>

		<h3>Set Time Example</h3>
		<p>Dynamically set the time using a Javascript Date object.</p>
		<p>
			<input id="setTimeExample" type="text" class="time" />
			<button id="setTimeButton">Set current time</button>
		</p>

		<pre class="code" data-language="javascript">$('#setTimeExample').timepicker();
$('#setTimeButton').on('click', function (){
	$('#setTimeExample').timepicker('setTime', new Date());
});</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#durationExample').timepicker({ 'minTime': '2:00pm', 'maxTime': '11:30pm', 'showDuration': true });
		  });
		</script>

		<h3>Duration Example</h3>
		<p>Set a starting time and see duration from that starting time. You can optionally set an maxTime as well.</p>
		<p><input id="durationExample" type="text" class="time" /></p>

		<pre class="code" data-language="javascript">$('#durationExample').timepicker({
	'minTime': '2:00pm',
	'maxTime': '11:30pm',
	'showDuration': true
});</pre>
	</div>




	<div class="example">
		<script>
		  $(function() {
			$('#onselectExample').timepicker();
			$('#onselectExample').on('changeTime', function() {
				$('#onselectTarget').text($(this).val());
			});
		  });
		</script>

		<h3>Event Example</h3>
		<p>Trigger an event after selecting a value. Fires before the input onchange event.</p>
		<p>
		  <input id="onselectExample" type="text" class="time" />
		  <span id="onselectTarget" style="margin-left: 30px;"></span>
		</p>

		<pre class="code" data-language="javascript">$('#onselectExample').timepicker();
$('#onselectExample').on('changeTime', function() {
	$('#onselectTarget').text($(this).val());
});</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#disableTimeRangesExample').timepicker({ 'disableTimeRanges': [['1am', '2am'], ['3am', '4:01am']] });
		  });
		</script>

		<h3>DisableTimeRanges Example</h3>
		<p>Prevent selection of certain time values.</p>
		<p><input id="disableTimeRangesExample" type="text" class="time" /></p>

		<pre class="code" data-language="javascript">$('#disableTimeRangesExample').timepicker({
	'disableTimeRanges': [
		['1am', '2am'],
		['3am', '4:01am']
	]
});</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#timeformatExample1').timepicker({ 'timeFormat': 'H:i:s' });
			$('#timeformatExample2').timepicker({ 'timeFormat': 'h:i A' });
		  });
		</script>

		<h3>timeFormat Example</h3>
		<p>timepicker.jquery uses the time portion of <a href="http://php.net/manual/en/function.date.php">PHP's date formatting commands</a>.</p>
		<p><input id="timeformatExample1" type="text" class="time" /> <input id="timeformatExample2" type="text" class="time" /></p>

		<pre class="code" data-language="javascript">$('#timeformatExample1').timepicker({ 'timeFormat': 'H:i:s' });
$('#timeformatExample2').timepicker({ 'timeFormat': 'h:i A' });</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#stepExample1').timepicker({ 'step': 15 });
			$('#stepExample2').timepicker({ 'step': 60 });
		  });
		</script>

		<h3>Step Example</h3>
		<p>Generate drop-down options with varying levels of precision.</p>
		<p><input id="stepExample1" type="text" class="time" /> <input id="stepExample2" type="text" class="time" /></p>

		<pre class="code" data-language="javascript">$('#stepExample1').timepicker({ 'step': 15 });
$('#stepExample2').timepicker({ 'step': 60 });</pre>
	</div>




	<div class="example">
		<script>
		  $(function() {
			$('#roundTimeExample').timepicker({ 'forceRoundTime': true });
		  });
		</script>

		<h3>forceRoundTime Example</h3>
		<p>jquery-timepicker allows entering times via the keyboard. Setting forceRoundTime to true will
			round the entered time to the nearest option on the dropdown list.</p>
		<p><input id="roundTimeExample" type="text" class="time" /> </p>

		<pre class="code" data-language="javascript">$('#roundTimeExample').timepicker({ 'forceRoundTime': true });</pre>
	</div>





	<div class="example">
		<script>
		  $(function() {
			$('#selectButton').click(function(e) {
			  e.preventDefault();
			  $('#selectExample').timepicker();
			  $(this).hide();
			});
		  });
		</script>

		<h3>Select Example</h3>
		<p>Use jquery-timepicker with &lt;select&gt; elements too.</p>
		<p><select id="selectExample" class="time">
				<option value="12:00am">12:00am</option>
				<option value="1:00am">1:00am</option>
				<option value="2:00am">2:00am</option>
				<option value="3:00am">3:00am</option>
				<option value="4:00am">4:00am</option>
				<option value="5:00am">5:00am</option>
				<option value="6:00am">6:00am</option>
				<option value="7:00am">7:00am</option>
				<option value="8:00am">8:00am</option>
				<option value="9:00am">9:00am</option>
				<option value="10:00am">10:00am</option>
				<option value="11:00am">11:00am</option>
				<option value="12:00pm">12:00pm</option>
				<option value="1:00pm">1:00pm</option>
				<option value="2:00pm">2:00pm</option>
				<option value="3:00pm">3:00pm</option>
				<option value="4:00pm">4:00pm</option>
				<option value="5:00pm">5:00pm</option>
				<option value="6:00pm">6:00pm</option>
				<option value="7:00pm">7:00pm</option>
				<option value="8:00pm">8:00pm</option>
				<option value="9:00pm">9:00pm</option>
				<option value="10:00pm">10:00pm</option>
				<option value="11:00pm">11:00pm</option>
			</select> <button id="selectButton">Convert to timepicker</button></p>

		<pre class="code" data-language="javascript">$('#selectButton').click(function(e) {
	e.preventDefault();
	$('#selectExample').timepicker();
	$(this).hide();
});</pre>
	</div>




	<div class="example">
		<script>
		  $(function() {
			$('#spanExample').timepicker();
			$('#openSpanExample').on('click', function(){
			  $('#spanExample').timepicker('show');
			});
		  });
		</script>

		<h3>Non-input Example</h3>
		<p>jquery-timepicker can be bound to any visibile DOM element, such as spans or divs.</p>
		<p><span id="spanExample" style="background:#f00; padding:0 10px; margin-right:100px;"></span> <button id="openSpanExample">Pick Time</button> </p>

		<pre class="code" data-language="javascript">$('#spanExample').timepicker();
	$('#openSpanExample').on('click', function(){
	$('#spanExample').timepicker('show');
});</pre>
	</div>





	<div class="example">
		<script src="<%=request.getContextPath()%>/assets/js/timepicker/datepair.js"></script>
		<h3>Datepair Example</h3>

		<p class="datepair" data-language="javascript">
			<input type="text" class="date start" />
			<input type="text" class="time start" /> to
			<input type="text" class="time end" />
			<input type="text" class="date end" />
		</p>

		<p>Datepair source available <a href="http://jonthornton.github.com/jquery-timepicker/lib/datepair.js">here</a>.</p>
	</div>


	<div class="example" style="background: #ffd;">
		<h2>Want to get paid to work on stuff like this?</h2>

		<p>Shameless plug: <a href="http://www.parkwhiz.com">ParkWhiz</a> is looking for talented developers
			to help us drag the parking industry out of the Stone Age. Visit ParkWhiz's
			<a href="http://www.parkwhiz.com/about/jobs/">jobs page</a> or email
			<a href="mailto:jobs@parkwhiz.com">jobs@parkwhiz.com</a> and introduce yourself!</p>
	</div>

	<h2>Contact</h2>
	<p><a href="http://jonthornton.com">Jon Thornton</a> &mdash; [lastname].[firstname]@gmail.com</p>


	<h2>Download</h2>
	<p>
	  You can download this project in either
	  <a href="https://github.com/jonthornton/jquery-timepicker/zipball/master">zip</a> or
	  <a href="https://github.com/jonthornton/jquery-timepicker/tarball/master">tar formats</a>. <br />
	  Get the source code on GitHub: <a href="https://github.com/jonthornton/jquery-timepicker">jonthornton/jquery.timepicker</a>
	</p>
	<div class="p">You can also clone the project with <a href="http://git-scm.com">Git</a>
	  by running:
	  <pre>$ git clone git://github.com/jonthornton/jquery-timepicker</pre>
	</div>

	<div class="footer">
	  &copy; 2012 <a href="http://jonthornton.com">Jon Thornton</a>, contributions from
	  	<a href="https://github.com/fojas">Anthony Fojas</a>, <a href="https://github.com/vinc3m1">Vince Mi</a>,
	  	<a href="https://github.com/websirnik">Nikita Korotaev</a>, <a href="https://github.com/Spoon88">Spoon88</a>,
	  	<a href="https://github.com/elarkin">elarkin</a>, , <a href="https://github.com/lodewijk">lodewijk</a>,
	  	<a href="https://github.com/jayzawrotny">jayzawrotny</a>, <a href="https://github.com/dmzza">David Mazza</a>,
	  	<a href="https://github.com/exabytes18">Matt Jurik</a>, <a href="https://github.com/philfreo">Phil Freo</a>,
		<a href="https://github.com/orloffv">orloffv</a>, <a href="https://github.com/patdenice">patdenice</a>,
		<a href="https://github.com/nervetattoo">Raymond Julin</a>, <a href="https://github.com/gavinballard">Gavin Ballard</a>,
		<a href="https://github.com/stevschmid">Steven Schmid</a>
	</div>

  </div>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15605525-1']);
  _gaq.push(['_trackPageview']);

  (function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>
