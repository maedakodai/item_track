class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
  end


  def show
  end

  def edit
  end

  private

  def item_params
    params.require(item).permit(:name, :reminder_days_before_end)
  end
end
