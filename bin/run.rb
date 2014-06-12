require_relative '../lib/word_cloud'
require 'json'

file = File.read('../data/quotes.json')
words = WordCloud.new(JSON.parse(file))
p words.buzz_words