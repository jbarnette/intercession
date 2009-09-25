unless defined?(ApplicationController)
  if ActionPack::Version::MAJOR == 2 && ActionPack::VERSION::MINOR >= 3 # Rails 2.3+
    require "application_controller"
  else # Rails 2.2 or earlier
    require "application"
  end
end

ApplicationController.send :include, Intercession::Lifecycle
