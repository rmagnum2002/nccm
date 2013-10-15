class TeamMember < ActiveRecord::Base
  has_attached_file :team_avatar,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  # after_save :convert_grayscale

  # def convert_grayscale
  #   system "convert public/system/avatars/#{self.id}/thumb/#{self.avatar.original_filename} -fx '(r+g+b)/3' public/system/avatars/#{self.id}/grayscale/#{self.avatar.original_filename}"
  # end
end
