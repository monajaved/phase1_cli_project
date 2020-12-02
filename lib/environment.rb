# require_relative "./"

require 'pry'
require 'bundler'
require 'json'
require 'rest-client'

Bundler.require

require_relative "./breaking_bad_services/api"
# require_relative ""
require_relative "./breaking_bad_models/character"
require_relative "./breaking_bad_services/cli"