class WordCloud
  attr_reader :speakers

  def initialize(input)
    @speakers = input.each do |speaker, phrases|
      words = phrases.join(' ').split(' ')
      input[speaker] = words.map { |word| word.downcase }
    end
  end

  def buzz_words
    words_said = {}
    speakers.each do |speaker, words|
      words.each do |word|
        if words_said.has_key?(word)
          words_said[word][:count] += 1
          if !words_said[word][:people].include?(speaker)
            words_said[word][:people] << speaker
          end
        else
          words_said[word] = {:count => 1, :people => [speaker]}
        end
      end
    end
    words_said
  end
end