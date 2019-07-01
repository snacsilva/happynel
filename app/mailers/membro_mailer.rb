class MembroMailer < ApplicationMailer
  before_action :load_member

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.membro_mailer.confirmation.subject
  #

  def confirmation

    mail to: @member.user.email, 
    subject: "Queremos a sua opnião. Responda a enquete!"
  end

  private

  def load_member
    @member = Membro.find params[:id]
  end
end
