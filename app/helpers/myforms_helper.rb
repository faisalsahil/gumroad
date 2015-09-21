module MyformsHelper
  def getgroups(listid)
  
   Gibbon.api_key = @current_user.mailchimp_api_key
   Gibbon.timeout = 15
   Gibbon.throws_exceptions = false
  
   @list_groups = Gibbon.listInterestGroupings({:id => listid})
   @list_group = @list_groups unless @list_groups.blank?
  
   # arrgroups = []
  
   # if @list_group.first.first == "error"
   #   return arrgroups
   # else
   #   @list_group.each do |obj|
   #     arrgroups << {"id" => obj["id"], "name" => obj["name"] , "type" => obj["form_field"]}
   #   end
   #   puts "===================="
   #   puts arrgroups.inspect
   #   puts "===================="
     return @list_group
  
  end
end
