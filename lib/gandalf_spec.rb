require 'rspec'
require_relative 'gandalf'

describe Gandalf do
  before do
    $stdout = StringIO.new
    $stderr = StringIO.new
  end

  it "tests if a parameter is a file and if true, returns stripped file contents" do
    Gandalf::the_validator("test_file.txt").should == "AAAACCCGGTuxn-"
  end

  context "on valid string characters" do
    it "strips String and gives it back to us" do
      Gandalf::the_validator("AAAACCCGGT\n").should == "AAAACCCGGT"
    end
  end

  context "on invalid string characters" do
    it "dies and prints out message" do
      # lambda catches kernel errors and passes them to RSPEC apparently
      lambda {Gandalf::the_validator( "AAAACCCGGTXi-UN" )}.should raise_error SystemExit
    end
  end
end
