class WorkersController < ApplicationController
  before_action :authenticate_worker, {only:[:edit_worker]}
  before_action :forbid_login_master, {only:[:new_worker, :create, :index_worker]}
  before_action :ensure_correct_worker, {only:[:mypage_worker, :edit_worker, :update]}
  
  def index_worker
    @workers=Worker.all
  end
  
  def mypage_worker
    @worker = Worker.find_by(id: params[:id])
  end
  
  def new_worker
    @worker=Worker.new
  end
  
  def create
    @worker = Worker.new(name: params[:name], email: params[:email], password: params[:password], status: params[:status])

    if @worker.save
      session[:worker_id]=@worker.id
      flash[:notice] = "情報登録が完了しました"
      redirect_to("/mypage_worker/#{@worker.id}")
    else
      render("workers/new_worker")
    end
  end
  
  def edit_worker
    @worker = Worker.find_by(id: params[:id])
  end
  
  def update
    @worker = Worker.find_by(id: params[:id])
    @worker.email = params[:email]
    @worker.password = params[:password]
    @worker.status = params[:status]
    
    if @worker.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/mypage_worker/#{@worker.id}")
    else
      render("workers/edit_worker")
    end
  end
  
  def logout
    session[:worker_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
  
  def forbid_login_master
    
    if @current_worker.status != "master"
      flash[:notice]="権限がありません"
      redirect_to("/mypage_worker/#{@current_worker.id}")
    end
  end
  
  def ensure_correct_worker
    if @current_worker.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/mypage_worker/#{@current_worker.id}")
    end
  end
  
  
end
