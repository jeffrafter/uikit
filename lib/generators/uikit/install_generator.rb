require 'rails/generators'

module Uikit
  class InstallGenerator < Rails::Generators::Base
    desc "A basic set of user interface templates for your Rails app"

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def generate_uikit
      copy_file "app/assets/stylesheets/uikit.scss", "app/assets/stylesheets/uikit.scss"
      directory "app/assets/stylesheets/uikit", "app/assets/stylesheets/uikit"
      directory "app/assets/stylesheets/mixins", "app/assets/stylesheets/mixins"
      directory "app/views/layouts", "app/views/layouts"

      # We don't want to overwrite this file
      insert_at_end_of_class "app/helpers/application_helper.rb", "app/helpers/application_helper.rb"
    end

    protected

    def insert_at_end_of_class(filename, source)
      source = File.expand_path(find_in_source_paths(source.to_s))
      context = instance_eval('binding')
      content = ERB.new(::File.binread(source), nil, '-', '@output_buffer').result(context)
      insert_into_file filename, "#{content}\n", before: /end\n*\z/
    end
  end
end
