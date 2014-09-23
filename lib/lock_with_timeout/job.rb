require_relative 'lock_with_timeout'


class Job

  def self.run id

    LockWithTimeout.new.try failed: -> { puts "Job #{id} failed" } do

      puts "Job #{id} started"
      sleep(4)
      puts "Job #{id} finished"
    end

  end

end





