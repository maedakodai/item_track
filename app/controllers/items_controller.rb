class ItemsController < ApplicationController
  before_action :check_items_status
  def index
    @items = current_user.items.order(:id)
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
    @item = current_user.items.find(params[:id])
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      @item.to_using# アイテムのステータスをチェックして必要に応じて更新
      flash[:success] = "#{@item.name}が使用中に更新されました。"
      redirect_to items_path
    else
      render :edit
    end
  end


  def destroy
    item = current_user.items.find(params[:id])
    item.destroy
    flash[:success] = "#{item.name}を削除しました。"
    redirect_to items_path 
  end

  def complete
    @item = current_user.items.find(params[:id])
    @item.completed!
    flash[:success] = "#{@item.name}交換完了に更新されました。"
    redirect_to items_path 
  end



  private

  def item_params
    params.require(:item).permit(:name, :reminder_days_before_end, :start_at, :end_at)
  end

  def check_items_status
    current_user.items.each do |item|
      item.to_recommended
    end
  end
end
