class Admin::PhonesController < Admin::BaseController
  load_and_authorize_resource
  @@phone_images_path = "public/phones/"
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
      upload_images @phone.id, params[:img]
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
    @phone.destroy
    flash[:success] = t :destroy_success
    redirect_to admin_phones_path
  end

  private
  def phone_params
    params.require(:phone).permit :name, :description, :category_id, :os, :ram,
      :screen, :pin, :front_camera, :back_camera, :memory
  end

  def upload_images phone_id, images_params
      current_time = Time.now.to_i.to_s
      new_name_folder = current_time
      image_root = "#{@@phone_images_path}"
      phone_images_folder_path = image_root + "#{phone_id}" +"/"+ "#{new_name_folder}";
      
      images_params.each_with_index do |image_param, index| 
        file_name = image_param.original_filename  if  (image_param !='')    
        file = image_param.read    

        file_type = file_name.split('.').last
        new_file_name_with_type = current_time + file_name + file_type

        FileUtils.mkdir_p(phone_images_folder_path);
        File.open(phone_images_folder_path +"/"+ "#{new_file_name_with_type}", "wb")  do |f|  
          f.write(file) 
        end 
      end
     
  end


end
