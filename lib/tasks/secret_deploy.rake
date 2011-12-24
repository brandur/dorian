desc 'Deploys a new secret token to config/initializers/secret_token.rb'
task :secret_deploy do
  secret = `rake secret`.strip
  token_file = 'config/initializers/secret_token.rb'
  File.open(token_file, 'w') do |file|
    file.puts File.read(token_file + ".example").gsub(/<secret token>/, secret)
  end
  puts "Wrote secret to #{token_file}"
end
