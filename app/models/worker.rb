class Worker
  def self.work(name, &block)
    @@definitions ||= []
    @@definitions << name
    define_method(name.gsub(/\./, '_'), &block)
  end

  work 'all' do |job|
    @@definitions.each { |name| puts name }
  end

  work 'jobs.clear' do |job|
    Job.destroy_all
  end

  work 'activity.update' do |job|
    activity_clear(job)
    activity_create(job)
    asub_create(job)
  end

  work 'activity.create' do |job|
    var = AppVar.get('activity.version.id')
    last_id = var.value

    total = 0
    Version.where("id > ?", last_id).order('id ASC').all.each do |version|
      Activity.create_from_version(version)
      last_id = version.id
      total += 1
    end
    var.update_attributes(:value => last_id)
    puts "TOTAL ACTIVITIES: #{total}"
  end

  work 'activity.clear' do |job|
    AppVar.get('activity.version.id').destroy
    Asub.destroy_all
    Activity.destroy_all
  end

  work 'asub.create' do |job|
    activities_count = 0
    subscriptions_count = 0
    Activity.where(:notified => false).all.each do |activity|
      activities_count += 1
      subscriptions = activity.notify
      subscriptions_count += subscriptions.length
      activity.update_attribute(:notified, true)
    end
    puts "ACTIVITIES: #{activities_count}"
    puts "SUBSCRIPTIONS: #{subscriptions_count}"
  end

  work 'activity.notify' do |job|
    ActivityMailer.activity_report_email.deliver
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
    Job.transaction do
      job.update_attribute(:started_at, Time.now)
      puts "JOB: #{job.name} #{job.created_at}"
      self.send(job.name.gsub(/\./, '_'), job)
      job.update_attribute(:finished_at, Time.now)
      puts "TIME: #{job.finished_at - job.started_at}"
    end
  end


  protected
end

