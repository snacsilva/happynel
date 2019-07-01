class RenameNotasToNotaValor < ActiveRecord::Migration[5.2]
  def change
    rename_column :notas, :nota, :valor
  end
end
