class CategoriesController < ApplicationController
  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end
  # GET /categories/new
  def new
    @category = Category.new
  end
  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def category_params
    params.expect(category: [:name])
  end
end
