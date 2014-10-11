require 'spec_helper'
require 'date'

describe "Non-Exisiting Todos Tests" do
   
# This needs to be used for Non-Empty
    before :each do
        delete_all
        hash = [
            {title: "Never", due: Date.today.to_s},
            {title: "gonna", due: Date.today.to_s},
            {title: "give", due: Date.today.to_s},
            {title: "you", due: Date.today.to_s},
            {title: "up", due: Date.today.to_s}
            ]
        create_todos hash
        a = get_id_all
    end
    
    ## cleanup
    after :all do
        delete_all
    end
    
    ## Test 1
    it "should return nothing" do
        
        r = HTTParty.get url("/todos/1")
                      
        expect(r.code).to eq(404)
    end
    
    ## Test 2
    it "should return a 405 as not allowed to post" do
        title = "aaron"
        due_date = "1991-07-21"
        
        r = HTTParty.post url("/todos/1"),
                        query: {
                            title: title,
                            due: due_date
                            }

        expect(r.code).to eq(405)
    end
    
    ## Test 3
    it "should return a 405 after passing empty parameters to an object" do
        
        r = HTTParty.post url("/todos/1"),
                        query: {}
        
        expect(r.code).to eq(405)
    end
    
    ## Test 4
    it "should provide fail as it does not provid any parameters" do
        
        r = HTTParty.put url("/todos/1"),
                        query: {}
        
        expect(r.code).to eq(422)
    end
   
    ## Test 5
        it "should return a 404 as that file doesn't exisit" do
        title = "aaron"
        due_date = "1991-07-21"
        
        r = HTTParty.put url("/todos/1"),
                        query: {
                            title: title,
                            due: due_date
                            }

        expect(r.code).to eq(404)
    end
    
    ## Test 6
        it "should return a 404 as the file is not there, therefore it cannont be deleted" do
            
        r = HTTParty.delete url("/todos/1"),
                        query: {}
        
        expect(r.code).to eq(404)
    end
end
