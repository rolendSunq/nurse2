<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>Production Crew</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link href="<%=request.getContextPath()%>/assets/css/productioncrew/style.css" type="text/css" rel="stylesheet" />
	<script src="<%=request.getContextPath()%>/assets/js/datepicker/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/productioncrew/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/assets/js/productioncrew/httpRequest.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/youtube/jquery.youtubepopup.js"></script>
	<link type="text/css" href="<%=request.getContextPath()%>/assets/css/youtube/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/youtube/jquery-ui.min.js"></script>
	<script type="text/javascript">
					$(function() {
						var $menu = $('#ei_menu > ul'), $menuItems = $menu
								.children('li'), $menuItemsImgWrapper = $menuItems
								.children('a'), $menuItemsPreview = $menuItemsImgWrapper
								.children('.ei_preview'), totalMenuItems = $menuItems.length,

						ExpandingMenu = (function() {
							/*
								@current
								set it to the index of the element you want to be opened by default,
								or -1 if you want the menu to be closed initially
							 */
							var current = -1,
							/*
								@anim
								if we want the default opened item to animate initialy set this to true
							 */
							anim = true,
							/*
								checks if the current value is valid -
								between 0 and the number of items
							 */
							validCurrent = function() {
								return (current >= 0 && current < totalMenuItems);
							}, init = function() {
								/* show default item if current is set to a valid index */
								if (validCurrent())
									configureMenu();

								initEventsHandler();
							}, configureMenu = function() {
								/* get the item for the current */
								var $item = $menuItems.eq(current);
								/* if anim is true slide out the item */
								if (anim)
									slideOutItem($item, true, 900,
											'easeInQuint');
								else {
									/* if not just show it */
									$item.css({
										width : '400px'
									}).find('.ei_image').css({
										left : '0px',
										opacity : 1
									});

									/* decrease the opacity of the others */
									$menuItems.not($item).children(
											'.ei_preview').css({
										opacity : 0.2
									});
								}
							}, initEventsHandler = function() {
								/*
								when we click an item the following can happen:
								1) The item is already opened - close it!
								2) The item is closed - open it! (if another one is opened, close it!)
								 */
								$menuItemsImgWrapper
										.bind(
												'click.ExpandingMenu',
												function(e) {
													var $this = $(this)
															.parent(), idx = $this
															.index();

													if (current === idx) {
														slideOutItem($menuItems
																.eq(current),
																false, 1500,
																'easeOutQuint',
																true);
														current = -1;
													} else {
														if (validCurrent()
																&& current !== idx)
															slideOutItem(
																	$menuItems
																			.eq(current),
																	false, 250,
																	'jswing');

														current = idx;
														slideOutItem($this,
																true, 250,
																'jswing');
													}
													return false;
												});
							},
							/* if you want to trigger the action to open a specific item */
							openItem = function(idx) {
								$menuItemsImgWrapper.eq(idx).click();
							},
							/*
							opens or closes an item
							note that "mLeave" is just true when all the items close,
							in which case we want that all of them get opacity 1 again.
							"dir" tells us if we are opening or closing an item (true | false)
							 */
							slideOutItem = function($item, dir, speed, easing,
									mLeave) {
								var $ei_image = $item.find('.ei_image'),

								itemParam = (dir) ? {
									width : '400px'
								} : {
									width : '75px'
								}, imageParam = (dir) ? {
									left : '0px'
								} : {
									left : '75px'
								};

								/*
								if opening, we animate the opacity of all the elements to 0.1.
								this is to give focus on the opened item..
								 */
								if (dir)
									/*
											alternative:
											$menuItemsPreview.not($menuItemsPreview.eq(current))
															 .stop()
															 .animate({opacity:0.1}, 500);
									 */
									$menuItemsPreview.stop().animate({
										opacity : 0.1
									}, 1000);
								else if (mLeave)
									$menuItemsPreview.stop().animate({
										opacity : 1
									}, 1500);

								/* the <li> expands or collapses */
								$item.stop().animate(itemParam, speed, easing);
								/* the image (color) slides in or out */
								$ei_image.stop().animate(imageParam, speed,
										easing, function() {
											/*
											if opening, we animate the opacity to 1,
											otherwise we reset it.
											 */
											if (dir)
												$ei_image.animate({
													opacity : 1
												}, 2000);
											else
												$ei_image.css('opacity', 0.2);
										});
							};

							return {
								init : init,
								openItem : openItem
							};
						})();

						/*
						call the init method of ExpandingMenu
						 */
						ExpandingMenu.init();

						/*
						if later on you want to open / close a specific item you could do it like so:
						ExpandingMenu.openItem(3); // toggles item 3 (zero-based indexing)
						 */
						 
						$("a.youtube").YouTubePopup({ autoplay: 0, draggable: true });
						$("#youtubeLink").YouTubePopup({ youtubeId: 'KgXtSx8ublA', title: 'My New Title' });
					});
	</script>
	<style type="text/css">
		h2, h3, p{
			font-family: Dotum, Gulim, 'Malgun Gothic' !important;
		}
	</style>
 </head>
<body>
<form method="post">
<input type="hidden" name="method" value="pc">
	<div class="container">
		<div class="header">
			<a class="left" href="<%=request.getContextPath()%>/login.do"> <<< Back to the Login </a>
			<%-- <a class="back" href="<%=request.getContextPath()%>/nakil.do?method=date">>>> 이단은 datepicker</a> --%>
		</div>
		<div class="content">
			<h1>Team: SYMA(Save Your Mavericks & Another Guy)</h1>
			<h3>Thanks: Zelratole</h3>
			<a>Photo by Nakil Choi</a>
			
			<div id="ei_menu" class="ei_menu">
				<ul>
					<li>
						<a href="#" class="pos1">
							<span class="ei_preview"></span>
							<span class="ei_image"></span>
						</a>
						<div class="ei_descr">
							<h2>Chris Song</h2>
							<h3>Class President</h3>
							<p>
								Role : Project Manager, jQuery
							</p>
							<p>
								There is nothing in the world of art
								like the songs mother used to sing.<br>
								Thanks Mom.<br>
								<br>
								The ones who are enough to think that
								they can change the world are the ones
								who do that. -Steve Jobs<br>
								<br>
								Special Thanks to Prof. Haha-man.
							</p>
						</div>
					</li>
					<li>
						<a href="#" class="pos2">
							<span class="ei_preview"></span>
							<span class="ei_image"></span>
						</a>
						<div class="ei_descr">
							<h2>심성규</h2>
							<h3>Mercenary</h3>
							<p>
								Role : Front-end Development, Controller, AJAX
							</p>
							<p>
								If today were the last day of your<br>
								life, would you want to do what<br>
								you are about to do today?<br>
							</p>
						</div>
					</li>
					<li>
						<a href="#" class="pos3">
							<span class="ei_preview"></span>
							<span class="ei_image"></span>
						</a>
						<div class="ei_descr">
							<h2>최창인</h2>
							<h3>Team Leader</h3>
							<p>
								Role : Community Development
							</p>
							<p>
								하루 하루가 새로운 시작이다.<br>
								Today is a brand new day.
							</p>
						</div>
					</li>
					<li>
						<a href="#" class="pos4">
							<span class="ei_preview"></span>
							<span class="ei_image"></span>
						</a>
						<div class="ei_descr">
							<h2>최낙일</h2>
							<h3>Deputy Team Leader</h3>
							<p>
								Role : DB Modeling, jQuery, Statistics
							</p>
							<p>
								let's it be ..... happy life
							</p>
						</div>
					</li>
					<li>
						<a href="#" class="pos5">
							<span class="ei_preview"></span>
							<span class="ei_image"></span>
						</a>
						<div class="ei_descr">
							<h2>이진우</h2>
							<h3>Team Member</h3>
							<p>
								Role : Membership Development, Spring MVC, myBatis
							</p>
							<p>
								모두들 그동안 수고  많으셨습니다 
								앞으로도  좋은 인연으로 남았으면 좋겠습니다
							</p>
						</div>
					</li>
					<li>
						<a href="#" class="pos6">
							<span class="ei_preview"></span>
							<span class="ei_image"></span>
						</a>
						<div class="ei_descr">
							<h2>김규형</h2>
							<h3>Team Member</h3>
							<p>
								Role : Membership Development, Spring MVC, myBatis, Tester
							</p>
							<p>
								I am alone, call me.
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="footer">
			We ♥ KH Information Educational Institute.
			<a href="http://www.iei.or.kr/">
				http://www.iei.or.kr/
			</a>
			<a id="youtubeLink" href="#">Theme Song</a>
		</div>
	</div>
</form>	
</body>
</html>


