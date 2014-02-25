def monthly_payment(salary_per_annum)
	return salary_per_annum / 12
end

puts "If the salary is £30,000 per year,"
puts "the monthly amount will be #{monthly_payment(30000)}"