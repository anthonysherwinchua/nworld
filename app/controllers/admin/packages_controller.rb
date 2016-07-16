class Admin::PackagesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_package, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Package.order('price asc')
  end

  def show
  end

  def new
    @current_item = Package.new
  end

  def edit
  end

  def create
    @current_item = Package.new(package_params)
    if @current_item.save
      redirect_to admin_packages_path, notice: 'Successfully created package'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @current_item.update_attributes(package_params)
      redirect_to admin_packages_path, notice: 'Successfully updated package'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_packages_path
  end

  private

  def prepare_package
    @current_item = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:price, :worth)
  end

end
