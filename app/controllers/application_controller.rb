class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_current_user
  before_action :set_current_worker
  
  #idの引き継ぎ
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def set_current_worker
    @current_worker = Worker.find_by(id: session[:worker_id])
  end
  
  #未登録者のアクセス制限
  def authenticate_user
    if @current_user == nil
      flash[:notice]="ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def authenticate_worker
    if @current_worker == nil
      flash[:notice]="ログインが必要です"
      redirect_to("/login")
    end
  end
  
  #登録者のアクセス制限
  def forbid_login_user
    if @current_user
      flash[:notice]="すでにログインしています"
      redirect_to("/lovegraph/top")
    end
  end
  
  
end
