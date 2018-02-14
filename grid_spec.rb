require_relative "grid"

describe Grid do
  let(:grid) { Grid.new }

  it "initializes all cells as dead" do
    expect(grid.alive?(0, 0)).to eq(false)
  end

  it "can toggle cells alive" do
    grid.toggle(0, 0)
    expect(grid.alive?(0, 0)).to eq(true)
    expect(grid.alive?(0, 1)).to eq(false)
    expect(grid.alive?(2, 2)).to eq(false)
  end

  it "can toggle cells dead" do
    grid.toggle(0, 0)
    grid.toggle(0, 0)
    expect(grid.alive?(0, 0)).to eq(false)
  end

  describe "#tick" do
    it "removes cells that have no neighbors" do
      grid.toggle(0, 0)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(false)
    end

    it "removes cells that have one neighbor" do
      grid.toggle(0, 0)
      grid.toggle(0, 1)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(false)
    end

    it "preserves cells that have two horizontal neighbors" do
      grid.toggle(0, 0)
      grid.toggle(1, 0)
      grid.toggle(-1, 0)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(true)
    end

    it "preserves cells that have two vertical neighbors" do
      grid.toggle(0, 0)
      grid.toggle(0, 1)
      grid.toggle(0, -1)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(true)
    end

    it "preserves cells that have two diagonal neighbors" do
      grid.toggle(0, 0)
      grid.toggle(1, 1)
      grid.toggle(1, -1)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(true)
    end

    it "does not bring two-neighbor cells to life" do
      grid.toggle(1, 1)
      grid.toggle(1, -1)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(false)
    end

    it "preserves cells that have three neighbors" do
      grid.toggle(0, 0)
      grid.toggle(1, 1)
      grid.toggle(1, -1)
      grid.toggle(1, 0)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(true)
    end

    it "brings to life cells that have three neighbors" do
      grid.toggle(1, 1)
      grid.toggle(1, -1)
      grid.toggle(1, 0)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(true)
    end

    it "removes cells that have four neighbors" do
      grid.toggle(0, 0)
      grid.toggle(1, 1)
      grid.toggle(1, -1)
      grid.toggle(1, 0)
      grid.toggle(0, -1)
      grid.tick
      expect(grid.alive?(0, 0)).to eq(false)
    end
  end
end
