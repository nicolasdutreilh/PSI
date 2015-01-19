class PaymentRulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment_rule, only: [:show, :edit, :update, :destroy]

  # GET /payment_rules
  # GET /payment_rules.json
  def index
    @payment_rules = PaymentRule.all
  end

  # GET /payment_rules/1
  # GET /payment_rules/1.json
  def show
  end

  # GET /payment_rules/new
  def new
    @payment_rule = PaymentRule.new
  end

  # GET /payment_rules/1/edit
  def edit
  end

  # POST /payment_rules
  # POST /payment_rules.json
  def create
    @payment_rule = PaymentRule.new(payment_rule_params)

    respond_to do |format|
      if @payment_rule.save
        format.html { redirect_to @payment_rule, notice: 'Payment rule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_rule }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_rules/1
  # PATCH/PUT /payment_rules/1.json
  def update
    respond_to do |format|
      if @payment_rule.update(payment_rule_params)
        format.html { redirect_to @payment_rule, notice: 'Payment rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_rules/1
  # DELETE /payment_rules/1.json
  def destroy
    @payment_rule.destroy
    respond_to do |format|
      format.html { redirect_to payment_rules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_rule
      @payment_rule = PaymentRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_rule_params
      params.require(:payment_rule).permit(:name, :percent, :period, :end_of_month, :since)
    end
end
