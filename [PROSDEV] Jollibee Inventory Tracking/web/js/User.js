/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var uname, id, password, fullname;

// -- ajax to add user ------
function addUser() {
    if(checkValues()){
        $("#error").hide();
        $("#error").empty();
        $.ajax({
            type: "POST",
            url: "HandleUser?action=add",
            data: $(".add-users-form").serialize(),
            success: function(html) {
                $("#add-user-div").prepend(html);
                $("#uname").val("");
                $("#name").val("");
                $("#password").val("");
            }
        });
    } else $("#error").show();
    return false;
}

function deleteUserFromList() {
    var old, oid, n;
    var passData = {"id": id};

    $.ajax({
        type: "POST",
        url: "HandleUser?action=deleteFrmList",
        data: passData,
        success: function(html) {
            $("td[id=user-count]").each(function(e) {
                old = $(this).siblings("#user-actions").find(".delete-user");
                oid = old.attr("id");
                n = oid.substr(oid.indexOf("-") + 1, oid.length - 1);
                if (n > count) {
                    oid = oid.replace("-" + n, "-" + (n - 1));
                    old.attr("id", oid);
                    $(this).html(n - 1);
                }
            });
            $("tr[id=i" + id + "]").remove();
        }
    });
}

function editUser(id) {
    if(checkValues()){
        $("#error").hide();
        $("#error").empty();
        $.ajax({
            type: "POST",
            url: "HandleUser?action=edit&id=" + id,
            data: $(".add-users-form").serialize(),
            success: function(html) {
                $("#add-user-div").prepend(html);
            }
        });
    } else $("#error").show();
    return false;
}

function checkValues(){
    var valid = false;
    var username = $("#uname").val();
    var name = $("#name").val();
    var utype = $("#utype").val();
    var password = $("#password").val();
    
    var error = $("#error");
    
    if (username.search(/[<>&\=;"'.?//]/ig) !== -1){   
        valid = false;
        error.append("<p>Please enter a proper username.</p><br/>");
    } else valid = true;
    if (name.search(/([<>&\=;"'.?//])|(\d)/ig) !== -1){
        valid = false;
        error.append("<p>Please enter a proper full name.</p><br/>");
    } else if (valid) valid = true;
    if(utype<0 || utype>3 || utype.search(/[<>&\=;"'.?//a-zA-Z]/ig)!== -1){
        valid = false;
        error.append("<p>\nThere are only three user types." +
                "Please select a proper user type.</p><br/>");
    } else if (valid) valid = true;
    if (password.search(/[<>&\=;"'.?//]/ig) !== -1){
        error.append("<p>Please enter a proper password.</p>");
        valid = false;
    } else if (valid) valid = true;
    
//    if(!valid){
//        error.show();
////        event.preventDefault();
//    }
//
//    if(valid) {
//        error.hide();
//        error.empty();
////        document.login.submit();
//    }
    return valid;
}
$(document).ready(function() {
    $("#error").hide();
    $(document).on("click", "#yes-delete-user", function(e){
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("d")+1);
 
        location.href="HandleUser?action=deleteFrmView&id=" + id;
    });
    
    $(document).on("click", "#yes-delete", function(e) {
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("-") - 1);
        count = name.substr(name.indexOf("-") + 1, name.length - 1);

        deleteUserFromList(id, count);
    });
    
});
