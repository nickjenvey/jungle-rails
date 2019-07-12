class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    raise "Yay, I'm here!"
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
