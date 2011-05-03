
ACTIVITY_QUEUE = GirlFriday::WorkQueue.new(:user_email, :size => 2) do |options|
  bok = options[:bok]
  action = options[:action]
  Activity.create_from_bok(bok, action)
end