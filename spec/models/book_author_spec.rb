require 'spec_helper'

describe BookAuthor do
  before(:each) do
    @valid_book_author = BookAuthor.new :name => 'Michael Crichton'
  end

  describe "validations" do
    it "should be valid" do
      @valid_book_author.valid?.should == true
    end
    
    it "should validate the presence of name" do
      @valid_book_author.name = nil
      @valid_book_author.valid?.should == false
    end
  end
end
