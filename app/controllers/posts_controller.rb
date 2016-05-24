class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.order("id desc")
    respond_to do |format|  
      format.json { render json: @posts }
    end
  end

  # GET /posts/1/comments
  def comments
    @comments = Comment.where(post_id: params[:id])
    respond_to do |format|  
      format.json { render json: @comments }
    end
  end

  # GET /posts/1
  def show
    @post = Post.where(id: params[:id])
    respond_to do |format|  
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # GET /posts/1/curtir
  def curtir
    @post = Post.find(params[:id])

    respond_to do |format|  
      if(@post.curtidas.nil?)
        @post.curtidas = 0
      end
      @post.curtidas = @post.curtidas+1
      @post.save

      format.json { render json: @post }
    end
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.json { render :show, status: :created, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.json { render :show, status: :ok, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:titulo, :texto, :curtidas, :user_id)
    end
end
