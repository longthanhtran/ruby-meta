module StringRefinement
  refine String do
    def length
      super > 5 ? 'long' : 'short'
    end
  end
end

using StringRefinement

str = "War and Peace"

puts "With Refinement wrapper: #{str.length}"
