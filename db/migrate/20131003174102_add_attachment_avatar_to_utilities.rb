class AddAttachmentAvatarToUtilities < ActiveRecord::Migration
  def self.up
    change_table :utilities do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :utilities, :avatar
  end
end
