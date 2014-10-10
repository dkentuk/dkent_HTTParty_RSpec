=begin
require 'spec_helper'
require 'date'

describe "Empty Collection Todos Tests" do
   
## This needs to be used for Non-Empty
#    before :each do
#        delete_all
#        hash = [
#            {title: "Never", due: Date.today.to_s},
#            {title: "gonna", due: Date.today.to_s},
#            {title: "give", due: Date.today.to_s},
#            {title: "you", due: Date.today.to_s},
#            {title: "up", due: Date.today.to_s}
#            ]
#        create_todos hash
#    end
    
    ## cleanup
    after :all do
        delete_all
    end
    
    ## Test Number 1
         it "Should try to create a todo item with just title and fail" do
        title = "Romeo"
                
        r = HTTParty.post url("/todos"), 
            query: {title: title }
        
        expect(r.code).to eq(422)
        end
    
    ## Test Number 2
        it "Should try to create a todo item with just title and fail" do
        due_date = "09-10-2013"
                 
        r = HTTParty.post url("/todos"), 
            query: {due: due_date}
        
        expect(r.code).to eq(422)
        end
    
    ## Test Number 3
    it "should create a Todo Item and succeed" do
        title = "Romeo"
        due_date = "2014-10-09"
        
        r = HTTParty.post url("/todos"),
                        query: {
                            title: title,
                            due: due_date
                            }
        
        expect(r.code).to eq(201)
        expect(r["title"]).to eq (title)
        expect(r["due"]).to eq(due_date)
    end
    
    ##Test Number 4
    it "Should try to create a todo item with no parameters and fails" do
       
        r = HTTParty.post url("/todos"), 
            query: {}
        
        expect(r.code).to eq(422)
    end
    
    ##Test Number 5
    it "Should get a collection with nothing inside of it" do
        
        r = HTTParty.get url("/todos")
            
        expect(r.code).to eq(200)
    end
    ##Test Number 6
    it "Should Put an empty collection" do
          r = HTTParty.put url("/todos"),
            query: {}
        
        expect(r.code).to eq (405) 
    end
    
    ##Test Number 7
      it "Should Delete and empty todos collection, " do
          r = HTTParty.delete url("/todos"),
            query: {}
        
        expect(r.code).to eq (405) 
    end
    end
=end