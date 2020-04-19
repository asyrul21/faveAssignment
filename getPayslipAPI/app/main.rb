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
        totalAnnualTax += getTax(rate, taxableAmount)
    end

    # 200001 - 40000
    lowerBound = 20000;
    upperBound = 40000;
    rate = 10;
    if(salary > lowerBound)
        if(salary > upperBound)
            taxableAmount = upperBound - lowerBound;
        else
            taxableAmount = salary - lowerBound
        end
        totalTaxable += taxableAmount;
        totalAnnualTax += getTax(rate, taxableAmount)
    end

    # 400001 - 80000
    lowerBound = 40000;
    upperBound = 80000;
    rate = 20;
    if(salary > lowerBound)
        if(salary > upperBound)
            taxableAmount = upperBound - lowerBound;
        else
            taxableAmount = salary - lowerBound
        end
        totalTaxable += taxableAmount;
        totalAnnualTax += getTax(rate, taxableAmount)
    end

    # 80001 - 180000
    lowerBound = 80000;
    upperBound = 180000;
    rate = 30;
    if(salary > lowerBound)
        if(salary > upperBound)
            taxableAmount = upperBound - lowerBound;
        else
            taxableAmount = salary - lowerBound
        end
        totalTaxable += taxableAmount;
        totalAnnualTax += getTax(rate, taxableAmount)
    end

    # 180001 - above
    lowerBound = 180000;
    rate = 40;
    if(salary > lowerBound)                   
            taxableAmount = salary - lowerBound

            totalTaxable += taxableAmount;
            totalAnnualTax += getTax(rate, taxableAmount)
    end


    return String(totalAnnualTax);
end

def getTax(rate, amount)
    return ((rate / 100) * amount);
end

puts "Hello World!"