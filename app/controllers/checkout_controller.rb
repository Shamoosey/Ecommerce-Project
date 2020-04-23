# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :initialize_session

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
    totalPrice = 0

    tax = Tax.find(session[:tax]['id'])
    pstRate = (tax.pst / 100)
    gstRate = (tax.gst / 100)

    items.each do |id, qty|
      product = Product.find(id)
      pst = product.price * pstRate
      gst = product.price * gstRate

      checkout_item = {
        name: product.name,
        description: product.description,
        amount: ((product.price + gst + pst) * 100).to_i,
        currency: 'CAD',
        quantity: qty
      }

      quantity += qty
      price += product.price
      totalPrice += (product.price + gst + pst)
      puts totalPrice
      checkout_items << checkout_item
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: checkout_items,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    order = Order.create(
      quantity: quantity,
      totalamount: totalPrice,
      subtotal: price,
      invoice: @session.id,
      pst: pstRate,
      gst: gstRate
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

  def province
    id = params[:province_id]
    session[:tax] = Tax.find(id)
    redirect_to root_path
  end

  def initialize_session
    session[:cart] ||= {}
    session[:tax] ||= Tax.where(province: 'Manitoba').first
  end
end
