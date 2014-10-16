class AnnouncementMailer < ActionMailer::Base
  default from: "ubiquity@ing.puc.cl"

  def send_announcement(announcement, user)
    @user = user
    @announcement = announcement
    mail(to: @user.email, subject: "IIC2513 - #{@announcement.title}")
  end

end
