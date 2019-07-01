class AddRespondeuToMembro < ActiveRecord::Migration[5.2]
  def change
    add_column :membros, :respondeu, :boolean
  end
end
