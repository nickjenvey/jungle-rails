class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @product = Category.new(product_params)

    if @product.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
