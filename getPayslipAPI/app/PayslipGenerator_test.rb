require 'minitest/autorun'

# import classes
require_relative './PayslipGenerator.rb';

class PayslipGeneratorTest < Minitest::Test
    def test_generatePayslip1
        pg = PayslipGenerator.new('Ren', 60000 );

        assert pg.instance_variable_get(:@employee_name) == 'Ren';
        assert pg.getGrossMonthlyIncome == '$5000.00';
        assert pg.getMonthlyIncomeTax == '$500.00';
        assert pg.getNetMonthlyIncome == '$4500.00';
    end

    def test_generatePayslip2
        pg = PayslipGenerator.new('Mike', 200000 );

        assert pg.instance_variable_get(:@employee_name)  == 'Mike';
        assert pg.getGrossMonthlyIncome == '$16666.67';
        assert pg.getMonthlyIncomeTax == '$4000.00';
        assert pg.getNetMonthlyIncome == '$12666.67';
    end

    def test_generatePayslip3
        pg = PayslipGenerator.new('John', 80150 );

        assert pg.instance_variable_get(:@employee_name)  == 'John';
        assert pg.getGrossMonthlyIncome == '$6679.17';
        assert pg.getMonthlyIncomeTax == '$837.08';
        assert pg.getNetMonthlyIncome == '$5842.08';
    end
end