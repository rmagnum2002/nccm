class AddAttachmentAvatarToClients < ActiveRecord::Migration
  def self.up
    change_table :clients do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :clients, :avatar
  end
end
