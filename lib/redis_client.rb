require 'redis'
require 'json'

redis = Redis.new(:host => '127.0.0.1', :port => 6379)

i = 1
N = 100000

start = Time.now
redis.pipelined do
  N.times do
    redis.set("demo:#{i}", rand(N))
    i += 1
  end
end
cost = Time.now - start
puts "cost #{cost} seconds"
