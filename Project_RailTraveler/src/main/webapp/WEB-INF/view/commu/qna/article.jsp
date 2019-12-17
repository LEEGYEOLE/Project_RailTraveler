<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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

	// http://www.libertypage.net/myblog/post/18/
</script>
<style type="text/css">
.tb-row span {
	display: inline-block;
	float: left;
	margin-right: 5px;
	color: #b2b2b2;
}

.tb-row {
	height: 35px;
}

#boardLikeCount {
	width: 41px;
	font-size: 13px;
	display: block;
	color: #888888;
	margin: 0 auto;
}

a#MOVE_TOP_BTN {
	padding: 7px 0;
	position: fixed;
	right: 3%;
	bottom: 100px;
	display: none;
	z-index: 999;
	width: 60px;
	height: 60px;
	border-radius: 50px;
	text-align: center;
	background: gray;
	color: white;
}

.modal-content ul {
	padding: 0;
	list-style: none;
}

.modal-content li {
	padding: 10px 5px;
	margin-bottom: 1px;
}

.modal-content a {
	color: black;
}

.modal-content a:hover {
	font-weight: bold;
	color: #0b0bf1;
}

.btnSendBoardLike:active, .btnSendBoardLike:hover {
	background: none;
}
</style>
<!-- Small modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		\
		<div class="modal-content"
			style="padding: 15px; background: #fffff5; border: 3px navy dotted;">
			<h3 style="font-weight: 900; border-bottom: 1px solid;">다운로드</h3>
			<ul>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
				<li style="padding: 5px;"><a href="#"><span><i
							class="far fa-arrow-alt-circle-down"></i>
							2019학년도_겨울계절학기_과목개설현황_및_수업시간표_20191111.pdf</span></a></li>
			</ul>
		</div>
	</div>
</div>

<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> 묻고 답하기</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<div style="padding-bottom: 10px;"></div>
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="45">
				<td width="300" align="left">
					<button type="button" class="btn btn-default"
						onclick="javascript:location.href='<%=cp%>/bbs/list?${query}';">
						목록 <span>></span> 맛집
					</button>
				</td>

				<td align="right"><c:if
						test="${sessionScope.member.userId==dto.userId}">
						<button type="button" class="btn btn-default"
							onclick="updateBoard();">수정</button>
					</c:if> <c:if
						test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
						<button type="button" class="btn btn-default"
							onclick="deleteBoard();">삭제</button>
					</c:if></td>
			</tr>
		</table>
		<table
			style="width: 100%; margin: 0px auto 0px; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #000; border-bottom: 2px solid #000;">
			<thead>
				<tr>
					<td colspan="3" style="padding-top: 15px;">
						<h3 style="margin: 10px 0 2px; font-size: 25px;">묻고답하기 게시물입니당 
						
						<span style="float: right;">
						
						<i class="fa fa-heart" style="width: 22px;"></i>&nbsp;5
						<i class="fas fa-comments"></i> 5
						
						</span> </h3>
					</td>
				</tr>

				<tr class="tb-row" style="height: 30px;">
					<td colspan="3" align="left"
						style="padding-left: 5px; font-size: 13px;"><span>이겨레</span><span>|</span><span>2019.
							12. 15. 20:47:43</span><span>|</span><span>조회 101회</span><span>|</span><span>댓글
							4</span></td>
				</tr>
				<tr>
					<td colspan="3" style="padding: 20px 5px;" valign="top"
						height="200">내용입니드아아아 내용입니드아아아 내용입니드아아아 내용입니드아아아 내용입니드아아아
						내용입니드아아아</td>
				</tr>

				<tr class="tb-row" style="border-bottom: 0;">
					<td colspan="3" height="40" align="center">
						<button type="button" class="btn btnSendBoardLike btn-default"
							title="좋아요"
							style="padding: 6px 8px; width: 60px; height: 60px; border-radius: 50%; margin-bottom: 5px;"
							onclick="clickLikeBtn();">
							<i id="boardLikeIcon" class="far fa-heart"
								style="font-size: 20px; display: block; margin: 0 auto; color: orangered;"></i><span
								id="boardLikeCount">${dto.boardLikeCount}0</span>
						</button>
					</td>
				</tr>
				<tr class="tb-row">
					<td colspan="3" align="left"
						style="padding-left: 5px; color: blue;"><a
						onclick="modalOn();" style="cursor: pointer;"> 첨부된 파일 (0)</a></td>
				</tr>
			</thead>
			<tbody>
				<tr height='30'>
					<td align='left' colspan="3"><span style='font-weight: bold;'>댓글
							(3)</span></td>
				</tr>
				<tr>
					<td style='padding: 5px 0px 15px;' colspan="3"><textarea
							class='boxTA'
							style='width: 89%; height: 50px; float: left; resize: none; overflow-y: scroll;'></textarea>
						<button type='button' class='btn btnSendReply btn-default'
							data-num='10'
							style='margin-left: 1%; width: 10%; height: 50px; padding: 10px 1px; float: left;'>등록</button>

					</td>
				</tr>
			</tbody>
			<tfoot>





				<tr height='35' style="border: 1px solid #cccccc;">
					<td width='80' style=''><span><b>작성자</b></span></td>
					<td>| 내용이 이렇게 적히는거죠??????????????????????????</td>
					<td width='250' style="text-align: right;"><span>2019-12-16
							18:03:22</span> | <span class="deleteReply" style="cursor: pointer;"
						data-replyNum='0' data-pageNo='0'>삭제</span> <span
						class="notifyReply">신고</span></td>
				</tr>
				<tr height='35' style="border: 1px solid #cccccc;">
					<td width='80' style=''><span>관리자</span></td>
					<td>| 자제좀요</td>
					<td width='250' style="text-align: right;"><span>2019-12-16
							18:03:22</span> | <span class="deleteReply" style="cursor: pointer;"
						data-replyNum='0' data-pageNo='0'>삭제</span> <span
						class="notifyReply">신고</span></td>
				</tr>
			</tfoot>
		</table>
<!-- List group -->
				<ul class="list-group" style="margin: 20px 0;
    box-shadow: none;">

					<li id="note-title" class="list-group-item note-title"
						style="background: beige;">
						<h3 class="panel-title" style="    float: left;">
							답글 <span id="note-count">2</span>
						</h3>
						<h3 class="panel-title" style="float: right;">
							<a href="#">최신순<a href="#"></a> | <a href="#">추천순</a>
						</h3>
						<div style="clear: both;"></div>
					</li>

					<li class="list-group-item note-item clearfix" id="note-1861368">
					<div style="padding: 5px 0 10px 10px;">
					<div style="
    color: red;
    font-size: 15px;
    text-shadow: 1px 1px yellow; float: left;">* 채택 된 답변입니다 *</div>
    <div style="float: right;"> <button type="button" class="btn btn-warning"
							onclick="updateBoard();" style="width: 115px;
    margin-bottom: 5px;"> 탑변으로 채택</button>
    
    
    </div><div style="clear: both;"></div>
    
    
					</div>
					 
							<div class="content-body panel-body pull-left" style="padding: 0 15px;">


								<div class="avatar avatar-medium clearfix ">
								<div style="height: 50px;
    float: left;
    width: 50px;"><i class="far fa-comment-dots" style="font-size: 35px;"></i></div>
									<div class="avatar-info">
									관리자
										<div class="date-created">
											<span class="timeago" title="2019-12-16 22:20:55.0">2019-12-16
												22:20:55</span>
										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-1861368"
										class="list-group-item-text note-text">

										<p>둘다 합격했다는 전제하에.......</p>
										<p>가고 싶은데 가세요. 근데 두군데 다 합격???</p>

									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center" style="width: 60px;">
								<div class="content-function-group">
									<button type="button" class="btn btn-default"
							onclick="clickReLikeBtn();" style="width: 60px;
    margin-bottom: 5px;"><i id="boardReLikeIcon" class="far fa-heart" style="font-size: 15px;
    margin: 0 auto; color: orangered;"></i>&nbsp;${dto.boardLikeCount}0</button>
    
    <button type="button" class="btn btn-default"
							onclick="updateBoard();" style="width: 60px;
    margin-bottom: 5px;">수정</button>
						<button type="button" class="btn btn-default"
							onclick="deleteBoard();" style="width: 60px;">삭제</button>
							
							
								</div>
							</div>
<table
			style="width: 100%; margin: 10px auto; border-spacing: 0px; border-collapse: collapse;">
			 
			<tbody>
				<tr height='30'>
					<td align='left' colspan="3"><span style='font-weight: bold;'>댓글
							(3)</span></td>
				</tr>
				<tr>
					<td style='padding: 5px 0px 15px;' colspan="3"><textarea
							class='boxTA'
							style='width: 89%; height: 50px; float: left; resize: none; overflow-y: scroll;'></textarea>
						<button type='button' class='btn btnSendReply btn-default'
							data-num='10'
							style='margin-left: 1%; width: 10%; height: 50px; padding: 10px 1px; float: left;'>등록</button>

					</td>
				</tr>
			</tbody>
			<tfoot>





				<tr height='35' style="border: 1px solid #cccccc;">
					<td width='80' style=''><span><b>관리자</b></span></td>
					<td>내용이 이렇게 적히는거죠??????????????????????????</td>
					<td width='250' style="text-align: right;"><span>2019-12-16
							18:03:22</span> | <span class="deleteReply" style="cursor: pointer;"
						data-replyNum='0' data-pageNo='0'>삭제</span> <span
						class="notifyReply">신고</span></td>
				</tr>
			</tfoot>
		</table>
					</li>



					<li class="list-group-item note-item clearfix" id="note-1861368">
							<div class="content-body panel-body pull-left" style="padding: 0 15px;">


								<div class="avatar avatar-medium clearfix ">
								<div style="height: 50px;
    float: left;
    width: 50px;"><i class="far fa-comment-dots" style="font-size: 35px;"></i></div>
									<div class="avatar-info">
										관리자
										<div class="date-created">
											<span class="timeago" title="2019-12-16 22:20:55.0">2019-12-16
												22:20:55</span>
										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-1861368"
										class="list-group-item-text note-text">

										<p>둘다 합격했다는 전제하에.......</p>
										<p>가고 싶은데 가세요. 근데 두군데 다 합격???</p>

									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center" style="width: 60px;">
								<div class="content-function-group">
									<button type="button" class="btn btn-default"
							onclick="clickReLikeBtn();" style="width: 60px;
    margin-bottom: 5px;"><i id="boardReLikeIcon" class="far fa-heart" style="font-size: 15px;
    margin: 0 auto; color: orangered;"></i>&nbsp;${dto.boardLikeCount}0</button>
    
    <button type="button" class="btn btn-default"
							onclick="updateBoard();" style="width: 60px;
    margin-bottom: 5px;">수정</button>
						<button type="button" class="btn btn-default"
							onclick="deleteBoard();" style="width: 60px;">삭제</button>
							
							
								</div>
							</div>
<table
			style="width: 100%; margin: 10px auto; border-spacing: 0px; border-collapse: collapse;">
			 
			<tbody>
				<tr height='30'>
					<td align='left' colspan="3"><span style='font-weight: bold;'>댓글
							(3)</span></td>
				</tr>
				<tr>
					<td style='padding: 5px 0px 15px;' colspan="3"><textarea
							class='boxTA'
							style='width: 89%; height: 50px; float: left; resize: none; overflow-y: scroll;'></textarea>
						<button type='button' class='btn btnSendReply btn-default'
							data-num='10'
							style='margin-left: 1%; width: 10%; height: 50px; padding: 10px 1px; float: left;'>등록</button>

					</td>
				</tr>
			</tbody>
			<tfoot>





				<tr height='35' style="border: 1px solid #cccccc;">
					<td width='80' style=''><span><b>관리자</b></span></td>
					<td>내용이 이렇게 적히는거죠??????????????????????????</td>
					<td width='250' style="text-align: right;"><span>2019-12-16
							18:03:22</span> | <span class="deleteReply" style="cursor: pointer;"
						data-replyNum='0' data-pageNo='0'>삭제</span> <span
						class="notifyReply">신고</span></td>
				</tr>
			</tfoot>
		</table>
					</li>



					<li class="list-group-item note-item clearfix" id="note-1861368">
							<div class="content-body panel-body pull-left" style="padding: 0 15px;">


								<div class="avatar avatar-medium clearfix ">
								<div style="height: 50px;
    float: left;
    width: 50px;"><i class="far fa-comment-dots" style="font-size: 35px;"></i></div>
									<div class="avatar-info">
									관리자
										<div class="date-created">
											<span class="timeago" title="2019-12-16 22:20:55.0">2019-12-16
												22:20:55</span>
										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-1861368"
										class="list-group-item-text note-text">

										<p>둘다 합격했다는 전제하에.......</p>
										<p>가고 싶은데 가세요. 근데 두군데 다 합격???</p>

									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center" style="width: 60px;">
								<div class="content-function-group">
									<button type="button" class="btn btn-default"
							onclick="clickReLikeBtn();" style="width: 60px;
    margin-bottom: 5px;"><i id="boardReLikeIcon" class="far fa-heart" style="font-size: 15px;
    margin: 0 auto; color: orangered;"></i>&nbsp;${dto.boardLikeCount}0</button>
    
    <button type="button" class="btn btn-default"
							onclick="updateBoard();" style="width: 60px;
    margin-bottom: 5px;">수정</button>
						<button type="button" class="btn btn-default"
							onclick="deleteBoard();" style="width: 60px;">삭제</button>
							
							
								</div>
							</div>
<table
			style="width: 100%; margin: 10px auto; border-spacing: 0px; border-collapse: collapse;">
			 
			<tbody>
				<tr height='30'>
					<td align='left' colspan="3"><span style='font-weight: bold;'>댓글
							(3)</span></td>
				</tr>
				<tr>
					<td style='padding: 5px 0px 15px;' colspan="3"><textarea
							class='boxTA'
							style='width: 89%; height: 50px; float: left; resize: none; overflow-y: scroll;'></textarea>
						<button type='button' class='btn btnSendReply btn-default'
							data-num='10'
							style='margin-left: 1%; width: 10%; height: 50px; padding: 10px 1px; float: left;'>등록</button>

					</td>
				</tr>
			</tbody>
			<tfoot>





				<tr height='35' style="border: 1px solid #cccccc;">
					<td width='80' style=''><span><b>관리자</b></span></td>
					<td>내용이 이렇게 적히는거죠??????????????????????????</td>
					<td width='250' style="text-align: right;"><span>2019-12-16
							18:03:22</span> | <span class="deleteReply" style="cursor: pointer;"
						data-replyNum='0' data-pageNo='0'>삭제</span> <span
						class="notifyReply">신고</span></td>
				</tr>
			</tfoot>
		</table>
					</li>






					<li class="list-group-item note-form clearfix">


						<div class="">
							<h5 class="" style="text-align: center;">
								<a href="/login/auth?redirectUrl=%2Farticle%2F661621"
									class="link">로그인</a>을 하시면 답글을 등록할 수 있습니다.
							</h5>
						</div>

					</li>
				</ul>
			
			
</div>
</div>
<script>
	Kakao.init('43fed4f22c437dfe99e213d8555c56e0');
	function sendLinkKakao() {
		Kakao.Link.sendDefault({
			objectType : 'feed',
			content : {
				title : '{{ post.title }}',
				description : '{{ post.content }}',
				imageUrl : '{{ post.content }}',
				link : {
					mobileWebUrl : '{{ request.build_absolute_uri }}',
					webUrl : '{{ request.build_absolute_uri }}'
				}
			},
			buttons : [ {
				title : '링크 열기',
				link : {
					mobileWebUrl : '{{ request.build_absolute_uri }}',
					webUrl : '{{ request.build_absolute_uri }}'
				}
			} ]
		});
	}
</script>