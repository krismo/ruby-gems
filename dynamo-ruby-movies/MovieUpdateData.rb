require "aws-sdk-core"

Aws.config.update({
  region: "us-west-2",
  endpoint: "http://localhost:8000"
})

dynamodb = Aws::DynamoDB::Client.new

year = 2017
title = "Bahubali"

params = {
    table_name: "Movies",
    key: {
        year: year,
        title: title
    },
    # update_expression: "set info.rating = :r, info.plot=:p, info.actors=:a, info.director=:d", 
    #update_expression: "set titletag = :titletag",
    update_expression: "set updatedDate = :d",
    expression_attribute_values: {
         ":d" => Time.now.to_s,
        # ":p" => "Fight between cousins to rule", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        # ":a" => ["Prabhas", "Rana", "Anushka", "Ramya Krishna"],
        # ":d" => "S.S. Rajamouli",
        #":titletag" => "Conclusion"
        
    },
    return_values: "UPDATED_NEW"
}

begin
    result = dynamodb.update_item(params)
    puts result

rescue  Aws::DynamoDB::Errors::ServiceError => error
    puts "Unable to update title:"
    puts "#{error.message}"
end
