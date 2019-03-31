class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.references :imageable, polymorphic: true, index: true
      t.string :img_path
      t.timestamps
    end
  end
end
