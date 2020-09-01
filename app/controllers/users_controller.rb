class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:index] #loginしていない人はindexアクション以外出来なくなる。
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert:"不正なアクセスです"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user) , notice: '更新に成功しました'
    else
      render :edit
    end
  end

  private #定番の書き方
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image) #userコントローラの、permit配下の情報４つを書き換える
  end
end
