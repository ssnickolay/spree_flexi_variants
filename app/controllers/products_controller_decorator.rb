ProductsController.class_eval do
  helper do 
    def on_demand_option_value_options(product_option_values)
      options = product_option_values.map do |pov| 
        
        plus_or_minus=""

        if pov.price_modifier>0
          plus_or_minus ="+"
        elsif pov.price_modifier<0
          plus_or_minus ="" # the minus is built into the value
        end
                         
        [(pov.price_modifier.nil? ? pov.option_value.presentation : "#{pov.option_value.presentation} (#{plus_or_minus}#{number_to_currency pov.price_modifier})"), pov.id.to_s]
      end
    end
  end
end