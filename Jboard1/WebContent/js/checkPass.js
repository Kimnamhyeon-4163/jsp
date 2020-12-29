/**
 * 비밀번호 일치여부 확인
 */
 var isPassOk = false;
$(function(){
    		
	var inputPass1 = $('input[name=pass1]');
	var inputPass2 = $('input[name=pass2]');
	
	inputPass2.focusout(function(){
		
		var pw1 = inputPass1.val();
		var pw2 = inputPass2.val();
		
		if(pw1 == pw2){
			$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');
			isPassOk = false;
		}else{
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			isPassOk = true;
		}
	});
});