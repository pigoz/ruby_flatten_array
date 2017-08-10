require "spec_helper"

RSpec.describe RubyFlattenArray::Flatten do
  let(:command) { RubyFlattenArray::Flatten }

  it "rejects nil" do
    expect { command.new(nil).() }.to raise_error(ArgumentError)
  end

  it "rejects {}" do
    expect { command.new({}).() }.to raise_error(ArgumentError)
  end

  it "rejects Object" do
    expect { command.new(Object).() }.to raise_error(ArgumentError)
  end

  it "flattens itself" do
    expect(command.new([1, 2, 3, 4]).()).to eql([1, 2, 3, 4])
  end

  it "flattens first level" do
    expect(command.new([1, [2, 3], 4]).()).to eql([1, 2, 3, 4])
  end

  it "flattens deeply" do
    expect(command.new([1, [2, [:a, 5], 6], 4]).()).to eql([1, 2, :a, 5, 6, 4])
  end

  it "flattens test input" do
    expect(command.new([1, [2, [3]], 4]).()).to eql([1, 2, 3, 4])
  end
end
