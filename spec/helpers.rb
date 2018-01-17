module Helpers
  class << self
    def normalize(expect)
      r = []
      expect.split("\n").each do |el|
        if !el.nil? && (el.match(/^\t\.file/) || el.match(/^\t\.loc/) || el.match(/^\t#/))
          next
        end
        r.push(el)
      end
      r.map { |l| "#{l}\n" }.join
    end
  end
end
