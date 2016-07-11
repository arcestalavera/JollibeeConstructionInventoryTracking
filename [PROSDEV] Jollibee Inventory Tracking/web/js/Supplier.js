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

function deleteSupplier(){
    var old, oid, n;
    var passData = {"id": id};
    
    $.ajax({
        type: "POST",
        url: "HandleSupplier?action=delete",
        data: passData,
        success: function(html){
            //arces help!
            //$("tr[id=i" + id + "]").remove();
        }
    });
}

$(document).ready(function(){
   $(document).on("click", "#yes-delete", function(e){
      name = $(this).attr('name');
      id = name.substr(1, name.indexOf("-") - 1);
      count = name.substr(name.indexOf("-") + 1, name.length -1);
      
      deleteItem(id, count);
   });
});
