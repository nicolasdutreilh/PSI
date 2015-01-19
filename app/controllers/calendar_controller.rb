class CalendarController < ApplicationController
  before_action :authenticate_user!

  # GET /
  def index
    @events = InvoicePayment.all.select do |event|
      event.start_time.present?
    end
  end
end
