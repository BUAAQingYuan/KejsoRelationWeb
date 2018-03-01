<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #preview {
        transition: all 0.3s;
    }

    .shrink {
        transform: scale(0.9);
        opacity: 0;
    }
</style>
<div class="sub-container dummy dummy-text">
    <div style="text-align: center" id="my-color">

    </div>
    <div id="preview" class="preview" style="height:88%;display: flex;align-content: space-around;flex-wrap: wrap">
    </div>
    <div id="slider" class="sp-slider-wrapper">
        <nav>
            <a href="#" class="sp-prev">Previous</a>
            <a href="#" class="sp-next">Next</a>
        </nav>
    </div>

</div>

<script>

    var colors = ["#f75353", "#f753cc", "#9a53f7", "#53d9f7", "#53f760", "#f4f753", "#f79753", "#05afd1", "#6495ED", "#9AC0CD",
        "#FF1493", "#EE82EE"]
    var word2Topic = {}
    for (var key in W2T) {
        word2Topic[I2W[key]] = W2T[key];
    }
    var str = "";
    for (var i = 0; i < topic_num; i++) {
        str += "<div class='square' style='background-color:" + colors[i] + "'>|主题" + (i + 1) + "|</div>";
    }
    $("#my-color").html(str);

    if (once) {
        for (var i = 0; i < Docs.length; i++) {
            for (var k = 0; k < Docs[i].length; k++) {
                var topic_id = word2Topic[Docs[i][k]];
                if (topic_id && topic_id > -1) {
                    Docs[i][k] = "<span class='tooltip tooltip-effect-" + (topic_id % 5 + 1) + "'><span data-topic='topic_" + topic_id + "' class='tooltip-item' style='color:" + colors[topic_id] + "'>" + Docs[i][k] + "</span><span class='tooltip-content clearfix'></span></span>";
                }
            }
            Docs[i] = Docs[i].join("");
        }
        once = false;
    }

    var $update = $('#preview');
    $update.html("<div class='curved_box'>" + Docs.slice(0, 5).join("</div><div class='curved_box'>") + "</div>");
    $("#slider").pagination({
        total: 80,
        onChange: function (value) {
            var subdocs = Docs.slice((value - 1) * 5, value * 5);
            $update.addClass("shrink")
            setTimeout(function () {
                $update.html("<div class='curved_box'>" + subdocs.join("</div><div class='curved_box'>") + "</div>");
                $update.removeClass("shrink")
            }, 350)

        }
    });
    $(".ui-corner-all span").css("left", "0");
</script>
