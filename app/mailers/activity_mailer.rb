class ActivityMailer < ActionMailer::Base
  default :from => "info@plataformabooka.net"

  def activity_report_email
    @activities = Activity.all
    mail(:to => User.first.email, :subject => "[Booka] Activity Report #{Time.now}")
  end
end
