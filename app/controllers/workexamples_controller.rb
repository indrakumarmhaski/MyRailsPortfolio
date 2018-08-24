class WorkexamplesController < ApplicationController
  before_action :set_workexample, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /workexamples
  def index
    @workexamples = Workexample.all
  end

  # GET /workexamples/1
  def show
  end

  # GET /workexamples/new
  def new
    @workexample = Workexample.new
  end

  # GET /workexamples/1/edit
  def edit
  end

  # POST /workexamples
  def create
    @workexample = Workexample.new(workexample_params)
    @workexample.user_id = current_user.id
    if @workexample.save
      redirect_to @workexample, notice: 'Workexample was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workexamples/1
  def update
    if @workexample.update(workexample_params)
      redirect_to @workexample, notice: 'Workexample was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workexamples/1
  def destroy
    @workexample.destroy
    redirect_to workexamples_url, notice: 'Workexample was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workexample
      @workexample = Workexample.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workexample_params
      params.require(:workexample).permit(:title, :description, :thumbimage, :mainimage, :user_id)
    end
end
