class Admin::PagesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_page, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Page.order('title asc')
  end

  def show
  end

  def edit
  end

  def update
    if @current_item.update_attributes(page_params)
      redirect_to admin_pages_path, notice: 'Successfully updated page'
    else
      flash.now[:error] = @current_item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_pages_path
  end

  private

  def prepare_page
    @current_item = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content, :tags)
  end

end
