class CategoriesController < ApplicationController

  def create
    Category.create(category_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)  
    end

end
