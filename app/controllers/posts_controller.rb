class PostsController < ApplicationController
  

  def show
    @post = Post.find_by(id: params[:id])
  end

  def index
    if params[:search].present?
       logger.debug("======================== params = #{params[:search]}")
      @posts = Post.where('content LIKE ?', "%#{params[:search]}%").or(Post.where('title LIKE ?', "%#{params[:search]}%")).order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      flash[:notice] =  "投稿されました！"
      redirect_to posts_path  
    else
      flash[:notice] =  "投稿出来ませんでした"
      render "posts/index"
    end    
  end

  def edit
    @post = Post.find_by(id: params[:id])
    
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] =  "投稿が編集されました"
      redirect_to post_path(@post)  
    else
      flash[:notice] =  "投稿の編集が出来ませんでした"
      render "posts/show"      
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] =  "投稿が削除されました"
      redirect_to posts_path
    else
      flash[:notice] =  "投稿の削除が出来ませんでした"
      render "posts/index"
    end
  end
  
  
  private
   def post_params
     params.require(:post).permit(:title, {videos: []}, :content, :youtube, {images: []}, :user_id)
   end
   

end


