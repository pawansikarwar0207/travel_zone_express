  class OrdersController < ApplicationController
      before_action :authenticate_user!
      
      def index
        @orders = Order.includes(:food_items).order(created_at: :desc)
      end

      def new
        if params[:food_item_ids]
          @food_items = FoodItem.where(id: params[:food_item_ids])
        else
          @food_items = []
        end
        @order = Order.new
        @food_items = FoodItem.all
      end

      def create
        @order = current_user.orders.build(order_params)
        @order.status = 'pending'
        @order.total_price = calculate_total_price(@order)
        @order.delivery_time = Time.current + estimated_delivery_time(@order)
      
        if @order.save
          params[:order][:quantity].each do |food_item_id, quantity|
            next if quantity.to_i <= 0
      
            @order.order_items.create(
              food_item_id: food_item_id,
              quantity: quantity.to_i
            )
          end
      
          redirect_to order_path(@order), notice: 'Order was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def show
        @order = current_user.orders.find(params[:id])
      end
    
      def update
        @order = Order.find(params[:id])
      
        # Update only the status field using params[:order][:status]
        if @order.update(status: params[:order][:status])
          redirect_to orders_path, notice: "Order status updated successfully."
        else
          redirect_to orders_path, alert: "Failed to update order status."
        end
      end          

      private
    
      def order_params
        params.require(:order).permit(:status, order_items_attributes: [:food_item_id, :quantity])
      end      
    
      def calculate_total_price(order)
        total = 0
        params[:order][:food_item_ids].each_with_index do |food_item_id, index|
          next if food_item_id.blank?
    
          food_item = FoodItem.find(food_item_id)
          quantity = params[:order][:quantity][food_item_id.to_i].to_i
          total += food_item.price * quantity
        end
        total
      end

      def estimated_delivery_time(order)
        max_time = order.food_items.maximum(:preparation_time)
        return 0.minutes if max_time.nil?  # Set a default value, e.g., 0 minutes, or any desired fallback time
      
        max_time.minutes
      end    
    
  end
