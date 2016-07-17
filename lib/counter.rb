module HashtagCount

  class Counter

    attr_reader :hours

    def initialize
      @hours = Hash.new
      23.times do |n|
        @hours[n] = 0
      end
    end

    def run(tweet)
      t = tweet.created_at
      @hours[t.hour] = @hours[t.hour] + 1
    end
    
  end

end
