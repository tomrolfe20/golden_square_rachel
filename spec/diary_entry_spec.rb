require 'diary_entry'

describe DiaryEntry do 
    context 'Giving diary entry a title' do 
        it 'return the title' do 
            entry = DiaryEntry.new('Dear diary', "I've had a shocking day")
            expect(entry.title).to eq 'Dear diary'            
        end
    end
    context 'Testing the diary_entry #contents' do
        it 'return the contents' do
            entry = DiaryEntry.new('Dear diary', "I've had a shocking day") 
            expect(entry.contents).to eq "I've had a shocking day"
        end
    end
    context 'Testing the #count_words method' do
        it 'returns the number of words in the contents' do
            entry = DiaryEntry.new('Dear diary', "I've had a shocking day") 
            expect(entry.count_words).to eq 5
        end
    end
    context "Testing #reading_time method" do
        it "returns the length of time to read contents when wpm is passed" do
            word = "hello " * 400
            entry = DiaryEntry.new('Dear diary', word) 
            expect(entry.reading_time(200)).to eq 2
        end

        it "returns the length of time to read contents when non multiple of wpm is passed" do
            word = "hello " * 300
            entry = DiaryEntry.new("Dear diary", word)
            expect(entry.reading_time(200)). to eq 1.5
        end

        it "returns length of time to read one word" do
            entry = DiaryEntry.new("Dear diary", "hello")
            expect(entry.reading_time(200)). to eq 0.005
        end
    end
    context 'Testing the #reading_chunk method' do
        it 'return a string of 5 hellos' do
            word = 'hello ' * 5
            entry = DiaryEntry.new('Dear diary', word)
            expect(entry.reading_chunk(5, 1)).to eq 'hello hello hello hello hello'
        end
        
        it 'return a string of 5 goodbyes' do
            word = ('hello ' * 5) + ('goodbye ' * 5)
            entry = DiaryEntry.new('Dear diary', word)
            entry.reading_chunk(5,1)
            expect(entry.reading_chunk(5, 1)).to eq 'goodbye goodbye goodbye goodbye goodbye'
        end

        it 'return a string of 5 ois' do
            word = ('hello ' * 5) + ('goodbye ' * 5) + ('oi ' * 5)
            entry = DiaryEntry.new('Dear diary', word)
            entry.reading_chunk(5,1)
            entry.reading_chunk(5,1)
            expect(entry.reading_chunk(5, 1)).to eq 'oi oi oi oi oi'
        end

        it 'return a string of 3 ois' do
            word = ('hello ' * 5) + ('goodbye ' * 5) + ('oi ' * 3)
            entry = DiaryEntry.new('Dear diary', word)
            entry.reading_chunk(5,1)
            entry.reading_chunk(5,1)
            expect(entry.reading_chunk(5, 1)).to eq 'oi oi oi'
        end

        it 'returns a string of 450 words - hello * 300 and 150 * goodbye' do
            word = ("hello " * 300) + ("goodbye " * 300) + ("oi " * 300)
            entry = DiaryEntry.new("Dear diary", word)
            expect(entry.reading_chunk(300, 1.5)).to eq "hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello hello goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye"
        end

        it 'returns a string of 450 goodbye * 150 and oi * 300' do
            word = ("hello " * 300) + ("goodbye " * 300) + ("oi " * 300)
            entry = DiaryEntry.new("Dear diary", word)
            entry.reading_chunk(300, 1.5)
            expect(entry.reading_chunk(300, 1.5)).to eq 'goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye goodbye oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi oi'
        end

        it 'returns a string of 450 goodbye * 150 and oi * 300' do
            word = ("hello " * 300) + ("goodbye " * 300) + ("oi " * 300)
            entry = DiaryEntry.new("Dear diary", word)
            entry.reading_chunk(300, 1.5)
            entry.reading_chunk(300, 1.5)
            expect(entry.reading_chunk(300, 1.5)).to eq "No contents left to read"
        end
    end
end