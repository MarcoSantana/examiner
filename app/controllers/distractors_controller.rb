class DistractorsController < ApplicationController
  before_action :set_distractor, only: [:show, :edit, :update, :destroy]

  # GET /distractors
  # GET /distractors.json
  def index
    @distractors = Distractor.all
  end

  # GET /distractors/1
  # GET /distractors/1.json
  def show
  end

  # GET /distractors/new
  def new
    @distractor = Distractor.new
  end

  # GET /distractors/1/edit
  def edit
  end

  # POST /distractors
  # POST /distractors.json
  def create
    @distractor = Distractor.new(distractor_params)

    respond_to do |format|
      if @distractor.save
        format.html { redirect_to @distractor, notice: 'Distractor was successfully created.' }
        format.json { render :show, status: :created, location: @distractor }
      else
        format.html { render :new }
        format.json { render json: @distractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distractors/1
  # PATCH/PUT /distractors/1.json
  def update
    respond_to do |format|
      if @distractor.update(distractor_params)
        format.html { redirect_to @distractor, notice: 'Distractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @distractor }
      else
        format.html { render :edit }
        format.json { render json: @distractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distractors/1
  # DELETE /distractors/1.json
  def destroy
    @distractor.destroy
    respond_to do |format|
      format.html { redirect_to distractors_url, notice: 'Distractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distractor
      @distractor = Distractor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def distractor_params
      params.require(:distractor).permit(:question_id, :option, :difficulty, :visible, :locked, :content, :right)
    end
end
