class LocsController < ApplicationController
  before_action :set_loc, only: [:show, :edit, :update, :destroy]

  # GET /locs
  # GET /locs.json
  def index
    @locs = Loc.all
  end

  # GET /locs/1
  # GET /locs/1.json
  def show
  end

  # GET /locs/new
  def new
    @loc = Loc.new
  end

  # GET /locs/1/edit
  def edit
  end

  # POST /locs
  # POST /locs.json
  def create
    @loc = Loc.new(loc_params)

    respond_to do |format|
      if @loc.save
        format.html { redirect_to @loc, notice: 'Loc was successfully created.' }
        format.json { render :show, status: :created, location: @loc }
      else
        format.html { render :new }
        format.json { render json: @loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locs/1
  # PATCH/PUT /locs/1.json
  def update
    respond_to do |format|
      if @loc.update(loc_params)
        format.html { redirect_to @loc, notice: 'Loc was successfully updated.' }
        format.json { render :show, status: :ok, location: @loc }
      else
        format.html { render :edit }
        format.json { render json: @loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locs/1
  # DELETE /locs/1.json
  def destroy
    @loc.destroy
    respond_to do |format|
      format.html { redirect_to locs_url, notice: 'Loc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loc
      @loc = Loc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loc_params
      params.require(:loc).permit(:coordinate, :address_1, :address_2, :city, :state, :postal_code)
    end
end
