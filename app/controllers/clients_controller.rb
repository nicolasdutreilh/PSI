class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_payment_rules, only: [:create, :update]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
  assign_payment_rules_to_client

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    assign_payment_rules_to_client

    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

  def set_payment_rules
    @payment_rules = PaymentRule.find_all_by_id(params[:client][:payment_rule_ids])
  end

  def assign_payment_rules_to_client
    @removed_payment_rules = @client.payment_rules - @payment_rules
    if @removed_payment_rules.present?
      @client.target_payment_rules.where(payment_rule_id: @removed_payment_rules.map(&:id)).destroy_all
    end

    if @payment_rules.present?
      @payment_rules.each do |rule|
        @client.target_payment_rules.build(payment_rule: rule) unless @client.payment_rules.include?(rule)
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:identifier, :name, :contact, :address, :country_code, :phone, :fax)
    end
end
