# import classes
require_relative './PayslipGenerator.rb';

puts "Hello World!"
# Payslip generator class
pg = PayslipGenerator.new('Ren', 60000 );
pg.display;

pg2 = PayslipGenerator.new('Mike', 200000 );
pg2.display;

pg3 = PayslipGenerator.new('Robert', 80150 );
pg3.display;

