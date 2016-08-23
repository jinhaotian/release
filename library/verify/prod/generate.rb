require 'erubis'
template = File.read("./verify_template.erb")
template = Erubis::Eruby.new(template)
result = template.result(:header => "",:data=>"",:method=>"GET",:url=>"$protocol://$server:$port/$war_file_name/profiles/UserProfile/users/D12AD340FDA26C1BE040960A38033EA2")
puts output = result;
