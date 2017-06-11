module ApplicationHelper
  def render_image(image, size, options = {})
    options = options.symbolize_keys
    unless options.key?(:class)
      options[:class] = 'ui image'
    end
    if image.present?
      if options.key?(:zoom_size)
        options['data-zoom-image'] = image.url(options[:zoom_size])
        options[:class] += ' zoom-image'
      end 
      image_tag image.url(size), options
    else
      image_tag 'no-image.png', options
    end
  end
end
