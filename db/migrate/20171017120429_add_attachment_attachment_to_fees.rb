class AddAttachmentAttachmentToFees < ActiveRecord::Migration[5.1]
  def self.up
    change_table :fees do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :fees, :attachment
  end
end
