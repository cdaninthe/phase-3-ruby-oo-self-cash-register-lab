
class CashRegister
    attr_accessor :total, :items, :last_price
    attr_reader :discount

    def initialize (employee_discount=0)
        @discount = employee_discount
        @total = 0
        @items = []
        @last_price = 0
    end

    def add_item(title, price, quantity=1)
        # previous_total = @total
        # @total = previous_total + (price * quantity)
        @total += (price * quantity)
        
        quantity.times do
            self.items << title 
        end
        
        self.last_price = price * quantity
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.total * (self.discount.to_f / 100.00))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_price
    end

end