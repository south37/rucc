require "forwardable"

module Rucc
  class FileIOList
    extend Forwardable

    # @param [FileIO] file
    def initialize(file)
      @files = [file]
      @stashed = []  # buffer for stashed files
    end
    delegate [:push, :first, :last] => :@files

    # @return [FileIO]
    def current
      @files.last
    end

    # @return [Char, NilClass]
    def readc
      while true
        c = current.readc
        if !c.nil?  # not EOF
          return c
        end

        if @files.size == 1
          return c
        end
        f = @files.pop
        f.close
        next
      end
      raise "Must not reach here!"
    end

    # @param [Char, NilClass]
    def unreadc(c)
      current.unreadc(c)
    end

    # @param [<FileIO>] files
    def stream_stash(files)
      @stashed.push(@files)
      @files = files
    end

    def stream_unstash
      @files = @stashed.pop
    end

    def stream_depth
      @files.size
    end
  end
end
