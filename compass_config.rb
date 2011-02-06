require 'eleven40'

output_style     = :expanded
project_path     = File.join(File.dirname(__FILE__), '/')
sass_dir         = 'content/stylesheets'
javascripts_dir  = 'output/javascripts'
css_dir          = 'output/stylesheets'
images_dir       = 'output/images'

http_path        = '/'
http_images_path = '/images'

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

sass_options = {
  :syntax => :scss
}

asset_cache_buster do |http_path, real_path|
  if File.exists?(real_path)
    File.mtime(real_path).strftime("%s")
  else
    "v=1"
  end
end
