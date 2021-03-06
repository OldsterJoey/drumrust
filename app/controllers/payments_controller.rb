class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    # The method called to utilise ultrahook webhook for third party communication between Stripe and the application
    def webhook
        payment_intent_id = params[:data][:object][:payment_intent]
        pp params[:data][:object][:charges]
        payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
        pp payment.charges
        product_id = payment.metadata.product_id
        buyer_id = payment.metadata.user_id
        puts "product: #{payment.metadata.product_id}"
        puts "buyer: #{payment.metadata.user_id}"
        product = Product.find(product_id)
        product.paid = true 
        product.save
        Purchase.create(user_id: buyer_id, product_id: product_id, payment_intent_id: payment_intent_id, receipt_url: payment.charges.data[0].receipt_url)
    end
end
