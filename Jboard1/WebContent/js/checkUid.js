/**
 * 아이디 중복체크
 */
 var isUidOk = false;
 
$(function(){
    		
	// 아이디 중복체크
	var inputUid = $('input[name=uid]');
	
	inputUid.focusout(function(){
		
		var uid = $(this).val();
		var jsonData = {'uid':uid};
		
		$.ajax({
			url: '/Jboard1/user/proc/checkUid.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				if(data.result == 1){    						
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
					isUidOk = false;
				}else{
					$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
					isUidOk = true;
				} 					
			}
		});
	});
});


