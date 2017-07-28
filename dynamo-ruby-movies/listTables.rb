require "aws-sdk-core"

Aws.config.update({
  region: "us-west-2",
  endpoint: "http://localhost:8000"
})

dynamodb = Aws::DynamoDB::Client.new
# params = {

# }

begin
    result = dynamodb.list_tables(exclusive_start_table_name: 'mov', limit: 1)
    puts "List of all tables in DynamoDB: " 
    puts result["table_names"]

rescue  Aws::DynamoDB::Errors::ServiceError => error
    puts "Unable to list of Dynamodb tables:"
    puts "#{error.message}"
end
