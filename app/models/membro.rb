class Membro < ApplicationRecord
    belongs_to :pesquisa

    after_create :send_confirmation


    private 
    def send_confirmation
        MembroMailer.with(membro: self).confirmation.deliver_now
    end
end
