module HomeHelper
  def format_github_action_stats(stats)
    return @formatted_github_action_stats if @formatted_github_action_stats
    @formatted_github_action_stats = stats.reverse.map do |s|
      month = s['month']
      time = Time.new(month[0..4], month[5..7])
      { 'month'     => time, 
        'count_all' => s['count_all'] }
    end
  end
end
