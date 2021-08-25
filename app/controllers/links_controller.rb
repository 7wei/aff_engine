class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.order("created_at DESC")
  end

  def show
  end


  def new
    @link = Link.new
  end

  def edit
  end


  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path()
    else
    end
  end

  def update
    if @link.update(link_params)
      redirect_to links_path()
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy

    redirect_to request.referrer
  end

  private

  def link_params
    params.require(:link).permit(
      :source,
      :url,
    )
  end

  def set_link
    @link = link.find(params[:id])
  end
end
