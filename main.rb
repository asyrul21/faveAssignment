require 'net/http';
require 'json';

# assign arguments to variables
inputName = ARGV[0];
inputSalary = ARGV[1];

# Check null
if(inputName == nil)
    puts('Input name is nil');
    inputName = 'Ren';
end
if(inputSalary == nil)
    puts('Input salary is nil');
    inputSalary = '60000';
end

# output for debug
# puts(ARGV)
# puts('Input name: ' + String(inputName));
# puts('Input salary: ' + String(inputSalary));

# API urls
baseURL = 'http://localhost:3000/api/v1/payslip/show';
nameURL = "?name=#{inputName}&";
salaryURL = "annual_salary=#{inputSalary}";

# API call
uri = URI("#{baseURL}#{nameURL}#{salaryURL}");
response = Net::HTTP.get(uri);
result = JSON.parse(response);

puts "Hello World!";
puts JSON.pretty_generate(result['data']);