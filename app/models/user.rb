class User < ApplicationRecord
  has_many :membros
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def self.find_or_create params
    @user = User.find_by_email params[:email]

    raise 'Email já cadastrado, tente outro email' if @user

    unless @user.present?
      @user = User.create({nome: params[:nome],email: params[:email], admin: params[:admin], password: '123456'})
    end
    @user
  end
end
