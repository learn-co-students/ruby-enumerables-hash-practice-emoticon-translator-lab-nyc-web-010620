# require modules here
require "yaml"
require 'pp'


def load_library(file)
  emoticons = YAML.load_file(file)
  hash = {:get_meaning => {},:get_emoticon => {}}
  emoticons.each {|k,v| hash[:get_meaning][v[1]] = k}
  emoticons.each {|k,v| hash[:get_emoticon][v[0]] = v[1]}
  hash
end

def get_japanese_emoticon(file, emoticon)
  lib = load_library(file)
#   if lib[:get_emoticon][emoticon]
#     return lib[:get_emoticon][emoticon]
#   else
#     return "Sorry, that emoticon was not found"
# end
lib[:get_emoticon][emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  lib = load_library(file)
  if lib[:get_meaning][emoticon]
    return lib[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end