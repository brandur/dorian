module TweetsHelper
  def month_name(num)
    Time.new(2000, num).strftime('%B')
  end
end
