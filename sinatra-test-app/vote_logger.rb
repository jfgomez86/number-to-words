class VoteLogger
  require 'yaml'
  require 'ftools'
  @@vote_results_file = File.join(File.dirname(__FILE__), "public/results.yml")

  def self.start
    load_previous_results
  end

  def self.vote(number="1", vote="si")
    unless @@dont_write
      temp_filename = Time.now.to_i.to_s
      File.open(temp_filename, "w") do |f|
        f << ( @@vote_results << {:number => number, :vote => vote, :created_at => Time.now.to_i} ).to_yaml
      end
      File.copy(temp_filename, @@vote_results_file)
      File.delete(temp_filename)
    else
        ( @@vote_results << {:number => number, :vote => vote, :created_at => Time.now.to_i} ).to_yaml
    end
  end

  def self.already_voted?(number)
    return false if @@vote_results.select{|v| v[:number] == number }.empty?
    return true
  end

  def self.get_votes
    unless @@dont_write
      load_previous_results
    else
      @@vote_results
    end
  end

  private

  def self.load_previous_results
    if File.writable? @@vote_results_file 
      @@vote_results = YAML.load_file(@@vote_results_file)
    else
      @@dont_write = true
      @@vote_results = []
    end
  end

end 
