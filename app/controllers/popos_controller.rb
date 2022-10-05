class PoposController < ApplicationController
  before_action :authenticate_user!
  before_action :set_popo, only: %i[ show edit update destroy ]

  # GET /popos or /popos.json
  def index
    @popos = Popo.all
  end

  # GET /popos/1 or /popos/1.json
  def show
  end

  # GET /popos/new
  def new
    @popo = Popo.new
  end

  # GET /popos/1/edit
  def edit
  end

  # POST /popos or /popos.json
  def create
    @popo = Popo.new(popo_params)

    respond_to do |format|
      if @popo.save
        format.html { redirect_to popo_url(@popo), notice: "Popo was successfully created." }
        format.json { render :show, status: :created, location: @popo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @popo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /popos/1 or /popos/1.json
  def update
    respond_to do |format|
      if @popo.update(popo_params)
        format.html { redirect_to popo_url(@popo), notice: "Popo was successfully updated." }
        format.json { render :show, status: :ok, location: @popo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @popo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /popos/1 or /popos/1.json
  def destroy
    @popo.destroy

    respond_to do |format|
      format.html { redirect_to popos_url, notice: "Popo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_popo
      @popo = Popo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def popo_params
      params.require(:popo).permit(:name, :date, :car, :description, :phone)
    end
end
