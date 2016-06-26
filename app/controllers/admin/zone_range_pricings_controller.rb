class Admin::ZoneRangePricingsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_country, only: [:show, :edit, :update, :destroy]
  before_action :prepare_zones, only: [:index]
  before_action :prepare_zone, only: [:index]

  def index
    @current_items = @zone.zone_range_pricings.order('id asc')
  end

  def show
  end

  def new
    @current_item = ZoneRangePricing.new
  end

  def edit
  end

  def create
    @current_item = ZoneRangePricing.new(zone_range_pricing_with_weight_range_params)
    if @current_item.save
      redirect_to admin_zone_range_pricings_path, notice: 'Successfully created country'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    respond_to do |format|
      if @current_item.update_attributes(zone_range_pricing_with_weight_range_params)
        format.html { redirect_to admin_zone_range_pricings_path, notice: 'Successfully updated country' }
        format.json { head :no_content }
      else
        format.html do
          flash.now[:error] = @current_item.errors.full_messages.to_sentence
          render action: 'edit'
        end
        format.json { render json: @current_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_zone_range_pricings_path
  end

  private

  def prepare_country
    @current_item = ZoneRangePricing.find(params[:id])
  end

  def zone_range_pricing_params
    params.require(:zone_range_pricing).permit(:price, :zone_id)
  end

  def zone_range_pricing_with_weight_range_params
    weight_range = Range.new(params[:zone_range_pricing].dig(:weight_range, '0').to_i, params[:zone_range_pricing].dig(:weight_range, '1').to_i)
    zone_range_pricing_params.merge(weight_range: weight_range)
  end

  def prepare_zones
    @zones = Zone.all
  end

  def prepare_zone
    @zone = @zones.detect { |zone| zone.id == params[:zone_id].to_i } || @zones.first
  end

end
