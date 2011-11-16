class Reply < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  after_create :update_flags

  def update_flags
    self.message.recipients.each do |recipient|
      flag = MessageFlag.where("user_id=? AND message_id=?", recipient.user_id, self.message_id).first
      flag.update_attributes({readed: false})
    end
  end

  def send_mail_reply_message(user)
    self.message.recipients.each do |recipient|
      UserMailer.send_reply_message(recipient.user.email, user, self.message, self).deliver
    end
  end
  
end
