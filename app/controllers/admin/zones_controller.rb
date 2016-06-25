class Admin::ZonesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_zone, only: [:show, :edit, :update, :destroy]

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
    @current_item = Zone.new(zone_params)
    if @current_item.save
      redirect_to admin_zones_path, notice: 'Successfully created zone'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @current_item.update_attributes(zone_params)
      redirect_to admin_zones_path, notice: 'Successfully updated zone'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_zones_path
  end

  private

  def prepare_zone
    @current_item = Zone.find(params[:id])
  end

  def zone_params
    params.require(:zone).permit(:name, :courier_id)
  end

end
