require_relative '../../lib/client/redis_client'


class LockWithTimeout

  def try(options)
    if locked? || !lock
      options[:failed].call
    else
      begin
        yield if block_given?
      ensure
        unlock
      end
    end
  end

  private

  def lock
    redis.set(lock_key, 'lock_it', ex: 2, nx: true)
  end

  def locked?
    redis.get(lock_key)
  end

  def unlock
    redis.del(lock_key)
  end

  def lock_key
    'lock_key'
  end

  def redis
    @connection ||= RedisClient.new.connect
  end

end

