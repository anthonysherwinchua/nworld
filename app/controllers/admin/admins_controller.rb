class Admin::AdminsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_user, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = User.with_role(:admin).order('email asc')
  end

  def show
  end

  def new
    @current_item = User.new
  end

  def edit
  end

  def create
    @current_item = User.new(user_params.merge(password: 'password123'))
    if @current_item.save
      redirect_to admin_admins_path, notice: 'Successfully created user'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @current_item.update_attributes(user_params)
      redirect_to admin_admins_path, notice: 'Successfully updated user'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_admins_path
  end

  private

  def prepare_user
    @current_item = User.find(params[:id])
  end

  def user_params
    params.require(:admin).permit(:email)
  end

end
