require_relative 'spec_helper'
require_relative '../lib/counter'
require 'twitter'

describe HashtagCount::Counter do

  before do
    @counter = HashtagCount::Counter.new
  end

  it "should have a counter for each hour" do
    24.times do |hour|
      expect(@counter.hours).to include(hour)
    end
  end

  context "Get time of tweet" do

    let(:tweet) { double(Twitter::Tweet) }

    before do
      allow(tweet).to receive(:created_at) { Time.new(2016, 01, 01, 3, 1, 2, "+01:00") }
    end

    it "should increment counter for the hour the tweet was created" do
      expect(tweet).to receive(:created_at) { Time.new(2016, 01, 01, 9, 1, 2, "+01:00") }

      @counter.run(tweet)

      expect(@counter.hours[9]).to eq(1)
    end

  end
end
