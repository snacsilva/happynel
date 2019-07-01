class AddEncerradaToPesquisas < ActiveRecord::Migration[5.2]
  def change
    add_column :pesquisas, :encerrada, :boolean
  end
end
