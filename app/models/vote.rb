class Vote < ActiveRecord::Base

  attr_accessor :choice 
  
  A_OPTIONS = [0, "a", "A"]
  B_OPTIONS = [1, "b", "B"]
 
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :poll

  validates :option, presence: true, inclusion: { in: [0, 1]  }
  validates :voter, :poll, presence: true
  #validates :option,  uniqueness: {  :scope => [:poll_id, :user_id] }

  before_validation :update_option
 
  scope :picked_a, -> { where(option: 0)}
  scope :picked_b, -> { where(option: 1)}

  def self.cast(voter,poll,choice)
    v = where(voter: voter, poll: poll).first
    if v.nil?
      v = Vote.new
      v.voter = voter
      v.poll = poll
      v.choice = choice
    else
      v.choice = choice 
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
