class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
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
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki created!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end

  end

  def destroy
    @wiki = Wiki.find(wiki_params)
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(wiki_params)
     authorize @wiki
    if @wiki.save
      flash[:notice] = "Your changes have been made."
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again."
    end
  end

private
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
