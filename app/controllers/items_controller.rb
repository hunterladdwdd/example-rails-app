class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to items_path
    else
      flash[:danger] = @item.errors.full_messages

      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params['id'])
  end

  def update
    @item = Item.find(params['id'])

    if @item.update(item_params)
      redirect_to items_path
    else
      flash[:danger] = @item.errors.full_messages

      redirect_to item_path(@item)
    end
  end

  def show
    @item = Item.find(params['id'])
  end

  def index
    @items = Item.all.order(id: :desc)
  end

  def destroy
    @item = Item.find(params['id'])

    puts @item.inspect

    @item.delete if @item

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
