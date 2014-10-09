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
    end
    
    ## cleanup
    after :all do
        delete_all
    end
    
    ## 
    it "should create a Todo Item and succeed" do
        
        r = HTTParty.get url("/todos")
                      
        expect(r.code).to eq(200)

    end
end
    