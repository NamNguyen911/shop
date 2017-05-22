$ document
  .ready () ->

    if FastClick?
      FastClick.attach document.body

    if $::owlCarousel?
      $ '#hero'
        .owlCarousel
          autoplay: 3000
          loop: true
          responsive:
            0:
              items: 1
            1024:
              items: 2
            1920:
              items: 3
      $ '#toolbar a.to-top'
        .click (e) ->
          e.preventDefault()
          $ 'html, body'
            .animate {scrollTop: 0}, 400

    cart = $ '#toolbar .view-cart'
    counters = $ '.view-cart .counter'
    inCart = 0
    updateCartCounters = (n) ->
      if n
        inCart = n
        $ counters
          .text n
    updateCartCounters 0
      

    $ '.add-to-cart'
      .on 'click', (e) ->
        e.preventDefault()
        img = $ @
          .closest '.product'
          .find '.image img'
          .last()
        if img
          clone = img
            .clone()
            .offset
              top: img.offset().top
              left: img.offset().left
            .css
              position: 'absolute'
              opacity: 1
              height: '150px'
              width: 'auto',
              zIndex: 10001
            .appendTo document.body
            .animate {
                top: cart.offset().top - 30
                left: cart.offset().left - 30
                height: '75px'
              }, 1000
          setTimeout () ->
              cart.addClass 'syncing'
              setTimeout () ->
                  cart.removeClass 'syncing'
                  updateCartCounters inCart + 1
                , 1000
            , 1000
          clone.animate {
              opacity: 0
            }, () ->
              $ @
                .detach()