class Admin::CommentsController < Admin::BaseController

  def edit
    @comment = Comment.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update_attributes comment_params
      @phone = Phone.find @comment.phone_id
      @comments = @phone.comments
      respond_to do |format|
        format.html { redirect_to @phone }
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @phone = @comment.phone
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @phone }
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :phone_id)
  end
end
