class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
   @items = Item.all.order(created_at: "DESC")

  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.user_id != current_user.id
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end