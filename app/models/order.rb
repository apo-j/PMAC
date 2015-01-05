class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy


  validates :name, :address, :email, presence: true

  #state machine
  state_machine :initial => :payed do
    event :next_step do
      transition :payed => :trait
      transition :trait => :delivered
      transition :delivered => :finished
    end

    event :go_back do
      transition :payed => :payed
      transition :trait => :payed
      transition :delivered => :trait
      transition :finished => :finished
    end

    event :cancel do
      transition all => :cancel
    end

    state :payed do
      def state_value
        'Payé'
      end
    end

    state :trait do
      def state_value
        'En cours de traitement'
      end
    end

    state :delivered do
      def state_value
        "En cours d'acheminement"
      end
    end

    state :finished do
      def state_value
        'Terminé'
      end
    end

    state :cancel do
      def state_value
        'Annulé'
      end
    end

  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
