 module AwesomeChallenge
  module StopWordsAnalyzer
    class Result
      attr_accessor :hash_table

      def initialize
        @hash_table = StopWordsAnalyzer::STOP_WORDS.inject({}) do |bag, item|
          bag[item.to_sym] = 0
          bag
        end
      end

      def check(word)
        word = word.to_s.downcase.to_sym
        hash_table[word] += 1 if hash_table[word]

        hash_table[word]
      end

      def most_used
        hash_table.reject { |k| hash_table[k] == 0 }.sort { |val_1 , val_2| val_2[1] <=> val_1[1] }[0..9]
      end
    end
  end
end