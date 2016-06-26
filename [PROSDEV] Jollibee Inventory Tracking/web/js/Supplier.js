// -- ajax to add supplier ------
function addSupplier() {
    $.ajax({
        type: "POST",
        url: "AddSupplier",
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