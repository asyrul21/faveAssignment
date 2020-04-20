class TaxCalculator
    def initialize(salary)
        @salary = salary;
        @boundaries = [0, 20000, 40000, 80000, 180000];
        @rates = [0, 10, 20, 30, 40];
        @totalTax = 0;
        @totalTaxableAmount = 0;

        if(@boundaries.length() != @rates.length())
            raise Exception.new "Boundary length must be equal to rates length!";
        end
    end

    def calculateTax()
        # some computations here
        totalTaxable = 0.00;
        totalAnnualTax = 0.00;
        for i in 0..@boundaries.length() - 1
            # puts String(@boundaries[i]);
            rate = @rates[i];

            # logic start
            # if last item
            if(i == @boundaries.length() - 1)
                # 180001 - above # no upper bound
                lowerBound = @boundaries[i];
                
                if(@salary > lowerBound)                  
                        taxableAmount = @salary - lowerBound;
            
                        totalTaxable += taxableAmount;
                        tax = getTax(rate, taxableAmount);
                        totalAnnualTax += tax;
                end
            else
                lowerBound = @boundaries[i];
                upperBound = @boundaries[i + 1];
                if(@salary > lowerBound)
                    if(@salary > upperBound)
                        taxableAmount = upperBound - lowerBound;
                    else
                        taxableAmount = @salary - lowerBound;
                    end
    
                    totalTaxable += taxableAmount;
                    tax = getTax(rate, taxableAmount);
                    totalAnnualTax += tax;
                end
            end
        end

        # set to instance variable
        @totalTax += totalAnnualTax;
        @totalTaxableAmount += totalTaxable;

        # return {
        #     totalTax: totalAnnualTax,
        #     totalTaxableAmount: totalTaxable
        # };
    end

    def getTax(rate, amount)
        return ((rate / 100.00) * amount);
    end

    # getters
    def getTotalAnnualTax
        return @totalTax
    end

    def getTotalTaxableAmount
        return @totalTaxableAmount
    end

    # boundaries and rates could have their own setters
    # to introduce dynamic Tax brackets

end