require 'socket'
require 'rack'
require_relative 'CashMachine'/

server = TCPServer.new('0.0.0.0', 3000)

class App
  def call(env)
    req = Rack::Request.new(env)

    params = env["QUERY_PARAMS"]
    balance = CashMachine.new

    case req.path
    when "/"
      [200, { "Content-Type" => "text/html" }, ["Cash Machine"]]
    when "/deposit"
			if params.nil? || params["value"].nil?
				[401, { "Content-Type" => "text/html" }, ["Enter your deposit"]]
			elsif balance.deposit(params["value"]) == 'success'
				[200, { "Content-Type" => "text/html" }, ["You entered #{params["value"]}. Your balance: #{balance.balance}"]]
      elsif balance.deposit(params["value"]) == 'error'
        [402, { "Content-Type" => "text/html" }, ["Deposit is incorrect. Please, enter a number"]]
			else
				[403, { "Content-Type" => "text/html" }, ["Deposit must be higher than 0"]]
			end
    when "/withdraw"
      if params.nil? || params["value"].nil?
        [401, { "Content-Type" => "text/html" }, ["Enter your withdraw"]]
      elsif balance.withdraw(params["value"]) == 'success'
        [200, { "Content-Type" => "text/html" }, ["You entered #{params["value"]}. Your balance: #{balance.balance}"]]
      elsif balance.withdraw(params["value"]) == 'error'
        [402, { "Content-Type" => "text/html" }, ["Withdraw is incorrect. Please, enter a number"]]
      else
        [403, { "Content-Type" => "text/html" }, ["Withdraw must be higher than 0 and less than balance (#{balance.balance})"]]
      end
    when "/balance"
      [200, { "Content-Type" => "text/html" }, ["Your balance: #{balance.balance}"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Page is not found"]]
		end
	end
end

def array_to_hash(array)
	result = {}

	array.each do |item|
		key = item.split("=")[0]
		value = item.split("=")[1]
		result[key] = value
	end
	result
end

app = App.new

while (connection = server.accept)
  request = connection.gets
  method, full_path, http_ver = request.split(' ')
  path, params = full_path.split('?')

  status, headers, body = app.call({
  	'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_PARAMS' => params != nil ? array_to_hash(params.split('&')) : nil
  })

	connection.print "#{http_ver} #{status} \r\n"

  headers.each do |key, value|
    connection.print("#{key}: #{value}\r\n") 
  end

  connection.print "\r\n"

  body.each do |part| 
    connection.print(part) 
  end

	connection.close
end