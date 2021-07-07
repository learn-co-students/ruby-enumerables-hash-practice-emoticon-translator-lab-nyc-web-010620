# require modules here
require "yaml"

#emoticons = './lib/emoticons.yml'
def load_library(file)
  # code goes here
  emoticon_file = YAML.load_file('./lib/emoticons.yml')
  emoticon_library = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  emoticon_file.each do |meaning, emojis|
    english_emoticon = emojis[0]
    japanese_emoticon = emojis[1]
    emoticon_library[:get_meaning][japanese_emoticon] = meaning
    emoticon_library[:get_emoticon][english_emoticon] = japanese_emoticon
  end 
  
  return emoticon_library
  
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  emoticon_library = load_library(file)
  
  if emoticon_library[:get_emoticon].include?(emoticon)
    emoticon_library[:get_emoticon][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file, emoticon)
  # code goes here
  emoticon_library = load_library(file)
  if emoticon_library[:get_meaning].include?(emoticon)
    emoticon_library[:get_meaning][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end 
end