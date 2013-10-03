require 'rails/generators'

module Uikit
  class InstallGenerator < Rails::Generators::Base
    desc "A basic set of user interface templates for your R<D-d>ails app"

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def generate_uikit
      copy_file "uikit.scss", "app/assets/stylesheets/uikit.scss"
      directory "uikit", "app/assets/stylesheets/uikit"
      directory "mixins", "app/assets/stylesheets/mixins"
    end
  end
end
