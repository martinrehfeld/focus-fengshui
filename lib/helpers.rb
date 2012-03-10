def margin_image(image_path, options={})
  <<-HTML
    <div class="margin-image-wrapper">
      <div class="margin-image">
        #{options[:polaroid] && "<div class=\"polaroid-image\">"}
          <p>
            #{image_tag image_path, options}
          </p>
        #{options[:polaroid] && "</div>"}
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
