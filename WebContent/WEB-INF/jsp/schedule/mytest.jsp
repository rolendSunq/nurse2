<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Test</title>
<script src="assets/js/gridly/jquery-2.0.3.js" type="text/javascript"></script>
<script src="assets/js/gridly/jquery.gridly.js" type="text/javascript"></script>
<link href="assets/css/gridly/jquery.gridly.css" rel="stylesheet" type="text/css" />
<link href='assets/css/gridly/sample.css' rel='stylesheet' type='text/css'>


<style type="text/css">
  .gridly {
    position: relative;
    width: 960px;
  }
  .brick.small {
    width: 140px;
    height: 140px;
  }
  .brick.large {
    width: 300px;
    height: 300px;
  }
</style>
<script type="text/javascript">
$(function(){
	$('.gridly').gridly({
		    base: 60, // px 
		    gutter: 20, // px
		    columns: 12
	});
});
</script>
</head>
<body>
<form method="post" action="mytest.do">
	<input type="checkbox" name="isDot" value="true" checked>
	<input type="submit">
</form>
schedule.isDot: ${schedule.isDot }
<br>
<hr>
<br>







    
    <div class='content'>
      <section class='example'>
        <div class='gridly'>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>
          <div class='brick small'>
            <a class='delete' href='#'>&times;</a>
          </div>


        </div>
        <p class='actions'>
          <a class='add button' href='#'>Add</a>
        </p>
      </section>
    </div>







</body>
</html>