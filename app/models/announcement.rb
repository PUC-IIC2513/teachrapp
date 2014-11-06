class Announcement < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 3 }

  # after_create :send_by_email

  def send_by_email
    # Por el momento, simplemente iteraremos en todos
    # los usuarios... pero esto puede tardar harto si son
    # muchos usuarios... en ese caso necesitaríamos hacer
    # de esto una operación asíncrona (que se siga realizando
    # en background, sin necesidad de detener el flujo del programa principal)
    User.all.each do |u|
      AnnouncementMailer.send_announcement(self, u).deliver
    end
  end
end
