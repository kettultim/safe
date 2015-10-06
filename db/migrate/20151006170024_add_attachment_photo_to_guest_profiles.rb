class AddAttachmentPhotoToGuestProfiles < ActiveRecord::Migration
  def self.up
    change_table :guest_profiles do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :guest_profiles, :photo
  end
end
