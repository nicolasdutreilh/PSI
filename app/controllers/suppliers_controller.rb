class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  before_action :set_payment_rules, only: [:create, :update]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
  assign_payment_rules_to_supplier

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supplier }
      else
        format.html { render action: 'new' }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    assign_payment_rules_to_supplier

    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def set_payment_rules
      @payment_rules = PaymentRule.find_all_by_id(params[:supplier][:payment_rule_ids])
    end

    def assign_payment_rules_to_supplier
      @removed_payment_rules = @supplier.payment_rules - @payment_rules
      if @removed_payment_rules.present?
        @supplier.target_payment_rules.where(payment_rule_id: @removed_payment_rules.map(&:id)).destroy_all
      end

      if @payment_rules.present?
        @payment_rules.each do |rule|
          @supplier.target_payment_rules.build(payment_rule: rule) unless @supplier.payment_rules.include?(rule)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:identifier, :name, :address, :shipping_address, :contact_name, :contact_mail, :country_code, :phone, :fax)
    end
end
