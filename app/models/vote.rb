class Vote < ActiveRecord::Base

  before_save :update_option
  belongs_to :user
  belongs_to :poll

  def self.cast(user,poll,choice)
    v = Vote.new
    v.user = user 
    v.poll = poll
    v.choice = choice
    v.save 
    return v
  end 

  attr_accessor :choice 

  A_OPTIONS = [0, "a", "A"]
  B_OPTIONS = [1, "b", "B"]

  def a?
    A_OPTIONS.include? option 
  end 

  def b?
    B_OPTIONS.include? option 
  end 

  def update_option
    if A_OPTIONS.include? choice
      self.option = 0
    end
  
    if B_OPTIONS.include? choice
      self.option = 1
    end 
  end 

end
