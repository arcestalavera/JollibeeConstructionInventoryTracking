$(document).ready(function() {
    var did;

    $("#requestmodal").on("show.bs.modal", function(event) {
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data('verdict');
        did = trigger.attr("name");
        var modal = $(this);

        if (verdict === "cancel") {
            modal.find('.modal-title').text("Are you sure you want to cancel this delivery?");
            modal.find('.modal-footer').append('<button type="button" id = "cancel-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');

        }
        else if (verdict === "finish") {
            modal.find('.modal-title').text("Are you sure you want to mark this delivery as finished?");
            modal.find('.modal-footer').append('<button type="button" id = "finish-yes" class="btn btn-primary" data-dismiss="modal">Yes</button>'
                    + '<button type="button" class="btn btn-default" data-dismiss="modal">No</button>');

        }
    });

    $('#requestmodal').on('hide.bs.modal', function(event) {
        var modal = $(this);
        modal.find('.modal-footer').empty();
    });

    $(document).on("click", "#cancel-yes", function(e) {
        did = did.substr(1, did.length);
        var passData = {"id": did};

        $.ajax({
            type: "POST",
            url: "HandleDelivery?action=cancel",
            data: passData,
            success: function(html) {
                $("#d" + did + "-actions").html("");
                $("#d" + did + "-status").html("Cancelled");
            }
        });
    });

    $(document).on("click", "#finish-yes", function(e) {
        did = did.substr(1, did.length);
        var passData = {"id": did};

        $.ajax({
            type: "POST",
            url: "HandleDelivery?action=finish",
            data: passData,
            success: function(html) {
                $("#d" + did + "-actions").html("");
                $("#d" + did + "-status").html("Finished");

                if (html.length !== 0) {
                    var split = html.split("-");
                    if (split.length === 2) {
                        var status = split[0];
                        var date = split[1];
                        $("#request-status").html(status);
                        $("#request-enddate").html(date);
                        alert(status + " date = " + date);
                    } else{
                        $("#request-status").html("In Transit - Incomplete");
                    }
                }
            }
        });
    });
});