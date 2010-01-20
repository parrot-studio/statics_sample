require 'standard_deviation_analyzer'
require 'order_statistic_analyzer'

list = [1,2,3,4,5,6,7,8,9,10]
sda = StandardDeviationAnalyzer.new(list)
osa = OrderStatisticAnalyzer.new(list)

p sda.ave
p sda.div

p osa.median
p osa.iqr
p osa.q1
p osa.q3


