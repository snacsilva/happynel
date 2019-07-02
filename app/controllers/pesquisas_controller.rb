class PesquisasController < ApplicationController
  before_action :set_pesquisa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @pesquisas = Pesquisa.all
  end

  def new
    @pesquisa = Pesquisa.new
  end

  def show 
  end

  def create 
    @pesquisa = Pesquisa.new(pesquisa_params)

    respond_to do |format|
      if @pesquisa.save
        format.html { redirect_to @pesquisa, notice: 'pesquisa was successfully created.' }
        format.json { render :show, status: :created, location: @pesquisa }
      else
        format.html { render :new }
        format.json { render json: @pesquisa.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @member = Membro.find_by_user_id current_user.id
    raise 'Usuário já votou.' if @member.membro_respondeu?

    Pesquisa.create_nota(notas_attributes.slice(:pesquisa, :id))
    respond_to do |format|
      if @pesquisa.save
        @member.update_attributes(respondeu: true)
        format.html { redirect_to @pesquisa, notice: 'pesquisa was successfully updated.' }
        format.json { render :show, status: :ok, location: @pesquisa }
      else
        format.html { render :edit }
        format.json { render json: @pesquisa.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pesquisa.destroy
    respond_to do |format|
      format.html { redirect_to pesquisas_url, notice: 'pesquisa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pesquisa
  #  authorize 
   @pesquisa = Pesquisa.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pesquisa_params
    params.require(:pesquisa).permit(:pergunta)
  end
  
  def notas_attributes
    request.parameters
  end
end
