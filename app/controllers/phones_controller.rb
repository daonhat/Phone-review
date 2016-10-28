class PhonesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create]
  before_action :verify_admin, only: [:new, :create]

  def show
    @phone_avg = @phone.average("quality").nil? ? 0.0 : @phone.average("quality").avg
  end

  def new
    @categories = Category.all
  end

  def create
    @phone = current_user.phones.build phone_params
    if @phone.save
      flash[:success] = t "phone_created"
      redirect_to @phone
    else
      render :new
    end

  end

  private
  def phone_params
    params.require(:phone).permit(:name, :description, :category_id)
  end
end
