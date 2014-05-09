class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  #state machine
  state_machine :initial => :payed do
    event :next_step do
      transition :payed => :trait
      transition :trait => :delivered
      transition :delivered => :finished
    end

    state :payed do
      def name
        1
      end
    end

    state :trait do
      def name
        2
      end
    end

    state :delivered do
      def name
        3
      end
    end

    state :finished do
      def name
        4
      end
    end

  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
