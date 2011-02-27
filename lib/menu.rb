def menu_item(text, target, attributes={})
  # Find item
  item = target.is_a?(String) ? items.detect { |item| item.path == target } : target
  raise "Item #{target.inspect} could not be found!" unless item

  # set level according to path nesting
  if attributes[:class]
    attributes[:class] << ' '
  else
    attributes[:class] = ''
  end
  attributes[:class] << "level#{item.path.count('/') - 1}"

  # mark current item
  if item == @item
    attributes[:class] << ' current'
  end

  link_to(text, item, attributes)
end
