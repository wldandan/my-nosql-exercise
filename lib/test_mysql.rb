require_relative 'benchmark_test'

class TestMySQL < BenchmarkTest

  setup do
    @host = ENV['MYSQL_HOST'] || 'localhost'
    @port = (ENV['MYSQL_PORT'] || '3306').to_i
    @user = ENV['MYSQL_USER'] || 'root'
    @pass = ENV['MYSQL_PASS'] || ''
    @db = ENV['MYSQL_DATABASE'] || 'test'
    @sock = ENV['MYSQL_SOCK']
    @flag = ENV['MYSQL_FLAG']
    @m = Mysql.init
    @N = 10000
    @m.connect(@host, @user, @pass, @db, @port, @sock, @flag)
  end

  teardown do
    @m.close if @m
  end

  transaction do
    @m.query("insert into t values (#{rand(N)})")
  end

end

#TestMySQL.new.run

