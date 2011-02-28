include Nanoc3::Helpers::XMLSitemap
# include Nanoc3::Helpers::Tagging
# include Nanoc3::Helpers::Rendering
# include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Capturing
include Nanoc3::Helpers::LinkTo

require 'fileutils'

# Adapted from: http://github.com/mgutz/nanoc3_blog/blob/master/lib/helpers.rb
#
# If a file has two extensions like Rails naming conventions, then the first extension
# is used as part of the output file.
#
#   sitemap.xml.erb # => sitemap.xml
#
def route_path(item)
  # in-memory items have no file
  return item.identifier + "index.html" if item[:content_filename].nil?

  url = item[:content_filename].gsub(/^content/, '')

  # determine output extension
  extname = '.' + item[:extension].split('.').last
  outext = '.haml'
  if url.match(/(\.[a-zA-Z0-9]+){2}$/) # => *.html.erb, *.html.md ...
    outext = '' # remove 2nd extension
  elsif extname == ".sass" || extname == ".scss"
    outext = '.css'
  else
    outext = '.html'
  end
  url.gsub!(extname, outext)

  url
end

# Copy static assets outside of content instead of having nanoc3 process them.
def copy_assets
  FileUtils.cp_r 'assets/.', 'output/', :preserve => true
end

def apply_filters
  # item[:extension] returns 'html.erb' for multi-dotted filename
  ext = item[:extension].nil? ? nil : item[:extension].split('.').last

  if ext == 'haml' || ext.nil?
    filter :haml, :attr_wrapper => '"'
  elsif ext == 'md' || ext == 'markdown'
    filter :erb
    filter :kramdown
  else
    filter :erb
  end
end

def apply_layout
  # use layouts with .html extension or layout specified in meta
  item[:layout] = "none" unless item[:layout] || File.extname(route_path(item)) == '.html'

  layout(item[:layout] || 'default') unless item[:layout] == "none"
end

def apply_filters_and_layout
  apply_filters
  apply_layout
end

# get keywords for <meta>
def keywords
  @item[:keywords].nil? ? nil : @item[:keywords].join(', ')
end

# get description for <meta>
def description
  @item[:excerpt]
end
