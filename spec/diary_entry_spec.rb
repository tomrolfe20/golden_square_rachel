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
        
    end
end