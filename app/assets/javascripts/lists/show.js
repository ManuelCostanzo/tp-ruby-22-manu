$(document).on('turbolinks:load', function() {

/********** COPIA EL LINK AL PORTAPAPELES Y MUESTRA TOOLTIP **********/

  function setTooltip() {
    $('[data-link]').attr('data-original-title', 'Copiado!').tooltip('show');
  }

  function hideTooltip() {
    $('[data-link]').tooltip('hide');
  }

  $("[data-link]").click(function() {

    $('[data-link]').tooltip({
      trigger: 'click',
      placement: 'bottom'
    });

    var clipboard = new Clipboard('[data-link]');
    setTooltip();

    $("[data-link]").mouseleave(function() {
      hideTooltip()
      clipboard.destroy();
    });
  });
  
//////////////////////////////////////////////////////////

/********** HACE X-EDITABLE EL TITULO DE LA LISTA Y AGARRO LA RESPUESTA EN AJAX **********/

  $('.edit_list').editable({
        success: function(response) {
          update_date(response.date);
        },
        error: function(errors) {
          return errors.responseJSON.toString().replace(/,/g, ".\n");
        }
    });

//////////////////////////////////////////////////////////

});