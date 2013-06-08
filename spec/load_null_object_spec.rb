require 'spec_helper'

describe "Null Object loaded if 'load_null_object' is declared" do
  context "a class without a load_null_object call" do

    it "should raise an exception when calling name on nil" do
      s = School.new("High School")
      s.principal.nil?.should be_true
      expect { s.principal.name }.to raise_error(NameError)
    end

    it "should not raise a name error if the principal is not nil" do
      p = Principal.new("Jim Kirk", "jim@enterprise.uss","1234567890")
      s = School.new("High School", p)
      s.principal.nil?.should be_false
      expect { s.principal.name }.to_not raise_error(NameError)
      s.principal.name.should == "Jim Kirk"
    end

  end

  context "a class that has a load_null_object declaration" do
    # Create a school class that using this gem.
    class SchoolWithNullObjectLoader < School
      include NullObjectLoader

      load_null_object :principal, :null_class => NullPrincipal
    end

    it "should not raise an exception when calling name on nil" do
      s = SchoolWithNullObjectLoader.new("High School")
      s.principal.nil?.should be_true
      expect { s.principal.name }.to_not raise_error(NameError)
      s.principal.name.should == NullPrincipal.new.name
    end

  end

end