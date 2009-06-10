Spec::Matchers.define :be_unpacked_correctly_to do |contents|
  match do |file, matcher|
    Unpacker.unpack(file) do |result|
      result.entries.include?(contents)
    end
  end

  failure_message_for_should do |file|
    "#{file} was not unpacked"
  end

  description do
    "expects to unpack a file"
  end
end
