class LugaresController < ApplicationController
  # GET /lugares
  # GET /lugares.json
  def index
    @lugares = Lugar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lugares }
    end
  end

  # GET /lugares/1
  # GET /lugares/1.json
  def show
    @lugar = Lugar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lugar }
    end
  end

  # GET /lugares/new
  # GET /lugares/new.json
  def new
    @lugar = Lugar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lugar }
    end
  end

  # GET /lugares/1/edit
  def edit
    @lugar = Lugar.find(params[:id])
  end

  # POST /lugares
  # POST /lugares.json
  def create
    @lugar = Lugar.new(params[:lugar])

    respond_to do |format|
      if @lugar.save
        format.html { redirect_to @lugar, notice: 'Lugar was successfully created.' }
        format.json { render json: @lugar, status: :created, location: @lugar }
      else
        format.html { render action: "new" }
        format.json { render json: @lugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lugares/1
  # PUT /lugares/1.json
  def update
    @lugar = Lugar.find(params[:id])

    respond_to do |format|
      if @lugar.update_attributes(params[:lugar])
        format.html { redirect_to @lugar, notice: 'Lugar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lugar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lugares/1
  # DELETE /lugares/1.json
  def destroy
    @lugar = Lugar.find(params[:id])
    @lugar.destroy

    respond_to do |format|
      format.html { redirect_to lugares_url }
      format.json { head :no_content }
    end
  end
end
