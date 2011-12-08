class UserMailer < ActionMailer::Base
  default :from => Drxfer::Application.config.email_notification_from_address
  
  def transfer_confirmation(transfer)
    @transfer = transfer
    mail(:to => transfer.user.email, 
         :subject => "Thank you for transferring your digital records")
  end
  
  def transfer_notification(transfer)
    @transfer = transfer    
    mail(:to => Drxfer::Application.config.transfer_notification_recipient_addresses, 
         :subject => "A digital records transfer has been received")
  end
end
