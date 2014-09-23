require_relative '../helper'
require_relative 'benchmark'


times = 50000
Benchmark.new(MySQLClient.new, times: times).run
Benchmark.new(RedisClient.new, times: times).run