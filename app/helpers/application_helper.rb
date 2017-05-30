module ApplicationHelper
  def render_image(image, image_type, image_class='ui image')
    if image.present?
      image_tag image.url(image_type), class: image_class
    else
      image_tag 'no-image', class: image_class
    end
  end
  
  def render_image_with_zoom(image, image_type, large_image_type, image_class='ui image zoom-image')
    if image.present?
      image_tag image.url(image_type), 'data-zoom-image': image.url(large_image_type), class: image_class
    else
      image_tag 'no-image', class: image_class
    end
  end
end
