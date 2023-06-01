# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

   def show
    @user = User.find_by(id: params[:id])
   end  
   
   def like
    @user = User.find_by(id:params[:id])
    @likes = Like.where(user_id: @user.id).order(id: :desc)
    @posts = @likes.map do |like|
      post = Post.find_by(id: like.post_id)
    end
   end
 
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
   
   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end
end
