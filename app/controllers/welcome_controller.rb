class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.paginate(page: params[:page], per_page: 10)
  end
end
