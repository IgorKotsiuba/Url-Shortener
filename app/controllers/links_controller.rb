class LinksController < ApplicationController
  before_action :set_link, only: [:destroy]
  before_action :authenticate_user!

  def index
    @links = Link.where(user_id: current_user.id)
                 .order('created_at DESC')
                 .paginate(page: params[:page], per_page: 10)
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
          return render 'links/404.html', status: 404
        end
      else
        redirect_to root_path
      end
    end
  end

  def new
    if current_user.subscriptions.last.link_count == 0
      flash[:alert] = 'Sorry, you have used all available links for this plan!!!
                        In order to proceed, please make new payment.'
      redirect_to links_path
    else
      @link = current_user.links.build
    end
  end

  def create
    @link = current_user.links.build(link_params)
    @subscription = current_user.subscriptions.last
    respond_to do |format|
      if @link.save
        @subscription.link_count -= 1
        @subscription.save
        if @subscription.link_count == 0
          flash[:notice] = 'Link was successfully created.'
        else
          flash[:notice] = 'Link was successfully created. You are out of plan.
                            In order to proceed, please make new payment.'
        end
        format.html { redirect_to links_path}
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
