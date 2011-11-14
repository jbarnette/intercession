module Intercession

  # Duh.
  VERSION = "3.0.0"

  def self.included klass
    klass.append_after_filter :intercede_after

    ks =  []
    ks << ActionDispatch::Session::AbstractStore::SessionHash rescue nil
    ks << CGI::Session rescue nil

    ks.compact.each { |c| c.send :include, Transient::Session }
  end

  def self.test!
    ActionController::TestSession.send :include, Transient::Session
  end

  def intercede_after
    # FIX: this obviously won't work with after filters in subclasses.
    session.before_save if session.respond_to? :before_save
  end
end
