class AddAttachmentAvatarToTeamMembers < ActiveRecord::Migration
  def self.up
    change_table :team_members do |t|
      t.attachment :team_avatar
    end
  end

  def self.down
    drop_attached_file :team_members, :team_avatar
  end
end
