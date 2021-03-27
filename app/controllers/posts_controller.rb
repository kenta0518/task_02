class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:create,:new,:show]}
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(
      r_name: params[:r_name],
      r_introduction: params[:r_introduction],
      r_price: params[:r_price],
      r_adress: params[:r_adress],
      r_image: params[:r_image],
      user_id: @current_user.id)
    if @post.save
      flash[:notice] = "ルームを登録しました！"
      redirect_to("/")
    else
      render action: "new"
    end
  end
  def search
    @posts = Post.search(params[:search],params[:free])
  end
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @posts.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end


  private
  def posts_params
    params.permit(:r_name,:r_introduction,:r_price,:r_adress,:r_image)
  end

end
