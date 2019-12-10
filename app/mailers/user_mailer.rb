class UserMailer < ActionMailer::Base
  default :from => 'drxfer@example.com'

  def transfer_confirmation(transfer)
    @transfer = transfer
    mail(:to => transfer.user.email,
         :subject => Drxfer::Application.config.transfer_confirmation_subject)
  end

  def transfer_notification(transfer)
    @transfer = transfer
    mail(:to => ['drxfer.admin@example.com'],
         :subject => "A digital records transfer has been received")
  end
end
