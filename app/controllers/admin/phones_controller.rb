class Admin::PhonesController < Admin::BaseController
  load_and_authorize_resource
  @@phone_images_path = "phones/"
  def index
    @phones = Phone.page params[:page]
  end

  def show
    @comments = @phone.comments.page params[:page]
    @comment_count = @phone.comments.count
  end

  def new
    @categories = Category.all
  end

  def create
    @phone = current_user.phones.build phone_params
    if @phone.save
      upload_images @phone.id, params[:img] if params[:img].present?
      flash[:success] = t "phone_created"
      redirect_to admin_phone_path @phone
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @phone.update_attributes phone_params
      upload_images(@phone.id, params[:img]) if params[:img].present?
      flash[:success] = t :update_success
      redirect_to admin_phone_path @phone
    else
      @categories= Category.all
      render :edit
    end
  end

  def destroy
    @phone.destroy
    flash[:success] = t :destroy_success
    redirect_to admin_phones_path
  end

  private
  def phone_params
    params.require(:phone).permit :name, :description, :category_id, :os, :ram,
      :screen, :pin, :front_camera, :back_camera, :memory, :cpu
  end

  def upload_images phone_id, images_params
		current_time = Time.now.to_i.to_s
		new_name_folder = current_time
		image_root = 'public/'+ "#{@@phone_images_path}"
		phone_images_folder_path = image_root + "#{phone_id}" +"/"+ "#{new_name_folder}";
		phone_images_folder_url = "#{@@phone_images_path}" +"#{phone_id}" +"/"+ "#{new_name_folder}";
		images_params.each_with_index do |image_param, index|
			file_name = image_param.original_filename  if  (image_param !='')
			file = image_param.read

			file_type = file_name.split('.').last
			new_file_name_with_type = current_time + file_name

			FileUtils.mkdir_p(phone_images_folder_path);
			phone_image_path = phone_images_folder_path +"/"+ "#{new_file_name_with_type}"
			phone_image_url = phone_images_folder_url + "/" + "#{new_file_name_with_type}"
			File.open(phone_images_folder_path +"/"+ "#{new_file_name_with_type}", "wb")  do |f|
				f.write(file)
			end
			# save to db
			save_image phone_id, phone_image_url
		end
  end

	def save_image phone_id, phone_image_url
		Image.create phone_id: phone_id, image_url: phone_image_url
	end
end








