module AwesomeChallenge
  class Factors
    def self.call(input_array)

      # Create bag for maintain desired output order in hash.
      result = input_array.inject({}) do |bag, v|
        bag[v] = []
        bag
      end

      # Sort the array to avoid O(n^2) complexity and use O(n log n)
      sorted = input_array.sort { |x1, x2| x2 <=> x1 }

      sorted.each_with_index do |value, i|
        counter = i + 1

        while counter < (sorted.length) do
          if value % sorted[counter] == 0
            result[value] << sorted[counter]
          end

          counter += 1
        end
      end

      result
    end
  end
end