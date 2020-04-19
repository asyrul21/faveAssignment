module Api
    module V1
        class PayslipController < ApplicationController
            # functions here
            def index
                #anything

                #render
                render json: {
                    status: 'SUCCESS',
                    message: 'Rails API works!'
                }, status: :ok
            end

            def show
                name = params[:name];
                # Gross income
                annual_salary = Integer(params[:annual_salary]);
                monthly_income_gross = (annual_salary / 12.00);

                # Tax
                annual_tax = getAnnualTax(annual_salary)[:totalTax];
                monthly_tax = (annual_tax / 12.00);
                total_taxable_amount = getAnnualTax(annual_salary)[:totalTaxableAmount];

                # Net Income
                net_monthly = monthly_income_gross - monthly_tax;

                #render
                render json: {
                    status: 'SUCCESS',
                    message: 'Getting params works!',
                    data: {
                        employee_name: name,
                        gross_monthly_income: toCurrency(monthly_income_gross),
                        monthly_income_tax: toCurrency(monthly_tax),
                        net_monthly_income: toCurrency(net_monthly),
                        other: {
                            annual_salary: annual_salary,
                            total_taxable_amount: total_taxable_amount
                        }   
                    }
                }, status: :ok
            end

            private
            def getAnnualTax(salary)
                salary = Integer(salary);
            
                # some computations here
                totalTaxable = 0;
                totalAnnualTax = 0;
            
                # 0 - 20 000
                lowerBound = 0;
                upperBound = 20000;
                rate = 0;
                if(salary > lowerBound)
                    if(salary > upperBound)
                        taxableAmount = upperBound - lowerBound;
                    else
                        taxableAmount = salary - lowerBound
                    end

                    totalTaxable += taxableAmount;
                    tax = getTax(rate, taxableAmount);
                    totalAnnualTax += tax;
                end
            
                # 200001 - 40000
                lowerBound = 20000;
                upperBound = 40000;
                rate = 10;
                if(salary > lowerBound)
                    puts('Salary is currently in 20000 - 40000')
                    if(salary > upperBound)
                        taxableAmount = upperBound - lowerBound;
                    else
                        taxableAmount = salary - lowerBound
                    end
                    totalTaxable += taxableAmount;
                    tax = getTax(rate, taxableAmount);
                    totalAnnualTax += tax;
                end
            
                # 400001 - 80000
                lowerBound = 40000;
                upperBound = 80000;
                rate = 20;
                if(salary > lowerBound)
                    puts('Salary is currently in 40000 - 80000')
                    if(salary > upperBound)
                        taxableAmount = upperBound - lowerBound;
                    else
                        taxableAmount = salary - lowerBound
                    end
                    totalTaxable += taxableAmount;
                    tax = getTax(rate, taxableAmount);
                    totalAnnualTax += tax;
                end
            
                # 80001 - 180000
                lowerBound = 80000;
                upperBound = 180000;
                rate = 30;
                if(salary > lowerBound)
                    puts('Salary is currently in 80000 - 180000')
                    if(salary > upperBound)
                        taxableAmount = upperBound - lowerBound;
                    else
                        taxableAmount = salary - lowerBound
                    end
                    totalTaxable += taxableAmount;
                    tax = getTax(rate, taxableAmount);
                    totalAnnualTax += tax;
                end
            
                # 180001 - above
                lowerBound = 180000;
                rate = 40;
                if(salary > lowerBound)
                        puts('Salary is currently in 18000')                   
                        taxableAmount = salary - lowerBound
            
                        totalTaxable += taxableAmount;
                        tax = getTax(rate, taxableAmount);
                        totalAnnualTax += tax;
                end
                return {
                    totalTax: totalAnnualTax,
                    totalTaxableAmount: totalTaxable
                };
            end
            
            def getTax(rate, amount)
                return ((rate / 100.00) * amount);
            end

            def toCurrency(number)
                return '$%.2f' % String(number);
            end
        end
    end
end