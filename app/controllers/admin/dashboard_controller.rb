class Admin::DashboardController < Admin::BaseController

  def index
    @users = User.all
    load_chart_data
  end

  private
  def load_chart_data
    @date = params[:date] || Date.today
    @start_date = @date.to_date - 7
    @end_date = @date.to_date
    load_user_sign_up_in_day
    load_phone_of_category
    #byebug
  end

  def load_user_sign_up_in_day
    @user_sign_up_chart_data = {}
    @users = User.created_between @start_date, @end_date
    @user_sign_up_chart_data = get_data @users, @user_sign_up_chart_data
  end

  def load_phone_of_category
    @phone_of_cate_data = {}
    @phones = Phone.all
    @categories = Category.all
    @phone_of_cate_data = get_data_phone @phones, @categories ,@phone_of_cate_data
  end

  def get_data datas, hash
    (@start_date..@end_date).each do |date|
      if datas.blank?
        hash[date] = 0
      else
        datas.each do |data|
          if data.created_at.to_date == date && hash[date]
            hash[date] += 1
          elsif data.created_at.to_date == date
            hash[date] = 1
          elsif hash[date].nil?
            hash[date] = 0
          end
        end
      end
    end
    hash = hash.map {|key, value| [key.to_s, value]}
  end

  def get_data_phone phones, categories ,hash
    categories.each do |category|
      phones.each do |phone|
        if phone.category == category && hash[category.name]
          hash[category.name] += 1
        elsif phone.category == category
          hash[category.name] = 1
        elsif hash[category.name].nil?
          hash[category.name] = 0
        end
      end
    end
    hash = hash.map {|key, value| [key, value]}
  end

end
