# require_relative "./"

require 'pry'
require 'bundler'
require 'json'
require 'rest-client'

Bundler.require

require_relative "./breaking_bad/api"
# require_relative ""
require_relative "./walter_white/code"
require_relative "./breaking_bad/cli"