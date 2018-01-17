require "rucc/version"
require "rucc/engine"

module Rucc
  def self.root
    File.expand_path '../..', __FILE__
  end
end
