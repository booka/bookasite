class Worker
  def self.work(name, &block)
    define_method(name.gsub(/\./, '_'), &block)
  end

  work 'activity.report' do |job|
    ActivityMailer.activity_report_email.deliver
    Activity.destroy_all
  end

  work 'system.fail' do |job|
    true
  end

  work 'system.nothing' do |job|

  end

  def initialize(job)
    @job = job
    @output = []
  end

  def puts(text)
    @output << text
  end

  def output
    @output
  end

  def job
    @job
  end

  def execute
    job.update_attribute(:started_at, Time.now)
    puts "JOB: #{job.name} #{job.created_at}"
    self.send(job.name.gsub(/\./, '_'), job)
    job.update_attribute(:finished_at, Time.now)
    puts "TIME: #{job.finished_at - job.started_at}"
  end


  protected
end

