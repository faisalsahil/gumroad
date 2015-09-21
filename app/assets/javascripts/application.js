//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require stripe
//= require_tree .

// Stripe.setPublishableKey('pk_test_e3M34Kpc9t0NSIJESv7IYGxQ');

// jQuery(function($) {
//     $('#payment-form').submit(function(event) {
//         Stripe.setPublishableKey('pk_test_e3M34Kpc9t0NSIJESv7IYGxQ');

//         var $form = $(this);
//         // Disable the submit button to prevent repeated clicks
//         //$form.find('button').prop('disabled', true);
//         $form.find('#stripe_submit_button').prop('disabled', false);
//         $('#stripe_submit_button').prop('disabled', true);
//         // Prevent the form from submitting with the default action
//         event.preventDefault();

// //        var card = number: $('#card_number').val()
// //        cvc: $('#card_code').val()
// //        expMonth: $('#card_month').val()
// //        expYear: $('#card_year').val()
// //
//         Stripe.createToken({
//             number: $('#card_number').val(),
//             cvc: $('#card_code').val(),
//             exp_month: $('#card_month').val(),
//             exp_year: $('#card_year').val()
//         }, stripeResponseHandler);

// //        Stripe.createToken($form, stripeResponseHandler);
//         return false;
//     });
// });

// //tok_2AgC3bk0JlBBxM
// var stripeResponseHandler = function(status, response) {
//     var $form = $('#payment-form');
//     if (response.error) {
//         alert(response.error.message);
//         // Show the errors on the form
//         $form.find('.payment-errors').text(response.error.message);
//         $form.find('#stripe_submit_button').prop('disabled', false);
//     } else {
//         $('#stripetoken').val(response.id);
//         $('#fingerprint').val(response.card.fingerprint);


//         // token contains id, last4, and card type
//         var token = response.id;
//         // Insert the token into the form so it gets submitted to the server
//         $form.append($('<input type="hidden" name="stripeToken" />').val(token));
//         $form.append($('<input type="hidden" name="fingerprint" />').val(response.card.fingerprint));
//         // and submit
//         $form.get(0).submit();
//     }
//     $('#stripe_submit_button').prop('disabled', false);

// };
