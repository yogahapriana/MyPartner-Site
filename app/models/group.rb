class Group < ActiveRecord::Base
  has_many :partners

  scope :named_like, lambda{|name| where("name LIKE ?", "%#{name}%")}  
end
