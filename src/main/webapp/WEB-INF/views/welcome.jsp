<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>科技领域实体关系挖掘分析系统</title>
    <link rel="shortcut icon" href="resources/favicon.ico"/>
    <link rel="bookmark" href="resources/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="resources/login/css/set1.css"/>
    <link rel="stylesheet" type="text/css" href="resources/particles.css"/>
    <link rel="stylesheet" type="text/css" href="resources/load.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_button.css"/>
    <link rel="stylesheet" type="text/css" href="resources/login/css/component_modal.css"/>

    <link rel="stylesheet" type="text/css" href="resources/component_main.css"/>
    <link rel="stylesheet" type="text/css" href="resources/component_menu.css"/>
    <link rel="stylesheet" type="text/css" href="resources/all/component_bigmenu.css"/>
    <link rel="stylesheet" type="text/css" href="resources/all/photo/index.css"/>
    <link rel="stylesheet" type="text/css" href="resources/pagePagination.css"/>
    <style>
        html, body {
            margin: 0;
            height: 100%;
        }

        h1 {
            margin: 0;
        }

        .main-container {
            height: 100%;
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

<nav class="menu menu--valentine">
    <ul class="pages-nav menu__list">
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="Index/index">首页</a></li>
        <li class="pages-nav__item menu__item menu__item--current"><a class="menu__link link link--page"
                                                                      href="#page-all">分析结果概要</a></li>
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="#page-topic">查看主题</a></li>
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="#page-document">查看原始文档</a>
        </li>
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="#page-word">查看单词</a></li>
        <li class="pages-nav__item menu__item"><a class="menu__link link link--page" href="User/login">退出</a></li>
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



<div class="main-container">
    <div class="middle expand-show">
        <div class="logo">
            <h1 class="title">科技领域实体关系挖掘分析系统</h1>
        </div>
        <div class="input">
            <section class="content bgcolor-1">
                <span class="input input--haruki">
					<input class="input__field input__field--haruki" type="text" id="url"/>
					<label class="input__label input__label--haruki" for="url">
						<span class="input__label-content input__label-content--haruki">请输入待分析的网页</span>
					</label>
				</span>
            </section>
        </div>
        <div class="hi-icon-wrap hi-icon-effect-8">
            <a href="javascript:void(0)" onclick="handle_submit()" class="hi-icon hi-icon-archive">Archive</a>
        </div>
    </div>
</div>
<div id="scene" class="scene unselectable"
     data-friction-x="0.1"
     data-friction-y="0.1"
     data-scalar-x="25"
     data-scalar-y="15">
    <div id="particles-js" style="" class="layer" data-depth="0.3"></div>
</div>
<div id="loader-container" class="loader-container">
    <div class='base'>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
    </div>
    <div class="load-title">加载中...</div>
    <%--<div class="mask"></div>--%>
</div>

<input type="button" style="display: none" class="md-trigger" data-modal="modal-1" id="click"/>
<div class="md-modal md-effect-1" id="modal-1">
    <div class="md-content">
        <h3 id="msg_head">警告</h3>
        <div>
            <p id="msg"></p>
            <input type="button" class="md-close" value="关闭"/>
        </div>
    </div>
</div>
<script src="resources/jquery.min.js"></script>
<script src="resources/login/js/parallax.js"></script>
<script src="resources/login/js/classie.js"></script>
<script src="resources/jquery.min.js"></script>
<script src="resources/particles.js"></script>
<script src="resources/login/js/modalEffects.js"></script>

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

    function handle_submit() {
        if ($.trim($("#url").val()) != "") {
            $("body").addClass("sp-load");
            $.post("Topic/handle", {"url": $.trim($("#url").val())}, function (data) {
                $("body").removeClass("sp-load");
                if (data.status) {
                    localStorage.setItem("model", JSON.stringify(data.model));
                    location.href = "Topic/main?product_id=" + data.product_id;
                } else {
                    $("#msg").text("数据分析失败，" + data.msg);
                    $("#msg_head").text("警告");
                    document.querySelectorAll("#click")[0].click();
                }
            })
        }
    }


    (function () {
        // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
        if (!String.prototype.trim) {
            (function () {
                // Make sure we trim BOM and NBSP
                var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                String.prototype.trim = function () {
                    return this.replace(rtrim, '');
                };
            })();
        }

        [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
            // in case the input is already filled..
            if (inputEl.value.trim() !== '') {
                classie.add(inputEl.parentNode, 'input--filled');
            }

            // events:
            inputEl.addEventListener('focus', onInputFocus);
            inputEl.addEventListener('blur', onInputBlur);
        });

        function onInputFocus(ev) {
            classie.add(ev.target.parentNode, 'input--filled');
        }

        function onInputBlur(ev) {
            if (ev.target.value.trim() === '') {
                classie.remove(ev.target.parentNode, 'input--filled');
            }
        }

        $scene = $('#scene');
        var parallax = new Parallax($scene[0]);
//        (resize = function() {
//            $scene.css("width",  window.innerWidth + 'px');
//            $scene.css("height", window.innerHeight + 'px');
//
//        })();
    })();


</script>

</body>
</html>