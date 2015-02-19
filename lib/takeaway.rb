require 'ostruct'
require 'twilio-ruby'
require './secrets.rb'

class Takeaway
  include SecretsHelper
  attr_accessor :dishes
  def initialize
    @dishes = OpenStruct.new(quarter_chicken: 2.5,
                             half_chicken: 5,
                             whole_chicken: 10,
                             chicken_platter: 15)
    set_secrets
  end

  def make_order(orders = {}, total)
    @quarter_chicken_count = orders[:quarter_chicken]
    @half_chicken_count = orders[:half_chicken]
    @whole_chicken_count = orders[:whole_chicken]
    @chicken_platter_count = orders[:chicken_platter]
    @total = total
    set_totals
    get_total
  end

  def set_totals
    @quarter_chicken_total = @quarter_chicken_count * dishes.quarter_chicken if @quarter_chicken_count
    @half_chicken_total = @half_chicken_count * dishes.half_chicken if @half_chicken_count
    @whole_chicken_total = @whole_chicken_count * dishes.whole_chicken if @whole_chicken_count
    @chicken_platter_total = @chicken_platter_count * dishes.chicken_platter if @chicken_platter_count
  end

  def get_total
    totals_array = [@quarter_chicken_total, @half_chicken_total, @whole_chicken_total, @chicken_platter_total]
    existing_totals = totals_array.reject {|total| total.nil?}
    total_total = existing_totals.inject(:+)
    if total_total == @total
      puts "order correct and being processed"
      send_message
    else
      raise "The total amount is wrong! please try again"
    end
  end

  def set_secrets
    super
  end

  def send_message
    @message = client.account.messages.create({ to: "+447903524834",
                                               from: "+441683292035",
                                               body: "We are processing your order, it will arrive soon!" })
  end
end

