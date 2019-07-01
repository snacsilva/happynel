class Pesquisa < ApplicationRecord
    has_many :notas

    validates_presence_of :pergunta

    before_update :is_blocked

    def media
        # notas
        # notas.map(&:sum(:nota))/
        notas.length
    end

    private
    def is_blocked
        throw(:abort) if self.encerrada
    end

end
