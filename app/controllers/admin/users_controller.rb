class Admin::UsersController < Admin::BaseController

  before_action :render_nothing

  private

  def render_nothing
    render nothing: true
  end

end
