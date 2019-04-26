class AddAttachmentPersonalPhotoToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.attachment :personal_photo
    end
  end

  def self.down
    remove_attachment :users, :personal_photo
  end
end
