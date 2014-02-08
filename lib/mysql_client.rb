require 'mysql'

N = 100000

class MySQLClient

  def initialize
    @host = ENV['MYSQL_HOST'] || 'localhost'
    @port = (ENV['MYSQL_PORT'] || '3306').to_i
    @user = ENV['MYSQL_USER'] || 'root'
    @pass = ENV['MYSQL_PASS'] || ''
    @db = ENV['MYSQL_DATABASE'] || 'test'
    @sock = ENV['MYSQL_SOCK']
    @flag = ENV['MYSQL_FLAG']
    @m = Mysql.init
  end

  def connect
    @m.connect(@host, @user, @pass, @db, @port, @sock, @flag)
  end

  def close
    @m.close if @m
  end

  def create_table
    @m.query("create table t (id int)")
  end

  def insert_value val
    @m.query("insert into t values (#{val})")
  end

end

mc = MySQLClient.new
mc.connect
#mc.create_table

start = Time.now
N.times do
  mc.insert_value rand(N)
end
cost = Time.now - start
puts "cost #{cost} seconds"

mc.close