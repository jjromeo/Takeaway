require 'ostruct'
class Takeaway
    attr_accessor :dishes
   def initialize
       @dishes = OpenStruct.new(quarter_chicken: 2.5, half_chicken: 5, whole_chicken: 10, chicken_platter: 15)
   end
   
   def make_order(dishes = {}, total)

   end
end

