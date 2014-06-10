class WordCloud
  attr_reader :speakers

  def initialize(input)
    @speakers = input.map do |speaker, phrases|
      words = phrases.join(' ').split(' ')
      {speaker => words}
    end
  end

  def buzz_words
    by_speaker = speakers.map do |speaker|
      speaker.map do |person, word|
        word.group_by { |i| i.downcase }.map do |unique, counts|
          {unique => {:count => counts.length, :people => person}}
        end
      end
    end.flatten

    by_word = by_speaker.reduce({}) do |h, pairs|
      pairs.each do |k, v|
        (h[k] ||= []) << v
      end; h
    end

    final = {}
    by_word.each do |key, value|
      count = 0
      people = []
      for i in 0... value.length
        count += value[i][:count]
        people << value[i][:people]
      end
      final[key] = {:count => count, :people => people}
    end
    final
  end
end