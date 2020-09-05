class ServicesController < ApplicationController
  before_action :authenticate_user!, except:[:index] #loginしていない人はindexアクション以外出来なくなる。
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @comments = @service.comments
    @comment = @service.comments.build
  end

  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])
    if @service.user != current_user
      redirect_to services_path, alert:"不正なアクセスです"
    end
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if @service.save
      redirect_to service_path(@service), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path(@service), notice: '更新に成功しました'
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to service_path(@service)
  end

  private
  def service_params
    params.require(:service).permit(:title, :company, :device, :problem, :price, :days, :result, :body, :image)
  end
end
