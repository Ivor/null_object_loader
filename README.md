# NullObjectLoader

This little gem lets you declare what null objects to instantiate if a certain method call returns nil.

## Installation

Add this line to your application's Gemfile:

    gem 'null_object_loader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install null_object_loader

## Usage

In your class

    include NullObjectLoader

Then, if you would like to load a null object if a method returns nil:

    load_null_object :method_name_here, :null_class => NullObjectClassHere

Example:

    class OldSchool
      attr_accessor :principal
      def initialize(principal = nil)
        @principal = principal
      end
    end
    OldSchool.new.principal.name # => NameError: Undefined method 'name' for nil:NilClass

Now, with NullObjectLoader

    class NullPrincipal
      def name; "No Principal"; end
    end

    class NewSchool < OldSchool
      include NullObjectLoader

      load_null_object :principal, :null_class => NullPrincipal
    end
    NewSchool.new.principal.name # => "No Principal"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
