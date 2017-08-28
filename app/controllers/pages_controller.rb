class PagesController < ApplicationController
  # responsible for showing all pages
  def index
    # local var is only available in the method
    # if we want our view to have Access to the var
    # we need instance variable
    @pages = Page.all
    # render :index
  end
# responsible for showing specific page
  def show
    @page = Page.find(params[:id])
  end
# responsible for showing a form to edit existing page
  def edit
    @page = Page.find(params[:id])

  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render :edit
    end
  end
# responsible for showing a form to create a new page
  def new
    @page = Page.new
    #
  end
  # Strong params
  def create
    page = Page.new(page_params)
    #executes the sql to try to save the new page in the database
    if page.save
      # success - new record in the database
      redirect_to page_path(page)
    else
      # fail - failed to execute the sql for some reason
      render :new
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :body, :private)
end
end
