class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy_confirmation, :destroy]}
  before_action :authenticate_user!, {only: [:new, :create, :edit, :update]}
  

  protect_from_forgery

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    if user_signed_in?
      @post = Post.new(
       content: params[:content],
       user_name:current_user.name,
       user_id: current_user.id
      )
    else    
      flash[:notice] = "ログインしてください。"
      render("posts/new")
    end  
    if params[:post_image] == nil
      @post.post_image = "post_image_default.jpg"
    else  
      @post.post_image = params[:post][:post_image]
    end  
     # @post.image_name = "#{@post.id}.jpg"
    #  image = params[:image]
    #  File.binwrite("public/post_images/#{@post.image_name}", image.read)
    #end
    if @post.save
      flash[:notice] = "投稿を作成しました。"
      redirect_to("/posts/index")
    else
      flash[:notice] = "投稿を作成出来ませんでした。"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])

  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}", image.read)
    end

    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy_confirmation
    @post = Post.find_by(id: params[:id])
    @likes_count = Like.where(post_id: @post.id).count
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end  

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

private

def post_params
  params.require(:post).permit(:content,:post_image).merge(user_name: current_user.name,user_id: current_user.id)
end  

end