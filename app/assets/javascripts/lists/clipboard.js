$(document).on('turbolinks:load', function() {

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
});