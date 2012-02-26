$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require "rubygems"
require "bundler/setup"
require "sinatra/base"
require "json"
require "pygments.rb"
require "syntaxtical/app"

module Syntaxtical
end

