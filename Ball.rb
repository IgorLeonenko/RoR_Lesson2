class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end
end

class Ball
  def self.shake
    answers = [
             'Don’t count on it', 'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful',
             'As I see it, yes', 'Most likely', 'Outlook good', 'Signs point to yes', 'Yes',
             'Reply hazy, try again', 'Ask again later', 'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again',
             'It is certain', 'It is decidedly so', 'Without a doubt', 'Yes — definitely', 'You may rely on it'               
            ]

    case answers.index(answers.sample)
      when 0..4
        puts answers[0..4].sample.red
      when 5..9
        puts answers[5..9].sample.green
      when 10..15
        puts answers[10..15].sample.yellow
      when 16..20
        puts answers[16..20].sample.blue
    end
  end
end

def ask_question
  question = gets.chomp
  if question == 'q'
    puts 'Good Bye!'.colorize(rand(31..34))
    exit
  end
end

puts 'Ask Magic Ball a question: (q to quit)'

while(true)
  ask_question
  puts '-=+++shake shake shake+++=-'
  sleep 0.8
  puts Ball.shake
  puts '---------------'
  puts 'Ask again:'
end