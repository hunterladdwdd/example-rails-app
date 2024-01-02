class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def show; end

  def index
    @items = Item.all.order(id: :desc)
  end

  def destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params['id'])
  end

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
