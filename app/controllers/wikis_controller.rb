class WikisController < ApplicationController

  def index
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
   @wiki = current_user.wikis.build(params[:wiki])
    if @wiki.save
      flash[:notice] = "Wiki was created."
      redirect_to @wiki
    else
      render :new
    end
  end

  def destroy
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You need to be a member to edit wiki."
    if @wiki.update_attributes(params[:wiki])
      flash[:success] = "Your changes have been made."
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again."
    end
  end
end
