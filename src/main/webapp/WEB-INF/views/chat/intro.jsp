<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    String SS_USER_ID = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅방 목록</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <style>
        a{text-decoration:none}
        ul,ol,li{list-style:none}

        html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            box-sizing: border-box;
        }

        ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }

        .sub_wrap .align_rt {
            float: right;
            width: 660px;
            margin-right: 31px;
            margin-top:70px;
            margin-bottom:100px;
        }

        .sub_wrap nav {
            display: block;
            float: left;
            width: 238px;
            padding-left: 31px;
            padding-top:32px;
        }

        .wrap{
            width:100%;
            background:#fff;
        }

        .sub_top_wrap{
            height: 211px;
            background:rgb(112,173,71);
        }

        .sub_top{
            width:1024px;
            height:211px;
            margin:0 auto;
            border-radius:0;
            padding-top:110px;
        }

        .sub_top h1{
            display:block;
            margin-left:100px;
            color:#fff;

        }


        .content{
            overflow:hidden;
        }

        .sub_wrap{
            width: 1024px;
            margin:0 auto 0 auto;
            padding_top:54px;
            padding_bottom:54px;
            background:rgb(112,173,71);
        }

        .show_list li .list_que span {
            font-size: 16px;
            color: black;
        }

        .show_list li{
            display: block;
            position: relative;
            height: auto;
            margin-bottom: 0;
            padding: 0px 24px 0px 0px;
            border-radius: 0;
            background: #fff;
            font-size: 18px;
            line-height: normal;
            cursor: pointer;
        }

        .show_list li .list_que p {
            padding-bottom: 0px;
            overflow: visible;
            white-space: normal;
            text-overflow: initial;
            line-height: normal;
            word-wrap: break-word;
        }

        .show_list li a p {
            overflow: hidden;
            width: 100%;
            padding-bottom: 3px;
            white-space: nowrap;
            text-overflow: ellipsis;
            color:black;
        }

        .tab_each {
            border-top: none;
        }

        .tab_each {
            clear: both;
            border-top: 1px solid black;
        }

        div {
            display: block;
        }

        p {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }

        .show_list {
            margin-bottom: 0;
            padding: 0 0;
        }

        .sub_top{
            margin:0 auto;
        }

        .sub_wrap nav ul li a{
            display:block;
            font-size:20px;
            color:black;
        }

        .sub_wrap nav ul li a.active{
            font-size:20px;
            color:rgb(112,173,71);
            font-weight:bold;
        }

        .wrap.show, footer.show {
            opacity: 1;
            visibility: visible;
        }

        .wrap {
            width: 100%;
            background: #fff;
            opacity: 0;
            visibility: hidden;
        }

        .sub_top li {
            margin: 21px 0 0 0px;
            font-size: 16px;
            font-weight: normal;
            letter-spacing: -1px;
        }

        .sub_wrap nav ul li {
            margin-bottom: 26px;
        }

        .tab span.tab_btn {
            display: inline-block;
            float: none;
            position: relative;
            width: auto;
            height: 30px;
            margin-right: 22px;
            font-size: 18px;
            line-height: normal;
            color: black;
            text-align: left;
            cursor: pointer;
        }



        .paging {
            padding:32px 0 0 32px;
        }

        .paging button{
            width: 32px;
            height: 32px;
            box-sizing: inherit;
            align-items: center;
            border-radius: 3px;
            border: none;
            box-shadow: none;
            font-size: 13px;
            line-height: 1.5;
            text-align: center;
        }

        .paging .on{
            background:rgb(112,173,71);
            color:#fff;
        }

        .tab_each ul li button::before{
            content: "\f078";
            font-family:"Font Awesome 5 Free";
            font-weight: 600;
            display: block;
            color: black;
            float: right;
            cursor:pointer;
            position:relative;
            top:3px;
        }

        .tab_each ul li button {
            border : 1px solid rgba(0,0,0,0.2);
            border-radius : 4px;
            background-color: #fff;
            font-weight: 400;
            color : black;
            padding : 4px;
            width : 240px;
            text-align: left;
            cursor : pointer;
            font-size : 16px;
            position : relative;
            box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
            z-index:1;
        }

        .dropdown{
            position : relative;
            display : inline-block;
            float : right;
        }

        .dropdown-content{
            display : none;
            font-weight: 400;
            background-color: #fff;
            min-width : 240px;
            border-radius: 8px;
            height : 90px;
            box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
            position:absolute;
            z-index:99;
        }

        .dropdown-content div{
            display : block;
            text-decoration : none;
            color : black;
            font-size: 16px;
            padding : 12px 10px;
        }
        .dropdown-content div:hover{
            background-color: rgb(226, 226, 226);
        }

        .dropdown-content.show{
            display : block;
        }

        .paging .write{
            float:right;
            width: 70px;
            height: 38px;
            box-sizing: inherit;
            align-items: center;
            border-radius: 5px;
            border: 2px solid rgba(0,0,0,0.15);
            box-shadow: none;
            font-size: 16px;
            line-height: 1.5;
            text-align: center;
        }

    </style>

    <script src="/js/jquery-3.6.1.min.js"></script>
    <script>
        $(document).ready(function (){

            let btnSend = document.getElementById("btnSend");

            btnSend.onclick = function (){
                const f = document.getElementById("f");
                f.submit();
            }
        });

        setInterval(function (){
            $.ajax({
                url : "/chat/roomList",
                type : "get",
                dataType : "JSON",
                success: function (json) {
                    let roomHtml = " ";

                    for (const room of json){
                        roomHtml += ("<span>" + room + "</span>");
                    }

                    $("#rooms").html(roomHtml);
                }
            });

        }, 1000);
    </script>

</head>
<body class="pc">
<div class="wrap show">
    <div class="sub_top_wrap">
        <div class="sub_top">
            <h1><i class="fas fa-phone-alt fa-lg"></i>채팅</h1>
        </div>
    </div>
    <div id="content" class="sub_wrap">
        <nav>
            <ul>
                <li>
                    <a href="/notice/NoticeList">게시판</a>
                </li>
                <li>
                    <a href="/notice/NoticeList" class="active">채팅</a>
                </li>
                <li>
                    <a href="/PRJmain">HOME</a>
                </li>
            </ul>
        </nav>
        <div class="align_rt">
            <div><b>현재 오픈된 채팅방</b></div>
            <hr/>
            <div id="rooms"></div>
            <br/>
            <br/>
            <form method="post" id="f" action="/chat/room">
                <div><b>채팅입장</b></div>
                <hr/>
                <div><sapn>채팅방 이름 : <input type="text" name="roomname"> </sapn></div>
                <div><span>채팅 별명 : <input type="text" name="nickname"></span></div>
                <button id="btnSend">채팅방 입장</button>
            </form>
        </div>
    </div>
</div>
</body>