require_relative '../../lib/client/redis_client'


class DemoPipeline

  N = 20000

  def job_without_pipeline
    run_with_timer('without pipeline') do
      N.times { redis.ping }
    end
  end

  def job_with_pipeline
    run_with_timer('with pipeline') do
      redis.pipelined do
        N.times { redis.ping }
      end
    end
  end

  private

  def run_with_timer(desc)
    start = Time.new
    yield if block_given?
    puts "#{desc} job cost #{Time.new - start} seconds"
  end

  def redis
    @connection ||= RedisClient.new.connect
  end

end


DemoPipeline.new.job_without_pipeline
DemoPipeline.new.job_with_pipeline

