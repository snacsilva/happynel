class Nota < ApplicationRecord
    belongs_to :pesquisa

    before_update :is_blocked

    private
    
    def is_blocked
        throw(:abort) if pesquisa.encerrada
    end
end
