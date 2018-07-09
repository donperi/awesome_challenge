require 'clamp'
require 'pp'

module AwesomeChallenge
  class ApplicationCommand < Clamp::Command

    subcommand "analyzer", "Run Sample Twitter Stopword Anaylizer" do
      option "--force", :flag, "Ignores sample data file and force fetch from Twitter", default: false

      def execute
        data = StopWordsAnalyzer::SampleDataFetcher.new.fetch(force?)
        analyzer = StopWordsAnalyzer::Analyzer.new
        result = analyzer.analyze(data)

        pp(result.most_used)
      end
    end

    subcommand "factors", "Given an array, look for factors of each integer inside it." do
      parameter "Array", "Array of numbers, Ex: 10,5,2,20", attribute_name: :input_array do |v|
        v.split(',').map { |i| i.to_i }
      end

      def execute
        pp(AwesomeChallenge::Factors::call(input_array))
      end
    end
  end
end
