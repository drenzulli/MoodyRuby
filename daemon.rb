require 'tweetstream'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "B5k2Yt8Cg1oRDZXifg0lyGrnQ"
  config.consumer_secret     = "Xdx0ySXZ5IWvUJJzxvo0F66lc6UgXzNqshC90Cy0f1md1zvr9w"
  config.access_token        = "2344418245-iXDdebi8DClpp7St33Ex8HK0rR0xzNvM0emwpz4"
  config.access_token_secret = "zqqk292U5ZoCz11c8eQ1PUYJSG4BT058CrE9p1ogjsZrA"
end

client.user do |object|
  	tweet = object.text if object.is_a?(Twitter::Tweet)
  	puts tweet if object.is_a?(Twitter::Tweet)
end