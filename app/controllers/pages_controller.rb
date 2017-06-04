class PagesController < ApplicationController

  def index
  end

  def about
    @page = Page.find_by(name: 'about_us')
    render template: 'pages/pages'
  end

  def contact
    @page = Page.find_by(name: 'contact_us')
    render template: 'pages/pages'
  end

  def terms
    @page = Page.find_by(name: 'terms_and_conditions')
    render template: 'pages/pages'
  end

  def privacy
    @page = Page.find_by(name: 'privacy_policy')
    render template: 'pages/pages'
  end

end
