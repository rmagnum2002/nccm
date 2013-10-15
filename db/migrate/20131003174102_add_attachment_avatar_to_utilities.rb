class AddAttachmentAvatarToUtilities < ActiveRecord::Migration
  def self.up
    change_table :utilities do |t|
      t.attachment :utility_image
    end
  end

  def self.down
    drop_attached_file :utilities, :utility_image
  end
end
