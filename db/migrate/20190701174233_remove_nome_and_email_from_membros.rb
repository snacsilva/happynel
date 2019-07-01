class RemoveNomeAndEmailFromMembros < ActiveRecord::Migration[5.2]
  def change
    remove_column :membros, :nome, :string
    remove_column :membros, :email, :string
  end
end
