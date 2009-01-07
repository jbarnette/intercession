module Intercession
  module Lifecycle
    def self.included klass
      klass.prepend_before_filter :intercede_before
      klass.append_after_filter :intercede_after
    end

    def intercede_before
      session.extend Transient::Session
      session.after_initialize if session.respond_to? :after_initialize
    end

    def intercede_after
      session.before_save if session.respond_to? :before_save
    end
  end
end
