require 'net/http';
require 'json';

# assign arguments to variables
inputName = ARGV[0];
inputSalary = ARGV[1];

# Check null
if(inputName == nil)
    inputName = 'Ren';
end
if(inputSalary == nil)
    inputSalary = '60000';
end

# API urls
baseURL = 'http://localhost:3000/api/v1/payslip/show';
nameURL = "?name=#{inputName}&";
salaryURL = "annual_salary=#{inputSalary}";

# API call
uri = URI("#{baseURL}#{nameURL}#{salaryURL}");
response = Net::HTTP.get(uri);
result = JSON.parse(response)['data'];

# puts "Hello World!";
# puts JSON.pretty_generate(result);
puts('Monthly Payslip for: ' + result['employee_name']);
puts('Gross Monthly Income: ' + result['gross_monthly_income']);
puts('Monthly Income Tax: ' + result['monthly_income_tax']);
puts('Net Monthly Income: ' + result['net_monthly_income']);

# Monthly Payslip for: "Ren"
# Gross Monthly Income: $5000.00
# Monthly Income Tax: $500.00
# Net Monthly Income: $4500.00