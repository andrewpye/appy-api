class AppsController < ApplicationController
  before_action :set_user, :set_app
  skip_before_filter :set_app, only: [ :index, :create ]

  # GET /apps
  def index
    query = nil

    case @user.role
    when "admin"
      # Return all apps that are submitted or approved.
      query = { status: [ "submitted", "approved" ] }
    when "developer"
      # Return the apps created by this user.
      query = { created_by: @user }
    end

    @apps = App.where(query)

    render json: @apps
  end

  # GET /apps/1
  def show
    render json: @app
  end

  # POST /apps
  def create
    @app = App.new(app_params)

    if @app.save
      render json: @app, status: :created, location: @app
    else
      render json: @app.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /apps/1
  def update
    if @app.update(app_params)
      render json: @app
    else
      render json: @app.errors, status: :unprocessable_entity
    end
  end

  # DELETE /apps/1
  def destroy
    @app.destroy
  end

  private
    # Grab the user from the authentication header
    def set_user
      user_id = request.headers["HTTP_USER_ID"]
      @user = User.find(user_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def app_params
      params.require(:app).permit(:name, :description, :status)
    end
end
