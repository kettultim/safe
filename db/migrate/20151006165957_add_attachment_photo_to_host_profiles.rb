class AddAttachmentPhotoToHostProfiles < ActiveRecord::Migration
  def self.up
    change_table :host_profiles do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :host_profiles, :photo
  end
end
