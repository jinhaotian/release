#!/usr/bin/ruby
require 'erubis'

lines = File.readlines 'data.txt'

testcases =  Array.new
testcase = Hash.new
lastTestCaseId="0"
testCaseId=0

for index in 1...lines.length do
   fields = lines[index].split(/\s(?=(?:[^'"]|'[^']*'|"[^"]*")*$)/)
#   puts "#{fields[5]}, #{fields[3]}, #{fields[4]}  #{fields[7]}  #{fields[6]}}"

   id = fields[5]
   method = fields[4][1,fields[4].length-2].intern  
   type = fields[7][1,fields[7].length-2].intern
   t_value = fields[6][1,fields[6].length-2]
   app_name =   fields[8][1,fields[8].length-2].intern
   http_code = fields[3][1,fields[3].length-2].intern
   
   if(type.eql? "header".intern)
     t_value = " -H \"#{t_value}\""
   end

   if id.eql? lastTestCaseId then
     if  testcase.has_key?(type)  then
        value = testcase[type] +  t_value
        testcase.store(type,value)
     else
       testcase.store(type,t_value)      
     end
   else
     testcases[testCaseId] = testcase
     testCaseId =  testCaseId + 1 
     testcase = Hash.new
     testcase.store(:id,id)
     testcase.store(:method,method)
     testcase.store(type,t_value)
     testcase.store(:http_code,http_code)
     testcase.store(:app_name,app_name)
     lastTestCaseId = id
   end

end


#for index in 1...testcases.length do
#    puts testcases[index]
#end

class BValues
  def initialize(header,url,method,data,http_code)
    @data = data
    @url = url
    @method = method
    @header = header
    @http_code = http_code
  end
  def get_binding
    return binding()
  end
end

for index in 1...testcases.length do
 
  vars = BValues.new(testcases[index][:header],testcases[index][:url],testcases[index][:method],testcases[index][:post_data],testcases[index][:http_code])
  bind  = vars.get_binding;
  #puts vars
  template = File.read("./verify_template.erb")
  template = Erubis::Eruby.new(template)
  result = template.result(bind)
 # puts output = result;
  File.write("./scripts/testcase_#{testcases[index][:app_name]}_#{testcases[index][:id]}.sh", result)
end
