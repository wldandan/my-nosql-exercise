require_relative 'job'


threads = []
threads << Thread.new { Job.run 1 }
threads << Thread.new { sleep(3); Job.run 2 }

threads.each { |t| t.join }


