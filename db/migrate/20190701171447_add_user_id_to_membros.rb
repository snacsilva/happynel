class AddUserIdToMembros < ActiveRecord::Migration[5.2]
  def change
    add_column :membros, :user_id, :integer
  end
end
