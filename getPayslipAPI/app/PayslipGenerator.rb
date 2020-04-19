require_relative 'TaxCalculator';

class PayslipGenerator
    def initialize(name, annualSalary)
        # intance variables
        @employee_name = name;

        # Gross income
        @annual_salary = annualSalary;
        @monthly_income_gross = (@annual_salary / 12.00);

        # Tax
        @Tax = computeTax;

        @annual_tax = @Tax[:annual_tax];
        @monthly_tax = (@annual_tax/12.00);
        
        # Net Income
        @net_monthly = (@monthly_income_gross - @monthly_tax);
        @totalTaxableAmount = @Tax[:total_taxable];
    end

    # computers
    def computeTax()
        tc = TaxCalculator.new(@annual_salary);
        tc.calculateTax;
        # puts('Tax: ' + String(totalTax[:totalTax]));
        return {
            annual_tax: tc.getTotalAnnualTax,
            total_taxable: tc.getTotalTaxableAmount
        }
    end

    # getters
    def getPaySlip()
        return  {
                employee_name: @employee_name,
                gross_monthly_income: toCurrency(@monthly_income_gross),
                monthly_income_tax: toCurrency(@monthly_tax),
                net_monthly_income: toCurrency(@net_monthly)
            }
    end

    def toCurrency(number)
        return '$%.2f' % String(number);
    end

    def display()
        puts('******************************');
        puts('Name of employee: ' + @employee_name);
        puts('Gross Annual income: ' + toCurrency(@annual_salary));
        puts('Gross monthly income: ' + toCurrency(@monthly_income_gross));
        puts('Total taxable amount: ' + toCurrency(@totalTaxableAmount));
        puts('Total Annual tax: ' + toCurrency(@annual_tax));
        puts('Monthly income tax: ' + toCurrency(@monthly_tax));
        puts('Net monthly income: ' + toCurrency(@net_monthly));
    end

    # some getters
    def getTotalAnnualTax
        return @annual_tax;
    end

    def getTotalTaxableAmount
        return @totalTaxableAmount;
    end
end