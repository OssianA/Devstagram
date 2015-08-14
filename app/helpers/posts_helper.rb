module PostsHelper
  def preview_selector(post)
    return image_tag post.image.url(:medium),
                       id: 'image-preview',
                       class: 'img-responsive' if post.image.exists?
      image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end
end
