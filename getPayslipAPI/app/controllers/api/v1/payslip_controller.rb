require './app/PayslipGenerator';

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
                annual_salary = Integer(params[:annual_salary]);

                # Payslip generator class
                pg = PayslipGenerator.new(name, annual_salary);
                paySlip = pg.display;
                paySlip = pg.getPaySlip;

                #render
                render json: {
                    status: 'SUCCESS',
                    message: 'Getting params works!',
                    data: {
                        employee_name: name,
                        gross_monthly_income: paySlip[:gross_monthly_income],
                        monthly_income_tax: paySlip[:monthly_income_tax],
                        net_monthly_income: paySlip[:net_monthly_income]
                    }
                }, status: :ok
            end
        end
    end
end