module HomeHelper
  def format_fact_stats(stats)
    return @formatted_fact_stats if @formatted_fact_stats
    stats_hash = Hash[stats.map{|s| [s['day'], s['count_all']]}]
    @formatted_fact_stats = 30.downto(0).map do |i|
      str_time = i.days.ago.strftime('%Y-%m-%d')
      count = stats_hash[str_time]
      { 'day'       => i.days.ago.strftime('%b %e'), 
        'count_all' => count.nil? ? 0 : count }
    end
  end

  def format_github_action_stats(stats)
    return @formatted_github_action_stats if @formatted_github_action_stats
    @formatted_github_action_stats = stats.map do |s|
      month = s['month']
      time = Time.new(month[0..4], month[5..7])
      { 'month'     => time.strftime('%b %y'), 
        'count_all' => s['count_all'] }
    end
  end

  def format_tweet_stats(stats)
    return @formatted_tweet_stats if @formatted_tweet_stats
    @formatted_tweet_stats = stats.map do |s|
      month = s['month']
      time = Time.new(month[0..4], month[5..7])
      { 'month'     => time.strftime('%b %y'), 
        'count_all' => s['count_all'] }
    end
  end
end
