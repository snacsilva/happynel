# Preview all emails at http://localhost:3000/rails/mailers/membro
class MembroPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/membro/confirmation
  def confirmation
    MembroMailer.confirmation
  end

end
