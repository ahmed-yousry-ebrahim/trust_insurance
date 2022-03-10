class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy mark_as_helpful mark_as_not_helpful]
  before_action :authenticate_user!, only: %i[ new create edit update ]

  # GET /experiences or /experiences.json
  def index
    @experiences = Experience.all
  end

  def search
    @experiences = Experience.all.left_joins(:user).order("users.reputation_points DESC")
    @experiences = @experiences.tagged_with(params[:tags]) if params[:tags].present?
  end

  def mark_as_helpful
    @experience.user.reputation_points = @experience.user.reputation_points + 1
    @experience.user.save

    redirect_to @experience, notice: "Review submitted successfully, thank you!"
  end

  def mark_as_not_helpful
    @experience.user.reputation_points = @experience.user.reputation_points - 1
    @experience.user.save

    redirect_to @experience, notice: "Review submitted successfully, thank you!"
  end

  # GET /experiences/1 or /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences or /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    respond_to do |format|
      if @experience.save
        format.html { redirect_to root_path, notice: "Experience was successfully created." }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1 or /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1 or /experiences/1.json
  def destroy
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def experience_params
      params.require(:experience).permit(:title, :description, :insurance_provider, :tag_list, :anonymous)
    end
end
