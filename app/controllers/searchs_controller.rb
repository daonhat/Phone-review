class SearchsController < ApplicationController

  def index
    @sum = @search.result.count
    @phones = @search.result.page(params[:page]).per(4)
  end
end
