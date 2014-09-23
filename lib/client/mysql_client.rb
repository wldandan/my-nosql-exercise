require 'mysql'

class MySQLClient

  def connect
    @m ||= Mysql.init.connect(host, user, pass, db, port, sock, flag)
  end

  def close
    @m.close if @m
  end

  def create_table
    @m.query("create table t (id int)")
  end

  def run i
    @m.query("insert into t values (#{rand(1000)})")
  end

  private

  def host
    ENV['MYSQL_HOST'] || 'localhost'
  end

  def port
    (ENV['MYSQL_PORT'] || '3306').to_i
  end

  def user
    ENV['MYSQL_USER'] || 'root'
  end

  def pass
    ENV['MYSQL_PASS'] || ''
  end

  def db
    ENV['MYSQL_DATABASE'] || 'test'
  end

  def sock
    ENV['MYSQL_SOCK']
  end

  def flag
    ENV['MYSQL_FLAG']
  end

end