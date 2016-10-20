class Admin::CategoriesController < Admin::BaseController
load_and_authorize_resource

  def index
    @categories = @categories.page params[:page]
    @category = Category.new
  end

  def show
    @phones = @category.phones.page params[:page]
  end

  def create
    if @category.save
      flash[:success] = t :create_success
      redirect_to admin_categories_path
    else
      @categories = Category.page params[:page]
      render :index
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @category.update_attributes category_params
      @categories = Category.page params[:page]
      respond_to do |format|
        format.html {redirect_to admin_categories_path}
        format.js
      end
    end
  end

  def destroy
    @category.destroy
    @categories = Category.page params[:page]
    respond_to do |format|
      format.html {redirect_to admin_categories_path}
      format.js
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
