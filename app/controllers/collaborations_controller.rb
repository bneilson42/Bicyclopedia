class CollaborationsController < ApplicationController
  def create
    @collaboration = Collaboration.new(params)
    if @collaboration.save
      flash[:notice] = "Saved"
      redirect_to :back
    else
      flash[:error] = "Crappppp"
      redirect_to :back
    end
  end


end
