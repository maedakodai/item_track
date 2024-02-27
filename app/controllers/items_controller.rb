class ItemsController < ApplicationController
  def index
    @items = Item.order(:id)
  end

  def new
    @item = Item.new
  end

  def create
    item = current_user.items.new(item_params)
    item.save!
    redirect_to items_path
  end


  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: "アイテム#{item.name}を削除しました"
  end

  private

  def item_params
    params.require(:item).permit(:name, :reminder_days_before_end, :start_at, :end_at)
  end
end
