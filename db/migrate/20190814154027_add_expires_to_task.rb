class AddExpiresToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expires, :date
  end
end
