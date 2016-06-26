// -- ajax to add supplier ------
function addItem() {
    $.ajax({
        type: "POST",
        url: "AddItem",
        data: $(".add-items-form").serialize(),
        success: function(html) {
            $("#add-items-div").prepend(html);
            $("#name").val("");
            $("#unitofmeasure").val("");
        }
    });
    return false;
}