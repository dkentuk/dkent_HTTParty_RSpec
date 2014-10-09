require 'spec_helper'

describe "Todos JSON Interface" do
    
    before :each do
        delete_all
        hash = [
            {title: "Never", due: Date.today.to_s},
            {title: "gonna", due: Date.today.to_s}
        }
        create_todos hash
    end
    
    after :all do
        delete_all
    end
    
    it "should create a Todo Item" do
        title = "Test Todo"
        due_date = "2001-01-01"
        
        r = HTTParty.post url("/todos"),
                        query: {
                            title: title,
                            due: due_date
                            }
        
        expect(r.code).to eq(201)
        expect(r["title"]).to eq (title)
        expect(r["due"]).to eq(due_date)
        end
    end