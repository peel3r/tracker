class PoolSerializer
  def self.count_per_month(pool)

    submissions = pool.submissions.group_by {|submission| submission.created_at.beginning_of_month }
    data = submissions.map { |key, values| values.length}
    {
        data: data ,

        x_axis: {
            legend: "Submissions per month",
            series: submissions.keys.map {|date| date.strftime("%b %Y")}
        },
        y_axis: {
            legend: "No. Pools",
            scale: [ 0, (data.max or 0) + 1 ]
        }
    }
  end

  def self.answers_per_tracker(tracker)
    answers_per_tracker = tracker.answers.group_by(&:possible_tracker)
    data = answers_per_tracker.map {|possible_tracker, answers| answers.length}
    series = answers_per_tracker.map {|possible_tracker, answers| possible_tracker.title}

    {
        data: data ,
        title: tracker.title,
        x_axis: {
            legend: "Tracers per question",
            series: series
        },
        y_axis: {
            legend: "No. Pools",
            scale: [ 0, (data.max or 0) + 1 ]
        }
    }
  end
end