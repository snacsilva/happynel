class CreatePesquisas < ActiveRecord::Migration[5.2]
  def change
    create_table :pesquisas do |t|
      t.string :pergunta

      t.timestamps
    end
  end
end
