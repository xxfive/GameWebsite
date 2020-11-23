var exp=/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/  //전화번호 양식 3/4/4
$(document).ready(function(){
	$("#send").click(function(){
		//아이디
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		
		//이름
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		
		//비번
		if($("#pwd").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}
		
		//비번확인
		if($("#pwd").val()!=$("#pwdck").val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#pwdck").focus();
			return false;
		}
		
		//이메일
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		
		//전화번호
		if(!$("#phone").val().match(exp)){ //위에 전화번호 양식에 안맞으면
			alert("전화번호를 입력하세요");
			$("#phone").focus();
			return false;
		}
		
		$("#frm").submit();
	}); //send
	
	
	
		//아이디 중복확인
	$("#idCheckBtn").click(function(){
		window.open("idCheck","","witdh=500 height=300")
	
	}); //idCheckBtn
	
	//id중복확인버튼 중복확인
	$("#useBtn").click(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		$.ajax({
			type:"post",
			url:"idCheck",
			data:{"userid":$("#userid").val()},
			success:function(val){
				if(val.trim()=="yes"){
					alert("사용가능");
					$(opener.document).find("#userid").val($("#userid").val());
					$(opener.document).find("#uid").val($("#userid").val());
					self.close();
				}else if(val.trim()=="no"){
					alert("사용불가능");
					$("#userid").val("");
				}
			},
			error:function(e){
				alert("error:"+e)
			}
			
		}); //ajax
		
	}); //useBtn
	
	
}) //document

function del(userid){
	if(confirm("정말 삭제할까요?")){
		$.getJSON("userDelete?userid="+userid,function(data){
			var htmlStr="";
			$.each(data.root,function(key,val){
				htmlStr+="<tr>";
				htmlStr+="<td>"+val.name+"</td>";
				htmlStr+="<td>"+val.userid+"</td>";
				htmlStr+="<td>"+val.phone+"</td>";
				htmlStr+="<td>"+val.email+"</td>";
				htmlStr+="<td>"+val.mode+"</td>";
				
			})
			$("table tbody").html(htmlStr);
			$("#cntSpan").text(data.rootCount.count);
		})
		
		
	}
}

