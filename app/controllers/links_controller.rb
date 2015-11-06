class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @links = Link.where(user_id: current_user.id)
                 .order('created_at DESC')
                 .paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def display_url
    if params[:short]
      @link = Link.find_by(short: params[:short])
      if @link.present?
        if @link.clicks == 0
          redirect_to @link.original
          @link.clicks += 1
          @link.save
        else
          render :text => 'Current link is not active anymore', :status => '404'
        end
      else
        redirect_to root_path
      end
    end
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    respond_to do |format|
      if @link.save
        flash[:success] = 'Link was successfully created.'
        format.html { redirect_to @link}
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:original)
    end
end
