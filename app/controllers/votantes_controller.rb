class VotantesController < ApplicationController
  before_action :set_votante, only: [:show, :edit, :update, :destroy]

  # GET /votantes
  # GET /votantes.json
  def index
    @count = Votante.count
    if params[:search]
      @votantes = Votante.search(params[:search])
    else
      @votantes = Votante.all
    end
  end

  # GET /votantes/1
  # GET /votantes/1.json
  def show
  end

  # GET /votantes/new
  def new
    @votante = Votante.new
  end

  # GET /votantes/1/edit
  def edit
  end

  # POST /votantes
  # POST /votantes.json
  def create
    @votante = Votante.new(votante_params)

    respond_to do |format|
      if @votante.save
        format.html { redirect_to @votante, notice: 'El votante se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @votante }
      else
        format.html { render :new }
        format.json { render json: @votante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votantes/1
  # PATCH/PUT /votantes/1.json
  def update
    respond_to do |format|
      if @votante.update(votante_params)
        format.html { redirect_to @votante, notice: 'El votante se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @votante }
      else
        format.html { render :edit }
        format.json { render json: @votante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votantes/1
  # DELETE /votantes/1.json
  def destroy
    @votante.destroy
    respond_to do |format|
      format.html { redirect_to votantes_url, notice: 'El votante se ha eliminado exitosamented.' }
      format.json { head :no_content }
    end
  end

  def follow
    @votante = Votante.find_by cedula: params[:followerId]
    seguido = Votante.find_by cedula: params[:followedId]
    if seguido == @votante
      flash[:error] = 'You cannot follow yourself.'
    else
      @votante.follow(seguido)
      flash[:notice] = "#{@votante.nombres} ahora sigue a #{seguido.nombres}"
    end
    redirect_to votantes_url
  end

  def unfollow
    @votante = Votante.find_by cedula: params[:followerId]
    seguido = Votante.find_by cedula: params[:followedId]
    @votante.stop_following(seguido)
    flash[:notice] = "#{@votante.nombres} ya no sigue a #{seguido.nombres}"
    redirect_to votantes_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_votante
    @votante = Votante.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def votante_params
    params.require(:votante).permit(:nombres, :apellidos, :cedula, :direccion,
                                    :barrio, :comuna, :puesto, :mesa, :celular,
                                    :fijo, :email, :estadoCivil, :hijos,
                                    :fechaNacimiento, :profesion, :hobby,
                                    :followerId, :followedId, :search)
  end
end
