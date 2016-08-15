var name, id, count;

// -- ajax to add supplier ------
function addItem() {
    if(checkValues()){
        $("#error").hide();
        $("#error").empty();
        $.ajax({
            type: "POST",
            url: "HandleItem?action=add",
            data: $(".add-items-form").serialize(),
            success: function(html) {
                $("#add-items-div").prepend(html);
                $("#name").val("");
                $("#unitofmeasure").val("");
                $("#description").val("");
            }
        });
    } else $("#error").show();
    return false;
}

function deleteItemFromList() {
    var old, oid, n;
    var passData = {"id": id};

    $.ajax({
        type: "POST",
        url: "HandleItem?action=deleteFrmList",
        data: passData,
        success: function(html) {
            $("td[id=item-count]").each(function(e) {
                old = $(this).siblings("#item-actions").find(".delete-item");
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

function editItem(id) {
    if(checkValues()){
        $("#error").hide();
        $("#error").empty();
        $.ajax({
            type: "POST",
            url: "HandleItem?action=edit&id=" + id,
            data: $(".add-items-form").serialize(),
            success: function(html) {
                $("#add-items-div").prepend(html);
            }
        });
    } else $("#error").show();
    return false;
}

function checkValues(){
    var valid = false;
    var name = $("#name").val();
    var description = $("#description").val();
    var unitofmeasure = $("#unitofmeasure").val();
    
    var error = $("#error");
    
    error.empty();
    if (name.search(/[<>&\=;"'.?//]/ig) !== -1){   
        valid = false;
        error.append("<p>Please enter a proper item name.</p><br/>");
    } else valid = true;
    if (description.search(/[<>&\=;"'.?//]/ig) !== -1){
        valid = false;
        error.append("<p>Please enter a proper description.</p><br/>");
    } else if (valid) valid = true;
    if(unitofmeasure.search(/[<>&\=;"'.?//]/ig)!== -1){
        valid = false;
        error.append("<p>Please enter a proper unit of measurement.</p><br/>");
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
    $(document).on("click", "#yes-delete-item", function(e){
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("d")+1);
 
        location.href="HandleItem?action=deleteFrmView&id=" + id;
    });
    
    $(document).on("click", "#yes-delete", function(e) {
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("-") - 1);
        count = name.substr(name.indexOf("-") + 1, name.length - 1);

        deleteItemFromList(id, count);
    });
    
});