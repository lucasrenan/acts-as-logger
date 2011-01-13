module ActsAsLogger
  class User
    def self.current
      Thread.current[:user]
    end

    def self.current=(user)
      Thread.current[:user] = user
    end
  end
end