# frozen_string_literal: true

require "spec_helper"

describe ::RuboCop::Cop::Migrations::ConcurrentIndex do
  subject(:cop) { described_class.new }

  context "when creating a new table" do
    it "does not warn about a new index that is not added concurrently" do
      expect_no_offenses(<<-RUBY.strip_indent)
        def up
          create_table :users do |t|
            t.string :name
          end

          add_index :users, :name, :algorithm => :concurrently
        end
      RUBY
    end
  end

  context "when modifying an existing table" do
    it "does not warn about a new index that is added concurrently" do
      expect_no_offenses(<<-RUBY.strip_indent)
        def up
          add_index :users, :name, :algorithm => :concurrently
        end
      RUBY
    end

    it "warns about a new index that is not added concurrently" do
      expect_offense(<<-RUBY.strip_indent)
        def up
          create_table :users_2 do |t|
            t.string :name
          end

          add_index :users, :name
          ^^^^^^^^^^^^^^^^^^^^^^^ Index must be added concurrently
        end
      RUBY
    end
  end
end
