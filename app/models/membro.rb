class Membro < ApplicationRecord
    belongs_to :pesquisa
    belongs_to :user

    after_create :send_confirmation

    def self.save_and_create_user params
        @member = Membro.create({
            pesquisa_id: params[:pesquisa_id], 
            respondeu: false,
            user_id: @user.id
        })
        @user = User.find_or_create(params) if @member
    end

    def membro_respondeu?
        respondeu
    end

    private 
    def send_confirmation
        MembroMailer.with(membro: self, id: self.id).confirmation.deliver_now
    end
end
