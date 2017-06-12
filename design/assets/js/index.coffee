initFastClick = () =>
  if FastClick?
    FastClick.attach document.body

initFoundation = () =>
  if $::foundation?
    $ document
      .foundation 'tab', 'reflow'

initListing = () =>
  $ document
    .on 'change', '.listing .sort', (e) =>
      url = $ e.target
        .val()
      window.location.href = url

initOwlCarousel = () =>
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
    $ '.product-images'
      .owlCarousel
        autoplay: 3000
        loop: true
        items: 1
        thumbs: true
        thumbImage: true

initProductDetail = () =>
  $ '.product-detail'
    .each (i, e) =>
      json = $ e
        .find 'pre.json'
        .html()
      try
        data = JSON.parse json
        data.forEach (item) =>
          item.set = new Set item.set
        getSelectedSet = () =>
          return new Set(
            $ e
              .find 'ul.candidates input:checked'
              .map (index, checked) =>
                return $(checked).attr('name') + '-' + $(checked).val()
              .toArray()
          )
        price = (number) =>
          return number.toLocaleString()
        update = (result) =>
          if result?
            reduceNumber = result.price.old - result.price.current
            reductPercent = (reduceNumber / result.price.old * 100).toFixed()
            $ e
              .find '.sku'
                .text result.sku
                .end()
              .find '.price'
                .find '.old strong'
                  .text price result.price.old
                  .end()
                .find '.current strong'
                  .text price result.price.current
                  .end()
                .find '.reduce strong'
                  .text "#{price(reduceNumber)} (-#{reductPercent}%)"
        $ e
          .on 'change', 'ul.candidates input', (e) =>
            selectedSet = getSelectedSet()
            result = _.find data, (i) =>
              return _.isEqual(i.set, selectedSet)
            update result
      catch e
        console.log e

initScrollToTop = () =>
  $ '#toolbar a.to-top'
    .click (e) ->
      e.preventDefault()
      $ 'html, body'
        .animate {scrollTop: 0}, 400

initAddToCart = () =>
  cart = $ '#toolbar .view-cart'
  counters = $ '.view-cart .counter'
  inCart = 0
  updateCartCounters = (n) ->
    if n
      inCart = n
      $ counters
        .text n
  $ document
    .on 'click', '.add-to-cart', (e) ->
      e.preventDefault()
      url = $ e.currentTarget
        .attr 'href'
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
            $.ajax
              method: 'get'
              url: url
              beforeSend: () =>
                cart.addClass 'syncing'
              success: (res) =>
                setTimeout () ->
                    count = parseInt res, 10
                    cart.removeClass 'syncing'
                    updateCartCounters count
                , 1000
          , 1000
        clone.animate {
            opacity: 0
          }, () ->
            $ @
              .detach()

initFastClick()

$ document
  .ready () ->

    initFoundation()
    initOwlCarousel()
    initListing()
    initAddToCart()
    initScrollToTop()
    initProductDetail()