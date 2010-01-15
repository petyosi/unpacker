Spec::Matchers.define :be_valid_archive do
  match do |file|
    Unpacker.valid?(file) 
  end

  failure_message_for_should do |file|
    "#{file} not recognized as valid archive"
  end

  failure_message_for_should_not do |file|
    "#{file} wrongly recognized as valid archive"
  end

  description do
    "expected a valid archive file"
  end
end
