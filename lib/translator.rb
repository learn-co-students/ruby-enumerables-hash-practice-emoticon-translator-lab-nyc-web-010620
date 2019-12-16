require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new
  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |english_word, emoticons|
    emoticon_hash["get_emoticon"][emoticons.first] = emoticons.last
    emoticon_hash["get_meaning"][emoticons.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
   result = emoticon_hash["get_meaning"][emoticon]
   if result == nil
     result = "Sorry, that emoticon was not found"
   end
   result
end
