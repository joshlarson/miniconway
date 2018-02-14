class Grid
  def initialize
    @cells = {}
  end

  def alive?(x, y)
    @cells.include?([x, y])
  end

  def toggle(x, y)
    @cells[[x, y]] = 0 if !@cells.delete([x, y])
  end

  def tick
    new_cells = {}
    neighbors_of(@cells) do |x, y|
      neighbor_count = 0
      neighbors_of({[x, y]=>0}) { |xx, yy| neighbor_count += 1 if alive?(xx, yy) }

      neighbor_count -= 1 if alive?(x, y)

      new_cells[[x, y]] = 0 if neighbor_count == 2 && alive?(x, y) || neighbor_count == 3
    end
    @cells = new_cells
  end

  private

  def neighbors_of(cells)
    cells.each do |(x, y), _|
      (-1..1).each { |dx| (-1..1).each { |dy| yield x+dx, y+dy } }
    end
  end
end
