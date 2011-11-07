class Message < ActiveRecord::Base
  has_many :recipients
  has_many :attachments
  has_many :replies
  has_many :message_flags
  after_create :insert_flags

  def insert_flags
    self.recipients.each do |recipient|
      self.message_flags.create({recipient_id: recipient.user_id, readed: false})
    end

    self.message_flags.create({user_id: self.user_id, readed: true})
  end
  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :recipients
  accepts_nested_attributes_for :replies
end
