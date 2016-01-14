class CategoriesController < ApplicationController
  def new
    @page_title = 'Add Category'
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    # save the category
    if @category.save
        flash[:notice] = "Category Created"
        redirect_to root_path
    else
        render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
    @images = @category.images
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
          flash[:notice] = "Category Updated"
          redirect_to category_path(params[:id])
    else
          flash[:alert] = "Category Not Updated"
          render :action => 'edit'
      end
  end

  def destroy
      @category = Category.find(params[:id])

    if  @category.destroy
        flash[:notice] = "Category Removed"
        redirect_to root_path
    else
        render 'destroy'
    end
  end
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @images = @category.images
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
