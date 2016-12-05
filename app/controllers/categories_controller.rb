class CategoriesController < ApplicationController
    def show
      @category = Category.find_by id: params[:id]
      @phones = @category.phones.page params[:page]
      @top_phones = Phone.top_phones.order(created_at: :desc).limit(7)
    end
end