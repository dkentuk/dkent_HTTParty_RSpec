require 'spec_helper'
require 'date'

describe "Existing Object Todos Tests" do
   
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
        get_id_all
    end
    
    ## cleanup
    after :all do
        delete_all
    end
    
    ## Test 1
    it "should create a Todo Item and succeed" do
        
        r = HTTParty.get url("/todos/#{@id[0]["id"]}"),
            query: {}
                      
        expect(r.code).to eq(200)
    end
    
    ## Test 2 Post
        it "should create a Todo Item and fail" do

        d = HTTParty.post url("/todos/#{@id[0]["id"]}")
                      
        expect(d.code).to eq(405)
    end
    
    ## Test 3 
        it "should post an existing object" do
        title = "Aaron"
        due_date = "21-07-1991"
        
        r = HTTParty.post url("/todos/#{@id[0]["id"]}"),
                        query: {
                            title: title,
                            due: due_date
                            }
        
        expect(r.code).to eq(405)
    end

    ## Test 4
        it "should create a Todo Item and succeed" do
        
        r = HTTParty.put url("/todos/#{@id[0]["id"]}"),
            query: {}
                      
        expect(r.code).to eq(422)
    end

    ## Test 5
        it "should post an existing object" do
        title = "Aaron"
        due_date = "21-07-1991"
        
        r = HTTParty.put url("/todos/#{@id[0]["id"]}"),
                        query: {
                            title: title,
                            due: due_date
                            }
        
        expect(r.code).to eq(200)
    end
end
    