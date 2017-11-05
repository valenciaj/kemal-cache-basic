require "./kemal-cache-basic/*"

module Kemal
  module Cache
    class BasicHandler < Kemal::Handler

      property cache : Hash(String, Bytes)

      def initialize
        @cache = Hash(String, Bytes).new
      end

      def call(context)
        # get cache content if exists
        if output = @cache[context.request.resource]?
          # output content cached
          context.response.write output
        else
          # get a "pointer" to original output object
          client = context.response.output
          # create a buffer to allocate copy of content
          buffer = IO::Memory.new
          # set multiwriter to output a content en both objects
          context.response.output = IO::MultiWriter.new context.response.output, buffer
          # continue request
          call_next context
          # allocate content?
          allocate = context.get "cache"
          # allocate buffer content
          @cache[context.request.resource] = buffer.to_slice if allocate
          # close output
          client.close
        end
      end
    end
  end
end
