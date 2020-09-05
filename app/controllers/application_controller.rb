class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller? #userがページにアクセスする前に下記を実行
  private #コントローラの中だけでしか下記メソッドを呼び出さない
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username]) #sign_up時にusernameを許可
  end


end
