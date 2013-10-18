class TraderoomsController < ApplicationController
  before_action :set_traderoom, only: [:show, :edit, :update, :destroy]

  # GET /traderooms
  # GET /traderooms.json
  def index
    @traderooms = Traderoom.all
  end

  # GET /traderooms/1
  # GET /traderooms/1.json
  def show
  end

  # GET /traderooms/new
  def new
    @traderoom = Traderoom.new
  end

  # GET /traderooms/1/edit
  def edit
  end

  # POST /traderooms
  # POST /traderooms.json
  def create
    @traderoom = Traderoom.new(traderoom_params)

    respond_to do |format|
      if @traderoom.save
        format.html { redirect_to @traderoom, notice: 'Traderoom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @traderoom }
      else
        format.html { render action: 'new' }
        format.json { render json: @traderoom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traderooms/1
  # PATCH/PUT /traderooms/1.json
  def update
    respond_to do |format|
      if @traderoom.update(traderoom_params)
        format.html { redirect_to @traderoom, notice: 'Traderoom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @traderoom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traderooms/1
  # DELETE /traderooms/1.json
  def destroy
    @traderoom.destroy
    respond_to do |format|
      format.html { redirect_to traderooms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traderoom
      @traderoom = Traderoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traderoom_params
      params.require(:traderoom).permit(:name)
    end
end
