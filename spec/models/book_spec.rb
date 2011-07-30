require 'spec_helper'

describe Book do
  # :all or :each
  before(:each) do
    @valid_book = Book.new :goodreads_id => 1, 
      :title       => 'Harry Potter', 
      :finished_at => Time.now, 
      :num_pages   => 893
  end

  describe "validations" do
    it "should be valid" do
      @valid_book.valid?.should == true
    end
    
    pending "need more Book validation specs"
  end

  describe "add_author" do
    it "should add a new author relation" do
      b = @valid_book
      b.add_author 'John Smith'
      b.valid?.should == true
      b.authors.size.should == 1
      b.authors.first.name.should == 'John Smith'
    end
  end

  describe "author" do
    it "should show just a single author name" do
      b = Book.new
      b.add_author 'John Smith'
      b.author.should == 'John Smith'
    end

    it "should concatenate two author names with 'and'" do
      b = Book.new
      b.add_author 'John Smith'
      b.add_author 'Jane Doe'
      b.author.should == 'John Smith, and Jane Doe'
    end

    it "should create a phrase with three or more author names" do
      b = Book.new
      b.add_author 'John Smith'
      b.add_author 'Jane Doe'
      b.add_author 'Ben Bernanke'
      b.author.should == 'John Smith, Jane Doe, and Ben Bernanke'
    end
  end
end
