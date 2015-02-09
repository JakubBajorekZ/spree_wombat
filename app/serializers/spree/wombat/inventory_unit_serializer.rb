require 'active_model/serializer'

module Spree
  module Wombat
    class InventoryUnitSerializer < ActiveModel::Serializer
      attributes :product_id, :name, :quantity, :price

      def quantity
        object.respond_to?(:quantity) ? object.quantity : 1
      end

      def price
        object.line_item.price.round(2).to_f
      end

      def product_id
        if object.variant
          object.variant.sku
        end
      end

      def name
        object.variant.name
      end

      include Spree::Wombat::JsonFromAttributes
    end
  end
end
