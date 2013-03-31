def margin_image(image_path, options={})
  polaroid = options.delete(:polaroid)
  <<-HTML
    <div class="margin-image-wrapper">
      <div class="margin-image">
        #{polaroid && "<div class=\"polaroid-image\">"}
          <p>
            #{options[:href] && "<a href=\"#{options[:href]}\">"}
            #{image_tag image_path, options}
            #{options[:href] && "</a>"}
          </p>
        #{polaroid && "</div>"}
      </div>
    </div>
    <div class="clearfix"></div>
  HTML
end

def image_tag(path, options)
  options[:alt] ||= path.split('/').last
  <<-HTML
    <img src="/images/#{path}" #{options.map { |k,v| "#{k}=\"#{v}\""}.join(' ')}>
  HTML
end

def page_id
  File.basename @item.identifier
end
