# require modules here
require 'yaml'

def load_library(emoticon_file)
  # code goes here
  emoticons = YAML.load_file('./lib/emoticons.yml')
  
  library = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  
  emoticons.each { |key, value|
    library['get_meaning'][value[1]] = key 
    library['get_emoticon'][value[0]] = value[1]
  }
  end
  return library
end

def get_japanese_emoticon(library, emoticon)
  # code goes here
  japanese = (load_library(library))['get_meaning'][emoticon]
  if japanese == nil
    return 'Sorry, that emoticon was not found'
  else
    return japanese
  end
  
end

def get_english_meaning(library, emoticon)
  # code goes here
  english = (load_library(library))['get_meaning'][emoticon]
  if english == nil
    return 'Sorry, that emoticon was not found'
  else
    return english
  end
end