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
end