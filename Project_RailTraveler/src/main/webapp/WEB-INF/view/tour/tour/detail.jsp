<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
	String nowUrl =request.getRequestURL().toString();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/flickity.min.css">
<script src="<%=cp%>/resource/js/flickity.pkgd.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!--지도 정보를 가져오는 API 스크립트-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=134ec7b5b1389d0316b7c1bed3033f48"></script>
<script type="text/javascript">
	function sendLinkFacebook() {
		var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u={{ request.build_absolute_uri }}";
		window.open(facebook_share_url, 'Share on Facebook',
				'scrollbars=no, width=500, height=500');
	}
	function sendLinkTwitter() {
		var twitter_share_text = "{{ post.title }}";
		var twitter_share_url = "{{ request.build_absolute_uri }}";
		window.open("https://twitter.com/share?text=" + twitter_share_text
				+ "&url=" + twitter_share_url, 'Share on Twitter',
				'scrollbars=no, width=500, height=500');
	}
	function sendLinkNaver() {
		var raw_url = "{{ request.build_absolute_uri }}";
		var raw_title = "{{ post.title }}"
		var naver_root_url = "http://share.naver.com/web/shareView.nhn?url="
		var naver_share_url = naver_root_url + encodeURI(raw_url) + "&title="
				+ encodeURI(raw_title);
		window.open(naver_share_url, 'Share on Naver',
				'scrollbars=no, width=500, height=500');
	}
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});

		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
	function modalOn() {
		$('#myModal').modal('toggle');
	}
	function clickLikeBtn() {
		var cs = document.getElementById("boardLikeIcon");
		if (cs.className == 'far fa-heart') {
			cs.className = 'fas fa-heart';
		} else {
			cs.className = 'far fa-heart';
		}
	}
	function clickReLikeBtn() {
		var cs = document.getElementById("boardReLikeIcon");
		if (cs.className == 'far fa-heart') {
			cs.className = 'fas fa-heart';
		} else {
			cs.className = 'far fa-heart';
		}
	}
	
	function snsShare() {
// 		$('#cocoaModal').css("display","block");
	}

	// http://www.libertypage.net/myblog/post/18/
</script>



<!--스크롤 슬라이드 스크립트-->
<script>

function fnMove(seq){
    var offset = $("#div" + seq).offset();
    offset.top = offset.top -100;
    console.log(offset);
    
    $('html, body').animate({scrollTop : offset.top}, 400);
}


</script>

<script type="text/javascript">
function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
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





//페이징 처리
$(function(){
	listPage(1);	
});

function listPage(page) {
	var url="<%=cp%>/tour2/listReply";
	var query="tourNum=${vo.tourNum}&pageNo="+page;
	var selector = "#listReply";
	
	ajaxHTML(url, "get", query, selector);
	
}

//댓글 등록
$(function(){
	$(".btnSendReply").click(function(){
		
		var userId = "${sessionScope.member.userId}";

		  if ( userId == "") {
			$("#modaltext").text("댓글 작성을 위해서 로그인이 필요합니다");			
			$("#commonModal").modal();
				return;

		  }
		  
		  
		var tourNum="${vo.tourNum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="<%=cp%>/tour2/insertReply";
		var query="tourNum="+tourNum+"&content="+content+"&answer=0";
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			} 
			

		};
		
		ajaxJSON(url, "post", query, fn);
	});
});

//리플달기 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var $trReplyAnswer = $(this).closest("tr").next();
		
		var isVisible = $trReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
		
		var $element = $(this).closest("tr")
		
		
		if(isVisible) {
			$trReplyAnswer.hide();
			$element.css("border-bottom","1px solid #c4c4c4");
		} else {
			$element.css("border-bottom","0px solid #c4c4c4");
			$trReplyAnswer.show();
            

			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum); 
			
			
		}
	});
	
});

//댓글에 리플 달기 (실제 추가)
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		
		var userId = "${sessionScope.member.userId}";
		
		if(userId==""){
			$("#modaltext").text("로그인이 필요한 기능입니다.");			
			$("#commonModal").modal();
			return;
		}
		
		var tourNum="${vo.tourNum}";
		var replyNum = $(this).attr("data-replyNum");
		var $td = $(this).closest("td");
		var content=$td.find("textarea").val().trim();
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="<%=cp%>/tour2/insertReply";
		var query="tourNum="+tourNum+"&content="+content+"&answer="+replyNum;
		
		var fn = function(data){
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state=="true") {
				
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum); 
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

//리플 리스트 출력
 function listReplyAnswer(replyNum) {
	
	var url ="<%=cp%>/tour2/listReplyAnswer";
	var query ="answer="+replyNum;
	var selector = "#listReplyAnswer"+replyNum;
	
	ajaxHTML(url, "get", query, selector);	
} 

//리플 갯수
function countReplyAnswer(replyNum) {
	var url ="<%=cp%>/tour2/replyCount";
	var query ="answer="+replyNum;
	var fn= function(data) {
		var count=data.count;
 		var vid="#answerCount"+replyNum;
		$(vid).html(count); 
	}
	
	ajaxJSON(url, "post", query, fn);
}


//댓글별 리플 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("리플을 삭제하시겠습니까 ? "))
		    return;
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="<%=cp%>/tour2/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			if(! data.state) console.log("삭제 실패!!!")
			listReplyAnswer(answer);
			countReplyAnswer(answer);
			
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});


//댓글 삭제 
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("댓글을 삭제하시겠습니까 ? 삭제하시면 해당 댓글의 리플까지 모두 다 삭제됩니다. "))
		    return;
		
		var replyNum=$(this).attr("data-replyNum");
		var page = $(this).attr("data-page");		
		var url="<%=cp%>/tour2/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			if(! data.state) console.log("삭제 실패!!!")
			listPage(page);
			
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});


//좋아요 관리하는 에이작스
function replyLike(ob){
	
	var userId = "${sessionScope.member.userId}";

	  if ( userId == "") {

			$("#modaltext").text("댓글 좋아요는 로그인한 회원에게만 제공됩니다.");			
			$("#commonModal").modal();
			
		return;
	  }
	
	var replyNum = $(ob).attr('data-replyNum');
	
	var url = "<%=cp%>/tour2/replyLike";
	var query = "replyNum="+replyNum;
	var fn = function(data){
		console.log(data.checkreplyLike);
			if(data.checkreplyLike==0){
				ob.className = "fas fa-heart"; 
			}
			else if (data.checkreplyLike==1){
				ob.className = "far fa-heart";
			}

	}; 
	
	ajaxJSON(url, "get", query, fn);

};

//취소 버튼 눌렀을 시 '기타' 지우기
$(function(){
	$('.cancelsingo').click(function(){
		var f = document.singoForm;		
		$('#etcText').val("");		
		//f.etcText.value="";		
	});
});

//"신고" 버튼 눌렀을 시 
function replySingo(replyNum) {
	var userId = "${sessionScope.member.userId}";
	  
	if ( userId == "") {
			$("#modaltext").text("로그인이 필요한 기능입니다.");			
			$("#commonModal").modal();
				return;
		  }
	
	var url = "<%=cp%>/singo/readreply";
	var query = "targetNo="+replyNum;
	var fn = function(data){
		var targetUserId  = data.dto.targetUserId;
		var targetContent = data.dto.targetContent;

		$('#targetUserId').text(targetUserId);
		$('#targetContent').text(targetContent);		
		$('#singoreplyNum').val(replyNum);

		$("#singo").modal(); 

	}; 
	
	ajaxJSON(url, "get", query, fn);
	
		
}

//모달창 내부에서 신고하기 버튼 눌렀을 때
function singosubmit() {		
	var targetNo = $('#singoreplyNum').val();
	var content = $('#singoreason').val();
	var f = document.singoForm;
	
	if (content == 'etc'){		
		 content = f.etcText.value;		 
	}
	
	f.etcText.value="";

	var targetUrl =	"${targetUrl}";
	var url = "<%=cp%>/singo/insertSingo";
	var query = {'targetNo':targetNo , 'content':content , 'targetUrl':targetUrl};
	var fn = function(data){
		
		
			if(data.state=="true"){
				alert("신고 접수 성공");
				$("#singo").modal('hide');
			}else{
				alert("신고 접수 실패");
			}

	}; 
	
	ajaxJSON(url, "get", query, fn);
	


}
$(function() {
	$('#replytextarea').click(function(){
		<c:if test="${empty sessionScope.member.userId}">
				location.href="<%=cp%>/member/login";
		</c:if>
	});
});

</script>

<style type="text/css">
.box1 {
	margin: 0 auto
}

.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
.img {width:325px; height:280px; overflow:hidden }  

.nonscroll::-webkit-scrollbar { 

    display: none; 

}


/* SNS 공유하기 모달 */
.modal_post_social .modal-content {
    padding: 8px 0;
}
.text-basic, .text-basic a {
    color: #212121;
}

.modal_post_social .social-btn {
    overflow: hidden;
}
.social-btn ul {
    list-style: outside none none;
    padding: 0;
}
.modal_post_social li:first-child, .modal_post_social li:nth-child(5) {
    margin-left: 5px;
}
.modal_post_social li {
    float: left;
    width: 68px;
    margin-top: 10px;
}
.modal_post_social li a {
    text-align: center;
    padding: 0;
    font-size: 12px;
    line-height: 1;
    display: block;
    width: 68px;
    height: 80px;
    background: url(//vendor-cdn.imweb.me/images/site/social_icon3.png?487487) no-repeat;
    background-size: 56px;
    padding-top: 63px;
}
.modal_post_social li.kakao a {
    background-position: 7px 0;
}
.modal_post_social li.story a {
    background-position: 7px -325px;
    letter-spacing: -1px;
}

.modal_post_social li.line a {
    background-position: 7px -81px;
}
.modal_post_social li.band a {
    background-position: 7px -406px;
}
.modal_post_social li.naver a {
    background-position: 7px -648px;
}
.modal_post_social li.face a {
    background-position: 7px -163px;
}
.modal_post_social li.twitter a {
    background-position: 7px -244px;
}
.modal_post_social li.googleplus a {
    background-position: 7px -568px;
}
.modal_post_social .url-copy {
    clear: both;
    padding: 0 8px;
    margin-top: 20px;
}
.holder {
    position: relative;
}
.modal_post_social .url-copy .form-control {
    border: 1px solid rgba(155, 155, 155, 0.4);
    box-shadow: none;
    color: #212121;
    /* padding-right: 65px; */
}
.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    background-color: #eee;
    opacity: 1;
}
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.modal_post_social .url-copy button {
    border-radius: 0;
    color: #000;
    border: 1px solid rgba(155, 155, 155, 0.4);
    font-size: 13px;
    padding: 7px 16px;
    height: 34px;
    position: absolute;
    right: 8px;
    top: 0;
    background: #fff;
    letter-spacing: 0;
}

.text-center {
    text-align: center;
}

</style>


<div class="body-content-container">
	<div style="width:600px; margin: 10px auto;">
		<img  style="height: 300px; width: 600px; border: 5px solid #c4c4c4" src="${vo.imagefilename}"/>
	</div>


	<div class="box1" style="width: 90%; border: 2px solid #eeeeee">
			
		<!--상단 메뉴-->
				
		<div class="box1" style="margin-top: 20px">

			<div class="box1"
				style="width: 93%; border: 1px solid #eeeeee; margin-top:10px; " >
				<h3 align="center">${vo.name}</h3>
				<h6 align="center">${vo.detailcateName}</h6>
						
				<div class="row" style="width: 340px; margin: 10px auto;">
					<div class="col" style="font-size: 18px; font-weight: 600;">
						<ul class="nav nav-tabs">
							<li class="nav-item "><a class="nav-link active"
								href="https://map.kakao.com/?eName=${vo.name}"><i class="fas fa-map-marker-alt"></i>
									길찾기</a></li>

							<li class="nav-item "><a class="nav-link active"
								onclick="roadmap();" style="cursor: pointer;"><i class="fas fa-map-marker-alt"></i>
									로드뷰</a></li>

							<li class="nav-item "><a class="nav-link active"
								onclick="sharebox();"><i class="fas fa-map-marker-alt"></i>
									공유하기</a></li>


						</ul>
					</div>
				</div>



			</div>

		</div>

		<!--장소 설명-->
		<div class="box1" style="margin-top: 20px;">
			<div class="box1"
				style="width: 93%; border: 1px solid #eeeeee; align-content: center">

				<div class="col"
					style="font-size: 18px; font-weight: 600; margin-top: 10px; margin-left: 10px">
					<p>
						<i class="fas fa-phone"></i> ${vo.tel}
					</p>
					<p>
						<i class="fas fa-map-marker-alt"></i>  ${vo.address}
					</p>
					<p>
						<i class="fas fa-home"></i> ${vo.content}
					</p>
				</div>
			</div>

		</div>

		<!--리뷰창-->
		<div class="container"
			style="margin-top: 40px; border-top: 2px solid black; width: 93%">
			<div class="row" style="width: 100%; margin: 10px auto;">
				<div class="col" style="font-size: 18px; font-weight: 600;">
					<ul class="nav nav-tabs">
						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="1st" onclick="fnMove('1');" >주요 정보</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="2st" onclick="fnMove('2');">후기/리뷰</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="3st" onclick="fnMove('3');">자유게시판</a></li>

						<li class="nav-item " style="width: 130px; margin: 0 auto;"><a
							style="text-align: center" class="nav-link active"
							id="4st" onclick="fnMove('4');">사진 요약</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		
		

		<!--찾아가는 길 설명-->
		<div id="div1" class="container" style="margin-top: 10px; margin-bottom: 50px; border-bottom: 2px solid #eeeeee; width: 93%">


			<div  class="row" style="width: 100%; ">
				<p style="font-size: 25px; font-weight: 700">"${vo.name}" 교통정보</p>
			</div>
			<div id="map" style="width:100%;height:350px;margin-bottom: 50px;"></div>
		</div>

		<!--후기 리뷰창 설명-->
		<div id="div2" class="container"
			style="margin-top: 10px; margin-bottom: 50px; border-bottom: 2px solid #eeeeee; width: 93%">
			<div class="row" style="width: 100%; margin-bottom: 5px; ">
				<p style="font-size: 25px; font-weight: 700"><b style="color: green;border: 2px solid green; padding: 1px 4px;">N</b><b style="color: green">네이버</b>&nbsp;&nbsp;후기/리뷰</p>
			</div>
			<div style="margin-bottom: 50px;">
				
				
			<c:forEach var="list" items="${bloglist}">

			<div class="box1" style="width: 100%; padding:10px 10px; margin-bottom:20px;
			border: 1px solid #eeeeee; align-content: center">

				<div class="col"
					style="font-size: 18px; font-weight: 600; margin-top: 10px; margin-left: 10px">
					
						<span style="text-align: left; font-size: 20px ">${list.blogSubject}</span>
						&nbsp;
						<span style="text-align: right; font-size: 14px" >${list.created}</span>
					
					<h6 style="font-weight: 500">
						${list.blogContent}
					</h6>
					
					<span style="font-size: 17px;font-weight: 700">${list.blogName} </span>
					<span style="font-size: 15px">/ <a href="${list.blogUrl}" target="_blank">블로그로 가기</a></span> 
					
				</div>
			</div>

			</c:forEach>
			
				
				
			</div>
		</div>





		<div id="div3" class="container" style="margin-top: 10px; border-bottom: 2px solid #eeeeee; width: 93%">
		
			<div class="row" style="width: 100%;  margin-bottom: 5px;">
				<p style="font-size: 25px; font-weight: 700">자유게시판</p>
			</div>
			

				<div id="listReply"></div>
			
			
			<table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; margin-top: 20px; margin-bottom: 50px;'>
					<tr height='30'>
						<td align='left'><span style='font-weight: bold;'>댓글을 달아보세요!</span></td>
					</tr>
					<tr>
						<td style='padding: 5px 5px 0px;'><textarea ${empty sessionScope.member.userId?'placeholder="로그인이 필요한 서비스 입니다.&#13;&#10;클릭시 로그인 창으로 이동합니다."':'placeholder="모두가 함께 만들어 가는 깨끗한 공간입니다. &#13;&#10;훈훈한 댓글 부탁드립니다^^"' }id="replytextarea" class='boxTA'
								style='width: 100%; height: 70px;'></textarea></td>
					</tr>
					<tr>
						<td align='right'>
							<button type='button' class='btn btnSendReply' data-num='10' style='padding: 10px 20px;'>댓글 등록</button>
						</td>
					</tr>
				</table>
		</div>
		
				<!--후기 리뷰창 설명-->
		<div id="div4" class="container" style="margin-top: 50px; margin-bottom:50px;  width: 93%">
			<div class="row" style="width: 100%; margin-top: 5px; ">
				<p style="font-size: 25px; font-weight: 700">사진 요약</p>
			</div>
			
	
			<div class="box1 img nonscroll" style="width: 96%; height:400px; overflow-y: scroll; padding:10px 10px;border: 1px solid #eeeeee; align-content: center">
			<c:forEach var="ivo" items="${imagelist}" >
				<div class="scale" style="float:left;  width: 160px; height: 160px;" >
				<a href="${ivo.imgUrl}" target="_blank"><img class="img" style="border-radius:25px; width: 160px; height: 160px; padding: 10px 10px;" alt="" src="${ivo.imgUrl}"></a>			
				</div>
			</c:forEach>		
			</div>

		</div>

	</div>
</div>

<!--Modal: 로드맵모달-->
<div class="modal fade  bd-example-modal-sm" id="roadMapModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document" style="width: 600px; height: 350px;">
    <!--Content-->
    <div class="modal-content text-center">

      <!--Body-->
      <div class="modal-body"  id="roadview" style="width:100%;height:300px;padding: 5px 5px; ">

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center" style="margin-top: 5px;">
       
        <a type="button" class="btn  btn-info waves-effect" data-dismiss="modal">닫기</a>
      </div>
    </div>
  </div>
</div>
<!--Modal: 로드맵모달-->

<!--Modal: 공통 모달-->
<div class="modal fade  bd-example-modal-sm" id="commonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document" style="width: 490px;">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading" style="font-size:25px;font-weight: 700">Rail Traveler</p>
      </div>

      <!--Body-->
      <div class="modal-body" style="padding: 5px 5px;">
        <i class="fas fa-bell fa-3x animated rotateIn mb-3"></i>

        <p id="modaltext" style="font-size: 17px; font-weight:500; margin-top: 10px;"></p>

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center" style="margin-top: 5px;">
       	<a href="<%=cp%>/member/login" type="button" class="btn  btn-info " >로그인</a>
        <a type="button" class="btn  btn-info waves-effect" data-dismiss="modal">닫기</a>
        
      </div>
    </div>
  </div>
</div>
<!--Modal: modalPush-->




<!--Modal: 공유기능 모달-->
<div class="modal fade in modal_post_social" id="shareModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-backdrop="true" data-keyboard="true">
  <div class="modal-dialog cascading-modal" role="document">


      <!--Body-->
		<ul style="list-style: none; margin-top: 70px;">
		<li></li>
		<li></li>
		<li></li>
		<li role="" class="kakao"><a href="javascript:;" onclick="shareKakaotalk();">카카오톡</a></li>
	<!-- 	<li role="" class="story"><a href="javascript:;" onclick="kakaoStory();">카카오스토리</a></li> -->
		<li role="" class="naver"><a href="javascript:;" onclick="share();">네이버</a></li>
		<li role="" class="band"><a href="javascript:;" onclick="shareNaverBand();">밴드</a></li>
<!-- 	<li role="" class="face"><a href="javascript:;" onclick="SNS.setSnsApi('facebook')">페이스북</a></li>
		<li role="" class="twitter"><a href="javascript:;" onclick="SNS.setSnsApi('twitter')">트위터</a></li>
		<li role="" class="googleplus"><a href="javascript:;" onclick="SNS.setSnsApi('googleplus')">Google+</a></li> -->
		</ul>
		 </div>
</div>


    <!--/.Content-->



<!--Modal: 공유기능 모달-->



<script type="text/javascript">


//신고 모달을 관리하는 스크립트
$(function() {
	
	//첫번째 더보기 클릭시 보이기/숨기기
	$('#adverClick').click(function(){
		if($("#adverInfo").css("display") == "none"){   
	        $('#adverInfo').css("display", "block");   
	    } else {  
	        $('#adverInfo').css("display", "none");   
	    } 
	});
	
	//두번째 더보기 클릭시 보이기/숨기기
	$('#19ageClick').click(function(){
		if($("#19ageInfo").css("display") == "none"){   
	        $('#19ageInfo').css("display", "block");   
	    } else {  
	        $('#19ageInfo').css("display", "none");   
	    } 
	});
	
	//라디오 박스 중 기타를 선택했을 시
	$("input:radio[id=etc]").click(function(){		
		if($("#etcTextarea").css("display") == "none"){   
	        $('#etcTextarea').css("display", "block");   
	    } else {  
	        $('#etcTextarea').css("display", "none");   
	    } 
		
	});
	
	//기타를 선택하지 않은 나머지를 선택했을시
	$("input:radio[class=notEtc]").click(function(){		
		 $('#etcTextarea').css("display", "none");  		
	});
	
	//content 값 보내기	
	$("input:radio[name=chk_info]").click(function(){		
		var val = $(this).val();
		var content;
		
		if(val != 'etc'){
			content =$(this).val();	
			$('#singoreason').val(content);
		}else{
			$('#singoreason').val('etc');
		}
		
	});
	
	
	
	
})

	 


</script>



<!--Modal: 신고 모달-->
<form name="singoForm" method="post" action="">
<div class="modal fade  bd-example-modal-sm" id="singo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document" style="width: 560px;">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <input type="hidden"  id="singoreplyNum" value="">
      <input type="hidden" id="singoreason" value="etc" >

      <div class="modal-header d-flex justify-content-center" style="background-color: #d3d3d3; padding: 9px 0px 9px 15px; border-bottom:1px solid #c4c4c4 ">
        <p style="font-size:22px; text-align:left;font-weight: 700;margin: 0px 0px;">신고하기</p>
      </div>

      <!--Body-->
      <div class="modal-body" style="padding: 12px 15px 0px; text-align: left; font-weight:700;">
		<div style=" border-bottom:1px solid #c4c4c4">
		<p>제&nbsp;&nbsp;&nbsp;목 :&nbsp;&nbsp;<span id="targetContent" style="font-weight: 500">얄라리얄라 얄라숑</span> </p>
		<p>작성자 :&nbsp;&nbsp;<span id="targetUserId" style="font-weight: 500">yoonsik09(김**)</span></p>
        </div>
        
        <div style="margin: 10px 0px;">
        	<table style="width: 100%; ">
        		<tr>
        			<td width="17%" valign="top">
        			<p>신고사유:&nbsp;&nbsp;</p>
        			</td>
        			<td width="83%" valign="top">
        			<span style="font-size: 14px; color: #949494;font-weight: 500">여러 사유에 해당하는 경우 대표 사례 하나만 선택해주세요</span>
        			</td>
        		</tr>
        		
        		<tr>
        		<td width="17%"></td>
        		<td width="83%">
        		    <P style="font-weight: 500"><input class="notEtc" type="radio" name="chk_info" value="부적절한 홍보 게시물" >부적절한 홍보 게시물<a id="adverClick" style="font-size:12px;color: #949494; cursor: pointer;">&nbsp;| 더보기</a></P> 
        		    <div id="adverInfo" style="display: none ">
        		   	 <ul style="font-size: 13px; color: #a9a9a9;font-weight: 500 ;margin: 10px 0px ; padding: 0px 0px 0px 20px; ">
      						<li>불법 사행성, 도박사이트를 홍보하는 경우</li>
      						<li>개인정보, 이미테이션, 성인의약품, 마약, 대포폰 등 불법 제품 및 정보를 홍보, 판매하는 경우</li>
      						<li>성매매, 장기매매 등의 신체 관련 거래 정보</li>
    				 </ul>
        		    </div>
					<P style="font-weight: 500"><input class="notEtc" type="radio" name="chk_info" value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용<a id="19ageClick" style="font-size:12px;color: #949494; cursor: pointer;">&nbsp;| 더보기</a></P>
					<div id="19ageInfo" style="display: none ">
       		   	 		<ul style="font-size: 13px; color: #a9a9a9;font-weight: 500;margin: 10px 0px ; padding: 0px 0px 0px 20px;">
      						<li>음란물 또는 음란한 행위(노골적인 성행위 장면)를 묘사하는 이미지/동영상</li>
      						<li>살해/상해/폭력 등 잔인한 장면을 묘사하는 이미지/동영상</li>
      						<li>중고 속옷 판매, 가출 유도 등의 청소년 유해 정보 공유</li>
    				 	</ul>
        		    </div>
					<P style="font-weight: 500"><input class="notEtc" type="radio" name="chk_info" value="명예훼손/사생활 침해 및 저작권침해 등">명예훼손/사생활 침해 및 저작권침해 등</P>
					<P style="font-weight: 500"><input type="radio" name="chk_info" id="etc" value="etc">기타</P>
					
					<div id="etcTextarea" style="display: none">
						<textarea id="etcText" style="height:100px; width: 100%" placeholder="해당 신고는 Rail_Traveler 운영자에게 전달됩니다."></textarea>
					</div>					
        		</td>

        		</tr>
        	</table>
      	</div>
      	
      	<div class="modal-footer flex-center" style="margin-top:5px; border-top:1px solid #c4c4c4" align="center">
      	    <a onclick="singosubmit();" type="button" class="btn btn-info " >신고하기</a>
        	<a type="button" class="btn  btn-info waves-effect cancelsingo" data-dismiss="modal">취소</a>
      	
      	</div>
        
        </div>


    </div>
  </div>
</div>
</form>
<!--Modal: 신고모달-->


<!--지도 API 스크립트!!!-->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.longitude}, ${vo.latitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

var iwContent = '<div><a href="https://map.kakao.com/link/map/${vo.name},${vo.longitude},${vo.latitude}" style="color:blue; text-align:right; target="_blank">큰지도보기</a> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(${vo.longitude}, ${vo.latitude}); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);  

</script>
<script type="text/javascript">
$(function() {
	var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

	var position = new kakao.maps.LatLng(${vo.longitude}, ${vo.latitude});

	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
	   
	
	  
	});
}
);



function roadmap() {
    //특정 css를 지우면 화면 전체로 만들 수 있어서 수정해 주었습니다.
	  var element = document.getElementById("daum:roadview:1");	    
	  element.style.removeProperty("position");
	  //모달창 띄우기
    $("#roadMapModal").modal();
};

function sharebox() {
	var userId = "${sessionScope.member.userId}";
	
	  if ( userId == "") {
			$("#modaltext").text("공유하기 전에 로그인 먼저 해주세요~");			
			$("#commonModal").modal();
				return;
		  }
	  else{
		  $("#shareModal").modal();
	 	 }
	
}
</script>







<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
    function shareKakaotalk() {
        Kakao.init("134ec7b5b1389d0316b7c1bed3033f48");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"${vo.name}"   // 콘텐츠의 타이틀
                , description:"${vo.address}"   // 콘텐츠 상세설명
                , imageUrl:"${vo.imagefilename}"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:"<%=nowUrl%>"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"<%=nowUrl%>" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
                  likeCount:0       // LIKE 개수
                , commentCount:0    // 댓글 개수
                , sharedCount:0     // 공유 회수
            }
            , buttons : [
                {
                      title:"게시글 확인"    // 버튼 제목
                    , link : {
                        mobileWebUrl:"${targetUrl}"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"${targetUrl}" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    };
    
    function sendLinkFacebook(){
        var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u={<%=nowUrl%>}";
        window.open(facebook_share_url,
                    'Share on Facebook',
                    'scrollbars=no, width=500, height=500');
    } 
</script>


<script> 

	
function shareNaverBlog(url, title) {

	var link = StringTool.format( 'https://share.naver.com/web/shareView.nhn?url={0}&title={1}', url, title );
	window.open( link, 'share', 'width=500, height=500' ); 
}


function share() {
	var targetUrl ="${targetUrl}";
	var url = targetUrl.replace('http://localhost', 'http://211.238.142.60');
   	
		url = encodeURI(encodeURIComponent(url));
    
    var title = encodeURI("${vo.name}");
    var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
    
    window.open( shareURL, 'share', 'width=500, height=500' );

  }

	
function shareNaverBand() { 

	
	var targetUrl ="${targetUrl}";
	var url = targetUrl.replace('http://localhost', 'http://211.238.142.60');
   	
	url = encodeURI(encodeURIComponent(url));
    
    var title = encodeURI("${vo.name}");
    var shareURL = "http://band.us/plugin/share?url=" + url + "&title=" + title;
    
    window.open( shareURL, 'share', 'width=500, height=500' );
	
	}


function format() { 
	var args = Array.prototype.slice.call (arguments, 1);
	return arguments[0].replace (/\{(\d+)\}/g, 
			function (match, index){ return args[index];
			});
	}

</script>




