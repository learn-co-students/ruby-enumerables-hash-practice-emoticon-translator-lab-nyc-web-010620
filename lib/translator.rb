# require modules here
require 'yaml'

def load_library(file_path)
  emoticon_list = YAML.load_file(file_path)
  # p emoticon_list

  emoticon_hash = {
    :get_emoticon => {},
    :get_meaning => {}
  }

  emoticon_list.each { | key, value |
    emoticon_hash[:get_emoticon][value[0]] = emoticon_list[key][1]
    emoticon_hash[:get_meaning][value[1]] = key
  }
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_list = load_library(file_path)

  if emoticon_list[:get_emoticon][emoticon]
    return emoticon_list[:get_emoticon][emoticon]
  else
    p "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_list = load_library(file_path)

  if emoticon_list[:get_meaning][emoticon]
    return emoticon_list[:get_meaning][emoticon]
  else
    p "Sorry, that emoticon was not found"
  end
end
