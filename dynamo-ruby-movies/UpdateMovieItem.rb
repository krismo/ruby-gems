require "aws-sdk-core"
require 'time'
def update_service_table(table_name, table_key_attributes, update_expression, expression_attribute_values)
    Aws.config.update({
      region: "us-west-2",
      endpoint: "http://localhost:8000"
    })
    
    dynamodb = Aws::DynamoDB::Client.new
    params = {}
    params[:table_name] = table_name
    params[:key] = table_key_attributes
    params[:update_expression] = update_expression
    params[:expression_attribute_values] = expression_attribute_values
    params[:return_values] = "UPDATED_NEW"
    begin
        result = dynamodb.update_item(params)
        puts result
    rescue  Aws::DynamoDB::Errors::ServiceError => error
        puts "Unable to update title:"
        puts "#{error.message}"
    end
end

table_name = "Movies"
key = {year: 2017,title: "Bahubali"}
update_service_table(table_name, key, "set titletag = :titletag, createdDt = :createdDt", {":titletag" => "The Conclusion", ":createdDt" => Time.now.to_s} )
