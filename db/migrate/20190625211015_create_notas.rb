class CreateNotas < ActiveRecord::Migration[5.2]
  def change
    create_table :notas do |t|
      t.integer :nota 
      t.integer :pesquisa_id
      
      t.timestamps
    end
  end
end
