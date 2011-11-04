class Attachment < ActiveRecord::Base
#  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :attached_file
end
