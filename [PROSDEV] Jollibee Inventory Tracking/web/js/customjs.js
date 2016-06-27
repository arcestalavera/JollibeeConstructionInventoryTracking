/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    console.log('yoohoo');
    $('.itemlist').hide();
    $('#requestsmodal').on('show.bs.modal', function(event){
//        console.log('yoohoo');
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        var modal = $(this);
        
//        console.log(trigger);
//        console.log(verdict);
        
        if(verdict==='approve'){
            modal.find('.modal-title').text("Are you sure you want to approve this request?");
            modal.find('.modal-footer').append('<button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');
        } else if (verdict==='reject'){
            modal.find('.modal-title').text("Are you sure you want to decline this request?");
            modal.find('.modal-footer').append('<button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button>'
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
    
    $('.additem').on('click', function(event){
        
    });
});

