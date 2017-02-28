class AppsController < ApplicationController
  before_action :set_user, :set_app
  skip_before_action :set_app, only: [ :index, :create ]

  # GET /apps
  def index
    @apps = @user.apps

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

    def app_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
