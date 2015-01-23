class RetrieveFacebookDetails
   
FIELDS = 
    ["id" ,
    "email",
    "gender",
    "last_name",
    "link", 
    "locale", 
    "name", 
    "timezone", 
    "updated_time", 
    "username", 
    "verified"] 
     
  FIELDS.each do |field|
    define_method("#{field}") do 
      @profile.fetch(field,nil)
    end 
  end


  def initialize(token)
    @token = token 
    @profile = nil
    @error = nil
  end 

  def error
    @error
  end 

  def error? 
    @error
  end 

  def call
    @error = nil
    begin
      @graph = Koala::Facebook::API.new(@token)
      @profile = @graph.get_object("me")
    rescue Exception => e 
      @error = e.message
    end 
  end

end 
