class IntsController < ApplicationController
  before_action :set_int, only: %i[ show edit update destroy ]

  # GET /ints or /ints.json
  def index
    @ints = Int.all
  end

  # GET /ints/1 or /ints/1.json
  def show
  end

  # GET /ints/new
  def new
    @int = Int.new
  end

  # GET /ints/1/edit
  def edit
  end

  # POST /ints or /ints.json
  def create
    @int = Int.new(int_params)

    respond_to do |format|
      if @int.save
        format.html { redirect_to int_url(@int), notice: "Int was successfully created." }
        format.json { render :show, status: :created, location: @int }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @int.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ints/1 or /ints/1.json
  def update
    respond_to do |format|
      if @int.update(int_params)
        format.html { redirect_to int_url(@int), notice: "Int was successfully updated." }
        format.json { render :show, status: :ok, location: @int }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @int.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ints/1 or /ints/1.json
  def destroy
    @int.destroy

    respond_to do |format|
      format.html { redirect_to ints_url, notice: "Int was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_int
      @int = Int.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def int_params
      params.fetch(:int, {})
    end
end
