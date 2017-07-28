require "aws-sdk-core"

Aws.config.update({
  region: "us-west-2",
  endpoint: "http://localhost:8000"
})

dynamodb = Aws::DynamoDB::Client.new

year = 2017
title = "Bahubali"

item = {
    year: year,
    title: title,
    info: {
            plot: "Fight between cousins to rule",
            rating: 0
    }
}

params = {
    table_name: "Movies",
    item: item
}

begin
    result = dynamodb.put_item(params)
    puts "Added item: #{year}  - #{title}"

rescue  Aws::DynamoDB::Errors::ServiceError => error
    puts "Unable to add item:"
    puts "#{error.message}"
end
