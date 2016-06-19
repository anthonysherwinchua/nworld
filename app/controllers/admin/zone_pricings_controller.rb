class Admin::ZonePricingsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_country, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = ZonePricing.includes(:zone).order('id asc')
  end

  def show
  end

  def new
    @current_item = ZonePricing.new
  end

  def edit
  end

  def create
    @current_item = ZonePricing.new(shipping_country_params)
    if @current_item.save
      redirect_to admin_zone_pricings_path, notice: 'Successfully created country'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    respond_to do |format|
      if @current_item.update_attributes(shipping_country_params)
        format.html { redirect_to admin_zone_pricings_path, notice: 'Successfully updated country' }
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = @current_item.errors.full_messages.to_sentence
          render action: "edit"
        end
        format.json { render json: @current_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_zone_pricings_path
  end

  private

  def prepare_country
    @current_item = ZonePricing.find(params[:id])
  end

  def shipping_country_params
    params.require(:zone_pricing).permit(:weight, :price, :zone_id)
  end

end
