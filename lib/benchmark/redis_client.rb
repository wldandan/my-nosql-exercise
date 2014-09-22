require 'redis'
require 'json'
require_relative 'benchmark'

class RedisClient

  def initialize
    @host = ENV['REDIS_HOST'] || 'localhost'
    @port = (ENV['REDIS_PORT'] || '6379').to_i
    @user = ENV['REDIS_USER'] || 'root'
    @pass = ENV['REDIS_PASS'] || ''
    @db = ENV['REDIS_DATABASE'] || 'test'
  end

  def prepare
    @r = Redis.new(:host => @host, :port => @port)
  end

  def close

  end

  def run i
    @r.set("demo:#{i}", rand(1000))
  end

end
