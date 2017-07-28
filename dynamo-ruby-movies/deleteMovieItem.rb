require "aws-sdk-core"
require 'time'
def delete_service_table(table_name, table_key_attributes)
    Aws.config.update({
      region: "us-west-2",
      endpoint: "http://localhost:8000"
    })
    
    dynamodb = Aws::DynamoDB::Client.new
    params = {}
    params[:table_name] = table_name
    params[:key] = table_key_attributes
    begin
        result = dynamodb.delete_item(params)
        puts result
    rescue  Aws::DynamoDB::Errors::ServiceError => error
        puts "Unable to update title:"
        puts "#{error.message}"
    end
end

table_name = "Movies"
year = 2017
title = "Bahubali"
key = {year: year, title: title}
delete_service_table(table_name, key)
