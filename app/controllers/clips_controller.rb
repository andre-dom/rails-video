class ClipsController < ApplicationController
  before_action :set_clip, only: %i[ show edit update destroy ]

  # GET /clips or /clips.json
  def index
    if user_signed_in?
      @clips = current_user.clips.paginate(page: params[:page], per_page: 8)
    else
      redirect_to root_path
    end
  end

  # GET /clips/1 or /clips/1.json
  def show
    @clip = Clip.friendly.find(params[:id])
  end

  # GET /clips/new
  def new
    @clip = current_user.clips.new
  end

  # GET /clips/1/edit
  def edit
  end

  # POST /clips or /clips.json
  def create
    @clip = current_user.clips.new(clip_params)

    respond_to do |format|
      if @clip.save
        format.html { redirect_to @clip, notice: "Clip was successfully created." }
        format.json { render :show, status: :created, location: @clip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clips/1 or /clips/1.json
  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to @clip, notice: "Clip was successfully updated." }
        format.json { render :show, status: :ok, location: @clip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clips/1 or /clips/1.json
  def destroy
    @clip.destroy
    respond_to do |format|
      format.html { redirect_to clips_url, notice: "Clip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clip
      @clip = Clip.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clip_params
      params.require(:clip).permit(:title, :video)
    end
end
