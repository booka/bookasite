class UserMailer < ActionMailer::Base
  default :from => "booka@plataformabooka.net"

  def invitation_email(user)
    @user = user
    mail(:to => user.email, :subject => 'Invitadx a participar en plataformabooka.net')
  end
end
