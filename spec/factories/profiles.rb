FactoryBot.define do
  factory :profile do
    username {"TestUser"}
    birth {"1995-11-30"}
    sex {"male"}
    nationality {"japan"}
    occupation {"student"}
    height {180}
    user
    
    trait :underage do
      birth {"2005-05-11"}
    end
    
    trait :female do
      sex {"female"}
    end
  end
end
