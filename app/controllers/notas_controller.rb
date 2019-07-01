class NotasController < ApplicationController
  before_action :set_nota, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notas = Nota.all
  end

  def new
    @nota = Nota.new
  end

  def create 
    @nota = Nota.new(pesquisa_params)

    respond_to do |format|
      if @nota.save
        format.html { redirect_to @nota, notice: 'pesquisa was successfully created.' }
        format.json { render :show, status: :created, location: @nota }
      else
        format.html { render :new }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end


  end
  def update
    respond_to do |format|
      if @nota.update(pesquisa_params)
        format.html { redirect_to @nota, notice: 'pesquisa was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota }
      else
        format.html { render :edit }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notas/1
  # DELETE /notas/1.json
  def destroy
    @nota.destroy
    respond_to do |format|
      format.html { redirect_to notas_url, notice: 'pesquisa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_nota
  #  authorize 
   @nota = Nota.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nota_params
    params.require(:nota).permit(:nota, :pesquisa_id)
  end
end
