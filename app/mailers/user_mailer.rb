class UserMailer < ActionMailer::Base
  default :from => "admin@example.org"

  def send_message(email_address, sender, message)
    @sender = sender
    @message = message
    @url = "#{SITE_URL}/reply/#{message.id}"

    mail(:to => email_address,
      :subject => "[MyParner-Site] - #{message.subject}")
  end

  def send_reply_message(email_address, sender, message, reply)
    @sender = sender
    @message = message
    @reply = reply
    @url = "#{SITE_URL}/reply/#{message.id}"
    
    mail(:to => email_address,
      :subject => "[MyParner-Site] - #{message.subject}")
  end
end