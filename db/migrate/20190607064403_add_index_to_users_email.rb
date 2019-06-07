class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    # Dùng method add_index thêm 1 index vào cột email trong bảng users
    add_index :users, :email, unique: true
  end
end
