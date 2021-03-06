# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Advisor
  #
  # Recommendations
  #
  class Recommendations

    #
    # Creates and initializes a new instance of the Recommendations class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [ComposedCowbellClient] reference to the ComposedCowbellClient
    attr_reader :client

    #
    # Initiates the recommendation generation or computation process for a
    # subscription. This operation is asynchronous. The generated recommendations
    # are stored in a cache in the Advisor service.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def generate(custom_headers = nil)
      response = generate_async(custom_headers).value!
      nil
    end

    #
    # Initiates the recommendation generation or computation process for a
    # subscription. This operation is asynchronous. The generated recommendations
    # are stored in a cache in the Advisor service.
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def generate_with_http_info(custom_headers = nil)
      generate_async(custom_headers).value!
    end

    #
    # Initiates the recommendation generation or computation process for a
    # subscription. This operation is asynchronous. The generated recommendations
    # are stored in a cache in the Advisor service.
    #
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def generate_async(custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      api_version = '2017-04-19'


      request_headers = {}
      path_template = 'subscriptions/{subscriptionId}/providers/Microsoft.Advisor/generateRecommendations'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:post, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end


        result
      end

      promise.execute
    end

    #
    # Retrieves the status of the recommendation computation or generation process.
    # Invoke this API after calling the generation recommendation. The URI of this
    # API is returned in the Location field of the response header.
    #
    # @param operation_id The operation ID, which can be found from the Location
    # field in the generate recommendation response header.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def get_generate_status(operation_id, custom_headers = nil)
      response = get_generate_status_async(operation_id, custom_headers).value!
      nil
    end

    #
    # Retrieves the status of the recommendation computation or generation process.
    # Invoke this API after calling the generation recommendation. The URI of this
    # API is returned in the Location field of the response header.
    #
    # @param operation_id The operation ID, which can be found from the Location
    # field in the generate recommendation response header.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_generate_status_with_http_info(operation_id, custom_headers = nil)
      get_generate_status_async(operation_id, custom_headers).value!
    end

    #
    # Retrieves the status of the recommendation computation or generation process.
    # Invoke this API after calling the generation recommendation. The URI of this
    # API is returned in the Location field of the response header.
    #
    # @param operation_id The operation ID, which can be found from the Location
    # field in the generate recommendation response header.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_generate_status_async(operation_id, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'operation_id is nil' if operation_id.nil?
      api_version = '2017-04-19'


      request_headers = {}
      path_template = 'subscriptions/{subscriptionId}/providers/Microsoft.Advisor/generateRecommendations/{operationId}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id,'operationId' => operation_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end


        result
      end

      promise.execute
    end

    #
    # Obtains cached recommendations for a subscription. The recommendations are
    # generated or computed by invoking generateRecommendations.
    #
    # @param filter [String] The filter to apply to the recommendations.
    # @param top [Integer] The number of recommendations per page if a paged
    # version of this API is being used.
    # @param skip_token [String] The page-continuation token to use with a paged
    # version of this API.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ResourceRecommendationBaseListResult] operation results.
    #
    def list(filter = nil, top = nil, skip_token = nil, custom_headers = nil)
      response = list_async(filter, top, skip_token, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Obtains cached recommendations for a subscription. The recommendations are
    # generated or computed by invoking generateRecommendations.
    #
    # @param filter [String] The filter to apply to the recommendations.
    # @param top [Integer] The number of recommendations per page if a paged
    # version of this API is being used.
    # @param skip_token [String] The page-continuation token to use with a paged
    # version of this API.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def list_with_http_info(filter = nil, top = nil, skip_token = nil, custom_headers = nil)
      list_async(filter, top, skip_token, custom_headers).value!
    end

    #
    # Obtains cached recommendations for a subscription. The recommendations are
    # generated or computed by invoking generateRecommendations.
    #
    # @param filter [String] The filter to apply to the recommendations.
    # @param top [Integer] The number of recommendations per page if a paged
    # version of this API is being used.
    # @param skip_token [String] The page-continuation token to use with a paged
    # version of this API.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(filter = nil, top = nil, skip_token = nil, custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      api_version = '2017-04-19'


      request_headers = {}
      path_template = 'subscriptions/{subscriptionId}/providers/Microsoft.Advisor/recommendations'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version,'$filter' => filter,'$top' => top,'$skipToken' => skip_token},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Advisor::Models::ResourceRecommendationBaseListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Obtains details of a cached recommendation.
    #
    # @param resource_uri [String] The fully qualified Azure Resource Manager
    # identifier of the resource to which the recommendation applies.
    # @param recommendation_id [String] The recommendation ID.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ResourceRecommendationBase] operation results.
    #
    def get(resource_uri, recommendation_id, custom_headers = nil)
      response = get_async(resource_uri, recommendation_id, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Obtains details of a cached recommendation.
    #
    # @param resource_uri [String] The fully qualified Azure Resource Manager
    # identifier of the resource to which the recommendation applies.
    # @param recommendation_id [String] The recommendation ID.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRest::HttpOperationResponse] HTTP response information.
    #
    def get_with_http_info(resource_uri, recommendation_id, custom_headers = nil)
      get_async(resource_uri, recommendation_id, custom_headers).value!
    end

    #
    # Obtains details of a cached recommendation.
    #
    # @param resource_uri [String] The fully qualified Azure Resource Manager
    # identifier of the resource to which the recommendation applies.
    # @param recommendation_id [String] The recommendation ID.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(resource_uri, recommendation_id, custom_headers = nil)
      fail ArgumentError, 'resource_uri is nil' if resource_uri.nil?
      fail ArgumentError, 'recommendation_id is nil' if recommendation_id.nil?
      api_version = '2017-04-19'


      request_headers = {}
      path_template = '{resourceUri}/providers/Microsoft.Advisor/recommendations/{recommendationId}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'resourceUri' => resource_uri,'recommendationId' => recommendation_id},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(result.request, http_response, error_model)
        end

        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = Advisor::Models::ResourceRecommendationBase.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response)
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
