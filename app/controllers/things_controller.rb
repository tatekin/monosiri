class ThingsController < ApplicationController

  def index
    @things = Thing.all
    @numbers = Thing.all.sum(:number)
    @categories = Category.all
    @category = Category.new
  end

  def new
    @thing = Thing.new
    @categories = Category.all
  end
  
  def create
    @thing = Thing.new(thing_params)
    if @thing.save
      flash[:success] = "登録が完了しました"
      redirect_to root_path and return
    else
      flash.now[:alert] = "空欄を埋めてください"
      render :new
    end
  end
  
  def edit
    @thing = Thing.find(params[:id])
    @categories = Category.all
  end
  
  def update
    thing = Thing.find(params[:id])
    if thing.update(thing_params)
      redirect_to root_path and return
    else
      flash.now[:alert] = "空欄を埋めてください"
      render :edit
    end
  end

  def destroy
    thing = Thing.find(params[:id])
    thing.destroy
    redirect_to root_path
  end

  private
    def thing_params
      params.require(:thing).permit(:name, :number, :category_id)
    end
end
