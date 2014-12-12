class CollaborationsController < ApplicationController
  def create
    @collaboration = Collaboration.new(collaboration_params)
    if @collaboration.save
      flash[:notice] = "Saved"
      redirect_to :back
    else
      flash[:error] = "Crappppp"
      redirect_to :back
    end
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:wiki_id, :user_id)
  end



end
