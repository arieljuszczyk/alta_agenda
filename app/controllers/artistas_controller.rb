class ArtistasController < AdminController
  # GET /artistas
  # GET /artistas.json
  def index
    @artistas = Artista.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artistas }
    end
  end

  # GET /artistas/1
  # GET /artistas/1.json
  def show
    @artista = Artista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artista }
    end
  end

  # GET /artistas/new
  # GET /artistas/new.json
  def new
    @artista = Artista.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artista }
    end
  end

  # GET /artistas/1/edit
  def edit
    @artista = Artista.find(params[:id])
  end

  # POST /artistas
  # POST /artistas.json
  def create
    @artista = Artista.new(params[:artista])

    respond_to do |format|
      if @artista.save
        format.html { redirect_to @artista, notice: 'Artista was successfully created.' }
        format.json { render json: @artista, status: :created, location: @artista }
      else
        format.html { render action: "new" }
        format.json { render json: @artista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artistas/1
  # PUT /artistas/1.json
  def update
    @artista = Artista.find(params[:id])

    respond_to do |format|
      if @artista.update_attributes(params[:artista])
        format.html { redirect_to @artista, notice: 'Artista was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artistas/1
  # DELETE /artistas/1.json
  def destroy
    @artista = Artista.find(params[:id])
    @artista.destroy

    respond_to do |format|
      format.html { redirect_to artistas_url }
      format.json { head :no_content }
    end
  end
end
