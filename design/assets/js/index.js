(function() {
  var initAddToCart, initFastClick, initFoundation, initListing, initOwlCarousel, initProductDetail, initScrollToTop;

  initFastClick = (function(_this) {
    return function() {
      if (typeof FastClick !== "undefined" && FastClick !== null) {
        return FastClick.attach(document.body);
      }
    };
  })(this);

  initFoundation = (function(_this) {
    return function() {
      if ($.prototype.foundation != null) {
        return $(document).foundation('tab', 'reflow');
      }
    };
  })(this);

  initListing = (function(_this) {
    return function() {
      return $(document).on('change', '.listing .sort', function(e) {
        var url;
        url = $(e.target).val();
        return window.location.href = url;
      });
    };
  })(this);

  initOwlCarousel = (function(_this) {
    return function() {
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
        return $('.product-images').owlCarousel({
          autoplay: 3000,
          loop: true,
          items: 1,
          thumbs: true,
          thumbImage: true
        });
      }
    };
  })(this);

  initProductDetail = (function(_this) {
    return function() {
      return $('.product-detail').each(function(i, e) {
        var data, getSelectedSet, json, price, update;
        json = $(e).find('pre.json').html();
        try {
          data = JSON.parse(json);
          data.forEach(function(item) {
            return item.set = new Set(item.set);
          });
          getSelectedSet = function() {
            return new Set($(e).find('ul.candidates input:checked').map(function(index, checked) {
              return $(checked).attr('name') + '-' + $(checked).val();
            }).toArray());
          };
          price = function(number) {
            return number.toLocaleString();
          };
          update = function(result) {
            var reduceNumber, reductPercent;
            if (result != null) {
              reduceNumber = result.price.old - result.price.current;
              reductPercent = (reduceNumber / result.price.old * 100).toFixed();
              return $(e).find('.sku').text(result.sku).end().find('.price').find('.old strong').text(price(result.price.old)).end().find('.current strong').text(price(result.price.current)).end().find('.reduce strong').text((price(reduceNumber)) + " (-" + reductPercent + "%)");
            }
          };
          return $(e).on('change', 'ul.candidates input', function(e) {
            var result, selectedSet;
            selectedSet = getSelectedSet();
            result = _.find(data, function(i) {
              return _.isEqual(i.set, selectedSet);
            });
            return update(result);
          });
        } catch (error) {
          e = error;
          return console.log(e);
        }
      });
    };
  })(this);

  initScrollToTop = (function(_this) {
    return function() {
      return $('#toolbar a.to-top').click(function(e) {
        e.preventDefault();
        return $('html, body').animate({
          scrollTop: 0
        }, 400);
      });
    };
  })(this);

  initAddToCart = (function(_this) {
    return function() {
      var cart, counters, inCart, updateCartCounters;
      cart = $('#toolbar .view-cart');
      counters = $('.view-cart .counter');
      inCart = 0;
      updateCartCounters = function(n) {
        if (n) {
          inCart = n;
          return $(counters).text(n);
        }
      };
      return $(document).on('click', '.add-to-cart', function(e) {
        var clone, img, url;
        e.preventDefault();
        url = $(e.currentTarget).attr('href');
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
            return $.ajax({
              method: 'get',
              url: url,
              beforeSend: (function(_this) {
                return function() {
                  return cart.addClass('syncing');
                };
              })(this),
              success: (function(_this) {
                return function(res) {
                  return setTimeout(function() {
                    var count;
                    count = parseInt(res, 10);
                    cart.removeClass('syncing');
                    return updateCartCounters(count);
                  }, 1000);
                };
              })(this)
            });
          }, 1000);
          return clone.animate({
            opacity: 0
          }, function() {
            return $(this).detach();
          });
        }
      });
    };
  })(this);

  initFastClick();

  $(document).ready(function() {
    initFoundation();
    initOwlCarousel();
    initListing();
    initAddToCart();
    initScrollToTop();
    return initProductDetail();
  });

}).call(this);
