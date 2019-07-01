class AddPesquisaIdToMembro < ActiveRecord::Migration[5.2]
  def change
    add_column :membros, :pesquisa_id, :integer
  end
end
