$(function() {

	//注册模块
	var error_name = false;
	var error_password = false;
	var error_check_password = false;
	var error_email = false;
	var error_check = false;

	$('#user_name').blur(function() {
		check_user_name();
	});

	$('#pwd').blur(function() {
		check_pwd();
	});

	$('#cpwd').blur(function() {
		check_cpwd();
	});

	$('#email').blur(function() {
		check_email();
	});

	$('.name_input').blur(function() {
		check_login_name();
	});

	$('.pass_input').blur(function() {
		check_login_password();
	});

	$('#allow').click(function() {
		if ($(this).is(':checked')) {
			error_check = false;
			$(this).siblings('span').hide();
		} else {
			error_check = true;
			$(this).siblings('span').html('请勾选同意');
			$(this).siblings('span').show();
		}
	});


	function check_user_name() {
		var len = $('#user_name').val().length;
		if (len < 5 || len > 20) {
			$('#user_name').next().html('请输入5-20个字符的用户名')
			$('#user_name').next().show();
			error_name = true;
		} else {
			$('#user_name').next().hide();
			error_name = false;
		}
	}

	function check_pwd() {
		var len = $('#pwd').val().length;
		if (len < 8 || len > 20) {
			$('#pwd').next().html('密码最少8位，最长20位')
			$('#pwd').next().show();
			error_password = true;
		} else {
			$('#pwd').next().hide();
			error_password = false;
		}
	}


	function check_cpwd() {
		var pass = $('#pwd').val();
		var cpass = $('#cpwd').val();

		if (pass != cpass) {
			$('#cpwd').next().html('两次输入的密码不一致')
			$('#cpwd').next().show();
			error_check_password = true;
		} else {
			$('#cpwd').next().hide();
			error_check_password = false;
		}

	}

	function check_email() {
		var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

		if (re.test($('#email').val())) {
			$('#email').next().hide();
			error_email = false;
		} else {
			$('#email').next().html('你输入的邮箱格式不正确')
			$('#email').next().show();
			error_check_password = true;
		}

	}

	function check_login_name() {
		var name = $('.name_input').val();
		var name_error = $('.user_error').val();
		alert(name_error)
		var csrf = $('input[name="csrfmiddlewaretoken"]').val();

		params = {
			'csrfmiddlewaretoken': csrf,
			'name': name
		}
		$.post('/user/login', params, function(data) {
			/*optional stuff to do after success */
			if (data.errmsg) {
				name_error.html(errmsg);
				name_error.css('display', 'block')
			} else {
				name_error.style.display = 'none';
			}
		});

	}

	function check_login_password() {
		var pass = $('.pass_input').val();
		var pass_error = $('.pwd_error').val();
		var csrf = $('input[name="csrfmiddlewaretoken"]').val();

		params = {
			'csrfmiddlewaretoken': csrf,
			'pass': pass
		}
		$.post('/user/login', params, function(data) {
			/*optional stuff to do after success */
			if (data.errmsg) {
				pass_error.html(errmsg);
				pass_error.style.display = 'block';
			} else {
				pass_error.style.display = 'none';
			}
		});

	}

	$('#reg_form').submit(function() {
		check_user_name();
		check_pwd();
		check_cpwd();
		check_email();

		if (error_name == false && error_password == false && error_check_password == false && error_email == false && error_check == false) {
			return true;
		} else {
			return false;
		}

	});



})