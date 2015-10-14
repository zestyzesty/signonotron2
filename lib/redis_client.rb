require 'redis'

class RedisClient
  include Singleton

  attr_reader :connection

  def initialize
    @connection = make_connection
  end

  def make_connection
    puts 'hi'
    if ENV['REDISCLOUD_URL']
      uri = URI.parse(ENV['REDISCLOUD_URL'])
      Redis.new(host: uri.host, port: uri.port, password: uri.password)
    else
      Redis.new(host: '127.0.0.1', port: ENV['BOXEN_REDIS_PORT'] || '6379')
    end
  end
end
