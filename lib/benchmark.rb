
class Benchmark

  def initialize(client)
    @client = client
  end

  def run
    @client.prepare
    i = 1
    start = Time.now
    N.times do
      @client.run i
      i = i + 1
    end
    cost = Time.now - start
    puts "#{@client.class} benchmark cost #{cost} seconds"
    @client.close
  end

end
