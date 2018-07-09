module AwesomeChallenge
  module StopWordsAnalyzer
    class SampleDataFetcher

      def initializer(twitter_client)
        @twitter_client = twitter_client
      end

      def fetch(force = false)
        if !force && File.exist?(sample_file)
          puts "Using existing data file #{sample_file}\n\n"
          return load_data_from_file
        end

        load_sample_from_twitter
      end

      def load_sample_from_twitter
        current_time =  Time.now
        end_time = current_time + duration

        puts "Fetching sample data from Twitter Stream API"
        puts "Fetch will end at #{end_time.strftime("%H:%M:%S")}"

        data = []

        file = File.open(sample_file, 'w+')
        file.truncate(0)

        begin
          twitter_client.sample do |object|
            file.write(object.text) if object.is_a?(Twitter::Tweet)
            current_time = Time.now

            if current_time.to_i >= end_time.to_i
              puts "Fetch Finished succefully."
              puts "Data is stored at #{sample_file}"
              break
            end
          end
        rescue Exception => ex
          puts "There was an error fetching tweets."
          raise ex
        end

        load_data_from_file
      end

      def duration
        5 * 60
      end

      def load_data_from_file
        File.readlines(sample_file)
      end

      def sample_file
        File.dirname(__FILE__) + "/../../../storage/sample_data.txt"
      end

      def twitter_client
        @twitter_client ||= Twitter::Streaming::Client.new do |config|
          config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
          config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
          config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
          config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
        end
      end
    end
  end
end