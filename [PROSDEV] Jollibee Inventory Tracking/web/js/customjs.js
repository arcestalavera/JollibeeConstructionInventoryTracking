/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var tableshown;
var rowcount;

function additem(){
    
    console.log('yooohoo');
    var dropdown = document.getElementById('itemselection');
    var item = dropdown.options[dropdown.selectedIndex];
    var name = item.text;
    var unit = $(dropdown).find(':selected').data('unit');
    var table = document.getElementById('itemlist');
    
    if (!tableshown){
      table.style.display = 'block';
      tableshown = true;
    }
    
    rowcount++;
    var row = table.insertRow(rowcount);
    var cell1 = row.insertCell(0);
    cell1.style= "width: 100%;";
    cell1.innerHTML = "<button type='button' class='btn btn-link name'>" + name + "</button>";
    var cell2 = row.insertCell(1);
    cell2.style = "text-align: right;";
    cell2.innerHTML = "<div class='form-group'>"
        + "<input type='number' class='form-control' name='amount' min='1' required>"
        + "</div>";
    var cell3 = row.insertCell(2);
    cell3.style = "white-space: nowrap;";
    cell3.innerHTML = "<a class='delete-button' data-toggle='modal'"
        + "data-target='#addrequestmodal' data-verdict='delete'>"
        + "<i class='fa fa-trash-o'></i>"
        + '</a>';
    
//    table.append('<tr>'
//            + '<td></td>'
//            + '<td style="text-align: right;">' + unit + '</button></td>'
//            + '<td style="text-align: right;">'
//            + '<div class="form-group">'
//            + '<input type="number" class="form-control" name="amount" min="1" required>'
//            + '</div>'
//            + '</td>'
//            + '<td style="white-space: nowrap>'
//            + '<a class="delete-button" data-toggle="modal"'
//            + 'data-target="#addrequestmodal" data-verdict="delete">'
//            + '<i class="fa fa-trash-o"></i>'
//            + '</a>'
//            + '</td>'
//            + '</tr>');
}

function deleteitem(){
    
}

$(document).ready(function() {
    var id, status;
//    console.log('yoohoo');
    $('.itemlist').hide();
    tableshown = false;
    rowcount = 0;
    $('#requestsmodal').on('show.bs.modal', function(event){
//        console.log('yoohoo');
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        id = event.relatedTarget.id;
        status = id.substr(0, 1);
//        console.log(trigger);
//        console.log(verdict);

        if (verdict === 'approve') {
            modal.find('.modal-title').text("Are you sure you want to approve this request?");
            modal.find('.modal-footer').append('<button type="button" id = "approve-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        } else if (verdict === 'reject') {
            if (status === "o")
                modal.find('.modal-title').text("Are you sure you want to cancel this request?");
            else
                modal.find('.modal-title').text("Are you sure you want to decline this request?");
            modal.find('.modal-footer').append('<button type="button" id = "reject-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
    
    $('#requestsmodal').on('hide.bs.modal', function(event){
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
    
    $('#deliveriesmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
        if(verdict==='cancel'){
            modal.find('.modal-title').text("Are you sure you can to cancel this delivery?");
            modal.find('.modal-footer').append('<button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
        
    $('#deliveriesmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
        
    $(document).on('click', '#approve-yes', function(e) {
        var passData = {"id": id, "resp": "Approved"};
        $.ajax({
            type: "POST",
            url: "HandleRequest?action=respond",
            data: passData,
            success: function(html) {
                $("a[id=" + id + "]").remove();
                $(".s" + id.substr(1, 2)).html("Approved");
            }
        });
    });

    $(document).on('click', '#reject-yes', function(e) {
        var passData = {"id": id, "resp": "Declined"};
        $.ajax({
            type: "POST",
            url: "HandleRequest?action=respond",
            data: passData,
            success: function(html) {
                $("a[id=" + id + "]").remove();
                $(".s" + id.substr(1, 2)).html("Declined");
            }
        });
    });
});

