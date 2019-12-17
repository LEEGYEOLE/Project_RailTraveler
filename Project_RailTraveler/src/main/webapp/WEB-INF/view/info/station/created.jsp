<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript"
	src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function sendOk() {
    var f = document.sbbsForm;
	
    var str = f.staName.value;
    if(!str){
    	 alert("역이름을 입력하세요. ");
         f.staName.focus();
         return;
    }
    
	var str = f.majorLocationNum.value;
    if(!str) {
        alert("지역을 선택하세요. ");
        f.subject.focus();
        return;
    }

	str = f.staTel.value;
    if(!str) {
        alert("전화번호를 입력하세요.");
        f.content.focus();
        return;
    }
    
    str = f.staAddress.value;
    if(!str) {
        alert("주소를 입력하세요.");
        f.content.focus();
        return;
    }

	f.action="<%=cp%>/station/${mode}";

    f.submit();
}
    
</script>
<style type="text/css">
.tb-row {
	text-align: left;
	height: 50px;
	border-bottom: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
}

.tb-title {
	text-align: center;
	background: #f7f9ff;
}

.tb-content {
	text-align: left;
	padding: 5px 1% 5px 10px;
}

.tb-created {
	width: 100%;
	margin: 0px auto 5px;
	border-spacing: 0px;
	border-collapse: collapse;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

input[type=text], input[type=file] {
	width: 100%; border : 1px solid #ccc;
	border-radius: 2px;
	border: 1px solid #ccc;
}
</style>
<div class="body-content-container">
	<div class="page-three-title mt40">
		<h3 class="fs26">
			<span style="padding: 10px 0px; display: block;"> ${mode=='update'?'역 소개 - 수정':'역 소개 - 추가'}</span>
		</h3>
	</div>

	<div id="sir_lbo" class="sir_lbo"
		style="padding: 0; margin: 0; font-size: 1.025em;">
		<form name="boardForm" method="post" enctype="multipart/form-data"
			onsubmit="return submitContents(this);">
			<table style="width: 100%; margin: 20px auto 5px; border-spacing: 0px;">
				<tr>
					<td style="text-align: right;"><button type="reset" class="btn btn-default"  style="
    padding: 6px 6px;
    border-radius: 5px;" onclick="resetContent(this);"><img alt="" src="<%=cp%>/resource/images/resetIcon1.png" style="width: 20px;"> </button>
					</td></tr></table>
					
			<table class="tb-created">
				<tr class="tb-row">
					<td width="100" class="tb-title">역&nbsp;&nbsp;이름</td>
					<td class="tb-content"><input type="text" name="staName"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.staName}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">지역&nbsp;&nbsp;이름</td>
					<td class="tb-content">
						<select name="majorLocationNum">
						<option class="boxTF" value="">:: 지역 선택 ::</option>
						<c:forEach var="vo" items="${groupCategory}">
							<option class="boxTF" value="${vo.categoryNum}" ${vo.categoryNum==dto.groupCategoryNum? "selected='selected'":""}>${vo.category}</option>
						</c:forEach>
						<option class="boxTF" value="${vo.categoryNum}" ${vo.categoryNum==dto.groupCategoryNum? "selected='selected'":""}>수도권</option>
						</select>
					</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">전화번호</td>
					<td class="tb-content"><input type="text" name="staTel"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.staTel}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">주&nbsp;&nbsp;&nbsp;&nbsp;소</td>
					<td class="tb-content"><input type="text" name="staAddress"
						maxlength="100" class="boxTF" style="padding: 5px 5px;"
						value="${dto.staTel}"></td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title" style="padding-top: 5px;"
						valign="top">혜&nbsp;&nbsp;&nbsp;&nbsp;택</td>
					<td valign="top" style="padding: 5px 1% 5px 10px;">
						<textarea name="content" rows="12" class="boxTA" style="width:100%;">${dto.content}</textarea>
					</td>
				</tr>
				<tr class="tb-row">
					<td width="100" class="tb-title">역사진&nbsp;&nbsp;첨부</td>
					<td class="tb-content"><input type="file" name="upload"
						class="boxTF" size="53"></td>
				</tr>

				<c:if test="${mode=='update' }">
					<tr class="tb-row">
						<td width="100" class="tb-title">첨부된파일</td>
						<td class="tb-content"><c:if
								test="${not empty dto.saveFilename}">
								<a href="<%=cp%>/bbs/deleteFile?num=${dto.num}&page=${page}"><i
									class="far fa-trash-alt"></i></a>
							</c:if> ${dto.originalFilename}</td>
					</tr>
				</c:if>	
			

			</table>
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;    text-align: center;">
				<tr>
					<td>
					<button type="button" class="btn btn-default" style="padding: 6px 20px;"
							onclick="javascript:location.href='<%=cp%>/station/info';">${mode=='update'?'수정취소':'등록취소'}</button>
						
						<button type="submit" class="btn btn-danger" style="margin-left: 5px;"><img alt="" src="<%=cp%>/resource/images/check-mark.png" style="width: 15px;"> ${mode=='update'?'수정완료':'작성완료'}</button>
						
						<c:if test="${mode =='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="page" value="${page}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>