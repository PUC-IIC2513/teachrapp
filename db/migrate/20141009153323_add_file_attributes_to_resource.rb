class AddFileAttributesToResource < ActiveRecord::Migration
  def up
    add_attachment :resources, :file
  end
  def down
    remove_attachment :resources, :file
  end
end
