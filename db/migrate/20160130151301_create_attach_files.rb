class CreateAttachFiles < ActiveRecord::Migration
  def change
    create_table :attach_files do |t|
      t.references :task, index: true, null: false
      t.text :name, null: false
      t.text :file
      t.timestamps null: false
    end

    add_foreign_key :attach_files, :tasks
  end
end
