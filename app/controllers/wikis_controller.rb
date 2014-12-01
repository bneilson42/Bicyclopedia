class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    if request.path != wiki_path(@wiki)
      redirect_to @wiki, status: :moved_permanently
    end
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(params[:wiki])
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki created!"
      redirect_to @wiki
    else
      render :new
    end

  end

  def destroy
  end

  def update
    @wiki = Wiki.find(params[:id])
     authorize @wiki
    if @wiki.update_attributes(params[:wiki])
      flash[:success] = "Your changes have been made."
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again."
    end
  end


end
