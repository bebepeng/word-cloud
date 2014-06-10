class WordCloud
  attr_reader :speakers

  def initialize(input)
    @speakers = input.map do |speaker, phrases|
      words = phrases.join(' ').split(' ')
      {speaker => words}
    end
  end

  def buzz_words
    speakers.map do |speaker|
      speaker.map do |person, word|
        p word.group_by {|i| i}
      end
    end
  end
end