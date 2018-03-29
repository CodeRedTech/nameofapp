class PaymentController < ApplicationController

  def create
    token = params[:product_id]
    @user = current_user
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: 1000, # amount in cents, again
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )
      
      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
      )
        flash[:success] = "Your payment was processed successfully"
      end
      
      rescue Stripe::CardError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end
    redirect_to product_path(product)
  end
end
    
