var focusFengShui = {
  init: function() {
    // support HTML5 elements in older browsers
    'article aside footer header nav section time'.replace(/\w+/g,function(n){document.createElement(n)});
  }
};

focusFengShui.init();
