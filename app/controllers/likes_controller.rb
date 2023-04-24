class HomeController < ApplicationController
  before_action :authenticate_user!
    
  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:id])
    @like.save
    redirect_to("/posts/#{@like.post_id}")
  end
    
  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
    redirect_to("/posts/#{@like.post_id}")
  end

end