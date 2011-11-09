class Message < ActiveRecord::Base
  has_many :recipients
  has_many :attachments
  has_many :replies
  has_many :message_flags
  after_create :insert_flags

  scope :my_inbox, lambda {|user_id|
    where(["recipients.user_id = ?", user_id]).includes(:recipients)
  }

  def insert_flags
    self.recipients.each do |recipient|
#      self.message_flags.create({user_id: recipient.user_id, readed: false})
      MessageFlag.create({message_id: self.id, user_id: recipient.user_id, readed: false})
    end

    self.message_flags.create({user_id: self.user_id, readed: true})
  end
  
  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :recipients
  accepts_nested_attributes_for :replies

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
    
    if flag.readed
      true
    else
      false
    end
  end

  def send_mail_message(user)
    self.recipients.each do |recipient|
      UserMailer.send_message(recipient.user.email, user,self).deliver
    end
  end



end
