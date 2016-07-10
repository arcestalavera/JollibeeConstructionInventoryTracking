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

function deleteItem() {
    var old, oid, n;
    var passData = {"id": id};

    $.ajax({
        type: "POST",
        url: "HandleItem?action=delete",
        data: passData,
        success: function(html) {
            $("td[id=item-count]").each(function(e) {
                old = $(this).siblings("#item-actions").find(".delete-item");
                oid = old.attr("id");
                n = oid.substr(oid.indexOf("-") + 1, oid.length - 1);
                oid = oid.replace("-" + n, "-" + (n - 1));
                old.attr("id", oid);
                if (n > count) {
                    $(this).html(n - 1);
                }
            });
            $("tr[id=i" + id + "]").remove();
        }
    });
}

function editItem(id){
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

$(document).ready(function() {
    $(document).on("click", "#yes-delete", function(e) {
        name = $(this).attr('name');
        id = name.substr(1, name.indexOf("-") - 1);
        count = name.substr(name.indexOf("-") + 1, name.length - 1);

        deleteItem(id, count);
    });
});