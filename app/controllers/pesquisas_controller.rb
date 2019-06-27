class PesquisasController < ApplicationController
  def index
    @pesquisas = Pesquisa.all
  end

  def new
    @pesquisa = Pesquisa.new
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
  def update
    respond_to do |format|
      if @pesquisa.update(pesquisa_params)
        format.html { redirect_to @pesquisa, notice: 'pesquisa was successfully updated.' }
        format.json { render :show, status: :ok, location: @pesquisa }
      else
        format.html { render :edit }
        format.json { render json: @pesquisa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @pesquisa.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'pesquisa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pesquisa
   authorize @pesquisa = Pesquisa.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pesquisa_params
    params.require(:pesquisa).permit(:nome)
  end

end
