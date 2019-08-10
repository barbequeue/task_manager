class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :checked

      t.belongs_to :project, with_index: true

      t.timestamps
    end
  end
end
