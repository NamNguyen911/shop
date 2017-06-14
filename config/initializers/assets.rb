# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( 
  index.css
  search.js 
  jquery/dist/jquery.min.js
  lodash/dist/lodash.min.js
  fastclick/lib/fastclick.js
  foundation/js/foundation.min.js
  owl.carousel/dist/owl.carousel.min.js
  owl.carousel2.thumbs/dist/owl.carousel2.thumbs.min.js
  index.js
)
