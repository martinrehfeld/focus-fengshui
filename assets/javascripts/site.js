({
  init: function() {
    // support HTML5 elements in older browsers
    'article aside footer header nav section time'.replace(/\w+/g,function (n) {
      document.createElement(n);
    });

    $(this.headerHomeLink);
    $(this.addToplinks);
  },

  addToplinks: function () {
    $('#main .content h2').append('<a class="toplink" href="#top">↑ Seitenanfang</a>');
  },

  headerHomeLink: function() {
    $('header').click(function () {
      window.location.href = '/';
    });
  }
}).init();
