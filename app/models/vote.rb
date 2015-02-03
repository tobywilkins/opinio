class Vote < ActiveRecord::Base

  attr_accessor :choice 
  
  A_OPTIONS = [0, "a", "A"]
  B_OPTIONS = [1, "b", "B"]
 
  belongs_to :user
  belongs_to :poll

  validates :option, presence: true, inclusion: { in: [0, 1]  }
  validates :user, :poll, presence: true
  validates :option,  uniqueness: {  :scope => [:poll_id, :user_id] }

  before_validation :update_option
  
  def self.cast(user,poll,choice)
    v = where(user: user, poll: poll).first
    if v.nil?
      v = Vote.new
      v.user = user 
      v.poll = poll
      v.choice = choice
      v.save 
    else
      v.choice = choice 
      v.save
    end
    return v
  end 

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
