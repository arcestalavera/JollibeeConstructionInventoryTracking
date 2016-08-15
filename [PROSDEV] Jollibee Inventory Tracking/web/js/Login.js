$(document).ready(function(e) {
    $(document).on('click', '#submit-btn', function(e) {
        var uname = $('#uname').val();
        var pass = $('#upass').val();

        if (uname.length < 5 || pass.length === 0)
            $('#login-msg').html("<font color = 'red'>Username must have at least 5 characters</font>");
        else {
            $.ajax({
                type: "POST",
                url: "HandleLogin",
                data: $("#login-form").serialize(),
                success: function(json)
                {
                    if(!json.login)
                        $('#login-msg').html("<font color = 'red'>Incorrect Username/Password</font>");
                    else if(json.login){
                        location.href = json.loc;
                    }
                }
            });
        }
    });
});