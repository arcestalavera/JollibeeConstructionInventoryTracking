$(document).ready(function() {
    var chosen;
    $("#status-options").hide();
    $(".edit-button").on('click', function(e) {
        $("#status-options").toggle('slow');
    });

    $("#requestmodal").on("show.bs.modal", function(event) {
        var trigger = $(event.relatedTarget);
        
    });

    $(document).on("click", ".proceed-btn", function(e) {
        $.ajax({
            type: "POST",
            url: "HandleRequest?action=status",
            data: $("#status-options").serialize(),
            success: function(html) {
                $("#status-options").toggle('slow');
                $("#request-status").html(html);
            }
        });
    });
});