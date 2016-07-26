/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    var id, status;
//    console.log('yoohoo');
    $('#itemlist').hide();
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
    
//    $('#deliveriesmodal').on('show.bs.modal', function(event){
//        var trigger = $(event.relatedTarget);
//        var verdict = trigger.data('verdict');
//        var modal = $(this);
//        
//        if(verdict==='cancel'){
//            modal.find('.modal-title').text("Are you sure you want to cancel this delivery?");
//            modal.find('.modal-footer').append('<button type="button" id="cancel-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>'
//                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
//        }
//    });
//        
//    $('#deliveriesmodal').on('hide.bs.modal', function(event) {
//        var modal = $(this);
//        modal.find('.modal-footer').empty();
//    });
    
    $('#itemsmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
        id = event.relatedTarget.id;
        if(verdict==='delete'){
            modal.find('.modal-title').text("Are you sure you want to delete this item?");
            modal.find('.modal-footer').append('<button type="button" id="yes-delete" class="btn btn-primary" name="' + id + '" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
    
    $('#itemsmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
    
    $('#suppliersmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
        id = event.relatedTarget.id;
        if(verdict==='delete'){
            modal.find('.modal-title').text("Are you sure you want to delete this supplier?");
            modal.find('.modal-footer').append('<button type="button" id="yes-delete" class="btn btn-primary" name="' + id
                    +'" data-dismiss="modal">Yes</button><button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
            deleteyes = false;
        }
    });
    
    $('#suppliersmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        if (deleteyes)
            modal.find('.modal-footer').empty();
    });
    
    $('#warehousesmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
        if(verdict==='delete'){
            modal.find('.modal-title').text("Are you sure you want to delete this warehouse?");
            modal.find('.modal-footer').append('<button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
    
    $('#warehousesmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
    
    $('#addrequestmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var rowcount = trigger.data('item');
        var modal = $(this);
        
        if(verdict==='delete'){
            modal.find('.modal-title').text("Are you sure you want to delete this entry?");
            modal.find('.modal-footer').append('<button type="button" class="btn btn-primary" id="rowdelete" data-dismiss="modal"'
                    +'data-item="'+ rowcount +'">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
    
    $('#viewitemsmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
        id = event.relatedTarget.id;
        if(verdict==='delete'){
            modal.find('.modal-title').text("Are you sure you want to delete this item?");
            modal.find('.modal-footer').append('<button type="button" id="yes-delete-item" class="btn btn-primary" name="' + id + '" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
    
    $('#viewitemsmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
    
    $('#viewsuppliersmodal').on('show.bs.modal', function(event){
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
        id = event.relatedTarget.id;
        if(verdict==='delete'){
            modal.find('.modal-title').text("Are you sure you want to delete this supplier?");
            modal.find('.modal-footer').append('<button type="button" id="yes-delete-supplier" class="btn btn-primary" name="' + id + '" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        }
    });
    
    $('#viewsuppliersmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
    
//    $(document).on('click', '.delete-button', function(event){
////        var index = parseInt($(this).attr('data-item'));
//        var table = document.getElementById('itemlist');
////        $(this).parent().delete();
//        var row = $(this).parent();
//        row.parent().removeChild(row);
//        rowcount--;
//        if(rowcount==0)
//            table.hide();
//    });
    
    $('#addrequestmodal').on('hide.bs.modal', function(event){
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });
        
    $(document).on('click', '#approve-yes', function(e) {
        var passData = {"id": id, "resp": "In Transit"};
        $.ajax({
            type: "POST",
            url: "HandleRequest?action=respond",
            data: passData,
            success: function(html) {
                $("a[id=" + id + "]").remove();
                $(".s" + id.substr(1, id.length)).html("In Transit");
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
                $(".s" + id.substr(1, id.length)).html("Declined");
            }
        });
    });
    
});

