require 'ruby-progressbar'


class Benchmark

  def initialize(client, options={})
    @client = client
    @times = options[:times]
  end

  def run
    @client.prepare

    start = Time.now
    i = 0
    progressbar = ProgressBar.create(:title => "  #{@client.class}", :starting_at => i, :total => @times)
    @times.times do
      @client.run i
      i = i + 1
      progressbar.progress = i
    end
    cost = Time.now - start
    puts "  #{@client.class} benchmark cost #{cost} seconds"

    @client.close
  end

end
