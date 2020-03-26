$(function () {
    $('#submit_1').click(function () {
        if($('#name_id').val()) {
            location.href = '#page2';
        }
    })
});

$(function () {
    $('#submit_2').click(function () {
        if($('#surname_id').val()) {
            location.href = '#page3';
        }
    })
});

$(function () {
    $('#submit_2_back').click(function () {
        location.href = '#page1';
    })
});

function validateEmail(email) {
    let pattern  = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
return pattern .test(String(email).toLowerCase());
}

$(function () {
    $('#submit_3').click(function () {
        let email = $('#email_id').val();
        if(email && validateEmail(email)) {
            location.href = '#page4';
        }
    })
});

$(function () {
    $('#submit_3_back').click(function () {
        location.href = '#page2';
    })
});
