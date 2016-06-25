class Admin::ZonesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_courier, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Zone.order('name asc')
  end

  def show
  end

  def new
    @current_item = Zone.new
  end

  def edit
  end

  def create
    @current_item = Zone.new(courier_params)
    if @current_item.save
      redirect_to admin_couriers_path, notice: 'Successfully created courier'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @current_item.update_attributes(courier_params)
      redirect_to admin_couriers_path, notice: 'Successfully updated courier'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_couriers_path
  end

  private

  def prepare_courier
    @current_item = Zone.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:name)
  end

end
