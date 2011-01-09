module AvatarHelper
  def avatar_url(user, size = 48)
    if user.avatar_url.present?
      user.avatar_url
    else
      email = user.email ? user.email.downcase : "nouser@plataformabooka.net"
      gravatar_id = Digest::MD5.hexdigest(email)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
    end
  end
end
