class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title, null: false
      t.text :content
      t.integer :level, null: false, default: 1
      t.boolean :notify, default: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
