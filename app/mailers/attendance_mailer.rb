class AttendanceMailer < ApplicationMailer
  default from: 'jeremy.h8@hotmail.fr'

  def new_attendance_email(admin)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @admin
    @admin = admin

    @url  = 'http://thp-eventbrite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Nouveau participant !')
  end
end
