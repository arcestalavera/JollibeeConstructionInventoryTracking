$(document).ready(function() {
    $("#reportmodal").on("show.bs.modal", function(event) {
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data("verdict");
        var modal = $(this);
        if (verdict === "question") {
            modal.find(".modal-title").text("Proceed Sending of Progress Report?");
            modal.find(".modal-footer").append("<button type = 'button' class = 'btn btn-primary proceed-btn' data-dismiss = 'modal'>Proceed</button>"
                    + "<button type = 'button' class = 'btn btn-primary' data-dismiss = 'modal'>Back</button>");
        }
    });

    $("#reportmodal").on("hide.bs.modal", function(event) {
        var modal = $(this);
        modal.find(".modal-footer").empty();
    });
    
    $(document).on('click', '.proceed-btn', function(e){
         $("#send-div").prepend("<p style = 'float:left; margin-left: 15px; color: green; font-size: 20px;'>Progress report has been sent!</p>"); 
    });
});