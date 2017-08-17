class CommentsController < ApplicationController
  helper_method :comment, :comments

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @new_comment = post.comments.new(comment_params)
    @new_comment.user = current_user

    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: post }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # def update
  #   respond_to do |format|
  #     if comment.update(comment_params)
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def post
    @post = Post.find(params[:post_id])
  end

  def comments
    @comments ||= post.comments.all
  end

  def comment
    @comment ||= comments.find(params[:id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(:body)
  end

end
