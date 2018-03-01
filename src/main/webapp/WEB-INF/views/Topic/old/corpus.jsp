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
    <title>主题展示 - RWNTM主题分析系统</title>
    <link rel="shortcut icon" href="resources/favicon.ico"/>
    <link rel="bookmark" href="resources/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="resources/particles.css"/>
    <link rel="stylesheet" type="text/css" href="resources/load.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_button.css"/>
    <link rel="stylesheet" type="text/css" href="resources/login/css/component_modal.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_main.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_menu.css"/>
    <link rel="stylesheet" type="text/css" href="resources/all/component_bigmenu.css"/>
    <link rel="stylesheet" type="text/css" href="resources/all/photo/index.css"/>
    <link rel="stylesheet" type="text/css" href="resources/pagePagination.css"/>
    <style>html, body {
        font-family: "微软雅黑";
    }</style>
    <script src="resources/modernizr-custom.js"></script>
</head>
<body>

<nav class="menu menu--valentine">
    <ul class="pages-nav menu__list">
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="">首页</a></li>
        <li class="pages-nav__item menu__item menu__item--current"><a class="menu__link link link--page"
                                                                      href="kejso/Topic/corpus">科搜语料实体关系</a></li>
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
<script src="resources/jquery.min.js"></script>
<script src="resources/particles.js"></script>
<script src="resources/clipboard.min.js"></script>
<script src="resources/echarts/echarts.common.min.js"></script>
<script src="resources/echarts/dark.js"></script>
<script src="resources/jquery-ui.js"></script>
<script src="resources/jquery.pagination.js"></script>
<script src="resources/wordcloud2.js"></script>
<script src="resources/tsne/d3.min.js"></script>
<script src="resources/tsne/scienceai-tsne.min.js"></script>
<script src="resources/tsne/karpathy-tsne.js"></script>
<script src="resources/tsne/tsneez.js"></script>
<script src="resources/main.js"></script>

<script>
    $scene = $('#scene');
    var parallax = new Parallax($scene[0]);
    var model = JSON.parse(localStorage.getItem("model"));
    var D2T = model["d2T"];
    var D2T_Map = model["d2T_Map"];
    var T2W = model["t2W"];
    var T2W_Map = model["t2W_Map"];

    var Docs = model["docs"];
    var I2W = model["i2W"];
    var W2T = model["w2T"];
    var topic_num = model["topic_num"];
    var wordCount = model["wordCount"];
    var wordIDF = model["wordIDF"];
    var photoList = model["photoList"];
    var Coherence_5 = model["coherence_5"];
    var Coherence_10 = model["coherence_10"];
    var W2T_Vec = model["w2T_Vec"];
    var once = true;
    var Rate = model["rate"];
</script>
</body>
</html>
