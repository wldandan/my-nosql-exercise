require_relative 'benchmark'
require_relative 'mysql_client'
require_relative 'redis_client'


times = 50000
Benchmark.new(MySQLClient.new, times: times).run
Benchmark.new(RedisClient.new, times: times).run