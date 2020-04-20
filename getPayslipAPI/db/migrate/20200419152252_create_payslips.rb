class CreatePayslips < ActiveRecord::Migration[6.0]
  def change
    create_table :payslips do |t|
      t.string :employee_name
      t.string :gross_monthly_income
      t.string :monthly_income_tax
      t.string :net_monthly_income

      t.timestamps
    end
  end
end
