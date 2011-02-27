require 'kramdown'
require 'nokogiri'

def menu_item(text, target, attributes={})
  # Find item
  item = target.is_a?(String) ? items.detect { |item| item.path == target } : target
  raise "Item #{target.inspect} could not be found!" unless item

  # set default :class
  if attributes[:class]
    attributes[:class] << ' '
  else
    attributes[:class] = ''
  end
  attributes[:class] << 'level1'

  if item == @item
    attributes[:class] << ' current'
  end

  # parse content and find <h2> tags
  unless item[:extension] =~ /(.md|.markdown)\Z/
    raise "Only markdown is supported as source format for menu item pages (got: #{item[:extension].inspect})" unless item[:extension] =~ /(.md|.markdown)\Z/
  end
  content = Kramdown::Document.new(item.raw_content).to_html
  doc = Nokogiri::HTML.parse(content)
  level2_links = []
  doc.xpath('//h2').each do |subheading|
    level2_links << link_to(subheading.content, "#{item.path}##{subheading['id']}", :class => 'level2')
  end

  link_to(text, item, attributes) + level2_links.join
end
