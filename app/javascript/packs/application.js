import 'bootstrap';
import '@client-side-validations/client-side-validations'
import '@client-side-validations/simple-form/dist/simple-form.bootstrap4'


console.log('Hello World from Webpacker')

$(document).on('shown.bs.modal', '.modal', function() {
  $('form[data-client-side-validations]').enableClientSideValidations();
});
