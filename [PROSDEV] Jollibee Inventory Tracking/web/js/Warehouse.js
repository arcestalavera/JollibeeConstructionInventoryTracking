// -- ajax to add warehouse ------
function addWarehouse() {
    $.ajax({
        type: "POST",
        url: "HandleWarehouse?action=add",
        data: $(".add-warehouse-form").serialize(),
        success: function(html) {
            $("#add-warehouse-div").prepend(html);
            $("#name").val("");
            $("#location").val("");
        }
    });
    return false;
}