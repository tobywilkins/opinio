class Poll < ActiveRecord::Base

  mount_uploader :image_a, PollImageUploader
  mount_uploader :image_b, PollImageUploader

  validates :user, :image_a, :image_b, :title, :caption_a, :caption_b, presence: true 
  
  has_many :votes
  belongs_to :user

  has_many :a_voters, -> { where(option: 0) }, class_name: "Vote" 
  has_many :b_voters, -> { where(option: 1) }, class_name: "Vote" 

  def owner
    user
  end 


  def total_votes
    votes.count
  end 

  # returns the users that picked option A
  def voted_a
    votes.select { |v| v.option == 0 }.collect(&:voter)
  end 

  # returns the users that picked option A
  def voted_b
    votes.select { |v| v.option == 1 }.collect(&:voter)
  end 

  def winner 
    a = 0
    b = 0
    
    self.votes.each do |vote|
    
      if (vote.a?)
        a = a + 1
      end 
      
      if (vote.b?)
        b = b + 1
      end
    
    end 
    
    if a > b
      return "A" 
    end 
      
    if b > a
      return "B" 
    end 
    
    if a == b
      return "Draw"   
    end 
 
  end 

end
