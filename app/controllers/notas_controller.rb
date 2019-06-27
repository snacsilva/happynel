class NotasController < ApplicationController
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

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @nota.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'pesquisa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
