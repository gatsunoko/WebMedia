class ConfigrationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_configration, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @configrations = Configration.all
  end

  def show
  end

  def new
    @configration = Configration.new
  end

  def edit
  end

  def create
    @configration = Configration.new(configration_params)

    respond_to do |format|
      if @configration.save
        format.html { redirect_to @configration, notice: 'Configration was successfully created.' }
        format.json { render :show, status: :created, location: @configration }
      else
        format.html { render :new }
        format.json { render json: @configration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @configration.update(configration_params)
        format.html { redirect_to @configration, notice: 'Configration was successfully updated.' }
        format.json { render :show, status: :ok, location: @configration }
      else
        format.html { render :edit }
        format.json { render json: @configration.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @configration.destroy
    respond_to do |format|
      format.html { redirect_to configrations_url, notice: 'Configration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_configration
      @configration = Configration.find(params[:id])
    end

    def configration_params
      params.require(:configration).permit(:eyecatch, :sitelogo, :home_icon)
    end

    def is_admin
      if current_user.role != 'admin'
        redirect_to root_path and return
      end
    end
end
