$(document).ready(function() {
    var chosen;
    $("#status-options").hide();
    $(".edit-button").on('click', function(e) {
        $("#status-options").toggle('slow');
    });

    $("#requestmodal").on("show.bs.modal", function(event) {
        var trigger = $(event.relatedTarget);
        var verdict = trigger.data("verdict");
        var modal = $(this);
        var chosenWord;
        chosen = $('input[name=optradio]:checked').val();
        switch (chosen) {
            case "1":
                chosenWord = "In Transit - Incomplete";
                break;
            case "2":
                chosenWord = "In Transit";
                break;
            case "3":
                chosenWord = "Finished";
                break;
            default:
                chosenWord = "Undefined";
                break;
        }
        if (verdict === "question") {
            if (chosenWord === "Undefined") {
                modal.find(".modal-title").text("Please Choose an Option");
                modal.find(".modal-footer").append("<button type = 'button' class = 'btn btn-primary' data-dismiss = 'modal'>Back</button>");
            }
            else {
                modal.find(".modal-title").text("Change Status to '" + chosenWord + "'?");
                modal.find(".modal-footer").append("<button type = 'button' class = 'btn btn-primary proceed-btn' data-dismiss = 'modal'>Proceed</button>"
                        + "<button type = 'button' class = 'btn btn-primary' data-dismiss = 'modal'>Back</button>");
            }
        }
    });

    $("#requestmodal").on("hide.bs.modal", function(event) {
        var modal = $(this);
        modal.find(".modal-footer").empty();
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