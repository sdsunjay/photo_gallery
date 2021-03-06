class ImagesController < ApplicationController
  def new
    @page_title = 'Add Image'
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)

    # save the image
    if @image.save
        flash[:notice] = "Image Created"
        redirect_to root_path
    else
        render 'new'
    end
  end

  def destroy
      @image = Image.find(params[:id])

    if  @image.destroy
        flash[:notice] = "Image Removed"
        redirect_to root_path
    else
        render 'destroy'
    end
  end

  def index
     @images = Image.all
#if params[:search]
#        @images = Image.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])  
#      else
#        @images = Image.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
#      end
  end

  private
  def image_params
    params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
  end
end
