class Message < ActiveRecord::Base

  with_options :dependent => :destroy do |message|
    message.has_many :recipients
    message.has_many :attachments
    message.has_many :replies
    message.has_many :message_flags
  end
  
  after_create :insert_flags

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :recipients
  accepts_nested_attributes_for :replies

  scope :my_inbox, lambda {|user_id|
    where(["recipients.user_id = ?", user_id]).includes(:recipients)
  }

  def insert_flags
    self.recipients.each do |recipient|
      MessageFlag.create({message_id: self.id, user_id: recipient.user_id, readed: false})
    end

    self.message_flags.create({user_id: self.user_id, readed: true})
  end
  
  def readed_by(user_id)
    flag = MessageFlag.where("user_id=? AND message_id=?", user_id, self.id).first
    flag.update_attributes({readed: true})
  end

  def unreaded_by(user_id)
    flag = MessageFlag.where("user_id=? AND message_id=?", user_id, self.id).first
    flag.update_attributes({readed: false})
  end

  def readed?(user_id)
    flag = MessageFlag.where("user_id=? AND message_id=?", user_id, self.id).first
    
    flag.readed? ? true : false
  end

  def send_mail_message(user)
    self.recipients.each do |recipient|
      UserMailer.send_message(recipient.user.email, user,self).deliver
    end
  end

end
