({
  init: function(global) {
    // support HTML5 elements in older browsers
    'article aside footer header nav section time'.replace(/\w+/g,function (n) {
      document.createElement(n);
    });

    $(this.addToplinks);
    $(global).resize(this.doLayout);
    $(this.doLayout);
  },

  addToplinks: function () {
    $('#main .content h2').append('<a class="toplink" href="#top">↑ Seitenanfang</a>');
  },

  doLayout: function() {
    var fullLogoHeight = 167;
    var fullLogoWidth = 1140;
    var logoAspectRatio = fullLogoHeight / fullLogoWidth;
    var acutalLogoWidth = $('header').innerWidth();

    $('header .logo').height(acutalLogoWidth * logoAspectRatio);
  }
}).init(this);
