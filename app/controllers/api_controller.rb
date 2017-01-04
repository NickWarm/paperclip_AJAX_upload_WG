class ApiController < ApplicationController
  def image_upload
    @image = Image.create(img_params)

    if @image
      render :json => {:status => 'success', :image_url => @image.image.url}
    else
      render :json => {:status => 'fail'}
    end
  end


  private

  def img_params
      params.require(:image).permit(:image)
  end
end
