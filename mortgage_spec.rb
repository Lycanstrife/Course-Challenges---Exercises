def provide_mortgage?(property_value, deposit, salary)
	min_deposit = 0.2
	sufficient_deposit = deposit >= property_value * min_deposit
	loan_amount = property_value - deposit
	salary_multiplier = 0.2
	sufficient_salary = salary >= loan_amount * salary_multiplier
	sufficient_deposit && sufficient_salary 
end

describe "Mortgage Provider" do

	it "should provide a mortgage if we borrow less than 5x salary" do
		expect(provide_mortgage?(100_000, 20_000, 20_000)).to be_true
	end

	it "should not provide a mortgage if we borrow over 5x salary" do
		expect(provide_mortgage?(100_000, 20_000, 10_000)).to be_false
	end

	it "should provide a mortgage with a 20% deposit" do
		expect(provide_mortgage?(200_000, 40_000, 100_000)).to be_true
	end

	it "should not provide a mortgage with a 10% deposit" do
		expect(provide_mortgage?(200_000, 20_000, 100_000)).to be_false
	end

end