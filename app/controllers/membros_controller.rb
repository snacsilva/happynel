class MembrosController < ApplicationController
  before_action :set_membro, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @membros = Membro.all
  end

  def new
    @membro = Membro.new
  end

  def show 
  end

  def create 
    @membro = Membro.save_and_create_user(membro_params)

    respond_to do |format|
      if @membro.save
        format.html { redirect_to @membro, notice: 'membro was successfully created.' }
        format.json { render :show, status: :created, location: @membro }
      else
        format.html { render :new }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end


  end
  def update
    raise 'Procedimento não permitido' if @membro.nil?
    @user = User.find(@membro.user_id)
    @user.update_attributes({email: params[:email], admin: params[:admin], nome: params[:nome]})
    respond_to do |format|
      if @membro.update(membro_params)
        format.html { redirect_to @membro, notice: 'membro was successfully updated.' }
        format.json { render :show, status: :ok, location: @membro }
      else
        format.html { render :edit }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    raise 'Procedimento não permitido' if @membro.nil? || @membro.user.id == current_user.id
    @user = User.find @membro.user_id
    @membro.destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to membros_url, notice: 'membro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_membro
  #  authorize 
   @membro = Membro.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def membro_params
    params.require(:membro).permit(:nome, :email, :pesquisa_id)
  end

end
