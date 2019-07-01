class AddLinkToPesquisas < ActiveRecord::Migration[5.2]
  def change
    add_column :pesquisas, :link, :string
  end
end
