require "application"
ApplicationController.send :include, Intercession::Lifecycle
