module ServicesHelper
  def avatar_url(user, size = 48)
    if user.avatar_url.present?
    user.avatar_url
    else
      email = user.email ? user.email.downcase : "nouser@plataformabooka.net"
      gravatar_id = Digest::MD5.hexdigest(email)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
    end
  end

  def disqus(model, hash_path)
    render :partial => '/shared/disqus', :locals => {:id => model.id, :model_name => model.class.to_s, :path => polymorphic_path(hash_path) }
  end
end
