var name, id, count;
var error = false;

// -- ajax to add supplier ------
function addSupplier() {
    if (checkValues()) {
        $.ajax({
            type: "POST",
            url: "HandleSupplier?action=add",
            data: $(".add-supplier-form").serialize(),
            success: function(html) {
                $("#add-suppliers-div").prepend(html);
                $("#name").val("");
                $("#location").val("");
                $("#contactno").val("");
                $("#emailadd").val("");
                $("#contactperson").val("");
                $("#error").hide();
            }
        });
    } else
        $("#error").show();
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

function editSupplier(id) {
    if (checkValues()) {
        $.ajax({
            type: "POST",
            url: "HandleSupplier?action=edit&id=" + id,
            data: $(".add-suppliers-form").serialize(),
            success: function(html) {
                $("#add-suppliers-div").prepend(html);
            }
        });
        return false;
    } else
        $("#error").show();
}

function checkValues() {
    var valid = false;
    var name = $("#name").val();
    var location = $("#location").val();
    var contactno = $("#contactno").val();
    var emailadd = $("#emailadd").val();
    var contactperson = $("#contactperson").val();
    var error = $("#error");

    error.empty();
    if (name.search(/[<>&\=;"'.?//]/ig) !== -1) {
        valid = false;
        error.append("<p>Please enter a proper supplier name.</p><br/>");
    } else
        valid = true;
    if (location.search(/[<>&\=;"'.?//]/ig) !== -1) {
        valid = false;
        error.append("<p>Please enter a proper location.</p><br/>");
    } else if (valid)
        valid = true;
    if (contactperson.search(/[<>&\=;"'.?//]/ig) !== -1) {
        valid = false;
        error.append("<p>Please enter a proper name for the contact person.</p><br/>");
    } else if (valid)
        valid = true;
    if (emailadd.search(/[<>&\=;"'?//]/ig) !== -1) {
        valid = false;
        error.append("<p>Please enter a proper name for the contact person.</p><br/>");
    } else if (valid)
        valid = true;
    if (contactno.search(/^(\d{10,11})+/ig) === -1) {
        valid = false;
        error.append("<p>Please enter a proper contact number.</p><br/>");
    } else if (valid)
        valid = true;

    return valid;
}

$(document).ready(function() {
    $("#error").hide();

    $(document).on("click", "#yes-delete", function(e) {
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("-") - 1);
        count = name.substr(name.indexOf("-") + 1, name.length - 1);

        deleteSupplierFromList(id, count);
    });

    $(document).on("click", "#yes-delete-supplier", function(e) {
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("d") + 1);
        location.href = "HandleSupplier?action=deleteFrmView&id=" + id;
    });
});
