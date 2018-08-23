class WorkExamplesController < ApplicationController
  before_action :set_work_example, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /work_examples
  def index
    @work_examples = WorkExample.all
  end

  # GET /work_examples/1
  def show
  end

  # GET /work_examples/new
  def new
    @work_example = WorkExample.new
  end

  # GET /work_examples/1/edit
  def edit
  end

  # POST /work_examples
  def create
    @work_example = WorkExample.new(work_example_params)

    if @work_example.save
      redirect_to @work_example, notice: 'Work example was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /work_examples/1
  def update
    if @work_example.update(work_example_params)
      redirect_to @work_example, notice: 'Work example was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /work_examples/1
  def destroy
    @work_example.destroy
    redirect_to work_examples_url, notice: 'Work example was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_example
      @work_example = WorkExample.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_example_params
      params.require(:work_example).permit(:title, :description, :ThumbImage, :MainImage)
    end
end
