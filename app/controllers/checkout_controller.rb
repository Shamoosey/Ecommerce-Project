# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    items = session[:cart]

    products = Product.find(items.keys)

    if products.nil?
      redirect_to root_path
      return
    end

    checkout_items = []

    price = 0
    quantity = 0

    items.each do |id, qty|
      product = Product.find(id)
      checkout_item = {
        name: product.name,
        description: product.description,
        amount: product.price * 100,
        currency: 'CAD',
        quantity: qty
      }
      quantity += qty
      price += product.price
      checkout_items << checkout_item
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: checkout_items,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    manitoba = Tax.where(province: 'Manitoba').first

    pst = price * (manitoba.pst / 100)
    gst = price * (manitoba.gst / 100)

    totalPrice = (price + pst + gst)

    Order.create(
      quantity: quantity,
      totalamount: totalPrice,
      subtotal: price,
      invoice: @session.id,
      pst: pst,
      gst: gst
    )

    respond_to do |format|
      format.js
    end
  end

  def cancel; end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    @order = Order.where(invoice: params[:session_id]).first
    session[:cart] = {}
  end
end
