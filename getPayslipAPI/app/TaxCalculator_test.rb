# ruby TaxCalculator_test.rb
require 'minitest/autorun'

# import classes
require_relative './TaxCalculator.rb';

class TaxCalculatorTest < Minitest::Test
    def test_calculateAnnualTax
        tx = TaxCalculator.new(60000);
        tx.calculateTax;
        assert tx.getTotalAnnualTax == 6000;
        assert tx.getTotalTaxableAmount == 60000;
    end

    def test_calculateAnnualTax2
        tx = TaxCalculator.new(200000);
        tx.calculateTax;
        assert tx.getTotalAnnualTax == 48000;
        assert tx.getTotalTaxableAmount == 200000;
    end

    def test_calculateAnnualTax3
        tx = TaxCalculator.new(80150);
        tx.calculateTax;
        assert tx.getTotalAnnualTax == 10045;
        assert tx.getTotalTaxableAmount == 80150;
    end
end