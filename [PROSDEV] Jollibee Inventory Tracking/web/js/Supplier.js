var name, id, count;

// -- ajax to add supplier ------
function addSupplier() {
    $.ajax({
        type: "POST",
        url: "HandleSupplier?action=add",
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
        url: "HandleSupplier?action=edit&id="+id,
        data: $(".add-suppliers-form").serialize(),
        success: function(html){
            $("#add-suppliers-div").prepend(html);
        }
    });
    return false;
}

$(document).ready(function() {
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
