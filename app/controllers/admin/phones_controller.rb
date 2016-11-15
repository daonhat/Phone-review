class Admin::PhonesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @phones = Phone.page params[:page]
  end

  def show

  end

  def new
    @categories = Category.all
  end

  def create
    @phone = current_user.phones.build phone_params
    if @phone.save
      flash[:success] = t "phone_created"
      redirect_to admin_phone_path @phone
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @phone.update_attributes phone_params
      flash[:success] = t :update_success
      redirect_to admin_phone_path @phone
    else
      render :edit
    end
  end

  def destroy
    byebug
    @phone.destroy
    flash[:success] = t :destroy_success
    redirect_to admin_phones_path
  end

  private
  def phone_params
    params.require(:phone).permit :name, :description, :category_id, :os, :ram,
      :screen, :pin, :front_camera, :back_camera, :memory
  end
end
