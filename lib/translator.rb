require 'yaml'

def load_library(file_path)
  hash = YAML.load_file(file_path)
  new_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }

  hash.each do |k , v|
    new_hash[:get_meaning][v[1]] = k
    new_hash[:get_emoticon][v[0]] = v[1]
  end

  new_hash
end

# From American emoji to Japanese emoji
def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)

  if hash[:get_emoticon][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    pp hash[:get_emoticon][emoticon]
  end
end

# From Japanese to English
def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)

  if hash[:get_meaning][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    hash[:get_meaning][emoticon]
  end
end
