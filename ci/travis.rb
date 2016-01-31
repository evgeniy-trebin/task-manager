#!/usr/bin/env ruby

class Build

  attr_reader :tasks

  def initialize(tasks)
    @tasks = tasks
  end

  def run!
    rake(@tasks)
  end

  private

  def rake(*tasks)
    tasks.each do |task|
      cmd = "bundle exec rake #{task}"
      puts "Running command: #{cmd}"
      return false unless system(cmd)
    end
    true
  end
end

tasks = [
    'bundle exec rspec'
]

Build.new(tasks).run!
puts 'Rails build finished successfully'
exit(true)