
class Benchmark

  def initialize(client)
    @client = client
  end

  def run
    @client.prepare
    start = Time.now
    i = 1
    N.times do
      @client.run i
      i = i + 1
    end
    cost = Time.now - start
    puts "#{@client.class} benchmark cost #{cost} seconds"
    @client.close
  end

end
