<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">


<script type="text/javascript">
function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//페이징
$(function(){
	listPlanPage(1);
});

function listPlanPage(page){
	var url = "<%=cp%>/plan/list";
	var query = "page="+page${query};
	var selector = "#listPlan";
	
	ajaxHTML(url, "get", query, selector);
}

function searchList(){
	var condition = $("select[name=condition]").val();
	var keyword = $("input[name=keyword]").val();
	
	var url = "<%=cp%>/plan/list";
	var query = "condition="+condition+"&keyword="+keyword;
	var selector = "#listPlan";
	
	ajaxHTML(url, "get", query, selector);
}

function changeDays(ob) {
	var $days = $("select[name=days]");
	
}
</script>

<style type="text/css">
.img-button {
	background: transparent;
	border: none;
	width: 30px;
	height: 30px;
	cursor: pointer;
}


.sombra_difuminada{
    background: #ffffff79;
    box-shadow: 0px 0px 1px rgba(0,0,0,1);
    -webkit-transition-duration: 0.3s;
}
.sombra_difuminada:hover{
background:#6e6e6e60;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.6);
}
</style>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;">추천 코스</span>
		</h3>
	</div>

	<div style="width: 100%;">
		<div style="margin-bottom: 10px; height: 40px;">
			<form name="dayForm" onchange="changeDays(this);" style="border: 1px solid #cccccc;
    height: 36px;
    border-radius: 3px;
    float: left;">
				<select name="days" class="boxTF" style="border-radius: 3px; width: 100%; height: 100%; border-left: 0;">
					<option value="all">전체</option>
					<option value="3">3일</option>
					<option value="5">5일</option>
					<option value="7">7일</option>
						
				</select>
			</form>
		
		
			<form name="searchForm" action="<%=cp%>/notice/list" method="post"
				style="border: 1px solid #cccccc; height: 36px; border-radius: 3px; float: right;">
				<select name="condition" class="boxTF"
					style="border-radius: 3px; width: 30%; height: 100%; border-left: 0;">
					<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
					<option value="writer"
						${condition=="writer"?"selected='selected'":""}>작성자</option>
					<option value="station"
						${condition=="station"?"selected='selected'":""}>경유 역</option>
					<option value="sDate"
						${condition=="sDate"?"selected='selected'":""}>시작 날짜</option>
						
				</select> <input type="text" name="keyword" value="${keyword}" class="boxTF"
					style="display: inline-block; height: 100%; width: 58%;"> <img
					src="<%=cp%>/resource/images/magnifying-glass.png" class=""
					onclick="searchList()"
					style="padding: 6px; cursor: pointer; opacity: 0.6; height: 100%; float: left; border-left: 1px solid #cccccc;">
			</form>
		</div>

		<div id="listPlan" style="width:100%; border-radius: 10px; text-align:center;
    background: #ffeccf40;
    padding: 10px 0;">
		
		</div>

	</div>
</div>


