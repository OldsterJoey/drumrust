module ProductsHelper
    # Formats the condition section of a product in order to remove underscores from the separated words
    def format_condition(condition)
        condition.split("_").map{|word| word.capitalize}.join(" ")
    end
end
