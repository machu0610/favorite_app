class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #sign_inした時の画面遷移 #(resource)はresourceの書き方
    user_path
  end

  def after_sign_up_path_for(resource) #sign_upした時の画面遷移
    user_path
  end

  def after_sign_out_path_for(resource_or_sccope) #sign_outした時の画面遷移
    new_user_session_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #これで新規登録するときに名前も新規登録できるようになる。
end

#privateは、自分からしか見えないメソッド
#protectedは、一般の人から見られたくないが、仲間(クラスが同じオブジェクト)からは見えるメソッド
