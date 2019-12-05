# require modules here
require "yaml"

def load_library(filepath)
  # returns a hash
  # has two keys, 'get_meaning' and 'get_emoticon' 
  # the keys 'get_meaning' and 'get_emoticon' point to inner hashes 
  # the keys inside the 'get_meaning' hash are the Japanese emoticons 
  # the emoticon keys inside the 'get_meaning' hash point to their meanings 
  # the keys inside the 'get_emoticon' hash are the English emoticons 
  # the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents 
  
  dictionary = YAML.load_file(filepath)
  emoticons = dictionary.map { |emotion| emotion[1] }
  get_emoticon = emoticons.to_h
  
  meanings = dictionary.map { |emotion| [emotion[1][1], emotion[0]] }
  get_meaning = meanings.to_h

  {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
end


def get_japanese_emoticon(filepath, emoticon)
  #accepts two arguments, the YAML file path and the emoticon
  #calls on #load_library and gives it the argument of the file path
  #returns the Japanese equivalent of an English grinning 
  #returns the Japanese equivalent of an English happy 
  #returns the Japanese equivalent of an English sad 
  #returns an apology message if the argument is not a known emoticon 
  
  emoticons_dictionary = load_library(filepath)["get_emoticon"]

  if emoticons_dictionary.include?(emoticon)
    return emoticons_dictionary[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(filepath,emoticon)
  #accepts two arguments, the YAML file path and the emoticon 
  #calls on #load_library and gives it the argument of the file path 
  #returns the English meaning of the Japanese emoticon (＾ｖ＾) 
  #returns the English meaning of the Japanese emoticon (￣ー￣) 
  #returns the English meaning of the Japanese emoticon (Ｔ▽Ｔ) 
  #returns an apology message if the argument is not a known emoticon 
  
  emoticons_dictionary = load_library(filepath)["get_meaning"]
  if emoticons_dictionary.include?(emoticon)
    return emoticons_dictionary[emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end