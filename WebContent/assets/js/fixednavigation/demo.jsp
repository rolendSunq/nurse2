<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Fixed Navigation - Codrops</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/fixednavigation/style.css" type="text/css" charset="utf-8"/>
        <script type="text/javascript" src="<%=request.getContextPath() %>/assets/js/fixednavigation/jquery-1.3.2.js"></script>
    </head>
    <style>
        body{
            background:#fff; /* url(desc.png) no-repeat 50px 100px; */
            font-family:Arial;
            height:2000px;
        }
        .header
        {
            width:600px;
            height:56px;
            position:absolute;
            top:0px;
            left:25%;
            background:#fff url(../../img/fixednavigation/title.png) no-repeat top left;
        }
        a.back{
            width:256px;
            height:73px;
            position:fixed;
            bottom:15px;
            right:15px;
            background:#fff url(../../img/fixednavigation/codrops_back.png) no-repeat top left;
        }
        .scroll{
            width:133px;
            height:61px;
            position:fixed;
            bottom:15px;
            left:150px;
            background:#fff url(../../img/fixednavigation/scroll.png) no-repeat top left;
        }
        .info{
            text-align:right;

        }
    </style>
    <body>
        <div class="header"></div>
        <div class="scroll"></div>
        <ul id="navigation">
            <li class="home"><a href="" title="Home">aaa</a></li>
            <li class="about"><a href="" title="About">bbb</a></li>
            <li class="search"><a href="" title="Search">ccc</a></li>
            <!-- 
            <li class="photos"><a href="" title="Photos"></a></li>
            <li class="rssfeed"><a href="" title="Rss Feed"></a></li>
            <li class="podcasts"><a href="" title="Podcasts"></a></li>
            <li class="contact"><a href="" title="Contact"></a></li> -->
        </ul>

        <div class="info">
            <a class="back" href="http://www.codrops.com"></a>
            <a href="http://dryicons.com">Icons by DryIcons.com</a>
        </div>

        <script type="text/javascript">
            $(function() {
                $('#navigation a').stop().animate({'marginLeft':'-85px'},1000);

                $('#navigation > li').hover(
                    function () {
                        $('a',$(this)).stop().animate({'marginLeft':'-2px'},200);
                    },
                    function () {
                        $('a',$(this)).stop().animate({'marginLeft':'-85px'},200);
                    }
                );
            });
        </script>
    </body>
</html>