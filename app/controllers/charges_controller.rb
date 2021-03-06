class ChargesController < ApplicationController

 def new
   @stripe_btn_data = {
     key: "#{ Rails.application.secrets.stripe_publishable_key }",
     description: "Premium Membership.",
     amount: Amount.default
   }
 end

   def create
    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: Amount.default,
        description: "Wiki Membership - #{current_user.email}",
        currency: 'usd'
    )

    flash[:success] = "Thanks for your payment, #{current_user.email}!"

    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.save

    redirect_to welcome_path, :notice => "Your subscription is active!"



  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
