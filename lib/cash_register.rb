class CashRegister
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    attr_accessor :total
    attr_reader :discount
    attr_reader :items
    attr_accessor :last_price
    attr_accessor :last_quantity

    def add_item(title, price, quantity = 1)
        self.total = self.total + price*quantity
        for x in 1..quantity do
            self.items << title
        end
        self.last_price = price
        self.last_quantity = quantity
    end

    def apply_discount
        if discount > 0
            self.total = self.total * (100-self.discount)/100
            return "After the discount, the total comes to $#{self.total}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        if last_price == "error"
            puts "Cannot void the last transaction"
        else
            for x in 1..last_quantity do
                items.pop()
                self.total = self.total - last_price
            end
            last_price = "error"
        end
    end


end
