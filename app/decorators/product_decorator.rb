class ProductDecorator < SimpleDelegator

  def price
    "PHP #{super}"
  end

  def packaged_weight
    "#{weight} kg(s) / #{unit}"
  end

  def directory_image_gallery
    if directory_image.url
      directory_image.gallery
    else
      ActionController::Base.helpers.asset_path('products/index/default-gallery.jpg')
    end
  end

  def directory_image_thumb
    if directory_image.url
      directory_image.thumb
    else
      ActionController::Base.helpers.asset_path('products/index/default-thumb.jpg')
    end
  end

end
