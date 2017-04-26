require_relative '../db/sql_runner.rb'

def Artist

  attr_reader :name

  def initialize(params)
    @name = params['name']
  end





end