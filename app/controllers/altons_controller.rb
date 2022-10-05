class AltonsController < ApplicationController
  before_action :set_alton, only: %i[ show edit update destroy ]

  # GET /altons or /altons.json
  def index
    @altons = Alton.all
  end

  # GET /altons/1 or /altons/1.json
  def show
  end

  # GET /altons/new
  def new
    @alton = Alton.new
  end

  # GET /altons/1/edit
  def edit
  end

  # POST /altons or /altons.json
  def create
    @alton = Alton.new(alton_params)

    respond_to do |format|
      if @alton.save
        format.html { redirect_to alton_url(@alton), notice: "Alton was successfully created." }
        format.json { render :show, status: :created, location: @alton }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alton.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /altons/1 or /altons/1.json
  def update
    respond_to do |format|
      if @alton.update(alton_params)
        format.html { redirect_to alton_url(@alton), notice: "Alton was successfully updated." }
        format.json { render :show, status: :ok, location: @alton }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alton.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /altons/1 or /altons/1.json
  def destroy
    @alton.destroy

    respond_to do |format|
      format.html { redirect_to altons_url, notice: "Alton was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alton
      @alton = Alton.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alton_params
      params.require(:alton).permit(:name, :data, :car, :description)
    end
end
