(function() {
  $(document).ready(function() {
    var cart, counters, inCart, updateCartCounters;
    if (typeof FastClick !== "undefined" && FastClick !== null) {
      FastClick.attach(document.body);
    }
    if ($.prototype.owlCarousel != null) {
      $('#hero').owlCarousel({
        autoplay: 3000,
        loop: true,
        responsive: {
          0: {
            items: 1
          },
          1024: {
            items: 2
          },
          1920: {
            items: 3
          }
        }
      });
      $('#toolbar a.to-top').click(function(e) {
        e.preventDefault();
        return $('html, body').animate({
          scrollTop: 0
        }, 400);
      });
    }
    cart = $('#toolbar .view-cart');
    counters = $('.view-cart .counter');
    inCart = 0;
    updateCartCounters = function(n) {
      if (n) {
        inCart = n;
        return $(counters).text(n);
      }
    };
    updateCartCounters(0);
    return $('.add-to-cart').on('click', function(e) {
      var clone, img;
      e.preventDefault();
      img = $(this).closest('.product').find('.image img').last();
      if (img) {
        clone = img.clone().offset({
          top: img.offset().top,
          left: img.offset().left
        }).css({
          position: 'absolute',
          opacity: 1,
          height: '150px',
          width: 'auto',
          zIndex: 10001
        }).appendTo(document.body).animate({
          top: cart.offset().top - 30,
          left: cart.offset().left - 30,
          height: '75px'
        }, 1000);
        setTimeout(function() {
          cart.addClass('syncing');
          return setTimeout(function() {
            cart.removeClass('syncing');
            return updateCartCounters(inCart + 1);
          }, 1000);
        }, 1000);
        return clone.animate({
          opacity: 0
        }, function() {
          return $(this).detach();
        });
      }
    });
  });

}).call(this);
