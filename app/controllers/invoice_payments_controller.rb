class InvoicePaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice_payment, only: [:pay, :unpay]

  # GET /invoice_payments/1/pay
  def pay
    respond_to do |format|
      if @invoice_payment.update_attributes(paid: true)
        format.html { redirect_to root_path, notice: 'Invoice has been successfully marked as paid.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, alert: 'Invoice cannot be marked as paid.' }
        format.json { render json: @invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /invoice_payments/1/unpay
  def unpay
    respond_to do |format|
      if @invoice_payment.update_attributes(paid: false)
        format.html { redirect_to root_path, notice: 'Invoice has been successfully marked as unpaid.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, alert: 'Invoice cannot be marked as unpaid.' }
        format.json { render json: @invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_payment
      @invoice_payment = InvoicePayment.find(params[:id])
    end
end
