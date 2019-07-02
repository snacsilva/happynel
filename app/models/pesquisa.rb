class Pesquisa < ApplicationRecord
    has_many :notas
    has_many :membros

    accepts_nested_attributes_for :notas

    validates_presence_of :pergunta

    before_update :is_blocked

    def media
        # notas
        # notas.map(&:sum(:nota))/
        notas.length
    end

    def self.create_nota nota
        @nota = Nota.new()
        @nota.valor = nota[:valor], 
        @nota.pesquisa_id = nota[:id]

        @nota.save
    end

    private
    def is_blocked
        throw(:abort) if self.encerrada
    end

end
