class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        @title = title
        @contents = contents
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
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end
  end