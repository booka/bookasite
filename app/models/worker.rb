class Worker
  def self.work(name, &block)
    define_method(name.gsub(/\./, '_'), &block)
  end

  work 'activity.report' do |job|
    puts("Epa!")
    puts("Time #{job.created_at}")
  end

  def initialize(job)
    @job = job
    @output = ''
  end

  def puts(text)
    @output = @output + '\n' + text
  end

  def execute
    puts "JOB: #{@job.name}"
    self.send @job.name.gsub(/\./, '_'), @job
    @output
  end


  protected
end

