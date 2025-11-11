class AddPhotoToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :photo, :string
  end
end
