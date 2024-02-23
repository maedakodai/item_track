class ItemsController < ApplicationController
  def index
    @items = Item.all
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
  end

  private

  def item_params
    params.require(:item).permit(:name, :reminder_days_before_end, :start_at, :end_at)
  end
end
