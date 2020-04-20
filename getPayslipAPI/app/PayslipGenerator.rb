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
        return {
            annual_tax: tc.getTotalAnnualTax,
            total_taxable: tc.getTotalTaxableAmount
        }
    end

    def toCurrency(number)
        return '$%.2f' % String(number);
    end

    # some getters
    def getPaySlip()
        return  {
                employee_name: @employee_name,
                gross_monthly_income: toCurrency(@monthly_income_gross),
                monthly_income_tax: toCurrency(@monthly_tax),
                net_monthly_income: toCurrency(@net_monthly)
            }
    end

    def getGrossMonthlyIncome
        return toCurrency(@monthly_income_gross);
    end

    def getMonthlyIncomeTax
        return toCurrency(@monthly_tax);
    end

    def getNetMonthlyIncome
        return toCurrency(@net_monthly);
    end

    def getTotalAnnualTax
        return toCurrency(@annual_tax);
    end

    def getTotalTaxableAmount
        return toCurrency(@totalTaxableAmount);
    end

    # display
    def display()
        puts('******************************');
        puts('Monthly Payslip for: ' + @employee_name);
        puts('Gross Annual income: ' + toCurrency(@annual_salary));
        puts('Gross Monthly Income: ' + toCurrency(@monthly_income_gross));
        puts('Total taxable amount: ' + toCurrency(@totalTaxableAmount));
        puts('Total Annual tax: ' + toCurrency(@annual_tax));
        puts('Monthly Income Tax: ' + toCurrency(@monthly_tax));
        puts('Net Monthly Income: ' + toCurrency(@net_monthly));
    end
end