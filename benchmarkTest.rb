require 'benchmark'

n = 25000000
Benchmark.bm do |x|
  x.report("for:") { for i in 1..n; a = "1"; end }
  x.report("times:") { n.times do ; a = "1"; end }
  x.report("upto:") { 1.upto(n) do ; a = "1"; end }
end
