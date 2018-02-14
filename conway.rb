require_relative "grid"

def display_grid(grid)
  rows = (-10..10).map do |y|
    columns = "|" + (-10..10).map { |x| grid.alive?(x, y) ? ?x : " " }.join + "|\n"
  end.reverse.join

  border = "+" + "-"*21 + "+\n"

  "#{border}#{rows}#{border}"
end

x, y = $_.split

$grid ||= Grid.new

if x == "t"
  $grid.tick
elsif x =~ /\d+/
  $grid.toggle(x.to_i, y.to_i)
end

puts display_grid($grid)
