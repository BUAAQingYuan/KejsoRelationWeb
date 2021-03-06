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

    <link rel="shortcut icon" href="resources/favicon.ico"/>
    <link rel="bookmark" href="resources/favicon.ico"/>
    <%--<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />--%>
    <!-- <link rel="stylesheet" type="text/css" href="css/demo.css" /> -->
    <link rel="stylesheet" type="text/css" href="resources/login/css/styles.css"/>

    <link rel="stylesheet" type="text/css" href="resources/login/css/set2.css"/>

    <link rel="stylesheet" type="text/css" href="resources/login/css/component.css"/>
    <link rel="stylesheet" type="text/css" href="resources/login/css/component_modal.css"/>
    <title>RWNTM主题分析系统</title>
</head>
<body>
<div id="container" class="wrapper">
    <ul id="scene" class="scene unselectable"
        data-friction-x="0.1"
        data-friction-y="0.1"
        data-scalar-x="25"
        data-scalar-y="15">
        <li class="layer" data-depth="0.00"></li>
        <li class="layer" data-depth="0.10">
            <div class="background"></div>
        </li>
        <li class="layer" data-depth="0.10">
            <div class="light orange b phase-4"></div>
        </li>
        <li class="layer" data-depth="0.10">
            <div class="light purple c phase-5"></div>
        </li>
        <li class="layer" data-depth="0.10">
            <div class="light orange d phase-3"></div>
        </li>
        <li class="layer" data-depth="0.15">
            <ul class="rope depth-10">
                <li><img src="resources/login/images/rope.png" alt="Rope"></li>
                <li class="hanger position-2">
                    <div class="board cloud-2 swing-1"></div>
                </li>
                <li class="hanger position-4">
                    <div class="board cloud-1 swing-3"></div>
                </li>
                <li class="hanger position-8">
                    <div class="board birds swing-5"></div>
                </li>
            </ul>
        </li>
        <li class="layer" data-depth="0.20"><h1 class="title">RWNTM<em>主题分析系统</em></h1></li>
        <li class="layer" data-depth="0.30">
            <ul class="rope depth-30">
                <li><img src="resources/login/images/rope.png" alt="Rope"></li>
                <li class="hanger position-1">
                    <div class="board cloud-1 swing-3"></div>
                </li>
                <li class="hanger position-5">
                    <div class="board cloud-4 swing-1"></div>
                </li>
            </ul>
        </li>
        <li class="layer" data-depth="0.30">
            <div class="wave paint depth-30"></div>
        </li>
        <li class="layer" data-depth="0.40">
            <div class="wave plain depth-40"></div>
        </li>
        <li class="layer" data-depth="0.50">
            <div class="wave paint depth-50"></div>
        </li>
        <li class="layer" data-depth="0.60">
            <div class="lighthouse depth-60"></div>
        </li>
        <li class="layer" data-depth="0.60">
            <ul class="rope depth-60">
                <li><img src="resources/login/images/rope.png" alt="Rope"></li>
                <li class="hanger position-3">
                    <div class="board birds swing-5"></div>
                </li>
                <li class="hanger position-6">
                    <div class="board cloud-2 swing-2"></div>
                </li>
                <li class="hanger position-8">
                    <div class="board cloud-3 swing-4"></div>
                </li>
            </ul>
        </li>
        <li class="layer" data-depth="0.60">
            <div class="wave plain depth-60"></div>
        </li>
        <li class="layer" data-depth="0.80">
            <div class="wave plain depth-80"></div>
        </li>
        <li class="layer" data-depth="1.00">
            <div class="wave paint depth-100"></div>
        </li>
    </ul>
    <form style="display: none;">
        <input style="display:none" type="text" name="fakeusernameremembered"/>
        <input style="display:none" type="password" name="fakepasswordremembered"/>
    </form>
    <section id="about" class="wrapper about hide accelerate">
        <div class="cell accelerate">
            <div class="cables center accelerate">
                <div class="panel accelerate">
                    <header>
                        <h1>RWNTM<em>主题分析系统</em></h1>
                    </header>
                    <div class="form-container">
                        <div class="second-container">
                            <div id="login-form">
                                <section class="content bgcolor-1">
                                    <div class="input input--nao">
                                        <input autocomplete="off" class="input__field input__field--nao" type="text"
                                               id="login_user_name"/>
                                        <label class="input__label input__label--nao" for="login_user_name">
                                            <span class="input__label-content input__label-content--nao">用户名</span>
                                        </label>
                                        <svg class="graphic graphic--nao" width="300%" height="100%"
                                             viewBox="0 0 1200 60" preserveAspectRatio="none">
                                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                                        </svg>
                                    </div>
                                    <div class="input input--nao">
                                        <input autocomplete="off" class="input__field input__field--nao" type="password"
                                               id="login_password"/>
                                        <label class="input__label input__label--nao" for="login_password">
                                            <span class="input__label-content input__label-content--nao">密码</span>
                                        </label>
                                        <svg class="graphic graphic--nao" width="300%" height="100%"
                                             viewBox="0 0 1200 60" preserveAspectRatio="none">
                                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                                        </svg>
                                    </div>
                                    <input type="button" class="btn btn-2 btn-2g" value="登录" id="login_button"/>
                                </section>
                            </div>
                            <div id="reg-form">
                                <section class="content bgcolor-1">
                                    <div class="input input--nao">
                                        <input autocomplete="off" class="input__field input__field--nao" type="text"
                                               id="reg_user_name"/>
                                        <label class="input__label input__label--nao" for="reg_user_name">
                                            <span class="input__label-content input__label-content--nao">用户名</span>
                                        </label>
                                        <svg class="graphic graphic--nao" width="300%" height="100%"
                                             viewBox="0 0 1200 60" preserveAspectRatio="none">
                                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                                        </svg>
                                    </div>
                                    <div class="input input--nao">
                                        <input autocomplete="off" class="input__field input__field--nao" type="password"
                                               id="reg_password"/>
                                        <label class="input__label input__label--nao" for="reg_password">
                                            <span class="input__label-content input__label-content--nao">密码</span>
                                        </label>
                                        <svg class="graphic graphic--nao" width="300%" height="100%"
                                             viewBox="0 0 1200 60" preserveAspectRatio="none">
                                            <path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
                                        </svg>
                                    </div>
                                    <%--<div class="input input--nao">--%>
                                    <%--<input autocomplete="off" class="input__field input__field--nao" type="password" id="confirm_password" />--%>
                                    <%--<label class="input__label input__label--nao" for="confirm_password">--%>
                                    <%--<span class="input__label-content input__label-content--nao">密码</span>--%>
                                    <%--</label>--%>
                                    <%--<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">--%>
                                    <%--<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>--%>
                                    <%--</svg>--%>
                                    <%--</div>--%>
                                    <input type="button" class="btn btn-5 btn-2g" value="注册" id="reg_button"/>
                                </section>
                            </div>
                        </div>
                    </div>
                    <ul class="links">
                        <li><a class="download">登录</a></li>

                        <li><a class="github">注册</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <button id="toggle" class="toggle i">
        <div class="cross">
            <div class="x"></div>
            <div class="y"></div>
        </div>
    </button>
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
<div class="md-overlay"></div>
<script src="resources/login/js/parallax.js"></script>
<script src="resources/login/js/classie.js"></script>
<script src="resources/login/js/modalEffects.js"></script>
<script src="resources/jquery.min.js"></script>
<script>

    $("#login_button").click(function () {
        $.post("User/login", {
            "user_id": "0",
            "user_name": $("#login_user_name").val(),
            "user_password": $("#login_password").val()
        }, function (data) {
            if (data.status) {
                location.href = "Index/index";
            } else {
                $("#msg").text("您输入的账号和密码有问题，请重新输入");
                $("#msg_head").text("警告");
                document.querySelectorAll("#click")[0].click();
            }
        });
    });
    $("#reg_button").click(function () {
        $.post("User/reg", {
            "user_name": $("#reg_user_name").val(),
            "user_password": $("#reg_password").val()
        }, function (data) {
            if (data.status) {
                $("#msg").text("注册成功，请登录");
                $("#msg_head").text("信息");
                document.querySelectorAll("#click")[0].click();
            } else {
                $("#msg").text("注册失败，请重试");
                $("#msg_head").text("警告");
                document.querySelectorAll("#click")[0].click();
            }
        });
    });
    //#############################################################

    var $html = $('html'),
            $toggle = $('#toggle'),
            $about = $('#about'),
            $scene = $('#scene');
    // Add touch or mouse class to html element.
    $html.addClass('mouse');

    // Resize handler.
    (resize = function () {
        $scene.css("width", window.innerWidth + 'px');
        $scene.css("height", window.innerHeight + 'px');

    })();

    function debounce(func, wait, immediate) {
        var timeout, args, context, timestamp, result;

        var later = function () {
            var last = (new Date()).getTime() - timestamp;

            if (last < wait && last >= 0) {
                timeout = setTimeout(later, wait - last);
            } else {
                timeout = null;
                if (!immediate) {
                    result = func.apply(context, args);
                    if (!timeout) context = args = null;
                }
            }
        };

        return function () {
            context = this;
            args = arguments;
            timestamp = (new Date()).getTime();
            var callNow = immediate && !timeout;
            if (!timeout) timeout = setTimeout(later, wait);
            if (callNow) {
                result = func.apply(context, args);
                context = args = null;
            }

            return result;
        };
    }

    // Attach window listeners.
    window.onresize = debounce(resize, 200);
    window.onscroll = debounce(resize, 200);

    function showDetails() {
        $about.removeClass('hide');
        $toggle.removeClass('i');
    }

    function hideDetails() {
        $about.addClass('hide');
        $toggle.addClass('i');
    }

    // Listen for toggle click event.
    $toggle.on('click', function (event) {
        $toggle.hasClass('i') ? showDetails() : hideDetails();
    });

    var parallax = new Parallax($scene[0]);

    $(".github").on("click", function () {
        $(".second-container").addClass("left-offset");
    });
    $(".download").on("click", function () {
        $(".second-container").removeClass("left-offset");
    });
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
    })();
</script>

</body>
</html>