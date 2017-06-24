class Admin::UsersController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_user, only: [:show, :edit, :update]

  def index
    @current_items = User.without_role(:admin).order('code asc')
  end

  def show
  end

  def new
    @current_item = User.new(code: SecureRandom.hex(4).upcase)
  end

  def edit
  end

  def create
    @current_item = User.new(user_params.merge(email: "user+#{User.count + 1}@nworld.com", password: 'password123'))
    if user_params[:code].present? && @current_item.save
      @current_item.add_role(role) if ['retailer', 'wholesaler'].include? role
      redirect_to admin_users_path, notice: 'Successfully created code'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @current_item.carts.empty? && user_params[:code].present? && @current_item.update_attributes(user_params)
      if ['retailer', 'wholesaler'].include? role
        @current_item.roles = []
        @current_item.add_role(role)
      end
      redirect_to admin_users_path, notice: 'Successfully updated code'
    else
      flash.now[:error] = 'Invalid code'
      render :edit
    end
  end

  private

  def prepare_user
    @current_item = User.without_role(:admin).find(params[:id])
  end

  def role
    @role ||= params[:user]&.delete(:role_ids)
  end

  def user_params
    params.require(:user).permit(:code)
  end

end
