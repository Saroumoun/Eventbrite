class AdminMailer < ApplicationMailer
	default from: 'evenbrite-no-reply@monsite.fr'
 
  def new_attendee_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendee = attendance.attendee
    @event = attendance.event    
    @admin = attendance.event.admin

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://evenbrite-thp.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'You have a new attendee for your event!') 
  end
end
