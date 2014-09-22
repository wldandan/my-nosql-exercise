require 'mysql'
require_relative 'benchmark'

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

  def prepare
    @m.connect(@host, @user, @pass, @db, @port, @sock, @flag)
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

end