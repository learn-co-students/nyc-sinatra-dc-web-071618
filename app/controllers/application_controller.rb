class ApplicationController < Sinatra::Base
  set :method_override, true
  
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
