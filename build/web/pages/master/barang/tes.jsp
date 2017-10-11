<!DOCTYPE html>
<html lang="en">
<head>
	<!--meta charset="utf-8"-->
	<title>JQuery UI Message box Samples</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
        <script src="js/jquery-ui-messageBox.js"></script>

	<style type="text/css">
		code{
			display: block;
			padding: 5px;
			border: solid 1px #aaaaaa;
		}

	</style>

</head>
<body>
	<H1>JQuery UI Message box Samples</H1>

	<H2>Sample 1. Easy usage</H2>
	<p>To show Message box - to call the function "$.showMessageBox" with the text that you want to show.</p>
	<code>$.showMessageBox("Very simple message box!");</code>
	</br>
	<button id='demo1'>Demo</button>

	<script>
		$('#demo1').click(function(){
			$.showMessageBox("Very simple message box!");
		});		
	
	</script>

	<H2>Sample 2. Custom title and content</H2>
	<p>To show Message box with additional parameters, you must call the function "$.showMessageBox" settings.</p>
	<code>$.showMessageBox({
				content:"Very simple usage Message box!",
				title: 'My information',
			});</code>
	</br>
	<button id='demo2'>Demo</button>

	<script>
		$('#demo2').click(function(){
			$.showMessageBox({
				content:"Very simple usage Message box!",
				title: 'My information',
			});
		});
	
	</script>

	

</body>
</html>