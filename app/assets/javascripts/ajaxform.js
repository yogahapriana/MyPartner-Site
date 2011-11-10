$(document).ready(function(){
	
	$('#contactform').submit(function(){

    formvalues = $("#contactform").serialize();

    $.ajax({
        type: "POST",
        url: "mailer.php",
        data: formvalues,
        dataType: "json",
        success: function(data) {
            if (data.success==1) {
                $("#contactform").slideUp(750,function() {
                    $('#contactmessage').html('<h3>Thank You!</h3>We have received your form submission - we aim to reply to all correspondence within 24 hours.');
                    });
            }
            else{
                if (data.invalid_email==1) { $('#contact_email').addClass("form_error"); }
                    else { $('#contact_email').removeClass("form_error"); }
                    
                if (data.invalid_name==1) { $('#contact_name').addClass("form_error"); }
                    else { $('#contact_name').removeClass("form_error"); }
                    
                if (data.invalid_message==1) { $('#contact_message_wrapper').addClass("form_error"); }
                    else { $('#contact_message_wrapper').removeClass("form_error"); }
           }
    }
    });
	    return false; 
	});

});