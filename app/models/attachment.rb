class Attachment < ActiveRecord::Base
  #  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :attached_file,
    :url => ':basename.:extension',
    :path => ':rails_root/tmp/attached_files/:id/:basename.:extension '
  
  belongs_to :messages
end
