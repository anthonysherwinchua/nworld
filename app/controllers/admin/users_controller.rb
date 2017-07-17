class Admin::UsersController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_user, only: [:show, :update]

  def index
    @current_items = User.without_role(:admin).order('code asc')
  end

  def show
  end

  def new
    @current_item = CreateCodeForm.new
  end

  def edit
    @form = UpdateCodeForm.new(@current_item)
  end

  def create
    @current_item = CreateCodeForm.new(create_user_params[:name], create_user_params[:code], create_user_params[:role])
    if @current_item.save
      redirect_to admin_users_path, notice: 'Successfully created code'
    else
      render :new
    end
  end

  def update
    @current_item.roles = []
    @current_item.add_role('wholesaler')
    redirect_to admin_users_path, notice: 'successfully upgraded tier'
  end

  private

  def prepare_user
    @current_item = User.without_role(:admin).find(params[:id])
  end

  def create_user_params
    params.require(:create_code_form).permit(:name, :code, :role)
  end

end
