class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :project, index: true
      t.string :git_repo

      t.timestamps
    end
  end
end
