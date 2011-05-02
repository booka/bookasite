class UserMailer < ActionMailer::Base
  default :from => "booka@plataformabooka.net"

  HOST = Rails.env.production? ? 'http://plataformabooka.net' : 'http://localhost:3000'

  def invitation_email(user)
    @user = user
    mail(:to => user.email, :subject => 'Invitadx a participar en plataformabooka.net')
  end

  def notification_email(user, notifications)
    @host = HOST
    @user = user
    @avatar_url = avatar_url(user, 40)
    @notifications = notifications
    mail(:to => user.email, :subject => 'Actividad en tus bokas - plataformabooka.net')
  end

  private
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
