/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var name, id, count;

// -- ajax to add supplier ------
function addUser() {
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
            $("td[id=item-count]").each(function(e) {
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
    $.ajax({
        type: "POST",
        url: "HandleUser?action=edit&id=" + id,
        data: $(".add-users-form").serialize(),
        success: function(html) {
            $("#add-user-div").prepend(html);
        }
    });
    return false;
}

function checkInput(id){
    if($("#description").search(/<>~`!@#$%^&*()_-+={}[]:;"',.?\//ig)!==-1){
        $.ajax({
            type: "POST",
            url: "HandleUser?action=error",
            data: $(".add-items-form").serialize(),
            success: function(html){
                $("#description").value = "";
                $("#error").show();
                $("#error").text("Special characters not allowed in description. Please rewrite.");
            }
        });
    } else if ($("#name").search(/<>~`!@#$%^&*()_-+={}[]:;"',.?\//ig)!==-1){
        $.ajax({
            type: "POST",
            url: "HandleItem?action=error",
            data: $(".add-items-form").serialize(),
            success: function(html){
                $("#name").value = "";
                $("#error").show();
                $("#error").text("Special characters not allowed in name. Please rewrite.");
            }
        });
    } else if ($("#unitofmeasure").search(/<>~`!@#$%^&*()_-+={}[]:;"',.?\//ig)!==-1){
        $.ajax({
            type: "POST",
            url: "HandleItem?action=error",
            data: $(".add-items-form").serialize(),
            success: function(html){
                $("#unitofmeasure").value = "";
                $("#error").show();
                $("#error").text("Special characters not allowed in unit of measure. Please rewrite.");
            }
        });
    } else if (id>=0){
        editUser(id);   
    } else if (id==-1){
        addUser();
    }
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
