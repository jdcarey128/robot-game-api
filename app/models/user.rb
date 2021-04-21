class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :score, type: Integer

  class << self 
    def leaderboard
      User.all.sort({ score: -1 }).limit(10)
    end
  end
end
