module RubyFlattenArray
  class Flatten
    def initialize(object)
      @object = object
    end

    def call
      raise ArgumentError, "can't flatten '#{@object}'" \
        unless @object.is_a?(Array)

      flatten(@object.to_a)
    end

    private

    def flatten(obj)
      if obj.is_a?(Array)
        obj.each_with_object([]) { |el, accu| accu.push(*flatten(el)) }
      else
        obj
      end
    end
  end
end
