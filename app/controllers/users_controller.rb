class UsersController < ApplicationController
  before_action :authenticate_user, {only:[:mypage, :edit]}       #ログインなしの時
  before_action :forbid_login_user, {only:[:new, :create, :login_form, :login]}       #ログインありの時
  before_action :ensure_correct_user, {only:[:mypage, :myphoto, :edit, :update]}      #ユーザーのidが異なる時
  
  def mypage
    @user = User.find_by(id: params[:id])
  end
  
  def myphoto
    @request = Request.find_by(id: params[:id])
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      email: params[:email], 
      password: params[:password],
      name: params[:name]
      )

    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/mypage/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.email = params[:email]
    @user.password = params[:password]
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/mypage/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
    
  end
  
  def login
    @user=User.find_by(email: params[:email], password: params[:password])
    @worker=Worker.find_by(email: params[:email], password: params[:password])

    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/mypage/#{@user.id}")
    elsif @worker
      session[:worker_id]=@worker.id
      flash[:notice]="ログインしました"
      redirect_to("/mypage_worker/#{@worker.id}")
    else
      @error_message="メールアドレスまたはパスワードが間違っています"
      @email=params[:email]
      @password=params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
  
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/lovegraph/top")
    end
  end
  
end
