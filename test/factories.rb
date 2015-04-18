FactoryGirl.define do  factory :user do
    
  end


  factory :answer do
  end

  factory :submission do
  end

  factory :possible_tracker do
    title "Possible Answer"
  end

  factory :tracker do
    title "Question #"
    kind "choice"

    factory :full_tracker do
      transient do
        answers_count 5
        possible_trackers_count 5
      end

      after(:create) do |tracker, evaluator|
        create_list :answer,
                    evaluator.answers_count,
                    tracker: tracker,
                    possible_tracker_id: 1

        create_list :possible_tracker,
                    evaluator.possible_trackers_count,
                    tracker: tracker
      end
    end
  end

  factory :pool do
    title "Testing poll"

    factory :full_pool do

      transient do
        submissions_count 5
        trackers_count 5
      end

      after(:create) do |pool, evaluator|
        create_list :full_tracker, evaluator.trackers_count, pool: pool
        create_list :submission, evaluator.submissions_count, pool: pool
      end
    end
  end
end