var name, id, count;
var error = false;

// -- ajax to add supplier ------
function addSupplier() {
    $.ajax({
        type: "POST",
        url: "HandleSupplier?action=add&error=no",
        data: $(".add-supplier-form").serialize(),
        success: function(html) {
            $("#add-supplier-div").prepend(html);
            $("#name").val("");
            $("#location").val("");
            $("#contactno").val("");
            $("#emailadd").val("");
        }
    });
    return false;
}

function deleteSupplierFromList() {
    var old, oid, n;
    var passData = {"id": id};

    $.ajax({
        type: "POST",
        url: "HandleSupplier?action=deleteFrmList",
        data: passData,
        success: function(html) {
            $("td[id=supplier-count]").each(function(e) {
                old = $(this).siblings("#supplier-actions").find(".delete-item");
                oid = old.attr("id");
                n = oid.substr(oid.indexOf("-") + 1, oid.length - 1);
                if (n > count) {
                    oid = oid.replace("-" + n, "-" + (n - 1));
                    old.attr("id", old);
                    $(this).html(n - 1);
                }
            });
            $("tr[id=i" + id + "]").remove();
        }
    });
}

function editSupplier(id){
    $.ajax({
        type: "POST",
        url: "HandleSupplier?action=edit&error=no&id="+id,
        data: $(".add-suppliers-form").serialize(),
        success: function(html){
            $("#add-suppliers-div").prepend(html);
        }
    });
    return false;
}

function checkName(name){
    if(name.search(/([<>~`!@#$%\^&*\(\)_\-\+\=\{\}\[\]:;"',.?//])|(\d{1,})/ig)!==-1)
        return 0;
    else return 1;
}

function checkLocation(loc){
    if (loc.search(/[<>~`!@#$%\^&*\(\)_\-\+\=\{\}\[\]:;"',.?//]/ig)!==-1)
        return 0;
    else return 1;
}

function checkNumber(num){
    if (num.search(/^(\d{10,11})+/ig)!==-1)
        return 0;
    else return 1;
}

function checkEmailAdd(email){
    if(email.search(/([<>])/ig)!==-1)
        return 0;
    else return 1;
}

function checkContactPerson(contact){
    if(contact.search(/([<>~`!@#$%\^&*\(\)_\-\+\=\{\}\[\]:;"',.?//])|(\d{1,})/ig)!==-1)
        return 0;
    else return 1;
}

function checkInput(id){
    var url = "";
    
    if(id==-1 && (!checkName($("#name").val())
        || !checkLocation($("#location").val())
        || !checkNumber($("#number").val()) 
        || !checkEmailAdd($("#emailadd").val())
        || !checkContactPerson($("#contactperson").val()))){
        error = true;
        url = "HandleSupplier?action=add&error=yes";
    } else if (id!=-1 && (!checkName($("#name").val())
        || !checkLocation($("#location").val())
        || !checkNumber($("#number").val()) 
        || !checkEmailAdd($("#emailadd").val())
        || !checkContactPerson($("#contactperson").val()))){
        error = true;
        url = "HandleSupplier?action=edit&error=yes&id=" + id;
    }
    
    if(error){
        $.ajax({
            type: "POST",
            url: url,
            data: $(".add-supplier-form").serialize(),
            success: function(html){
//                $("#name").value = "";
//                error = true;
                $("#error").text("Please input the correct entries.");
                $("#error").show();
                if(!checkName($("#name").val()))
                    $("#name").css();
                if(!checkLocation($("#location").val()))
                    $("#location").css();
                if(!checkNumber($("#number").val()))
                    $("#number").css();
                if(!checkEmailAdd($("#emailadd").val()))
                    $("#emailadd").css();
                if(!checkContactPerson($("#contactperson").val()))
                    $("#contactperson").css();
            }
        });
        
    } else if (id>=0 && !error){
        error = false;
        $("#error").text("");
        editSupplier(id);   
    }else if (id==-1 && !error){
        error = false;
        $("#error").text("");
        addSupplier();
    }
}

$(document).ready(function() {
    if (error===false)
        $("#error").hide();
    else $("#error").show();
    
    $(document).on("click", "#yes-delete", function(e) {
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("-") - 1);
        count = name.substr(name.indexOf("-") + 1, name.length - 1);

        deleteSupplierFromList(id, count);
    });
    
    $(document).on("click", "#yes-delete-supplier", function(e){
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("d")+1);
        location.href = "HandleSupplier?action=deleteFrmView&id=" + id;
    });
});
