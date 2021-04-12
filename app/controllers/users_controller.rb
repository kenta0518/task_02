class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index , :edit, :account , :update ,:profile , :compilation]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update , :account , :profile , :compilation]}
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image:'default_user.jpg')
    if @user.save
      session[:user_id] = @user.id
      #log_in @user
      flash[:notice] = "Welcome to the Sample App!"
      redirect_to('/')
    else
      render action: "new"
    end
  end
  def edit
    @user = User.find_by(id: params[:id])
  end
  def account
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
  end
  def profile
    @user = User.find_by(id: params[:id])
  end
  def compilation
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.introduction = params[:introduction]
    if params[:image]
    @user.image = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{params[:id]}.jpg",image.read)
    end
    if @user.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/users/#{@user.id}/profile")
      else
      render "/users/#{@user.id}/profile"
      end
  end

  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]            
      @password = params[:password]            
      render("users/login_form")
    end
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
  def rooms
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
  def profile_params
    params.permit(:image,:name,:introduction)
  end

end
