# frozen_string_literal: true

require "spec_helper"

describe ::RuboCop::Cop::Migrations::DefaultValue do
  subject(:cop) { described_class.new }

  context "when creating a new table" do
    it "warns about a column with a default value" do
      expect_offense(<<-RUBY.strip_indent)
        class CreateUsers < ActiveRecord::Migration
          def change
            create_table :users do |t|
              t.string :guid
              t.string :name, :default => "Zaphod"
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Default values are not allowed
            end
          end
        end
      RUBY
    end
  end

  context "when modifying an existing table" do
    it "warns about a column with a default value" do
      expect_offense(<<-RUBY.strip_indent)
        class AddNameToUsers < ActiveRecord::Migration
          def change
            add_column :users, :age, :integer
            add_column :users, :first_name, :string, :default => "Zaphod"
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Default values are not allowed
            add_column :users, :last_name, :string, :default => "Beeblebrox"
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Default values are not allowed
          end
        end
      RUBY
    end
  end
end
