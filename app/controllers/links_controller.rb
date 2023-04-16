class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    @link = Link.find_by(given_url: link_params[:given_url])
    unless @link
      @link = Link.new(link_params)
      @link.short_url = "shortUrl"+SecureRandom.hex(3)
    end

    if @link.save
      redirect_to link_path(@link), notice: "Link created successfully."
    else
      render :index
    end
  end

  def show
    @link = Link.find(params[:id])
  end
  
  def redirect_to_original_url
    mapping = Link.find_by(short_url: params[:short_url])
    if mapping
      redirect_to mapping.given_url, allow_other_host: true
    else
      render plain: "Short URL not found", status: :not_found
    end
  end
  

  private

  def link_params
    params.require(:link).permit(:given_url)
  end
end


