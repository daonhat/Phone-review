class PhonesController < ApplicationController
  load_and_authorize_resource

  def show
    @phone_avg = @phone.average("quality").nil? ? 0.0 : @phone.average("quality").avg
  end
end
