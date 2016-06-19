class Admin::ShippableCountriesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_country, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = ShippableCountry.includes(:zone).order('name asc')
  end

  def show
  end

  def new
    @current_item = ShippableCountry.new
  end

  def edit
  end

  def create
    @current_item = ShippableCountry.new(shipping_country_params)
    if @current_item.save
      redirect_to admin_shippable_countries_path, notice: 'Successfully created country'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    respond_to do |format|
      if @current_item.update_attributes(shipping_country_params)
        format.html { redirect_to admin_shippable_countries_path, notice: 'Successfully updated country' }
        format.json { head :no_content } # 204 No Content
      else
        format.html do
          flash.now[:error] = @current_item.errors.full_messages.to_sentence
          render action: "edit"
        end
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_shippable_countries_path
  end

  private

  def prepare_country
    @current_item = ShippableCountry.find(params[:id])
  end

  def shipping_country_params
    params.require(:shippable_country).permit(:name, :zone_id)
  end

end
