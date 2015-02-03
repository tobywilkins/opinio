class Poll < ActiveRecord::Base

  mount_uploader :image_a, PollImageUploader
  mount_uploader :image_b, PollImageUploader

  has_many :votes
  belongs_to :use


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
