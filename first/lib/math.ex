defmodule Math do
 def sum(a, b) do
   do_sum(a, b)
 end

 defp do_sum(a, b) do
   a + b
 end

 def zero?(0) do
   true
 end

 def zero?(x) when is_number(x) do
  false
 end

   #recursion
   def sum_list([head|tail], accumulator) do
     sum_list(tail, head + accumulator)
   end

   def sum_list([], accumulator) do
     accumulator
   end

end
