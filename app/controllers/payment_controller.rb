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
      Order.create()
    end  
      
  rescue Stripe::CardError => e
    # The card has been declined
  end
  redirect_to product_path(product)
end
