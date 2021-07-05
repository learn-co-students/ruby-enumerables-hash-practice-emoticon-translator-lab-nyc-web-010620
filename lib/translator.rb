require 'yaml'
require 'pry'

# emoticons = 
# {
# "angel"=>["O:)", "☜(⌒▽⌒)☞"],
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrased"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆"],
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]
# }

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  emoticon_hash["get_meaning"] = {}
  emoticon_hash["get_emoticon"] = {}
    
    emoticons.each do |english,emoticons_array|
      emoticon_hash["get_emoticon"][emoticons_array[0]] = emoticons_array[1]
      emoticon_hash["get_meaning"][emoticons_array[1]] = english
    end 
    emoticon_hash
end 

def get_japanese_emoticon(path,emoticon)
  emoticon_hash = load_library(path)
  output = emoticon_hash["get_emoticon"][emoticon]
    if output == nil
      return "Sorry, that emoticon was not found"
    end 
  output
end 

def get_english_meaning(path,emoticon)
  emoticon_hash = load_library(path)
  output = emoticon_hash["get_meaning"][emoticon]
    if output == nil 
      return "Sorry, that emoticon was not found"
    end 
    output
end 



