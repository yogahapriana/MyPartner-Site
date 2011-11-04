class Message < ActiveRecord::Base
  has_many :recipients
  has_many :attachments

  accepts_nested_attributes_for :attachments

end
