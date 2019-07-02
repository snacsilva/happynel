class Pesquisa < ApplicationRecord
    has_many :notas
    has_many :membros

    accepts_nested_attributes_for :notas

    validates_presence_of :pergunta

    before_update :is_blocked

    def media
        notas.average(:valor)#/(notas.length)
    end

    def self.create_nota nota
        
        @nota = Nota.new()
        @nota.valor = nota[:pesquisa][:valor].to_i,
        @nota.pesquisa_id = nota[:id].to_i
        @nota.save
    end

    private
    def is_blocked
        throw(:abort) if self.encerrada
    end

end
