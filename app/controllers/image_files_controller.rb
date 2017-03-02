class ImageFilesController < ApplicationController
  before_action :set_image_file, only: [:show, :update, :destroy]

  # GET /image_files
  def index
    @image_files = ImageFile.all

    render json: @image_files
  end

  # GET /image_files/1
  def show
    render json: @image_file
  end

  # POST /image_files
  def create
    @image_file = ImageFile.new(image_file_params)

    # Set the version counter to 1.
    @image_file.version = 1

    if @image_file.save
      render json: @image_file, status: :created, location: @image_file
    else
      render json: @image_file.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /image_files/1
  def update
    if @image_file.update(image_file_params)
      # Increment the version counter.
      @image_file.increment!(:version)

      render json: @image_file
    else
      render json: @image_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /image_files/1
  def destroy
    @image_file.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_file
      @image_file = ImageFile.find(params[:id])
    end

    def image_file_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
