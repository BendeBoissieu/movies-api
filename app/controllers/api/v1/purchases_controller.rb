class Api::V1::PurchasesController < ApplicationController
  def index
    purchases = Purchase.all
    render json: {status: 'SUCCESS', message: 'Loaded purchases', data: purchases}, status: :ok
  end

  def create
    purchase = Purchase.new(purchase_params)
    purchase.user = User.first
    if purchase.save
      render json: {status: 'SUCCESS', message: 'purchase created', data: purchase}, status: :ok
    else
      render json: {status: 'ERROR', message: 'purchase not saved', data: purchase.errors}, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.permit(:purchase_option_id, :user_id)
  end
end
