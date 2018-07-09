module AwesomeChallenge
  module StopWordsAnalyzer
    class Analyzer

      def analyze(data_array)
        result = Result.new

        data_array.each do |item|
          item.split(" ").each do |word|
            result.check(word)
          end
        end

        result
      end
    end
  end
end