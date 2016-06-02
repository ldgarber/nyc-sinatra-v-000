require 'sinatra/base'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
