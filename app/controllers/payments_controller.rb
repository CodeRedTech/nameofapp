class PaymentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @user = current_user

    token = params[:stripeToken]
   begin
      charge = Stripe::Charge.create(
        amount: (@product.price.to_i * 100),
        currency: "gbp",
        source: token,
        description: params[:stripeEmail]
      )

      if charge.paid
        if !current_user.nil?
          Order.create(
            product_id: @product.id,
            user_id: current_user.id,
            total: @product.price
              )
        end
          flash[:notice] = "Your payment was processed successfully"
      end
        
    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product)

  end
end
