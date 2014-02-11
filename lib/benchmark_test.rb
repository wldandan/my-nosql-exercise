

class BenchmarkTest

  def initialize
    @setups = []
    @transactions = []
    @teardowns = []
  end

  def setup(&block)
    @setups << block
  end

  def teardown(&block)
    @teardowns << block
  end

  def transaction(&block)
    @transactions << block
  end

  def run
    @setups.each do |setup|
      block.call setup
    end

    @transactions.each do |transaction|
      block.call transaction
    end

    @teardowns.each do |teardown|
      block.call teardown
    end
  end



end