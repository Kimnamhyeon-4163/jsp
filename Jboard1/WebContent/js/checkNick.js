/**
 * 닉네임 중복여부 확인
 */
 var isNickOk = false;
$(function(){
    		
	// 닉네임 중복체크
	var inputNick = $('input[name=nick]');
	
	inputNick.focusout(function(){
		
		var nick = $(this).val();
		var jsonData = {'nick':nick};
		
		$.ajax({
			url: '/Jboard1/user/proc/checkNick.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				if(data.result == 1){    						
					$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
					isNickOk = false;
				}else{
					$('.resultNick').css('color', 'green').text('사용 가능한 닉네임 입니다.');
					isNickOk = true;
				} 					
			}
		});
	});
});