<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>

<!DOCTYPE html>
<html class="no-js">
<head>
    <base href="<%=basePath%>">
    <title>科搜语料搜索</title>
    <link rel="shortcut icon" href="resources/favicon.ico"/>
    <link rel="bookmark" href="resources/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="resources/login/css/set1.css"/>
    <link rel="stylesheet" type="text/css" href="resources/particles.css"/>
    <link rel="stylesheet" type="text/css" href="resources/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="resources/jqcloud.css"/>
    <link rel="stylesheet" type="text/css" href="resources/load.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_button.css"/>

    <link rel="stylesheet" type="text/css" href="resources/component_main.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_menu.css"/>
    <link rel="stylesheet" type="text/css" href="resources/all/component_bigmenu.css"/>
    <link rel="stylesheet" type="text/css" href="resources/all/photo/index.css"/>
    <link rel="stylesheet" type="text/css" href="resources/pagePagination.css"/>
    <style>
        html, body {
            margin: 0;
            height: 100%;
            font-family: "微软雅黑";
        }

        h1 {
            margin: 0;
        }

        .main-container {
            height: 120%;
            width: 100%;
            overflow: hidden;
            position: relative;
        }

        .middle {
            position: absolute;
            width: 70%;
            text-align: center;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            max-height: 400px;
        }

        .title {
            font: 70px microsoft yahei;
            text-align: center;
            color: #b04b40;
            text-shadow: 0px 2px 3px #555;
            font-weight: bolder;
        }

        /*.title:hover {*/
        /*color: #a0a0a0;*/
        /*text-shadow: 0px 5px 8px #2a2a2a;*/
        /*}*/
    </style>
    <script src="resources/modernizr-custom.js"></script>
</head>
<body>


<div class="main-container">
    <div class="middle expand-show">
        <div class="logo">
            <h1 class="title">科搜语料搜索</h1>
        </div>
        <div class="input">
             <section class="content bgcolor-1">
                     <span class="input input--haruki">
			<input class="input__field input__field--haruki" type="text" id="entity" name="entity"/>
			<label class="input__label input__label--haruki" for="url">
				<span class="input__label-content input__label-content--haruki">请输入实体</span>
			</label>
		</span>
            </section>
        </div>
        <div class="hi-icon-wrap hi-icon-effect-8">
        	  <input type="button"  class="hi-icon hi-icon-archive" onclick="corpus()" />
        </div>
    </div>

    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModaltitle">
					科搜语料搜索
				</h4>
			</div>
			<!-- 模态框内容  -->
			<div class="modal-body" id="corpus_content">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
						data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</div>


<div id="scene" class="scene unselectable"
     data-friction-x="0.1"
     data-friction-y="0.1"
     data-scalar-x="25"
     data-scalar-y="15">
    <div id="particles-js" style="" class="layer" data-depth="0.3"></div>
</div>

<nav class="menu menu--valentine">
    <ul class="pages-nav menu__list">
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="">首页</a></li>
        <li class="pages-nav__item menu__item menu__item--current"><a class="menu__link link link--page"
                                                                      href="kejso/Topic/corpus">科搜语料搜索</a></li>
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="kejso/Topic/network">实体关系网络</a></li>
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="kejso/Topic/medicine">医学实体网络</a></li>
    </ul>
</nav>
<!-- /navigation-->
<!-- pages stack -->
<div class="pages-stack">
    <!-- page -->
    <div class="page" id="page-all" data-page-url="Topic/all"></div>
    <div class="page" id="page-topic" data-page-url="Topic/topic"></div>
    <div class="page" id="page-document" data-page-url="Topic/document"></div>
    <div class="page" id="page-word" data-page-url="Topic/word"></div>
</div>
<!-- /pages-stack -->
<button class="menu-button"><span>Menu</span></button>


<div id="scene" class="scene unselectable"
     data-friction-x="0.1"
     data-friction-y="0.1"
     data-scalar-x="25"
     data-scalar-y="15">
    <div id="particles-js" style="" class="layer" data-depth="0.10"></div>
</div>
<script src="resources/login/js/parallax.js"></script>
<script src="resources/login/js/classie.js"></script>
<script src="resources/jquery-2.1.1.js"></script>
<script src="resources/jqcloud-1.0.4.min.js"></script>
<script src="resources/echarts-all.js"></script>
<script src="resources/bootstrap.min.js"></script>
<script src="resources/particles.js"></script>
<script src="resources/login/js/modalEffects.js"></script>
<script src="resources/clipboard.min.js"></script>

<script src="resources/jquery-ui.js"></script>
<script src="resources/jquery.pagination.js"></script>
<script src="resources/wordcloud2.js"></script>
<script src="resources/tsne/d3.min.js"></script>
<script src="resources/tsne/scienceai-tsne.min.js"></script>
<script src="resources/tsne/karpathy-tsne.js"></script>
<script src="resources/tsne/tsneez.js"></script>
<script src="resources/main.js"></script>

<script>

   function  corpus()
   {
   	var entity = $.trim($("#entity").val());
   	alert(entity);
	$.ajax({
		url : 'kejso/corpus',
		data : "entity=" + entity,
		type : "POST",
		success : function(data) {
			console.log(data);
			$('#corpus_content').empty();
			if(data.cause.length!=0)
			{
				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'><div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>Cause");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.cause).each(
					function(index){
						$('#corpus_content').append("<p>"+data.cause[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");
			}

			if(data.describe.length!=0)
			{
				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'> <div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>"+"Describe");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.describe).each(
					function(index){
						$('#corpus_content').append("<p>"+data.describe[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");
			}

			if(data.from.length!=0)
			{
				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'> <div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>"+"From");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.from).each(
					function(index){
						$('#corpus_content').append("<p>"+data.from[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");
			}

			if(data.identity.length!=0)
			{
				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'> <div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>"+"Identity");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.identity).each(
					function(index){
						$('#corpus_content').append("<p>"+data.identity[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");

			}

			if(data.medicine.length!=0)
			{

				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'> <div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>"+"Medicine");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.medicine).each(
					function(index){
						$('#corpus_content').append("<p>"+data.medicine[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");

			}

			if(data.part.length!=0)
			{
				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'> <div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>"+"Part");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.part).each(
					function(index){
						$('#corpus_content').append("<p>"+data.part[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");

			}

			if(data.position.length!=0)
			{
				$('#corpus_content').append("<div class='panel panel-default' id='paperDiv'> <div class='panel-heading' style='overflow: auto;'><h3 class='panel-title'>"+"Position");
				$('#corpus_content').append("</h3></div><div class='panel-body'><div id='resultlist'>");
				$(data.position).each(
					function(index){
						$('#corpus_content').append("<p>"+data.position[index]+"</p>");
					}
				);
				$('#corpus_content').append("</div></div></div><hr />");
			}

		}
	});

   	$('#myModal').modal('show');
   }
</script>

</body>
</html>
