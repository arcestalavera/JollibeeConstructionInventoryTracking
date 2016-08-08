var name, id, count;

// -- ajax to add supplier ------
function addItem() {
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
    $.ajax({
        type: "POST",
        url: "HandleItem?action=edit&id=" + id,
        data: $(".add-items-form").serialize(),
        success: function(html) {
            $("#add-items-div").prepend(html);
        }
    });
    return false;
}

function checkInput(id){
    if($("#description").value.search(/[<>~`!@#$%\^&*\(\)_\-\+\=\{\}\[\]:;"',.?//]/ig)!==-1){
        $.ajax({
            type: "POST",
            url: "HandleItem?action=error",
            data: $(".add-items-form").serialize(),
            success: function(html){
                $("#description").value = "";
                $("#error").show();
                $("#error").text("Special characters not allowed in description. Please rewrite.");
            }
        });
    } else if ($("#name").value.search(/([<>~`!@#$%\^&*\(\)_\-\+\=\{\}\[\]:;"',.?//])|(\d{1,})/ig)!==-1){
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
    } else if ($("#unitofmeasure").value.search(/[<>~`!@#$%\^&*\(\)_\-\+\=\{\}\[\]:;"',?//]|(\b[.]{2})/ig)!==-1){
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
        editItem(id);   
    } else if (id==-1){
        addItem();
    }
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