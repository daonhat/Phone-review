class SearchsController < ApplicationController

  def index
    @sum = @search.result.count
    @phones = @search.result.page(params[:page]).per(4)
    @top_phones = Phone.top_phones.order(created_at: :desc).limit(7)
  end
end
