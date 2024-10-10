class AddNameToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :born, :date
    add_column :users, :terms, :boolean
  end
end
