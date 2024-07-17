#class OrdersController < ApplicationController
 # before_action :authenticate_user! , only: [:index, :create]
  #before_action :set_item, only: [:index, :create]
  #before_action :move_to_index, only:[:index, :create]

  #def index
   #if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
    #  @item_order = ItemOrder.new
    #else
    #  redirect_to root_path
    #end
  #end

  #def create
   # @item_order = ItemOrder.new(order_params)
    #if @item_order.valid?
     # pay_item
      #@item_order.save
      #return redirect_to root_path
#    else
 #     render action: :index
 #   end
 # end

 # def edit
 # end

 # def update
  #  if current_user.update(user_params)
  #    redirect_to root_path
   # else
    #  render :edit, status: :unprocessable_entity
   # end
  #end

#  private

#  def user_params
 #   params.require(:user).permit(:name, :email)
 # end

  #def set_item
 #   @item = Item.find(params[:item_id])
  #end

#  def order_params
 #   params.require(:item_order).permit(:postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
 # end

  #def move_to_index
   # redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
 # end

#end
