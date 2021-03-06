class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_admin, except: %i[index show]
  before_action :check_for_confirmed

  helper_method :post, :posts

  # GET /posts
  # GET /posts.json
  def index
    posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @new_comment = post.comments.build(params[:comment])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: I18n.t('controllers.posts.created') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if post.update(post_params)
        format.html { redirect_to post, notice: I18n.t('controllers.posts.updated') }
        format.json { render :show, status: :ok, location: post }
      else
        format.html { render :edit }
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: I18n.t('controllers.posts.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  def posts
    @posts ||= Post.all.order('posts.created_at DESC')
  end

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.fetch(:post, {}).permit(:title, :body)
  end

end
