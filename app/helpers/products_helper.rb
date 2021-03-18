module ProductsHelper
    def format_condition(condition)
        condition.split("_").map{|word| word.capitalize}.join(" ")
    end
end
