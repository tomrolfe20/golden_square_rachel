class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        @title = title
        @contents = contents
        @counter = 1
        @start = 0
    end
  
    def title
        @title
    end
  
    def contents
        @contents
    end
  
    def count_words
      @contents.split.length
    end
  
    def reading_time(wpm)
      count_words.to_f / wpm 
    end

    def reading_chunk(wpm, minutes)
      amount = wpm * minutes
      chunk = @contents.split
      chunk_cut = chunk.slice(@start,(amount * @counter))
      @start += amount
      @counter += 1
      return chunk_cut == [] ? "No contents left to read" : chunk_cut.join(' ')
    end
  end

=begin
words = ("hello " * 300) + ("goodbye " * 300) + ("oi " * 300)
entry = DiaryEntry.new("Dear diary", words)
number = entry.reading_chunk(300, 1.5)
puts number.split.length

  contents = 'hello hello hello hello hello goodbye goodbye goodbye goodbye goodbye'
  entry = DiaryEntry.new("Dear diary", contents)
  puts entry.reading_chunk(5, 1)
  puts entry.reading_chunk(5, 1)
=end


  # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.