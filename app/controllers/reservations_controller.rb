class ReservationsController < ApplicationController
  before_action :authenticate_user
  def index
    @reservations = Reservation.where(user_id: @current_user.id)
  end
  def new
    @post = Post.find_by(id: params[:id])
    @reservation = Reservation.new
  end
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @posts.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end


  def create
    @post = Post.find_by(id: params[:id])
    @reservation = Reservation.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      people: params[:people],
      user_id: @current_user.id,
      post_id: params[:post_id],
      total_price: params[:total_price],
      p1_price: params[:p1_price]
    )
    if @reservation.save
      flash[:notice] = "予約を完了しました！"
      redirect_to("/")
    else
      flash[:notice] = "予約に失敗しました！"
      redirect_to("/")
    end
  end


end