class CreateTasks < ActiveRecord::Migration

  class User < ActiveRecord::Base
    has_many :tasks
  end

  class Task < ActiveRecord::Base
    belongs_to :user
    STATE_NEW = :new
  end

  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.text :name, null: false
      t.text :description
      t.text :state, index: true, null: false, default: Task::STATE_NEW

      t.timestamps null: false
    end

    add_foreign_key :tasks, :users
  end
end
