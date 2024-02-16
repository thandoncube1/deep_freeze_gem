require "deep_freeze/version"

module DeepFreeze
  def deep_freeze object
    case object
    when String, Numeric, Symbol,NilClass, TrueClass, FalseClass
      object.freeze
    when Hash
      object.each { |key, value| deep_freeze(key) }
      object.freeze
    when Array
      object.each { |element| deep_freeze(element) }
      object.freeze
    else
      raise "Can't deep freeze objects of class #{object.class}"
    end
  end
end
