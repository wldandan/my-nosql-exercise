require 'redis'
require 'json'

class RedisClient

  def connect
    @r ||= Redis.new(:host => host, :port => port)
  end

  def close

  end

  def run i
    @r.set("demo:#{i}", rand(1000))
  end

  private

  def host
    ENV['REDIS_HOST'] || 'localhost'
  end

  def port
    (ENV['REDIS_PORT'] || '6379').to_i
  end

  def user
    ENV['REDIS_USER'] || 'root'
  end

  def pass
    ENV['REDIS_PASS'] || ''
  end

  def db
    ENV['REDIS_DATABASE'] || '0'
  end

end
