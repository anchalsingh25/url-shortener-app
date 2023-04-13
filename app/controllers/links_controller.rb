class LinksController < ApplicationController
  def index
    @link = Link.new
  end

    def show
      @link = Link.find(params[:id])
      if params[:commit] == "Short url"
        @link.short_url = SecureRandom.hex(3)
        if @link.save
          redirect_to root_url, notice: "Short URL created successfully."
        else
          render :show
        end
      end
    end
  

  def new
    @link = Link.new
  end

  def create
    byebug
    @link = Link.new(given_url: params[:given_url])
    if @link.save
      redirect_to root_path, notice: "Link created successfully."
    else
      render :index
    end
  end

  private
  def link_params
    params.require(:links).permit(:given_url)
  end

  
end
