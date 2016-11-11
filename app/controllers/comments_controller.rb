class CommentsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def create
   @comment = current_user.comments.build comment_params
   @phone = Phone.find @comment.phone_id
   if @comment.save
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
   else
     flash.now[:danger] = "error"
     redirect_to :back
   end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @comment.update_attributes comment_params
      @phone = Phone.find @comment.phone_id
      respond_to do |format|
        # format.html {redirect_to admin_categories_path}
        format.js
      end
    end
  end

  def destroy
    @comment = current_user.comments.find params[:id]
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
