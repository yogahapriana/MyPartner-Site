class Group < ActiveRecord::Base
  has_many :partners

  has_and_belongs_to_many :users

  scope :named_like, lambda{|name| where("name LIKE ?", "%#{name}%")}  
end
